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

extern BOOL linearSoundInterpolation;

static void (REGPARM *getSamples)(void *samples, uint32_t num_samples_per_chn);
static void (*fadeInOut)(void);

#include <SDL2/SDL_audio.h>

#define CHN_CNT 2

static SDL_AudioDeviceID audioDevice;
static BOOL unPaused, canGetSamples;
static uint32_t buffer_pos;
static uint8_t *buffer;

static void audioCallback(void *userdata, uint8_t *stream, int32_t len)
{
	if (!buffer)
	{
		int32_t i;
		for (i = 0; i < len; i += 256 * CHN_CNT * sizeof(int16_t))
			getSamples(stream + i, 256);
	}
	else
	{
		while (buffer_pos < len)
		{
			getSamples(buffer + buffer_pos, 256);
			buffer_pos += 256 * CHN_CNT * sizeof(int16_t);
		}
		memcpy(stream, buffer, len);
		memcpy(buffer, buffer + len, buffer_pos -= len);
	}
}
static void audioCallbackInterp(void *userdata, uint8_t *stream, int32_t len)
{
	int16_t samples[256 * CHN_CNT];
	int16_t *buffer_16b;
	uint32_t i, c;
	while (buffer_pos < len)
	{
		buffer_16b = (int16_t *)(buffer + buffer_pos);
		getSamples(samples, 256);
		for (i = 0; i < (256 - 1) * CHN_CNT; i += CHN_CNT)
		{
			for (c = 0; c < CHN_CNT; ++c)
			{
				buffer_16b[c] = samples[i + c];
				buffer_16b[c + CHN_CNT] = (samples[i + c] + samples[i + c + CHN_CNT]) >> 1;
			}
			buffer_16b += CHN_CNT << 1;
		}
		for (c = 0; c < CHN_CNT; ++c)
			buffer_16b[c] = buffer_16b[c + CHN_CNT] = samples[i + c];
		buffer_pos += 512 * CHN_CNT * sizeof(int16_t);
	}
	memcpy(stream, buffer, len);
	memcpy(buffer, buffer + len, buffer_pos -= len);
}

/**/

REALIGN uint32_t iSNDdllversion_(void)
{
	return 0x60002;
}

REALIGN STDCALL uint32_t iSNDdirectsetfunctions_wrap(void (REGPARM *arg1)(), void (*arg2)(), void (*arg3)(), void (*arg4)(), void (*arg5)())
{
	getSamples = arg1;
	fadeInOut  = arg4;
	return 0;
}
REALIGN REGPARM uint32_t iSNDdirectcaps_(void *hWnd)
{
	return 0x23E0F; //?
}
REALIGN REGPARM uint32_t iSNDdirectstart_(uint32_t arg1, void *hWnd)
{
	SDL_AudioSpec audioSpecIn =
	{
		linearSoundInterpolation ? 44100 : 22050,
		AUDIO_S16,
		CHN_CNT,
		0,
		1024,
		0,
		0,
		linearSoundInterpolation ? audioCallbackInterp : audioCallback,
		NULL
	};
	SDL_AudioSpec audioSpecOut;
	audioDevice = SDL_OpenAudioDevice(NULL, 0, &audioSpecIn, &audioSpecOut, 0);
	if (!audioDevice)
		buffer = (uint8_t *)malloc(256 * CHN_CNT * sizeof(int16_t));
	else
	{
		uint32_t bufferSize = (audioSpecOut.samples + 255) & ~255; //Aligned to 256
		if (linearSoundInterpolation || bufferSize != audioSpecOut.samples)
		{
			bufferSize += linearSoundInterpolation ? 512 : 256;
			bufferSize *= CHN_CNT * sizeof(int16_t);
			buffer = (uint8_t *)malloc(bufferSize);
		}
	}
	canGetSamples = true;
	return 0;
}
REALIGN void iSNDdirectserve_(void)
{
	if (canGetSamples)
	{
		if (!unPaused && audioDevice)
		{
			SDL_PauseAudioDevice(audioDevice, 0);
			unPaused = true;
		}
		fadeInOut();
		if (!audioDevice)
			getSamples(buffer, 256);
	}
}
REALIGN uint32_t iSNDdirectstop_(void)
{
	canGetSamples = false;
	if (audioDevice)
	{
		SDL_CloseAudioDevice(audioDevice);
		unPaused = false;
		audioDevice = 0;
	}
	buffer_pos = 0;
	free(buffer);
	buffer = NULL;
	return 0;
}
