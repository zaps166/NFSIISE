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

#include "User32.h"

#include <SDL2/SDL_messagebox.h>
#include <SDL2/SDL_events.h>
#include <SDL2/SDL_video.h>
#include <SDL2/SDL_timer.h>

static const uint8_t sdl_to_windows_scancode_table[100] =
{
	0x00, 0x00, 0x00, 0x00, 0x1E, 0x30, 0x2E, 0x20, 0x12, 0x21,
	0x22, 0x23, 0x17, 0x24, 0x25, 0x26, 0x32, 0x31, 0x18, 0x19,
	0x10, 0x13, 0x1F, 0x14, 0x16, 0x2F, 0x11, 0x2D, 0x15, 0x2C,
	0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B,
	0x1C, 0x01, 0x0E, 0x0F, 0x39, 0x0C, 0x0D, 0x1A, 0x1B, 0x2B,
	0x00, 0x27, 0x28, 0x29, 0x33, 0x34, 0x35, 0x3A, 0x3B, 0x3C,
	0x3D, 0x3E, 0x3F, 0x40, 0x41, 0x42, 0x43, 0x44, 0x57, 0x58,
	0x37, 0x46, 0x59, 0x52, 0x47, 0x49, 0x53, 0x4F, 0x51, 0x4D,
	0x4B, 0x50, 0x48, 0x45, 0x35, 0x37, 0x4A, 0x4E, 0x1C, 0x4F,
	0x50, 0x51, 0x4B, 0x4C, 0x4D, 0x47, 0x48, 0x49, 0x52, 0x53
};

extern int32_t winWidth, winHeight;
extern uint32_t fullScreenFlag;
extern SDL_Window *sdlWin;
extern double dpr;

BOOL windowResized = false;

WindowProc wndProc;

#ifdef NFS_CPP
	void wrap_stdcall4(void *this, void *func, void *arg0, int32_t arg1, int32_t arg2, int32_t arg3);

	#define wndProc(a,b,c,d) \
		wrap_stdcall4(this, wndProc, a, b, c, d);
#endif

static SDL_TimerID timerID;
uint32_t watchdogTimer(uint32_t interval, void *param);

REALIGN STDCALL uint32_t DefWindowProcA_wrap(void *hWnd, uint32_t uMsg, uint32_t wParam, uint32_t lParam)
{
	if (uMsg == WM_DESTROY)
	{
		SDL_DestroyWindow(sdlWin);
		sdlWin = NULL;
	}
	return 0;
}
REALIGN STDCALL BOOL DestroyWindow_wrap(void *hWnd)
{
	SDL_Event event;
	event.type = WM_DESTROY;
	if (timerID)
	{
		SDL_RemoveTimer(timerID);
		timerID = 0;
	}
	return SDL_PushEvent(&event) == 1;
}

