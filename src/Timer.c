// SPDX-License-Identifier: MIT

#include "Wrapper.h"

#include <SDL2/SDL_timer.h>

static SDL_TimerID timerID;

typedef void Event;
STDCALL BOOL SetEvent_wrap(Event *event);

#ifdef NFS_CPP
	extern Event **dword_4DDA70, **dword_5637CC, **dword_5637D8;
	extern uint32_t *dword_4DB1B0, *dword_5637A0;

	#define dword_4DDA70 (*dword_4DDA70)
	#define dword_5637CC (*dword_5637CC)
	#define dword_5637D8 (*dword_5637D8)
	#define dword_4DB1B0 (*dword_4DB1B0)
	#define dword_5637A0 (*dword_5637A0)
#else
	extern Event *dword_4DDA70, *dword_5637CC, *dword_5637D8;
	extern uint32_t dword_4DB1B0, dword_5637A0;
#endif

static uint32_t timerCallback(uint32_t interval, void *param)
{
	static uint32_t dword_5637A8, dword_5637C8;
	int32_t delay;

	if (dword_5637A0 == 655360)
		delay = 1;
	else
	{
		uint32_t val = (dword_5637C8 + dword_5637A0) >> 16 /*/ 61440*/;
		dword_5637C8 = (uint16_t)(dword_5637C8 + dword_5637A0);
		dword_5637A8 += val;

		delay = dword_5637A8 - SDL_GetTicks() - 1;
		if (delay < 1)
		{
			if (delay < -1000)
				dword_5637A8 = SDL_GetTicks() + 1;
			delay = 1;
		}
	}

	if (dword_5637CC)
		SetEvent_wrap(dword_5637CC);
	if (dword_5637D8 && !dword_4DB1B0)
		SetEvent_wrap(dword_5637D8);
	if (dword_4DDA70)
		SetEvent_wrap(dword_4DDA70);

	return delay;
}

REALIGN void startTimer()
{
	timerID = SDL_AddTimer(1, timerCallback, NULL);
}
REALIGN void stopTimer()
{
	SDL_RemoveTimer(timerID);
}
