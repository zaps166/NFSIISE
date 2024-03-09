// SPDX-License-Identifier: MIT

#include "../Glide2x.h"

#include <SDL2/SDL_stdinc.h>
#include <SDL2/SDL_video.h>

#ifdef GLES2
# include <SDL2/SDL_opengles2.h>
#else
# include <SDL2/SDL_opengl.h>
static PFNGLGETSHADERIVPROC glGetShaderiv;
static PFNGLGETPROGRAMIVPROC glGetProgramiv;
static PFNGLGETSHADERINFOLOGPROC glGetShaderInfoLog;
static PFNGLGETPROGRAMINFOLOGPROC glGetProgramInfoLog;
static PFNGLCREATESHADERPROC glCreateShader;
static PFNGLDELETESHADERPROC glDeleteShader;
static PFNGLSHADERSOURCEPROC glShaderSource;
static PFNGLCOMPILESHADERPROC glCompileShader;
static PFNGLCREATEPROGRAMPROC glCreateProgram;
static PFNGLDELETEPROGRAMPROC glDeleteProgram;
static PFNGLATTACHSHADERPROC glAttachShader;
static PFNGLLINKPROGRAMPROC glLinkProgram;
static PFNGLGETATTRIBLOCATIONPROC glGetAttribLocation;
static PFNGLGETUNIFORMLOCATIONPROC glGetUniformLocation;
static PFNGLUSEPROGRAMPROC glUseProgram;
static PFNGLUNIFORM1IPROC glUniform1i;
static PFNGLUNIFORMMATRIX4FVPROC glUniformMatrix4fv;
static PFNGLVERTEXATTRIBPOINTERPROC glVertexAttribPointer;
static PFNGLUNIFORM3FPROC glUniform3f;
static PFNGLUNIFORM1FPROC glUniform1f;
static PFNGLENABLEVERTEXATTRIBARRAYPROC glEnableVertexAttribArray;
static PFNGLDISABLEVERTEXATTRIBARRAYPROC glDisableVertexAttribArray;
static PFNGLGENFRAMEBUFFERSPROC glGenFramebuffers;
static PFNGLBINDFRAMEBUFFERPROC glBindFramebuffer;
static PFNGLFRAMEBUFFERTEXTURE2DPROC glFramebufferTexture2D;
static PFNGLGENRENDERBUFFERSPROC glGenRenderbuffers;
static PFNGLBINDRENDERBUFFERPROC glBindRenderbuffer;
static PFNGLRENDERBUFFERSTORAGEPROC glRenderbufferStorage;
static PFNGLFRAMEBUFFERRENDERBUFFERPROC glFramebufferRenderbuffer;
static PFNGLCHECKFRAMEBUFFERSTATUSPROC glCheckFramebufferStatus;
static PFNGLDELETERENDERBUFFERSPROC glDeleteRenderbuffers;
static PFNGLDELETEFRAMEBUFFERSPROC glDeleteFramebuffers;
#endif

#include <signal.h>

BOOL contextError = false;
BOOL shaderError = false;
BOOL framebufferError = false;

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
	"uniform vec3 uFogColor;"

	"void main()"
	"{"
		"vec4 texture = uTextureEnabled * texture2D(uTextureSampler, vTexCoord.st / vTexCoord.q);"
		"vec4 ret = vColor * ((1.0 - uTextureEnabled) + texture);"

		"if (ret.a <= 16.0 / 255.0)"
			"discard;"

		"ret.rgb = mix(uFogColor, ret.rgb, 1.0 - (1.0 - vFog) * uFogEnabled);"

		"gl_FragColor = ret;"
	"}"
;

const char g_vShaderDispSrc[] =
#ifdef GLES2
	"precision mediump float;"
#else
	"#version 110\n"
#endif

	"attribute vec2 aPosition;"
	"attribute vec2 aTexCoord;"

	"varying vec2 vTexCoord;"

	"void main()"
	"{"
		"vTexCoord = aTexCoord;"
		"gl_Position = vec4(aPosition, 0.0, 1.0);"
	"}"
;
const char g_fShaderDispSrc[] =
#ifdef GLES2
	"precision mediump float;"
#else
	"#version 110\n"
#endif

	"varying vec2 vTexCoord;"

	"uniform sampler2D uTextureSampler;"
	"uniform float uGamma;"

	"void main()"
	"{"
		"vec4 texture = texture2D(uTextureSampler, vTexCoord);"
		"texture.rgb = pow(texture.rgb, vec3(1.0 / uGamma));"
		"gl_FragColor = texture;"
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
static ColorValues g_colorValues[MaxTriangles];
static FogCoord g_fogCoord[MaxTriangles];
static TextureCoord g_textureCoord[MaxTriangles];
static Vertices g_vertices[MaxTriangles];