REALIGN STDCALL BOOL PostMessageA_wrap(void *hWnd, uint32_t uMsg, uint32_t wParam, uint32_t lParam)
{
	if (uMsg >= WM_USER && uMsg < WM_USER_END)
	{
		SDL_Event event;
		event.type = uMsg + SDL_USEREVENT - WM_USER;
		event.user.code = lParam;
		return SDL_PushEvent(&event) == 1;
	}
	return false;
}
REALIGN STDCALL BOOL GetMessageA_wrap(MSG *msg, void *hWnd, uint32_t wMsgFilterMin, uint32_t wMsgFilterMax)
{
	static uint32_t lastLParam;
	BOOL br;
	SDL_Event event;
	memset(msg, 0, sizeof(MSG));
	do
	{
		br = true;
		if (SDL_WaitEvent(&event))
		{
			switch (event.type)
			{
				case SDL_WINDOWEVENT:
					switch (event.window.event)
					{
						case SDL_WINDOWEVENT_RESIZED:
							winWidth  = event.window.data1 * dpr;
							winHeight = event.window.data2 * dpr;
							windowResized = true;
							br = false;
							break;
						case SDL_WINDOWEVENT_MINIMIZED:
							msg->uMsg = WM_KILLFOCUS;
							break;
						case SDL_WINDOWEVENT_RESTORED:
							msg->uMsg = WM_SETFOCUS;
							break;
					}
					break;
				case WM_DESTROY:
					msg->uMsg = event.type;
					break;
				case SDL_QUIT:
					timerID = SDL_AddTimer(2500, watchdogTimer, NULL);
					return 0;
				case SDL_KEYDOWN:
					if (event.key.keysym.sym == SDLK_RETURN && (event.key.keysym.mod & KMOD_LALT))
					{
						if (!event.key.repeat)
							SDL_SetWindowFullscreen(sdlWin, (SDL_GetWindowFlags(sdlWin) & fullScreenFlag) ? SDL_FALSE : fullScreenFlag);
						br = false;
						break;
					}
					//no break
				case SDL_KEYUP:
				{
					SDL_Scancode scancode = event.key.keysym.scancode;
					SDL_Keycode sym = event.key.keysym.sym;

					BOOL isWMChar = false;

					msg->lParam = 1;

					switch (sym)
					{
						case SDLK_LSHIFT:
						case SDLK_RSHIFT:
							msg->wParam = 0x10;
							break;
						case SDLK_PAGEDOWN:
							msg->wParam = 0x21;
							break;
						case SDLK_PAGEUP:
							msg->wParam = 0x22;
							break;
						case SDLK_END:
							msg->wParam = 0x23;
							break;
						case SDLK_HOME:
							msg->wParam = 0x24;
							break;
						case SDLK_LEFT:
							msg->wParam = 0x25;
							break;
						case SDLK_UP:
							msg->wParam = 0x26;
							break;
						case SDLK_RIGHT:
							msg->wParam = 0x27;
							break;
						case SDLK_DOWN:
							msg->wParam = 0x28;
							break;
						case SDLK_INSERT:
							msg->wParam = 0x2D;
							break;
						case SDLK_DELETE:
							msg->wParam = 0x2E;
							break;
						case SDLK_KP_0:
							msg->wParam = 0x60;
							break;
						case SDLK_KP_1:
							msg->wParam = 0x61;
							break;
						case SDLK_KP_2:
							msg->wParam = 0x62;
							break;
						case SDLK_KP_3:
							msg->wParam = 0x63;
							break;
						case SDLK_KP_4:
							msg->wParam = 0x64;
							break;
						case SDLK_KP_5:
							msg->wParam = 0x65;
							break;
						case SDLK_KP_6:
							msg->wParam = 0x66;
							break;
						case SDLK_KP_7:
							msg->wParam = 0x67;
							break;
						case SDLK_KP_8:
							msg->wParam = 0x68;
							break;
						case SDLK_KP_9:
							msg->wParam = 0x69;
							break;
						case SDLK_KP_MULTIPLY:
							msg->wParam = 0x6A;
							break;
						case SDLK_KP_PLUS:
							msg->wParam = 0x6B;
							break;
						case SDLK_KP_MINUS:
							msg->wParam = 0x6D;
							break;
						case SDLK_KP_PERIOD:
							msg->wParam = 0x6E;
							break;
						case SDLK_KP_DIVIDE:
							msg->wParam = 0x6F;
							break;
						case SDLK_EQUALS:
							msg->wParam = 0xBB;
							break;
						case SDLK_MINUS:
							msg->wParam = 0xBD;
							break;
						case SDLK_PERIOD:
							msg->wParam = 0xBE;
							break;
						case SDLK_BACKQUOTE:
							msg->wParam = 0xC0;
							break;
						case SDLK_QUOTE:
							msg->wParam = 0xDE;
							break;
						case SDLK_KP_ENTER:
							sym = SDLK_RETURN;
						default:
							if (!(sym & 0x40000000))
							{
								isWMChar = sym >= SDLK_BACKSPACE && sym < SDLK_SPACE;
								msg->wParam = sym;
							}
					}

					if (msg->lParam == 1 && scancode < 100)
						msg->lParam |= sdl_to_windows_scancode_table[scancode] << 16;
					lastLParam = msg->lParam;

					SDL_Event event2;
					event2.type = WM_CHR_SDL;
					if (event.type == SDL_KEYUP)
						msg->uMsg = WM_KEYUP;
					else if (event.type == SDL_KEYDOWN)
					{
						msg->uMsg = WM_KEYDOWN;
						if (isWMChar)
						{
							event2.user.data1 = (void *)msg->wParam;
							event2.user.data2 = (void *)msg->lParam;
							SDL_PushEvent(&event2);
						}
					}

					if (sym >= SDLK_a && sym <= SDLK_z)
						msg->wParam = sym & ~0x20;
				} break;
				case SDL_TEXTINPUT:
				{
					msg->uMsg = WM_CHAR;
					msg->wParam = event.text.text[0];
					msg->lParam = lastLParam;
				} break;
				case WM_CHR_SDL:
					msg->uMsg = WM_CHAR;
					msg->wParam = (uint32_t)event.user.data1;
					msg->lParam = (uint32_t)event.user.data2;
					break;
				default:
					if (event.type >= SDL_USEREVENT)
					{
						msg->uMsg = event.type + WM_USER - SDL_USEREVENT;
						msg->lParam = event.user.code;
						break;
					}
					br = false;
			}
			if (br)
				return 1;
		}
	} while (!br);
	return -1;
}
REALIGN STDCALL uint32_t DispatchMessageA_wrap(MAYBE_THIS const MSG *msg)
{
	wndProc(sdlWin, msg->uMsg, msg->wParam, msg->lParam);
	return 0;
}

REALIGN STDCALL int GetKeyboardType_wrap(int typeFlag)
{
	return 0;
}

REALIGN STDCALL int MessageBoxA_wrap(void *hWnd, const char *text, const char *caption, uint32_t type)
{
	SDL_MessageBoxButtonData buttons[] = {{SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT, 1, "OK"}, {SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT, 2, "Cancel"}};
	SDL_MessageBoxData msgb = {SDL_MESSAGEBOX_WARNING, NULL, caption, text, (int32_t)(type & 0x1) + 1, buttons, NULL};
	int buttonID;
	if (!SDL_ShowMessageBox(&msgb, &buttonID))
		return buttonID;
	return 1;
}
