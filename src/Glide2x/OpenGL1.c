// SPDX-License-Identifier: MIT

#include "../Glide2x.h"

#include <SDL2/SDL_stdinc.h>
#include <SDL2/SDL_opengl.h>
#include <SDL2/SDL_video.h>

void SetBrightness(float);

#define MaxTriangles 0x000400
#define TextureMem   0x200000
#define VertexSnap   0x0C0000
#define Near        -1.0f
#define Far          0.0f

typedef struct
{
	struct
	{
		float r, g, b, a;
	} vertex[3];
} ColorValues;
typedef struct
{
	float vertex[3];
} FogCoord;
typedef struct
{
	struct
	{
		float s, t, r, q;
	} vertex[3];
} TextureCoord;
typedef struct
{
	struct
	{
		float x, y, z;
	} vertex[3];
} Vertices;
static ColorValues colorValues[MaxTriangles];
static FogCoord fogCoord[MaxTriangles];
static TextureCoord textureCoord[MaxTriangles];
static Vertices vertices[MaxTriangles];

typedef struct
{
	uint8_t *data; // Only for palette indices
	uint32_t *palette;
	uint32_t id;
} TextureInfo;
static TextureInfo textures[TextureMem >> 2];

static uint8_t *lfb, textureMem[TextureMem], fogTable[0x10000];
static uint32_t *palette, tmpTexture[0x400];
static uint32_t trianglesCount, maxTexIdx;

static PFNGLFOGCOORDFPROC p_glFogCoordf;

static int32_t xOffset, yOffset, visibleWidth, visibleHeight;
static SDL_GLContext glCtx;

extern BOOL useGlBleginGlEnd, keepAspectRatio, windowResized, linearFiltering;
extern int32_t vSync, winWidth, winHeight;
extern SDL_Window *sdlWin;

static void setTextureFiltering()
{
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, linearFiltering ? GL_LINEAR : GL_NEAREST);

	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
}

static inline void convertColor(GrColor_t color, float *r, float *g, float *b, float *a)
{
	/* Game uses ARGB color format */
	*a = ((color & 0xFF000000) >> 24) / 255.0;
	*r = ((color & 0x00FF0000) >> 16) / 255.0;
	*g = ((color & 0x0000FF00) >>  8) / 255.0;
	*b = ((color & 0x000000FF)      ) / 255.0;
}

static inline void drawTriangles()
{
	if (trianglesCount)
	{
		glDrawArrays(GL_TRIANGLES, 0, trianglesCount * 3);
		trianglesCount = 0;
	}
}

/**/