static float g_textureCoordDisp[4][2] = {
	{0.0f, 1.0f},
	{0.0f, 0.0f},
	{1.0f, 1.0f},
	{1.0f, 0.0f},
};
static float g_verticesDisp[4][2] = {
	{-1.0f, +1.0f},
	{-1.0f, -1.0f},
	{+1.0f, +1.0f},
	{+1.0f, -1.0f},
};

typedef struct
{
	void *data;
	void *palette;
	GrTextureFormat_t fmt;
	uint32_t size;
	uint32_t id;
} TextureInfo;
static TextureInfo g_textures[TextureMem >> 2];

static uint8_t *g_lfb, g_textureMem[TextureMem], g_fogTable[0x10000];
static uint32_t *g_palette, g_tmpTexture[0x400];
static uint32_t g_trianglesCount;

static SDL_GLContext g_glCtx;

extern BOOL keepAspectRatio, needRecreateGl, windowResized, linearFiltering, fixedFramebufferSize, framebufferLinearFiltering;
extern int32_t vSync, winWidth, winHeight, initialWinWidth, initialWinHeight;
extern SDL_Window *sdlWin;

/* GLSL game */
static GLuint g_vShader, g_fShader, g_shaderProgram;
static GLint g_aPositionLoc, g_aTexCoordLoc, g_aColorLoc, g_aFogLoc, g_uMatrixLoc, g_uTextureEnabledLoc, g_uFogEnabledLoc, g_uFogColorLoc;

/* GLSL display */
static GLuint g_vShaderDisp, g_fShaderDisp, g_shaderProgramDisp;
static GLint g_aPositionLocDisp, g_aTexCoordLocDisp, g_uGammaLocDisp;

/* Framebuffer */
static uint32_t g_framebuffer;
static uint32_t g_framebufferTexture;
static uint32_t g_framebufferDepth;
static int32_t  g_framebufferHeight;

/* GLSL config */
static BOOL g_textureEnabled;
static BOOL g_fogEnabled;
static float g_fogColor[3];
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
static BOOL checkShaderProgram(GLuint program)
{
	GLint status = 0;
	glGetProgramiv(program, GL_LINK_STATUS, &status);
	if (!status)
	{
		GLint maxLen = 0;
		GLsizei len = 0;
		glGetProgramiv(program, GL_INFO_LOG_LENGTH, &maxLen);
		if (maxLen > 1)
		{
			GLchar *log = (GLchar *)malloc(maxLen);
			glGetProgramInfoLog(program, maxLen, &len, log);
			fprintf(stderr, "%s\n", log);
			free(log);
		}
		return false;
	}
	return true;
}

static inline BOOL loadShaders()
{
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
		if (!checkShaderProgram(g_shaderProgram))
			return false;

		g_aPositionLoc = glGetAttribLocation(g_shaderProgram, "aPosition");
		g_aTexCoordLoc = glGetAttribLocation(g_shaderProgram, "aTexCoord");
		g_aColorLoc = glGetAttribLocation(g_shaderProgram, "aColor");
		g_aFogLoc = glGetAttribLocation(g_shaderProgram, "aFog");
		g_uMatrixLoc = glGetUniformLocation(g_shaderProgram, "uMatrix");

		g_uTextureEnabledLoc = glGetUniformLocation(g_shaderProgram, "uTextureEnabled");
		g_uFogEnabledLoc = glGetUniformLocation(g_shaderProgram, "uFogEnabled");
		g_uFogColorLoc = glGetUniformLocation(g_shaderProgram, "uFogColor");

		glUseProgram(g_shaderProgram);
		glUniform1i(glGetUniformLocation(g_shaderProgram, "uTextureSampler"), 0);
		glUseProgram(0);
	}

	{
		const GLint vShaderLen = sizeof(g_vShaderDispSrc) - 1;
		const GLint fShaderLen = sizeof(g_fShaderDispSrc) - 1;

		const GLchar *vShaderSrc = g_vShaderDispSrc;
		const GLchar *fShaderSrc = g_fShaderDispSrc;

		g_vShaderDisp = glCreateShader(GL_VERTEX_SHADER);
		g_fShaderDisp = glCreateShader(GL_FRAGMENT_SHADER);

		glShaderSource(g_vShaderDisp, 1, &vShaderSrc, &vShaderLen);
		glShaderSource(g_fShaderDisp, 1, &fShaderSrc, &fShaderLen);

		glCompileShader(g_vShaderDisp);
		if (!checkShaderCompilation(g_vShaderDisp))
			return false;
		glCompileShader(g_fShaderDisp);
		if (!checkShaderCompilation(g_fShaderDisp))
			return false;

		g_shaderProgramDisp = glCreateProgram();

		glAttachShader(g_shaderProgramDisp, g_vShaderDisp);
		glAttachShader(g_shaderProgramDisp, g_fShaderDisp);

		glLinkProgram(g_shaderProgramDisp);
		if (!checkShaderProgram(g_shaderProgramDisp))
			return false;

		g_aPositionLocDisp = glGetAttribLocation(g_shaderProgramDisp, "aPosition");
		g_aTexCoordLocDisp = glGetAttribLocation(g_shaderProgramDisp, "aTexCoord");

		g_uGammaLocDisp = glGetUniformLocation(g_shaderProgramDisp, "uGamma");

		glUseProgram(g_shaderProgramDisp);
		glUniform1i(glGetUniformLocation(g_shaderProgramDisp, "uTextureSampler"), 0);
		glUseProgram(0);
	}

	return true;
}

