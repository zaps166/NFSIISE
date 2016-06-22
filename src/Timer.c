/*
	MIT License

	Copyright (c) 2014-2016 Błażej Szczygieł

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

#include "Wrapper.h"

#include <SDL2/SDL_timer.h>

static SDL_TimerID timerID;

typedef void Event;
STDCALL BOOL SetEvent_wrap(Event *event);
extern Event *dword_4DDA70, *dword_5637CC, *dword_5637D8;
extern uint32_t dword_4DB1B0, dword_5637A0;

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