REALIGN STDCALL void grAlphaBlendFunction(GrAlphaBlendFnc_t rgb_sf, GrAlphaBlendFnc_t rgb_df, GrAlphaBlendFnc_t alpha_sf, GrAlphaBlendFnc_t alpha_df)
{
	drawTriangles();
	switch (rgb_df)
	{
		case GR_BLEND_ONE:
			glBlendFunc(GL_SRC_ALPHA, GL_ONE);
			break;
		case GR_BLEND_ONE_MINUS_SRC_ALPHA:
			glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
			break;
	}
// 	printf("grAlphaBlendFunction: %d %d %d %d\n", rgb_sf, rgb_df, alpha_sf, alpha_df);
}
REALIGN STDCALL void grAlphaCombine(GrCombineFunction_t function, GrCombineFactor_t factor, GrCombineLocal_t local, GrCombineOther_t other, BOOL invert)
{
	drawTriangles();
	if (other == GR_COMBINE_OTHER_TEXTURE)
		glEnable(GL_TEXTURE_2D);
	else
		glDisable(GL_TEXTURE_2D);
// 	printf("grAlphaCombine: %d\n", (other == GR_COMBINE_OTHER_TEXTURE));
}
REALIGN STDCALL void grAlphaTestFunction(GrCmpFnc_t function)
{
// 	printf("grAlphaTestFunction: %X\n", function);
}
REALIGN STDCALL void grAlphaTestReferenceValue(GrAlpha_t value)
{
// 	printf("grAlphaTestReferenceValue: %f\n", value / 255.0f);
}
REALIGN STDCALL void grClipWindow(uint32_t minX, uint32_t minY, uint32_t maxX, uint32_t maxY)
{
	float widthRatio  = winWidth  / 640.0f;
	float heightRatio = winHeight / 480.0f;

	if (keepAspectRatio)
	{
		if (widthRatio > heightRatio)
			widthRatio = heightRatio;
		else if (heightRatio > widthRatio)
			heightRatio = widthRatio;

		xOffset = winWidth  / 2 - widthRatio  * 320;
		yOffset = winHeight / 2 - heightRatio * 240;

		visibleWidth  = 640 * widthRatio  + 0.5f;
		visibleHeight = 480 * heightRatio + 0.5f;
	}

	int32_t scaledMinX = minX * widthRatio;
	int32_t scaledMinY = minY * heightRatio;
	int32_t scaledMaxX = maxX * widthRatio  + 0.5f;
	int32_t scaledMaxY = maxY * heightRatio + 0.5f;

// 	printf("grClipWindow: %d %d %d %d [%d]\n", minX, minY, maxX, maxY, trianglesCount);

	drawTriangles();

	glLoadIdentity();

	glOrtho(scaledMinX, scaledMaxX, scaledMaxY, scaledMinY, Near, Far);
	glViewport(scaledMinX + xOffset, winHeight - scaledMaxY - yOffset, scaledMaxX - scaledMinX, scaledMaxY - scaledMinY);
	glScissor (scaledMinX + xOffset, winHeight - scaledMaxY - yOffset, scaledMaxX - scaledMinX, scaledMaxY - scaledMinY);

	glScalef(widthRatio, heightRatio, 1.0f);
	glLineWidth(widthRatio + heightRatio);
}
REALIGN STDCALL void grBufferClear(GrColor_t color, GrAlpha_t alpha, uint16_t depth)
{
	float r, g , b, a;
	convertColor(color, &r, &g, &b, &a);

// 	printf("grBufferClear: %X %X %X [%d]\n", color, alpha, depth, trianglesCount);

	drawTriangles();

	glClearColor(r, g, b, a);
	glClearDepth(depth / 65535.0f);

	glClear(GL_DEPTH_BUFFER_BIT | GL_COLOR_BUFFER_BIT);
}
REALIGN STDCALL void grChromakeyMode(GrChromakeyMode_t mode)
{
// 	printf("grChromakeyMode: %X\n", mode);
// 	chromaKeyEnabled = mode;
}
REALIGN STDCALL void grChromakeyValue(GrColor_t value)
{
// 	printf("grChromakeyValue: %X\n", value);
// 	chromaKeyValue = value;//(value & 0x0000FF00) | ((value & 0x00FF0000) >> 16) | ((value & 0x000000FF) << 16);
}
REALIGN STDCALL void grBufferSwap(int swap_interval)
{
// 	printf("grBufferSwap: [%d]\n", trianglesCount);
	swapBufferCommon();
}
REALIGN STDCALL void grColorCombine(GrCombineFunction_t function, GrCombineFactor_t factor, GrCombineLocal_t local, GrCombineOther_t other, BOOL invert)
{
// 	printf("grColorCombine\n");
}
REALIGN STDCALL void grCullMode(GrCullMode_t mode)
{
// 	printf("grCullMode: %d\n", mode);
}
REALIGN STDCALL void grDepthBiasLevel(int16_t level)
{
// 	printf("grDepthBiasLevel: %d\n", level);
}
REALIGN STDCALL void grDepthBufferFunction(GrCmpFnc_t function)
{
// 	drawTriangles();
// 	glDepthFunc(GL_NEVER + function);
// 	printf("grDepthBufferFunction: %X\n", function);
}
REALIGN STDCALL void grDepthBufferMode(GrDepthBufferMode_t mode)
{
// 	printf("grDepthBufferMode: %X\n", mode);
}
REALIGN STDCALL void grDepthMask(BOOL mask)
{
	drawTriangles();
	glDepthMask(mask);
// 	printf("grDepthMask: %d [%d]\n", mask, trianglesCount);
}
REALIGN STDCALL void grDitherMode(GrDitherMode_t mode)
{
// 	printf("grDitherMode: %d\n", mode);
}
REALIGN STDCALL void grDrawTriangle(const GrVertex *a, const GrVertex *b, const GrVertex *c)
{
// 	printf("grDrawTriangle\n");
	const GrVertex *grVertices[3] = {a, b, c};
	uint32_t i;
	if (useGlBleginGlEnd)
	{
		glBegin(GL_TRIANGLES);
		for (i = 0; i < 3; ++i)
		{
			const GrVertex *grVertex = grVertices[i];

			glColor4f(grVertex->r / 255.0f, grVertex->g / 255.0f, grVertex->b / 255.0f, grVertex->a / 255.0f);
			if (p_glFogCoordf)
				p_glFogCoordf(fogTable[(uint16_t)(1.0f / grVertex->oow)] / 255.0f);
			glTexCoord4f(grVertex->tmuvtx[0].sow / 256.0f, grVertex->tmuvtx[0].tow / 256.0f, 0.0f, grVertex->oow);
			glVertex3f(grVertex->x - VertexSnap, grVertex->y - VertexSnap, grVertex->oow);
		}
		glEnd();
	}
	else
	{
		for (i = 0; i < 3; ++i)
		{
			const GrVertex *grVertex = grVertices[i];

			colorValues[trianglesCount].vertex[i].r = grVertex->r / 255.0f;
			colorValues[trianglesCount].vertex[i].g = grVertex->g / 255.0f;
			colorValues[trianglesCount].vertex[i].b = grVertex->b / 255.0f;
			colorValues[trianglesCount].vertex[i].a = grVertex->a / 255.0f;

			fogCoord[trianglesCount].vertex[i] = fogTable[(uint16_t)(1.0f / grVertex->oow)] / 255.0f;

			textureCoord[trianglesCount].vertex[i].s = grVertex->tmuvtx[0].sow / 256.0f;
			textureCoord[trianglesCount].vertex[i].t = grVertex->tmuvtx[0].tow / 256.0f;
			textureCoord[trianglesCount].vertex[i].q = grVertex->oow;

			vertices[trianglesCount].vertex[i].x = grVertex->x - VertexSnap;
			vertices[trianglesCount].vertex[i].y = grVertex->y - VertexSnap;
			vertices[trianglesCount].vertex[i].z = grVertex->oow;
		}
		if (++trianglesCount >= MaxTriangles)
		{
			drawTriangles();
// 			fprintf(stderr, "Too many triangles!\n");
		}
	}
}
REALIGN STDCALL void grDrawLine(const GrVertex *a, const GrVertex *b)
{
// 	printf("grDrawLine: [%d]\n", trianglesCount);
	drawTriangles();
	glBegin(GL_LINES); {
		glColor4ub(a->r, a->g, a->b, a->a);
		glVertex3f(a->x - VertexSnap, a->y - VertexSnap, a->oow);

		glColor4ub(b->r, b->g, b->b, b->a);
		glVertex3f(b->x - VertexSnap, b->y - VertexSnap, b->oow);
	} glEnd();
}
REALIGN STDCALL void grFogColorValue(GrColor_t fogcolor)
{
	float fogColor[4];
	convertColor(fogcolor, fogColor + 0, fogColor + 1, fogColor + 2, fogColor + 3);
	drawTriangles();
	glFogfv(GL_FOG_COLOR, fogColor);
// 	printf("grFogColorValue: 0x%.8X [%d]\n", fogcolor, trianglesCount);
}
REALIGN STDCALL void grFogMode(GrFogMode_t mode)
{
	switch (mode)
	{
		case GR_FOG_DISABLE:
			glDisable(GL_FOG);
			break;
		case GR_FOG_WITH_TABLE:
			glEnable(GL_FOG);
			glFogi(GL_FOG_COORDINATE_SOURCE, GL_FOG_COORDINATE);
			glHint(GL_FOG_HINT, GL_FASTEST);
			glFogf(GL_FOG_MODE, GL_LINEAR);
			glFogf(GL_FOG_START, 0.0f);
			glFogf(GL_FOG_END, 1.0f);
			break;
	}
// 	printf("grFogMode: %X\n", mode);
}
REALIGN STDCALL void grGammaCorrectionValue(float value)
{
	SetBrightness(value);
}
REALIGN STDCALL void grGlideInit(void)
{
// 	printf("grGlideInit\n");
}
REALIGN STDCALL void grGlideShutdown(void)
{
	SDL_GL_DeleteContext(glCtx);
	palette = NULL;
	glCtx = NULL;

// 	printf("grGlideShutdown\n");
}
REALIGN STDCALL BOOL grLfbLock(GrLock_t type, GrBuffer_t buffer, GrLfbWriteMode_t writeMode, GrOriginLocation_t origin, BOOL pixelPipeline, GrLfbInfo_t *info)
{
	//TODO Remove this
	memset(info, 0, sizeof(GrLfbInfo_t));
	if (type == GR_LFB_WRITE_ONLY)
	{
		info->lfbPtr = lfb = (uint8_t *)malloc(640*480*2);
		info->strideInBytes = 2;
		return true;
	}
	return false;
}
REALIGN STDCALL BOOL grLfbUnlock(GrLock_t type, GrBuffer_t buffer)
{
	//TODO Remove this
	free(lfb);
	lfb = NULL;
	return true;
}
REALIGN STDCALL void grRenderBuffer(GrBuffer_t buffer)
{
// 	printf("grRenderBuffer\n");
}
REALIGN STDCALL void grSstIdle(void)
{
// 	printf("grSstIdle\n");
}
REALIGN STDCALL BOOL grSstIsBusy(void)
{
// 	printf("grSstIsBusy\n");
	return false;
}
REALIGN STDCALL BOOL grSstQueryHardware(GrHwConfiguration *hwconfig)
{
	return true;
}
REALIGN STDCALL void grSstSelect(int which_sst)
{
// 	printf("grSstSelect: %d\n", which_sst);
}
REALIGN STDCALL uint32_t grSstStatus(void)
{
// 	printf("grSstStatus\n");
	return 0x0FFFF03F;
}
REALIGN STDCALL void grSstWinClose(void)
{
// 	printf("grSstWinClose\n");
}
REALIGN STDCALL BOOL grSstWinOpen(uint32_t hWnd, GrScreenResolution_t screen_resolution, GrScreenRefresh_t refresh_rate, GrColorFormat_t color_format, GrOriginLocation_t origin_location, int nColBuffers, int nAuxBuffers)
{
	glCtx = SDL_GL_CreateContext(sdlWin);
	handleDpr();

	if (vSync >= 0)
		SDL_GL_SetSwapInterval(vSync);

	glEnable(GL_SCISSOR_TEST);
	glEnable(GL_ALPHA_TEST);
	glEnable(GL_DEPTH_TEST);
	glDisable(GL_DITHER);
	glEnable(GL_BLEND);

	glAlphaFunc(GL_GREATER, 16.0f / 255.0f);
	glDepthFunc(GL_LEQUAL);

	maxTexIdx = 0;

	if (useGlBleginGlEnd)
		p_glFogCoordf = (PFNGLFOGCOORDFPROC)SDL_GL_GetProcAddress("glFogCoordfEXT");
	else
	{
		glEnableClientState(GL_COLOR_ARRAY);
		glColorPointer(4, GL_FLOAT, 0, colorValues);

		PFNGLFOGCOORDPOINTERPROC p_glFogCoordPointer = (PFNGLFOGCOORDPOINTERPROC)SDL_GL_GetProcAddress("glFogCoordPointerEXT");
		if (p_glFogCoordPointer)
		{
			glEnableClientState(GL_FOG_COORD_ARRAY);
			p_glFogCoordPointer(GL_FLOAT, 0, fogCoord);
		}

		glEnableClientState(GL_TEXTURE_COORD_ARRAY);
		glTexCoordPointer(4, GL_FLOAT, 0, textureCoord);

		glEnableClientState(GL_VERTEX_ARRAY);
		glVertexPointer(3, GL_FLOAT, 0, vertices);
	}

	grClipWindow(0, 0, 640, 480);

	return true;
}
REALIGN STDCALL uint32_t grTexCalcMemRequired(GrLOD_t lodmin, GrLOD_t lodmax, GrAspectRatio_t aspect, GrTextureFormat_t fmt)
{
	uint32_t size = 256 >> lodmax;
	size *= size;
	switch (fmt)
	{
		case GR_TEXFMT_P_8:
			break;
		case GR_TEXFMT_RGB_565:
		case GR_TEXFMT_ARGB_1555:
		case GR_TEXFMT_ARGB_4444:
			size <<= 1;
			break;
	}
	return size;
}
REALIGN STDCALL void grTexClampMode(GrChipID_t tmu, GrTextureClampMode_t s_clampmode, GrTextureClampMode_t t_clampmode)
{
}
REALIGN STDCALL void grTexCombine(GrChipID_t tmu, GrCombineFunction_t rgb_function, GrCombineFactor_t rgb_factor, GrCombineFunction_t alpha_function, GrCombineFactor_t alpha_factor, BOOL rgb_invert, BOOL alpha_invert)
{
// 	printf("grTexCombine\n");
}
REALIGN STDCALL void grTexCombineFunction(GrChipID_t tmu, GrTextureCombineFnc_t fnc)
{
// 	printf("grTexCombineFunction\n");
}
REALIGN STDCALL void grTexDownloadMipMap(GrChipID_t tmu, uint32_t startAddress, uint32_t evenOdd, GrTexInfo *info)
{
	TextureInfo *ti = &textures[startAddress >> 2];
	uint8_t *data = (uint8_t *)info->data;
	uint32_t size = 256 >> info->largeLod;
	BOOL newTexture = (ti->id == 0);

	drawTriangles();

	if (newTexture)
		glGenTextures(1, &ti->id);

	if (newTexture || info->format != GR_TEXFMT_P_8)
		glBindTexture(GL_TEXTURE_2D, ti->id);

	if (newTexture)
		setTextureFiltering();

	switch (info->format)
	{
		case GR_TEXFMT_P_8:
			if (newTexture)
				glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, size, size, 0, GL_BGRA, GL_UNSIGNED_BYTE, NULL);
			ti->data = &textureMem[startAddress];
			ti->palette = NULL;
			memcpy(ti->data, info->data, size * size);
			break;
		case GR_TEXFMT_RGB_565:
			glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, size, size, 0, GL_RGB, GL_UNSIGNED_SHORT_5_6_5, data);
			break;
		case GR_TEXFMT_ARGB_1555:
			glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, size, size, 0, GL_BGRA, GL_UNSIGNED_SHORT_1_5_5_5_REV, data);
			break;
		case GR_TEXFMT_ARGB_4444:
			glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, size, size, 0, GL_BGRA, GL_UNSIGNED_SHORT_4_4_4_4_REV, data);
			break;
	}