static void destroyFrameBuffer()
{
	if (g_framebufferDepth != 0)
	{
		glDeleteRenderbuffers(1, &g_framebufferDepth);
		g_framebufferDepth = 0;
	}
	if (g_framebufferTexture != 0)
	{
		glDeleteTextures(1, &g_framebufferTexture);
		g_framebufferTexture = 0;
	}
	if (g_framebuffer != 0)
	{
		glDeleteFramebuffers(1, &g_framebuffer);
		g_framebuffer = 0;
	}
	g_framebufferHeight = 0;
}
static void createFrameBuffer()
{
	int32_t shorterEdge = fixedFramebufferSize ? SDL_min(initialWinWidth, initialWinHeight) : SDL_min(winWidth, winHeight);
	if (g_framebufferHeight == shorterEdge)
		return;

	int32_t w = shorterEdge * 4 / 3;
	int32_t h = shorterEdge;

	destroyFrameBuffer();

	glGenFramebuffers(1, &g_framebuffer);
	glBindFramebuffer(GL_FRAMEBUFFER, g_framebuffer);

	glGenTextures(1, &g_framebufferTexture);
	glBindTexture(GL_TEXTURE_2D, g_framebufferTexture);
	glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, w, h, 0, GL_RGB, GL_UNSIGNED_BYTE, NULL);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, (!fixedFramebufferSize || !framebufferLinearFiltering) ? GL_NEAREST : GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
	glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, g_framebufferTexture, 0);
	glBindTexture(GL_TEXTURE_2D, 0);

	glGenRenderbuffers(1, &g_framebufferDepth);
	glBindRenderbuffer(GL_RENDERBUFFER, g_framebufferDepth);
#ifdef GLES2
	if (strstr((const char *)glGetString(GL_EXTENSIONS), "GL_OES_depth24") != NULL)
		glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH_COMPONENT24_OES, w, h);
	else
		glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH_COMPONENT16, w, h);
#else
	glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH_COMPONENT24, w, h);
#endif
	glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, g_framebufferDepth);
	glBindRenderbuffer(GL_RENDERBUFFER, 0);

	if (glCheckFramebufferStatus(GL_FRAMEBUFFER) != GL_FRAMEBUFFER_COMPLETE)
	{
		framebufferError = true;
		raise(SIGABRT);
	}

	g_framebufferHeight = shorterEdge;
}

static void useGameProgram(BOOL gameProgram)
{
	if (gameProgram)
	{
		glEnable(GL_DEPTH_TEST);
		glEnable(GL_BLEND);

		glBindFramebuffer(GL_FRAMEBUFFER, g_framebuffer);

		glDisableVertexAttribArray(g_aPositionLocDisp);
		glDisableVertexAttribArray(g_aTexCoordLocDisp);

		glUseProgram(g_shaderProgram);

		glEnableVertexAttribArray(g_aPositionLoc);
		glEnableVertexAttribArray(g_aTexCoordLoc);
		glEnableVertexAttribArray(g_aColorLoc);
		glEnableVertexAttribArray(g_aFogLoc);

		glVertexAttribPointer(g_aPositionLoc, 3, GL_FLOAT, GL_FALSE, 0, g_vertices);
		glVertexAttribPointer(g_aTexCoordLoc, 4, GL_FLOAT, GL_FALSE, 0, g_textureCoord);
		glVertexAttribPointer(g_aColorLoc, 4, GL_UNSIGNED_BYTE, GL_TRUE, 0, g_colorValues);
		glVertexAttribPointer(g_aFogLoc, 1, GL_UNSIGNED_BYTE, GL_TRUE, 0, g_fogCoord);
	}
	else
	{
		glDisable(GL_DEPTH_TEST);
		glDisable(GL_BLEND);

		glBindFramebuffer(GL_FRAMEBUFFER, 0);

		glDisableVertexAttribArray(g_aPositionLoc);
		glDisableVertexAttribArray(g_aTexCoordLoc);
		glDisableVertexAttribArray(g_aColorLoc);
		glDisableVertexAttribArray(g_aFogLoc);

		glUseProgram(g_shaderProgramDisp);

		glEnableVertexAttribArray(g_aPositionLocDisp);
		glEnableVertexAttribArray(g_aTexCoordLocDisp);

		glVertexAttribPointer(g_aPositionLocDisp, 2, GL_FLOAT, GL_FALSE, 0, g_verticesDisp);
		glVertexAttribPointer(g_aTexCoordLocDisp, 2, GL_FLOAT, GL_FALSE, 0, g_textureCoordDisp);
	}
}

