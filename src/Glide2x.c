// SPDX-License-Identifier: MIT

static void handleDpr();

#ifdef OPENGL1X
	#include "Glide2x/OpenGL1.c"
#else
	#include "Glide2x/OpenGL2.c"
#endif

static void handleDpr()
{
	extern double dpr;
	int w = winWidth, h = winHeight;
	SDL_GL_GetDrawableSize(sdlWin, &w, &h);
	dpr = ((double)w / (double)winWidth + (double)h / (double)winHeight) / 2.0;
	winWidth  *= dpr;
	winHeight *= dpr;
}
