/*
	MIT License

	Copyright (c) 2014-2017 Błażej Szczygieł

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

#ifndef USER32_H
#define USER32_H

#include "Wrapper.h"

enum
{
	WM_CHR_SDL   = 0x0001,

	WM_DESTROY   = 0x0002,
	WM_SETFOCUS  = 0x0007,
	WM_KILLFOCUS = 0x0008,

	WM_KEYDOWN   = 0x0100,
	WM_KEYUP     = 0x0101,
	WM_CHAR      = 0x0102,

	WM_USER      = 0x0400,
	WM_USER_END  = 0xC000
};

typedef struct
{
	void *hWnd;
	uint32_t uMsg;
	uint32_t wParam;
	uint32_t lParam;
	uint32_t time;
	uint32_t pt[2];
} MSG;

#endif // USER32_H