static void createContext()
{
	g_glCtx = SDL_GL_CreateContext(sdlWin);
	if (!g_glCtx)
	{
		contextError = true;
		raise(SIGABRT);
	}

#ifndef GLES2
	glGetShaderiv = SDL_GL_GetProcAddress("glGetShaderiv");
	glGetProgramiv = SDL_GL_GetProcAddress("glGetProgramiv");
	glGetShaderInfoLog = SDL_GL_GetProcAddress("glGetShaderInfoLog");
	glGetProgramInfoLog = SDL_GL_GetProcAddress("glGetProgramInfoLog");
	glCreateShader = SDL_GL_GetProcAddress("glCreateShader");
	glDeleteShader = SDL_GL_GetProcAddress("glDeleteShader");
	glShaderSource = SDL_GL_GetProcAddress("glShaderSource");
	glCompileShader = SDL_GL_GetProcAddress("glCompileShader");
	glCreateProgram = SDL_GL_GetProcAddress("glCreateProgram");
	glDeleteProgram = SDL_GL_GetProcAddress("glDeleteProgram");
	glAttachShader = SDL_GL_GetProcAddress("glAttachShader");
	glLinkProgram = SDL_GL_GetProcAddress("glLinkProgram");
	glGetAttribLocation = SDL_GL_GetProcAddress("glGetAttribLocation");
	glGetUniformLocation = SDL_GL_GetProcAddress("glGetUniformLocation");
	glUseProgram = SDL_GL_GetProcAddress("glUseProgram");
	glUniform1i = SDL_GL_GetProcAddress("glUniform1i");
	glUniformMatrix4fv = SDL_GL_GetProcAddress("glUniformMatrix4fv");
	glVertexAttribPointer = SDL_GL_GetProcAddress("glVertexAttribPointer");
	glUniform3f = SDL_GL_GetProcAddress("glUniform3f");
	glUniform1f = SDL_GL_GetProcAddress("glUniform1f");
	glEnableVertexAttribArray = SDL_GL_GetProcAddress("glEnableVertexAttribArray");
	glDisableVertexAttribArray = SDL_GL_GetProcAddress("glDisableVertexAttribArray");
	glGenFramebuffers = SDL_GL_GetProcAddress("glGenFramebuffers");
	glBindFramebuffer = SDL_GL_GetProcAddress("glBindFramebuffer");
	glFramebufferTexture2D = SDL_GL_GetProcAddress("glFramebufferTexture2D");
	glGenRenderbuffers = SDL_GL_GetProcAddress("glGenRenderbuffers");
	glBindRenderbuffer = SDL_GL_GetProcAddress("glBindRenderbuffer");
	glRenderbufferStorage = SDL_GL_GetProcAddress("glRenderbufferStorage");
	glFramebufferRenderbuffer = SDL_GL_GetProcAddress("glFramebufferRenderbuffer");
	glCheckFramebufferStatus = SDL_GL_GetProcAddress("glCheckFramebufferStatus");
	glDeleteFramebuffers = SDL_GL_GetProcAddress("glDeleteFramebuffers");
	glDeleteRenderbuffers = SDL_GL_GetProcAddress("glDeleteRenderbuffers");

	BOOL ok = true;
	ok &= !!glGetShaderiv;
	ok &= !!glGetProgramiv;
	ok &= !!glGetShaderInfoLog;
	ok &= !!glGetProgramInfoLog;
	ok &= !!glCreateShader;
	ok &= !!glDeleteShader;
	ok &= !!glShaderSource;
	ok &= !!glCompileShader;
	ok &= !!glCreateProgram;
	ok &= !!glDeleteProgram;
	ok &= !!glAttachShader;
	ok &= !!glLinkProgram;
	ok &= !!glGetAttribLocation;
	ok &= !!glGetUniformLocation;
	ok &= !!glUseProgram;
	ok &= !!glUniform1i;
	ok &= !!glUniformMatrix4fv;
	ok &= !!glVertexAttribPointer;
	ok &= !!glUniform3f;
	ok &= !!glUniform1f;
	ok &= !!glEnableVertexAttribArray;
	ok &= !!glDisableVertexAttribArray;
	ok &= !!glGenFramebuffers;
	ok &= !!glBindFramebuffer;
	ok &= !!glFramebufferTexture2D;
	ok &= !!glGenRenderbuffers;
	ok &= !!glBindRenderbuffer;
	ok &= !!glRenderbufferStorage;
	ok &= !!glFramebufferRenderbuffer;
	ok &= !!glCheckFramebufferStatus;
	ok &= !!glDeleteRenderbuffers;
	ok &= !!glDeleteFramebuffers;
	if (!ok)
	{
		contextError = true;
		raise(SIGABRT);
	}
#endif

	if (vSync >= 0)
		SDL_GL_SetSwapInterval(vSync);

	glEnable(GL_SCISSOR_TEST);
	glDisable(GL_DITHER);

	glDepthFunc(GL_LEQUAL);

	if (!loadShaders())
	{
		shaderError = true;
		raise(SIGABRT);
	}
}
static void destroyContext()
{
	uint32_t i;

	glUseProgram(0);

	destroyFrameBuffer();

	for (i = 0; i < (TextureMem >> 2); ++i)
	{
		TextureInfo *ti = &g_textures[i];
		if (ti->id != 0)
			glDeleteTextures(1, &ti->id);
	}

	glDeleteProgram(g_shaderProgram);
	glDeleteShader(g_fShader);
	glDeleteShader(g_vShader);

	glDeleteProgram(g_shaderProgramDisp);
	glDeleteShader(g_fShaderDisp);
	glDeleteShader(g_vShaderDisp);

	SDL_GL_DeleteContext(g_glCtx);
	g_glCtx = NULL;

	g_trianglesCount = 0;
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
	BOOL newTexture = (ti->id == 0);

	if (newTexture)
		glGenTextures(1, &ti->id);

	if (newTexture || ti->fmt != GR_TEXFMT_P_8)
		glBindTexture(GL_TEXTURE_2D, ti->id);

	if (newTexture)
		setTextureFiltering();

	switch (ti->fmt)
	{
		case GR_TEXFMT_P_8:
			glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, ti->size, ti->size, 0, GL_RGBA, GL_UNSIGNED_BYTE, NULL);
			ti->palette = NULL;
			break;
		case GR_TEXFMT_RGB_565:
			glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, ti->size, ti->size, 0, GL_RGB, GL_UNSIGNED_SHORT_5_6_5, ti->data);
			break;
		case GR_TEXFMT_ARGB_1555:
			glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, ti->size, ti->size, 0, GL_RGBA, GL_UNSIGNED_SHORT_5_5_5_1, ti->data);
			break;
		case GR_TEXFMT_ARGB_4444:
			glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, ti->size, ti->size, 0, GL_RGBA, GL_UNSIGNED_SHORT_4_4_4_4, ti->data);
			break;
	}
}

