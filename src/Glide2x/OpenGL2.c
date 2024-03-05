// SPDX-License-Identifier: MIT

#include "../Glide2x.h"

#include <SDL2/SDL_stdinc.h>
#include <SDL2/SDL_video.h>

#ifdef GLES2
	#include <SDL2/SDL_opengles2.h>
#else
	#include <SDL2/SDL_opengl.h>

	static PFNGLGETSHADERIVPROC glGetShaderiv;
	static PFNGLGETPROGRAMIVPROC glGetProgramiv;
	static PFNGLGETSHADERINFOLOGPROC glGetShaderInfoLog;
	static PFNGLGETPROGRAMINFOLOGPROC glGetProgramInfoLog;
	static PFNGLCREATESHADERPROC glCreateShader;
	static PFNGLSHADERSOURCEPROC glShaderSource;
	static PFNGLCOMPILESHADERPROC glCompileShader;
	static PFNGLCREATEPROGRAMPROC glCreateProgram;
	static PFNGLATTACHSHADERPROC glAttachShader;
	static PFNGLLINKPROGRAMPROC glLinkProgram;
	static PFNGLGETATTRIBLOCATIONPROC glGetAttribLocation;
	static PFNGLGETUNIFORMLOCATIONPROC glGetUniformLocation;
	static PFNGLUSEPROGRAMPROC glUseProgram;
	static PFNGLUNIFORM1IPROC glUniform1i;
	static PFNGLUNIFORMMATRIX4FVPROC glUniformMatrix4fv;
	static PFNGLVERTEXATTRIBPOINTERPROC glVertexAttribPointer;
	static PFNGLUNIFORM4FPROC glUniform4f;
	static PFNGLUNIFORM1FPROC glUniform1f;
	static PFNGLENABLEVERTEXATTRIBARRAYPROC glEnableVertexAttribArray;
#endif

#include <signal.h>

BOOL shaderError = false;

#ifdef WIN32
	#undef near
	#undef far
#endif

/* Matrix 4x4 */

static float g_matrix[16];

static inline void matrixLoadIdentity()
{
	g_matrix[ 0] = 1;
	g_matrix[ 5] = 1;
	g_matrix[10] = 1;
	g_matrix[12] = 0;
	g_matrix[13] = 0;
	g_matrix[14] = 0;
	g_matrix[15] = 1;
}
static inline void matrixScale2(float x, float y)
{
	g_matrix[ 0] *= x;
	g_matrix[ 5] *= y;
}
static inline void matrixOrtho(float left, float right, float bottom, float top, float near, float far)
{
	const float rl = (right - left);
	const float tb = (top - bottom);
	const float fn = (far - near);
	g_matrix[ 0] = 2 / rl;
	g_matrix[ 5] = 2 / tb;
	g_matrix[10] = -2 / fn;
	g_matrix[12] = -(left + right) / rl;
	g_matrix[13] = -(top + bottom) / tb;
	g_matrix[14] = -(far + near) / fn;
}

/* Shaders */

const char g_vShaderSrc[] =
#ifdef GLES2
	"precision mediump float;"
#else
	"#version 110\n"
#endif

	"attribute vec4 aPosition;"
	"attribute vec4 aTexCoord;"
	"attribute vec4 aColor;"
	"attribute float aFog;"

	"varying vec4 vTexCoord;"
	"varying vec4 vColor;"
	"varying float vFog;"

	"uniform mat4 uMatrix;"

	"void main()"
	"{"
		"vTexCoord = aTexCoord;"
		"vColor = aColor;"
		"vFog = aFog;"
		"gl_Position = uMatrix * aPosition;"
	"}"
;

const char g_fShaderSrc[] =
#ifdef GLES2
	"precision mediump float;"
#else
	"#version 110\n"
