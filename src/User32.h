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
	uint32_t pt_x, pt_y;
} MSG;

#endif // USER32_H
