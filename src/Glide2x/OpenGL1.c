/*
	MIT License

	Copyright (c) 2014-2022 Błażej Szczygieł

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.
*/

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

static uint8_t *lfb, textureMem[TextureMem], fogTable[0x10000];
static uint32_t *palette, tmpTexture[0x400];
static uint32_t trianglesCount, maxTexIdx;

static PFNGLFOGCOORDFPROC p_glFogCoordf;

static int32_t xOffset, yOffset, visibleWidth, visibleHeight;
static SDL_GLContext glCtx;

extern BOOL useGlBleginGlEnd, keepAspectRatio, windowResized;
extern int32_t vSync, winWidth, winHeight;
extern SDL_Window *sdlWin;

static void setTextureFiltering()
{
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

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
	drawTriangles();

	if (windowResized)
	{
		grClipWindow(0, 0, 640, 480);
		windowResized = false;
	}

	if (keepAspectRatio && (xOffset > 0 || yOffset > 0))
	{
		GLint scissorBox[4] = {0, 0, winWidth, winHeight};
		glGetIntegerv(GL_SCISSOR_BOX, scissorBox);

		glClearColor(0.0f, 0.0f, 0.0f, 0.0f);

		if (xOffset > 0)
		{
			glScissor(0, 0, xOffset, winHeight);
			glClear(GL_DEPTH_BUFFER_BIT | GL_COLOR_BUFFER_BIT);

			glScissor(xOffset + visibleWidth, 0, winWidth - visibleWidth - xOffset, winHeight);
			glClear(GL_DEPTH_BUFFER_BIT | GL_COLOR_BUFFER_BIT);
		}
		if (yOffset > 0)
		{
			// Y starts from bottom

			glScissor(0, 0, winWidth, winHeight - visibleHeight - yOffset);
			glClear(GL_DEPTH_BUFFER_BIT | GL_COLOR_BUFFER_BIT);

			glScissor(0, yOffset + visibleHeight, winWidth, yOffset);
			glClear(GL_DEPTH_BUFFER_BIT | GL_COLOR_BUFFER_BIT);
		}

		glScissor(scissorBox[0], scissorBox[1], scissorBox[2], scissorBox[3]);
	}

	SDL_GL_SwapWindow(sdlWin);
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
REALIGN STDCALL void grFogTable(const GrFog_t ft[GR_FOG_TABLE_SIZE])
{
	/* Copied from OpenGLIDE */

	static const uint32_t intStartEnd[GR_FOG_TABLE_SIZE + 1] =
	{
		1, 1, 1, 1, 2, 2, 2, 3, 4, 4, 5, 6, 8, 9, 11, 13, 16, 19, 22, 26, 32, 38, 45, 53,
		64, 76, 90, 107, 128, 152, 181, 215, 256, 304, 362, 430, 512, 608, 724, 861,
		1024, 1217, 1448, 1722, 2048, 2435, 2896, 3444, 4096, 4870, 5792, 6888, 8192,
		9741, 11585, 13777, 16384, 19483, 23170, 27554, 32768, 38967, 46340, 55108, 65536
	};
	static const uint32_t intEndMinusStart[GR_FOG_TABLE_SIZE] =
	{
		0, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 2, 1, 2, 2, 3, 3, 3, 4, 6, 6, 7, 8, 11, 12, 14,
		17, 21, 24, 29, 34, 41, 48, 58, 68, 82, 96, 116, 137, 163, 193, 231, 274, 326,
		387, 461, 548, 652, 774, 922, 1096, 1304, 1549, 1844, 2192, 2607, 3099, 3687,
		4384, 5214, 6199, 7373, 8768, 10428
	};

	uint32_t i, j;

	GrFog_t glideFogTable[GR_FOG_TABLE_SIZE + 1];
	memcpy(glideFogTable, ft, GR_FOG_TABLE_SIZE * sizeof(GrFog_t));
	glideFogTable[GR_FOG_TABLE_SIZE] = 255;

	for (i = 0; i < GR_FOG_TABLE_SIZE; ++i)
		for (j = intStartEnd[i]; j < intStartEnd[i + 1]; ++j)
			fogTable[j] = (uint8_t)(glideFogTable[i] + (glideFogTable[i + 1] - glideFogTable[i]) * (j - intStartEnd[i]) / intEndMinusStart[i]);

// 	printf("grFogTable\n");
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

	/* Indexed color textures */
	uint32_t i;
	for (i = 1; i <= 5; ++i)
	{
		glBindTexture(GL_TEXTURE_2D, i);
		setTextureFiltering();
		glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, 64 >> i, 64 >> i, 0, GL_BGRA, GL_UNSIGNED_BYTE, NULL);
	}
	maxTexIdx = 5;

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
	uint8_t *data = (uint8_t *)info->data;
	uint32_t size = 256 >> info->largeLod;

	if (info->format == GR_TEXFMT_P_8)
	{
		memcpy(textureMem + startAddress, data, size * size);
		return;
	}

	drawTriangles();

	uint32_t *id = (uint32_t *)(textureMem + startAddress);
	BOOL newTexture = false;

	if (*id <= 5 || *id > maxTexIdx)
	{
		*id = ++maxTexIdx;
		newTexture = true;
	}

	glBindTexture(GL_TEXTURE_2D, *id);

	if (newTexture)
		setTextureFiltering();

	switch (info->format)
	{
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
	uint8_t *data = textureMem + startAddress;
	drawTriangles();
	if (info->format != GR_TEXFMT_P_8)
		glBindTexture(GL_TEXTURE_2D, *(uint32_t *)data);
	else if (palette)
	{
		uint32_t size = 256 >> info->largeLod;
		int32_t sqrSize = size * size, i;
		glBindTexture(GL_TEXTURE_2D, info->largeLod - 2);
		for (i = 0; i < sqrSize; ++i)
			tmpTexture[i] = palette[data[i]];
		glTexSubImage2D(GL_TEXTURE_2D, 0, 0, 0, size, size, GL_BGRA, GL_UNSIGNED_BYTE, tmpTexture);
	}
}
REALIGN STDCALL void guFogGenerateExp(GrFog_t fogtable[GR_FOG_TABLE_SIZE], float density)
{
	/* Copied from OpenGLIDE */

	static const float tableIndexToW[GR_FOG_TABLE_SIZE] =
	{
		1.000000f,     1.142857f,     1.333333f,     1.600000f,
		2.000000f,     2.285714f,     2.666667f,     3.200000f,
		4.000000f,     4.571429f,     5.333333f,     6.400000f,
		8.000000f,     9.142858f,     10.666667f,    12.800000f,
		16.000000f,    18.285715f,    21.333334f,    25.600000f,
		32.000000f,    36.571430f,    42.666668f,    51.200001f,
		64.000000f,    73.142860f,    85.333336f,    102.400002f,
		128.000000f,   146.285721f,   170.666672f,   204.800003f,
		256.000000f,   292.571442f,   341.333344f,   409.600006f,
		512.000000f,   585.142883f,   682.666687f,   819.200012f,
		1024.000000f,  1170.285767f,  1365.333374f,  1638.400024f,
		2048.000000f,  2340.571533f,  2730.666748f,  3276.800049f,
		4096.000000f,  4681.143066f,  5461.333496f,  6553.600098f,
		8192.000000f,  9362.286133f,  10922.666992f, 13107.200195f,
		16384.000000f, 18724.572266f, 21845.333984f, 26214.400391f,
		32768.000000f, 37449.144531f, 43690.667969f, 52428.800781f
	};

	float f, scale, dp;
	int i;

	dp = density * tableIndexToW[GR_FOG_TABLE_SIZE - 1];
	scale = 255.0f / (1.0f - (float)SDL_pow(2.71828182845904523536029, -dp));

	for (i = 0; i < GR_FOG_TABLE_SIZE; ++i)
	{
		dp = density * tableIndexToW[i];
		f = (1.0f - (float)SDL_pow(2.71828182845904523536029, -dp)) * scale;
		if (f > 255.0f)
			f = 255.0f;
		else if (f < 0.0f)
			f = 0.0f;
		fogtable[i] = (GrFog_t)f;
	}
}