#endif

	"varying vec4 vTexCoord;"
	"varying vec4 vColor;"
	"varying float vFog;"

	"uniform sampler2D uTextureSampler;"
	"uniform float uTextureEnabled;"
	"uniform float uFogEnabled;"
	"uniform vec4 uFogColor;"
	"uniform float uGamma;"

	"void main()"
	"{"
		"vec4 ret = vColor;"

		"vec4 texture = uTextureEnabled * texture2D(uTextureSampler, (vTexCoord.st / 256.0) / vTexCoord.q);"
		"ret *= (1.0 - uTextureEnabled) + vec4(texture.b, texture.g, texture.r, texture.a);"

		"if (ret.a <= 16.0 / 255.0)"
			"discard;"

		"ret = mix(uFogColor, ret, 1.0 - (1.0 - vFog) * uFogEnabled);"

		"ret.rgb = pow(ret.rgb, vec3(1.0 / uGamma));"

		"gl_FragColor = ret;"
	"}"
;

#define MaxTriangles 0x000400
#define TextureMem   0x200000
#define VertexSnap   0x0C0000
#define Near        -1.0f
#define Far          0.0f

typedef struct
{
	struct
	{
		uint8_t r, g, b, a;
	} vertex[3];
} ColorValues;
typedef struct
{
	uint8_t vertex[3];
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
	uint8_t *data;
	uint32_t *palette;
	GrTextureFormat_t fmt;
	uint32_t size;
	uint32_t id;
} TextureInfo;
static TextureInfo textures[TextureMem >> 2];

static uint8_t *lfb, textureMem[TextureMem], fogTable[0x10000];
static uint32_t *palette, tmpTexture[256 * 256 /* 0x400 for grTexSource */];
static uint32_t trianglesCount;

static int32_t xOffset, yOffset, visibleWidth, visibleHeight;
static SDL_GLContext glCtx;

extern BOOL keepAspectRatio, needRecreateGl, windowResized, linearFiltering;
extern int32_t vSync, winWidth, winHeight;
extern SDL_Window *sdlWin;

/* GLSL */
static GLuint g_vShader, g_fShader, g_shaderProgram;
static GLint g_aPositionLoc, g_aTexCoordLoc, g_aColorLoc, g_aFogLoc, g_uMatrixLoc, g_uTextureEnabledLoc, g_uFogEnabledLoc, g_uFogColorLoc, g_uGammaLoc;

/* GLSL config */
static BOOL g_textureEnabled;
static BOOL g_fogEnabled;
static float g_fogColor[4];
static float g_gammaValue;

/* GL config */
static BOOL g_depthMask;
static GLenum g_blendFuncDFactor;

static BOOL checkShaderCompilation(GLuint shader)
{
	GLint status = 0;
	glGetShaderiv(shader, GL_COMPILE_STATUS, &status);
	if (!status)
	{
		GLint maxLen = 0;
		GLsizei len = 0;
		glGetShaderiv(shader, GL_INFO_LOG_LENGTH, &maxLen);
		if (maxLen > 1)
		{
			GLchar *log = (GLchar *)malloc(maxLen);
			glGetShaderInfoLog(shader, maxLen, &len, log);
			fprintf(stderr, "%s\n", log);
			free(log);
		}
		return false;
	}
	return true;
}
static BOOL checkShaderProgram()
{
	GLint status = 0;
	glGetProgramiv(g_shaderProgram, GL_LINK_STATUS, &status);
	if (!status)
	{
		GLint maxLen = 0;
		GLsizei len = 0;
		glGetProgramiv(g_shaderProgram, GL_INFO_LOG_LENGTH, &maxLen);
		if (maxLen > 1)
		{
			GLchar *log = (GLchar *)malloc(maxLen);
			glGetProgramInfoLog(g_shaderProgram, maxLen, &len, log);
			fprintf(stderr, "%s\n", log);
			free(log);
		}
		return false;
	}
	return true;
}

