// SPDX-License-Identifier: MIT

static void handleDpr();
static void swapBufferCommon();

#ifdef OPENGL1X
	#include "Glide2x/OpenGL1.c"
#else
	#include "Glide2x/OpenGL2.c"
#endif

static void handleDpr()
{
	extern double dpr;
	SDL_GetWindowSize(sdlWin, &winWidth, &winHeight);
	int w = winWidth, h = winHeight;
	SDL_GL_GetDrawableSize(sdlWin, &w, &h);
	dpr = ((double)w / (double)winWidth + (double)h / (double)winHeight) / 2.0;
	winWidth  *= dpr;
	winHeight *= dpr;
}
static void swapBufferCommon()
{
	if (windowResized)
	{
		grClipWindow(0, 0, 640, 480);
		windowResized = false;
	}
	else
	{
		drawTriangles();
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