static void recreateContext()
{
	uint32_t i;

	destroyContext();

	createContext();

	// Restore textures
	for (i = 0; i < (TextureMem >> 2); ++i)
	{
		TextureInfo *ti = &g_textures[i];
		if (ti->id == 0)
			continue;

		ti->id = 0;
		uploadTexture(ti);
	}

	// Restore config
	{
		glDepthMask(g_depthMask);
		glBlendFunc(GL_SRC_ALPHA, g_blendFuncDFactor);

		glUseProgram(g_shaderProgram);
		glUniform1f(g_uTextureEnabledLoc, g_textureEnabled);
		glUniform1f(g_uFogEnabledLoc, g_fogEnabled);
		glUniform3f(g_uFogColorLoc, g_fogColor[0], g_fogColor[1], g_fogColor[2]);
		glUseProgram(0);

		glUseProgram(g_shaderProgramDisp);
		glUniform1f(g_uGammaLocDisp, g_gammaValue);
		glUseProgram(0);
	}
}

static inline void drawTriangles()
{
	if (g_trianglesCount == 0)
		return;

	glDrawArrays(GL_TRIANGLES, 0, g_trianglesCount * 3);
	g_trianglesCount = 0;
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
// 	fprintf(stderr, "grAlphaBlendFunction: %d %d %d %d\n", rgb_sf, rgb_df, alpha_sf, alpha_df);
}
REALIGN STDCALL void grAlphaCombine(GrCombineFunction_t function, GrCombineFactor_t factor, GrCombineLocal_t local, GrCombineOther_t other, BOOL invert)
{
	drawTriangles();
	if (other == GR_COMBINE_OTHER_TEXTURE)
		g_textureEnabled = 1.0f;
	else
		g_textureEnabled = 0.0f;
	glUniform1f(g_uTextureEnabledLoc, g_textureEnabled);
// 	fprintf(stderr, "grAlphaCombine: %d\n", (other == GR_COMBINE_OTHER_TEXTURE));
}
REALIGN STDCALL void grAlphaTestFunction(GrCmpFnc_t function)
{
// 	fprintf(stderr, "grAlphaTestFunction: %X\n", function);
}
REALIGN STDCALL void grAlphaTestReferenceValue(GrAlpha_t value)
{
// 	fprintf(stderr, "grAlphaTestReferenceValue: %f\n", value / 255.0f);
}
REALIGN STDCALL void grClipWindow(uint32_t minX, uint32_t minY, uint32_t maxX, uint32_t maxY)
{
	float ratio = g_framebufferHeight / 480.0f;

	int32_t scaledMinX = minX * ratio;
	int32_t scaledMinY = minY * ratio;
	int32_t scaledMaxX = maxX * ratio + 0.5f;
	int32_t scaledMaxY = maxY * ratio + 0.5f;

// 	fprintf(stderr, "grClipWindow: %d %d %d %d [%d]\n", minX, minY, maxX, maxY, g_trianglesCount);

	drawTriangles();

	glViewport(scaledMinX, g_framebufferHeight - scaledMaxY, scaledMaxX - scaledMinX, scaledMaxY - scaledMinY);
	glScissor (scaledMinX, g_framebufferHeight - scaledMaxY, scaledMaxX - scaledMinX, scaledMaxY - scaledMinY);

	glLineWidth(2.0f * ratio);

	matrixLoadIdentity();
	matrixOrtho(scaledMinX, scaledMaxX, scaledMaxY, scaledMinY, Near, Far);
	matrixScale2(ratio, ratio);
	glUniformMatrix4fv(g_uMatrixLoc, 1, GL_FALSE, g_matrix);
}
REALIGN STDCALL void grBufferClear(GrColor_t color, GrAlpha_t alpha, uint16_t depth)
{
	float r, g , b, a;
	convertColor(color, &alpha, &r, &g, &b, &a);

// 	fprintf(stderr, "grBufferClear: %X %X %X [%d]\n", color, alpha, depth, g_trianglesCount);

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
// 	fprintf(stderr, "grChromakeyMode: %X\n", mode);
// 	chromaKeyEnabled = mode;
}
REALIGN STDCALL void grChromakeyValue(GrColor_t value)
{
// 	fprintf(stderr, "grChromakeyValue: %X\n", value);
// 	chromaKeyValue = value;//(value & 0x0000FF00) | ((value & 0x00FF0000) >> 16) | ((value & 0x000000FF) << 16);
}
REALIGN STDCALL void grBufferSwap(int swap_interval)
{
// 	fprintf(stderr, "grBufferSwap: [%d]\n", g_trianglesCount);

	drawTriangles();

	useGameProgram(false);

	GLint viewportSize[4] = {};
	glGetIntegerv(GL_VIEWPORT, viewportSize);

	GLint scissorBox[4] = {};
	glGetIntegerv(GL_SCISSOR_BOX, scissorBox);

	int32_t xOffset = 0, yOffset = 0;
	int32_t visibleWidth = 0, visibleHeight = 0;
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

	clearUnusedArea(xOffset, yOffset, visibleWidth, visibleHeight);

	int32_t scaledMaxX = 640.0f * widthRatio  + 0.5f;
	int32_t scaledMaxY = 480.0f * heightRatio + 0.5f;
	glViewport(xOffset, winHeight - scaledMaxY - yOffset, scaledMaxX, scaledMaxY);
	glScissor (xOffset, winHeight - scaledMaxY - yOffset, scaledMaxX, scaledMaxY);

	glBindTexture(GL_TEXTURE_2D, g_framebufferTexture);
	glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
	glBindTexture(GL_TEXTURE_2D, 0);

	SDL_GL_SwapWindow(sdlWin);

	if (needRecreateGl)
	{
		recreateContext();
		needRecreateGl = false;
		windowResized = true;
	}

	if (windowResized)
	{
		createFrameBuffer();
		useGameProgram(true);
		grClipWindow(0, 0, 640, 480);
		windowResized = false;
	}
	else
	{
		useGameProgram(true);
		glViewport(viewportSize[0], viewportSize[1], viewportSize[2], viewportSize[3]);
		glScissor(scissorBox[0], scissorBox[1], scissorBox[2], scissorBox[3]);
	}
}
REALIGN STDCALL void grColorCombine(GrCombineFunction_t function, GrCombineFactor_t factor, GrCombineLocal_t local, GrCombineOther_t other, BOOL invert)
{
// 	fprintf(stderr, "grColorCombine\n");
}
REALIGN STDCALL void grCullMode(GrCullMode_t mode)
{
// 	fprintf(stderr, "grCullMode: %d\n", mode);
}
REALIGN STDCALL void grDepthBiasLevel(int16_t level)
{
// 	fprintf(stderr, "grDepthBiasLevel: %d\n", level);
}
REALIGN STDCALL void grDepthBufferFunction(GrCmpFnc_t function)
{
// 	drawTriangles();
// 	glDepthFunc(GL_NEVER + function);
// 	fprintf(stderr, "grDepthBufferFunction: %X\n", function);
}
REALIGN STDCALL void grDepthBufferMode(GrDepthBufferMode_t mode)
{
// 	fprintf(stderr, "grDepthBufferMode: %X\n", mode);
}
REALIGN STDCALL void grDepthMask(BOOL mask)
{
	drawTriangles();

	g_depthMask = mask;
	glDepthMask(g_depthMask);
// 	fprintf(stderr, "grDepthMask: %d [%d]\n", mask, g_trianglesCount);
}
REALIGN STDCALL void grDitherMode(GrDitherMode_t mode)
{
// 	fprintf(stderr, "grDitherMode: %d\n", mode);
}
REALIGN STDCALL void grDrawTriangle(const GrVertex *a, const GrVertex *b, const GrVertex *c)
{
// 	fprintf(stderr, "grDrawTriangle\n");
	const GrVertex *grVertices[3] = {a, b, c};
	uint32_t i;
	for (i = 0; i < 3; ++i)
	{
		const GrVertex *grVertex = grVertices[i];

		g_colorValues[g_trianglesCount].vertex[i].r = grVertex->r;
		g_colorValues[g_trianglesCount].vertex[i].g = grVertex->g;
		g_colorValues[g_trianglesCount].vertex[i].b = grVertex->b;
		g_colorValues[g_trianglesCount].vertex[i].a = grVertex->a;

		g_fogCoord[g_trianglesCount].vertex[i] = 255 - g_fogTable[(uint16_t)(1.0f / grVertex->oow)];

		g_textureCoord[g_trianglesCount].vertex[i].s = grVertex->tmuvtx[0].sow / 256.0f;
		g_textureCoord[g_trianglesCount].vertex[i].t = grVertex->tmuvtx[0].tow / 256.0f;
		g_textureCoord[g_trianglesCount].vertex[i].q = grVertex->oow;

		g_vertices[g_trianglesCount].vertex[i].x = grVertex->x - VertexSnap;
		g_vertices[g_trianglesCount].vertex[i].y = grVertex->y - VertexSnap;
		g_vertices[g_trianglesCount].vertex[i].z = grVertex->oow;
	}
	if (++g_trianglesCount >= MaxTriangles)
	{
		drawTriangles();
// 		fprintf(stderr, "Too many triangles!\n");
	}
}
REALIGN STDCALL void grDrawLine(const GrVertex *a, const GrVertex *b)
{
//	fprintf(stderr, "grDrawLine: [%d]\n", g_trianglesCount);
	drawTriangles();

	const GrVertex *grVertices[2] = {a, b};
	uint32_t i;
	for (i = 0; i < 2; ++i)
	{
		g_colorValues->vertex[i].r = grVertices[i]->r;
		g_colorValues->vertex[i].g = grVertices[i]->g;
		g_colorValues->vertex[i].b = grVertices[i]->b;
		g_colorValues->vertex[i].a = grVertices[i]->a;

		g_vertices->vertex[i].x = grVertices[i]->x - VertexSnap;
		g_vertices->vertex[i].y = grVertices[i]->y - VertexSnap;
		g_vertices->vertex[i].z = grVertices[i]->oow;
	}
	glDrawArrays(GL_LINES, 0, 2);
}
REALIGN STDCALL void grFogColorValue(GrColor_t fogcolor)
{
	drawTriangles();

	convertColor(fogcolor, NULL, &g_fogColor[0], &g_fogColor[1], &g_fogColor[2], NULL);
	glUniform3f(g_uFogColorLoc, g_fogColor[0], g_fogColor[1], g_fogColor[2]);

// 	fprintf(stderr, "grFogColorValue: 0x%.8X [%d]\n", fogcolor, g_trianglesCount);
}
REALIGN STDCALL void grFogMode(GrFogMode_t mode)
{
	switch (mode)
	{
		case GR_FOG_DISABLE:
			g_fogEnabled = 0.0f;
			break;
		case GR_FOG_WITH_TABLE:
			g_fogEnabled = 1.0f;
			break;
	}
	glUniform1f(g_uFogEnabledLoc, g_fogEnabled);
// 	fprintf(stderr, "grFogMode: %X\n", mode);
}
REALIGN STDCALL void grGammaCorrectionValue(float value)
{
	if (g_gammaValue == value)
		return;

	g_gammaValue = value;

	useGameProgram(false);
	glUniform1f(g_uGammaLocDisp, g_gammaValue);
	useGameProgram(true);
}
REALIGN STDCALL void grGlideInit(void)
{
// 	fprintf(stderr, "grGlideInit\n");
}
REALIGN STDCALL void grGlideShutdown(void)
{
	destroyContext();
	g_palette = NULL;

// 	fprintf(stderr, "grGlideShutdown\n");
}
REALIGN STDCALL BOOL grLfbLock(GrLock_t type, GrBuffer_t buffer, GrLfbWriteMode_t writeMode, GrOriginLocation_t origin, BOOL pixelPipeline, GrLfbInfo_t *info)
{
	//TODO Remove this
	memset(info, 0, sizeof(GrLfbInfo_t));
	if (type == GR_LFB_WRITE_ONLY)
	{
		info->lfbPtr = g_lfb = (uint8_t *)malloc(640*480*2);
		info->strideInBytes = 2;
		return true;
	}
	return false;
}
REALIGN STDCALL BOOL grLfbUnlock(GrLock_t type, GrBuffer_t buffer)
{
	//TODO Remove this
	free(g_lfb);
	g_lfb = NULL;
	return true;
}
REALIGN STDCALL void grRenderBuffer(GrBuffer_t buffer)
{
// 	fprintf(stderr, "grRenderBuffer\n");
}
REALIGN STDCALL void grSstIdle(void)
{
// 	fprintf(stderr, "grSstIdle\n");
}
REALIGN STDCALL BOOL grSstIsBusy(void)
{
// 	fprintf(stderr, "grSstIsBusy\n");
	return false;
}
REALIGN STDCALL BOOL grSstQueryHardware(GrHwConfiguration *hwconfig)
{
	return true;
}
REALIGN STDCALL void grSstSelect(int which_sst)
{
// 	fprintf(stderr, "grSstSelect: %d\n", which_sst);
}
REALIGN STDCALL uint32_t grSstStatus(void)
{
// 	fprintf(stderr, "grSstStatus\n");
	return 0x0FFFF03F;
}
REALIGN STDCALL void grSstWinClose(void)
{
// 	fprintf(stderr, "grSstWinClose\n");
}
REALIGN STDCALL BOOL grSstWinOpen(uint32_t hWnd, GrScreenResolution_t screen_resolution, GrScreenRefresh_t refresh_rate, GrColorFormat_t color_format, GrOriginLocation_t origin_location, int nColBuffers, int nAuxBuffers)
{
	createContext();
	createFrameBuffer();
	useGameProgram(true);

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
// 	fprintf(stderr, "grTexCombine\n");
}
REALIGN STDCALL void grTexCombineFunction(GrChipID_t tmu, GrTextureCombineFnc_t fnc)
{
// 	fprintf(stderr, "grTexCombineFunction\n");
}
REALIGN STDCALL void grTexDownloadMipMap(GrChipID_t tmu, uint32_t startAddress, uint32_t evenOdd, GrTexInfo *info)
{
	TextureInfo *ti = &g_textures[startAddress >> 2];
	ti->data = &g_textureMem[startAddress];
	ti->palette = NULL;
	ti->fmt = info->format;
	ti->size = 256 >> info->largeLod;

	uint16_t *dataIn  = (uint16_t *)info->data;
	uint16_t *dataOut = (uint16_t *)ti->data;

	drawTriangles();

	// ARGB -> RGBA conversion or copy
	uint32_t sqrSize = ti->size * ti->size, i;
	switch (ti->fmt)
	{
		case GR_TEXFMT_ARGB_1555:
		{
			for (i = 0; i < sqrSize; ++i)
			{
				uint16_t value = dataIn[i];
				dataOut[i] = (value << 1) | (value >> 15);
			}
			break;
		}
		case GR_TEXFMT_ARGB_4444:
			for (i = 0; i < sqrSize; ++i)
			{
				uint16_t value = dataIn[i];
				dataOut[i] = (value << 4) | (value >> 12);
			}
			break;
		default:
			memcpy(dataOut, dataIn, ti->size * ti->size * (ti->fmt == GR_TEXFMT_P_8 ? 1 : 2));
			break;
	}

	uploadTexture(ti);

//	fprintf(stderr, "grTexDownloadMipMap: 0x%.8X %d %u %u\n", startAddress, ti->fmt, ti->size, ti->id);
}
REALIGN STDCALL void grTexDownloadTable(GrChipID_t tmu, GrTexTable_t type, void *data)
{
	if (type == GR_TEXTABLE_PALETTE)
		g_palette = (uint32_t *)data;
}
REALIGN STDCALL void grTexFilterMode(GrChipID_t tmu, GrTextureFilterMode_t minfilter_mode, GrTextureFilterMode_t magfilter_mode)
{
	/* Always linear */
// 	fprintf(stderr, "grTexFilterMode: %d\n", minfilter_mode);
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
	TextureInfo *ti = &g_textures[startAddress >> 2];
	drawTriangles();
	glBindTexture(GL_TEXTURE_2D, ti->id);
	if (info->format == GR_TEXFMT_P_8 && g_palette && ti->palette != g_palette)
	{
		// Update only when palette or texture changes (let's assume every palette has different pointer)
		// When texture changes, palette is NULL
		uint8_t *data = ti->data;
		uint32_t size = 256 >> info->largeLod;
		uint32_t sqrSize = size * size, i;
		for (i = 0; i < sqrSize; ++i)
		{
			uint32_t value = g_palette[data[i]];
			g_tmpTexture[i] = ((value >> 16) & 0x000000FF) | ((value << 16) & 0x00FF0000) | (value & 0xFF00FF00);
		}
		glTexSubImage2D(GL_TEXTURE_2D, 0, 0, 0, size, size, GL_RGBA, GL_UNSIGNED_BYTE, g_tmpTexture);
		ti->palette = g_palette;
	}
}