static inline BOOL loadShaders()
{
	const GLint vShaderLen = sizeof(g_vShaderSrc) - 1;
	const GLint fShaderLen = sizeof(g_fShaderSrc) - 1;

	const GLchar *vShaderSrc = g_vShaderSrc;
	const GLchar *fShaderSrc = g_fShaderSrc;

	g_vShader = glCreateShader(GL_VERTEX_SHADER);
	g_fShader = glCreateShader(GL_FRAGMENT_SHADER);

	glShaderSource(g_vShader, 1, &vShaderSrc, &vShaderLen);
	glShaderSource(g_fShader, 1, &fShaderSrc, &fShaderLen);

	glCompileShader(g_vShader);
	if (!checkShaderCompilation(g_vShader))
		return false;
	glCompileShader(g_fShader);
	if (!checkShaderCompilation(g_fShader))
		return false;

	g_shaderProgram = glCreateProgram();

	glAttachShader(g_shaderProgram, g_vShader);
	glAttachShader(g_shaderProgram, g_fShader);

	glLinkProgram(g_shaderProgram);
	if (!checkShaderProgram())
		return false;

	g_aPositionLoc = glGetAttribLocation(g_shaderProgram, "aPosition");
	g_aTexCoordLoc = glGetAttribLocation(g_shaderProgram, "aTexCoord");
	g_aColorLoc = glGetAttribLocation(g_shaderProgram, "aColor");
	g_aFogLoc = glGetAttribLocation(g_shaderProgram, "aFog");
	g_uMatrixLoc = glGetUniformLocation(g_shaderProgram, "uMatrix");

	g_uTextureEnabledLoc = glGetUniformLocation(g_shaderProgram, "uTextureEnabled");
	g_uFogEnabledLoc = glGetUniformLocation(g_shaderProgram, "uFogEnabled");
	g_uFogColorLoc = glGetUniformLocation(g_shaderProgram, "uFogColor");
	g_uGammaLoc = glGetUniformLocation(g_shaderProgram, "uGamma");

	glUseProgram(g_shaderProgram);

	glUniform1i(glGetUniformLocation(g_shaderProgram, "uTextureSampler"), 0);

	return true;
}

static void createContext()
{
	glCtx = SDL_GL_CreateContext(sdlWin);

#ifndef GLES2
	glGetShaderiv = SDL_GL_GetProcAddress("glGetShaderiv");
	glGetProgramiv = SDL_GL_GetProcAddress("glGetProgramiv");
	glGetShaderInfoLog = SDL_GL_GetProcAddress("glGetShaderInfoLog");
	glGetProgramInfoLog = SDL_GL_GetProcAddress("glGetProgramInfoLog");
	glCreateShader = SDL_GL_GetProcAddress("glCreateShader");
	glShaderSource = SDL_GL_GetProcAddress("glShaderSource");
	glCompileShader = SDL_GL_GetProcAddress("glCompileShader");
	glCreateProgram = SDL_GL_GetProcAddress("glCreateProgram");
	glAttachShader = SDL_GL_GetProcAddress("glAttachShader");
	glLinkProgram = SDL_GL_GetProcAddress("glLinkProgram");
	glGetAttribLocation = SDL_GL_GetProcAddress("glGetAttribLocation");
	glGetUniformLocation = SDL_GL_GetProcAddress("glGetUniformLocation");
	glUseProgram = SDL_GL_GetProcAddress("glUseProgram");
	glUniform1i = SDL_GL_GetProcAddress("glUniform1i");
	glUniformMatrix4fv = SDL_GL_GetProcAddress("glUniformMatrix4fv");
	glVertexAttribPointer = SDL_GL_GetProcAddress("glVertexAttribPointer");
	glUniform4f = SDL_GL_GetProcAddress("glUniform4f");
	glUniform1f = SDL_GL_GetProcAddress("glUniform1f");
	glEnableVertexAttribArray = SDL_GL_GetProcAddress("glEnableVertexAttribArray");
#endif

	if (vSync >= 0)
		SDL_GL_SetSwapInterval(vSync);

	glEnable(GL_SCISSOR_TEST);
	glEnable(GL_DEPTH_TEST);
	glDisable(GL_DITHER);
	glEnable(GL_BLEND);

	glDepthFunc(GL_LEQUAL);

	if (!loadShaders())
	{
		shaderError = true;
		raise(SIGABRT);
	}

	glEnableVertexAttribArray(g_aPositionLoc);
	glEnableVertexAttribArray(g_aTexCoordLoc);
	glEnableVertexAttribArray(g_aColorLoc);
	glEnableVertexAttribArray(g_aFogLoc);

	glVertexAttribPointer(g_aPositionLoc, 3, GL_FLOAT, GL_FALSE, 0, vertices);
	glVertexAttribPointer(g_aTexCoordLoc, 4, GL_FLOAT, GL_FALSE, 0, textureCoord);
	glVertexAttribPointer(g_aColorLoc, 4, GL_UNSIGNED_BYTE, GL_TRUE, 0, colorValues);
	glVertexAttribPointer(g_aFogLoc, 1, GL_UNSIGNED_BYTE, GL_TRUE, 0, fogCoord);
}