// 	printf("grTexDownloadMipMap: 0x%.8X %d\n", startAddress, maxTexIdx);
}
REALIGN STDCALL void grTexDownloadTable(GrChipID_t tmu, GrTexTable_t type, void *data)
{
	if (type == GR_TEXTABLE_PALETTE)
		palette = (uint32_t *)data;
}
REALIGN STDCALL void grTexFilterMode(GrChipID_t tmu, GrTextureFilterMode_t minfilter_mode, GrTextureFilterMode_t magfilter_mode)
{
	/* Always linear */
// 	printf("grTexFilterMode: %d\n", minfilter_mode);
}
REALIGN STDCALL uint32_t grTexMaxAddress(GrChipID_t tmu)
{
	return TextureMem;
}
REALIGN STDCALL uint32_t grTexMinAddress(GrChipID_t tmu)
{
	return 0;
}
REALIGN STDCALL void grTexMipMapMode(GrChipID_t tmu, GrMipMapMode_t mode, BOOL lodBlend)
{
	/* mode = 0 */
}
REALIGN STDCALL void grTexSource(GrChipID_t tmu, uint32_t startAddress, uint32_t evenOdd, GrTexInfo *info)
{
	TextureInfo *ti = &textures[startAddress >> 2];
	drawTriangles();
	glBindTexture(GL_TEXTURE_2D, ti->id);
	if (info->format == GR_TEXFMT_P_8 && palette && ti->palette != palette)
	{
		// Update only when palette or texture changes (let's assume every palette has different pointer)
		// When texture changes, palette is NULL
		uint8_t *data = ti->data;
		uint32_t size = 256 >> info->largeLod;
		uint32_t sqrSize = size * size, i;
		for (i = 0; i < sqrSize; ++i)
			tmpTexture[i] = palette[data[i]];
		glTexSubImage2D(GL_TEXTURE_2D, 0, 0, 0, size, size, GL_BGRA, GL_UNSIGNED_BYTE, tmpTexture);
		ti->palette = palette;
	}
}