static void setTextureFiltering()
{
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, linearFiltering ? GL_LINEAR : GL_NEAREST);

	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
}

static void uploadTexture(TextureInfo *ti)
{
	uint16_t *data = (uint16_t *)ti->data;
	BOOL newTexture = (ti->id == 0);

	if (newTexture)
		glGenTextures(1, &ti->id);

	if (newTexture || ti->fmt != GR_TEXFMT_P_8)
		glBindTexture(GL_TEXTURE_2D, ti->id);

	if (newTexture)
		setTextureFiltering();

	const uint32_t loopSize = ti->size * ti->size * 4;
	uint8_t *tmpTexture8 = (uint8_t *)tmpTexture;
	uint32_t i, j;
	switch (ti->fmt)
	{
		case GR_TEXFMT_RGB_565:
		{
			for (i = 0, j = 0; i < loopSize; i += 4, ++j)
			{
				tmpTexture8[i + 0] = (data[j] << 3) & 0xF8;
				tmpTexture8[i + 1] = (data[j] >> 3) & 0xFC;
				tmpTexture8[i + 2] = (data[j] >> 8) & 0xF8;
				tmpTexture8[i + 3] = 0xFF;
			}
			break;
		}
		case GR_TEXFMT_ARGB_1555:
		{
			for (i = 0, j = 0; i < loopSize; i += 4, ++j)
			{
				tmpTexture8[i + 0] = (data[j] << 3) & 0xF8;
				tmpTexture8[i + 1] = (data[j] >> 2) & 0xF8;
				tmpTexture8[i + 2] = (data[j] >> 7) & 0xF8;
				tmpTexture8[i + 3] = (data[j] >> 15) * 255;
			}
			break;
		}
		case GR_TEXFMT_ARGB_4444:
		{
			for (i = 0, j = 0; i < loopSize; i += 4, ++j)
			{
				tmpTexture8[i + 0] = (data[j] << 4) & 0xF0;
				tmpTexture8[i + 1] = (data[j] >> 0) & 0xF0;
				tmpTexture8[i + 2] = (data[j] >> 4) & 0xF0;
				tmpTexture8[i + 3] = (data[j] >> 8) & 0xF0;
			}
			break;
		}
	}
	glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, ti->size, ti->size, 0, GL_RGBA, GL_UNSIGNED_BYTE, (ti->fmt == GR_TEXFMT_P_8) ? NULL : tmpTexture);
}

/**/

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
			g_blendFuncDFactor = GL_ONE;
			break;
		case GR_BLEND_ONE_MINUS_SRC_ALPHA:
			g_blendFuncDFactor = GL_ONE_MINUS_SRC_ALPHA;
			break;
	}
	glBlendFunc(GL_SRC_ALPHA, g_blendFuncDFactor);
// 	printf("grAlphaBlendFunction: %d %d %d %d\n", rgb_sf, rgb_df, alpha_sf, alpha_df);
}
REALIGN STDCALL void grAlphaCombine(GrCombineFunction_t function, GrCombineFactor_t factor, GrCombineLocal_t local, GrCombineOther_t other, BOOL invert)
{
	drawTriangles();
	if (other == GR_COMBINE_OTHER_TEXTURE)
		g_textureEnabled = 1.0f;
	else
		g_textureEnabled = 0.0f;
	glUniform1f(g_uTextureEnabledLoc, g_textureEnabled);
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

	matrixLoadIdentity();

	matrixOrtho(scaledMinX, scaledMaxX, scaledMaxY, scaledMinY, Near, Far);
	glViewport(scaledMinX + xOffset, winHeight - scaledMaxY - yOffset, scaledMaxX - scaledMinX, scaledMaxY - scaledMinY);
	glScissor (scaledMinX + xOffset, winHeight - scaledMaxY - yOffset, scaledMaxX - scaledMinX, scaledMaxY - scaledMinY);

	matrixScale2(widthRatio, heightRatio);
	glLineWidth(widthRatio + heightRatio);

	glUniformMatrix4fv(g_uMatrixLoc, 1, GL_FALSE, g_matrix);
}
REALIGN STDCALL void grBufferClear(GrColor_t color, GrAlpha_t alpha, uint16_t depth)
{
	float r, g , b, a;
	convertColor(color, &r, &g, &b, &a);

// 	printf("grBufferClear: %X %X %X [%d]\n", color, alpha, depth, trianglesCount);

	drawTriangles();

	glClearColor(r, g, b, a);
#ifdef GLES2
	glClearDepthf(depth / 65535.0f);
#else
	glClearDepth(depth / 65535.0f);
#endif

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

#ifdef GLES2
	if (needRecreateGl)
	{
		uint32_t i;

		// Destroy old context
		if (glCtx)
		{
			for (i = 0; i < (TextureMem >> 2); ++i)
			{
				TextureInfo *ti = &textures[i];
				if (ti->id != 0)
					glDeleteTextures(1, &ti->id);
			}

			glUseProgram(0);

			glDetachShader(g_shaderProgram, g_fShader);
			glDetachShader(g_shaderProgram, g_vShader);

			glDeleteProgram(g_shaderProgram);

			glDeleteShader(g_fShader);
			glDeleteShader(g_vShader);

			SDL_GL_DeleteContext(glCtx);
		}

		trianglesCount = 0;

		createContext();

		// Restore textures
		for (i = 0; i < (TextureMem >> 2); ++i)
		{
			TextureInfo *ti = &textures[i];
			if (ti->id == 0)
				continue;

			ti->id = 0;
			uploadTexture(ti);
		}

		// Restore config
		{
			glUniform1f(g_uTextureEnabledLoc, g_textureEnabled);
			glUniform1f(g_uFogEnabledLoc, g_fogEnabled);
			glUniform4f(g_uFogColorLoc, g_fogColor[0], g_fogColor[1], g_fogColor[2], g_fogColor[3]);
			glUniform1f(g_uGammaLoc, g_gammaValue);

			glDepthMask(g_depthMask);
			glBlendFunc(GL_SRC_ALPHA, g_blendFuncDFactor);
		}

		needRecreateGl = false;
		windowResized = true;
	}
#endif

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

	g_depthMask = mask;
	glDepthMask(g_depthMask);
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
	for (i = 0; i < 3; ++i)
	{
		const GrVertex *grVertex = grVertices[i];

		colorValues[trianglesCount].vertex[i].r = grVertex->r;
		colorValues[trianglesCount].vertex[i].g = grVertex->g;
		colorValues[trianglesCount].vertex[i].b = grVertex->b;
		colorValues[trianglesCount].vertex[i].a = grVertex->a;

		fogCoord[trianglesCount].vertex[i] = 255 - fogTable[(uint16_t)(1.0f / grVertex->oow)];

		textureCoord[trianglesCount].vertex[i].s = grVertex->tmuvtx[0].sow;
		textureCoord[trianglesCount].vertex[i].t = grVertex->tmuvtx[0].tow;
		textureCoord[trianglesCount].vertex[i].q = grVertex->oow;

		vertices[trianglesCount].vertex[i].x = grVertex->x - VertexSnap;
		vertices[trianglesCount].vertex[i].y = grVertex->y - VertexSnap;
		vertices[trianglesCount].vertex[i].z = grVertex->oow;
	}
	if (++trianglesCount >= MaxTriangles)
	{
		drawTriangles();
// 		fprintf(stderr, "Too many triangles!\n");
	}
}
REALIGN STDCALL void grDrawLine(const GrVertex *a, const GrVertex *b)
{
//	printf("grDrawLine: [%d]\n", trianglesCount);
	drawTriangles();

	ColorValues lineColorValues;
	Vertices lineVertices;

	const GrVertex *grVertices[2] = {a, b};
	uint32_t i;
	for (i = 0; i < 2; ++i)
	{
		lineColorValues.vertex[i].r = grVertices[i]->r;
		lineColorValues.vertex[i].g = grVertices[i]->g;
		lineColorValues.vertex[i].b = grVertices[i]->b;
		lineColorValues.vertex[i].a = grVertices[i]->a;

		lineVertices.vertex[i].x = grVertices[i]->x - VertexSnap;
		lineVertices.vertex[i].y = grVertices[i]->y - VertexSnap;
		lineVertices.vertex[i].z = grVertices[i]->oow;
	}

	glVertexAttribPointer(g_aPositionLoc, 3, GL_FLOAT, GL_FALSE, 0, &lineVertices);
	glVertexAttribPointer(g_aColorLoc, 4, GL_UNSIGNED_BYTE, GL_TRUE, 0, &lineColorValues);

	glDrawArrays(GL_LINES, 0, 2);

	glVertexAttribPointer(g_aPositionLoc, 3, GL_FLOAT, GL_FALSE, 0, vertices);
	glVertexAttribPointer(g_aColorLoc, 4, GL_UNSIGNED_BYTE, GL_TRUE, 0, colorValues);
}
REALIGN STDCALL void grFogColorValue(GrColor_t fogcolor)
{
	convertColor(fogcolor, g_fogColor + 0, g_fogColor + 1, g_fogColor + 2, g_fogColor + 3);
	drawTriangles();
	glUniform4f(g_uFogColorLoc, g_fogColor[0], g_fogColor[1], g_fogColor[2], g_fogColor[3]);
// 	printf("grFogColorValue: 0x%.8X [%d]\n", fogcolor, trianglesCount);
}
REALIGN STDCALL void grFogMode(GrFogMode_t mode)
{
	switch (mode)
	{
		case GR_FOG_DISABLE: // Is it necessary to disable fog?
			g_fogEnabled = 0.0f;
			break;
		case GR_FOG_WITH_TABLE:
			g_fogEnabled = 1.0f;
			break;
	}
	glUniform1f(g_uFogEnabledLoc, g_fogEnabled);
// 	printf("grFogMode: %X\n", mode);
}
REALIGN STDCALL void grGammaCorrectionValue(float value)
{
	g_gammaValue = value;
	glUniform1f(g_uGammaLoc, g_gammaValue);
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
	createContext();

	handleDpr();

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
	ti->data = &textureMem[startAddress];
	ti->palette = NULL;
	ti->fmt = info->format;
	ti->size = 256 >> info->largeLod;

	memcpy(ti->data, info->data, ti->size * ti->size * (ti->fmt == GR_TEXFMT_P_8 ? 1 : 2));

	drawTriangles();

	uploadTexture(ti);

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
		glTexSubImage2D(GL_TEXTURE_2D, 0, 0, 0, size, size, GL_RGBA, GL_UNSIGNED_BYTE, tmpTexture);
		ti->palette = palette;
	}
}
