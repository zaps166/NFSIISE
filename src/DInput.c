// SPDX-License-Identifier: MIT

#include "DInput.h"

#ifdef NFS_CPP
	void Release_wrap(void *);
	void CreateDevice_wrap(void *);
	void EnumDevices_wrap(void *);
	void QueryInterface_wrap(void *);

	void GetCapabilities_wrap(void *);
	void SetProperty_wrap(void *);
	void Acquire_wrap(void *);
	void Unacquire_wrap(void *);
	void GetDeviceState_wrap(void *);
	void GetDeviceData_wrap(void *);
	void SetDataFormat_wrap(void *);
	void SetEventNotification_wrap(void *);
	void SetCooperativeLevel_wrap(void *);
	void GetObjectInfo_wrap(void *);
	void CreateEffect_wrap(void *);
	void SendForceFeedbackCommand_wrap(void *);
	void Poll_wrap(void *);

	void SetParameters_wrap(void *);
	void Start_wrap(void *);
	void Stop_wrap(void *);
	void Download_wrap(void *);
	void Unload_wrap(void *);

	int32_t wrap_stdcall2_ret(void *this, void *func, int32_t arg0, int32_t arg1);

	static void *dinput_game_thread;

	#define WRAP_NAME(name) name##_wrap
	#define MAYBE_STATIC
#else
	#define WRAP_NAME(name) name
	#define MAYBE_STATIC static
#endif

#include <SDL2/SDL_version.h>
#include <SDL2/SDL_events.h>

#define MOUSE        0x6F1D2B60
#define JOYSTICK     0x6F1D2B70
#define FORCE_CONST  0x13541C20
#define FORCE_SQUARE 0x13541C22
#define FORCE_SPRING 0x13541C27

#define USE_ORIGINAL_SPRING_VALUES 0

static const char *g_joyPaths[2];

extern SDL_Window *sdlWin;
extern int32_t winWidth, winHeight;
extern float dpr;

extern SDL_TouchID touchId;
extern float touchDX, touchDY;

extern int32_t joystickAxes[2][12];
extern int32_t joystickAxisValueShift[2];
extern int32_t joystickEscButton[2], joystickResetButton[2];

#ifdef NFS_CPP
	extern uint32_t *mousePositionX, *mousePositionY;
	#define mousePositionX (*mousePositionX)
	#define mousePositionY (*mousePositionY)
#else
	extern uint32_t mousePositionX, mousePositionY;
#endif

static void simulateKey(int32_t keycode, int32_t scancode, uint8_t pressed, uint8_t *lastPressed)
{
	SDL_Event event = {0};
	event.key.keysym.sym = keycode;
	event.key.keysym.scancode = scancode;
	if (pressed && !*lastPressed)
	{
		event.type = SDL_KEYDOWN;
		SDL_PushEvent(&event);
		*lastPressed = pressed;
	}
	else if (!pressed && *lastPressed)
	{
		event.type = SDL_KEYUP;
		SDL_PushEvent(&event);
		*lastPressed = pressed;
	}
}

static inline int16_t convertDiToS16(int32_t magniture)
{
	return (SDL_min(magniture, 10000) * 0x7FFF) / 10000;
}
#if USE_ORIGINAL_SPRING_VALUES
static inline uint16_t convertDiToU16(uint32_t magniture)
{
	return (SDL_min(magniture, 10000u) * 0xFFFF) / 10000;
}
#endif
static inline uint32_t convertDiLength(uint32_t diLen)
{
	if (diLen == SDL_HAPTIC_INFINITY)
		return SDL_HAPTIC_INFINITY;
	return diLen / 1000;
}

static void maybeInitEffect(DirectInputDevice *dev, DirectInputEffect *eff)
{
	if (eff->joy || eff->haptic)
		return;

	if (dev->rumble)
	{
		/* Use only square force for rumble, because this API is too simple to use two forces smoothly */
		switch (eff->guid.a)
		{
			case FORCE_SQUARE:
				eff->effect.type = SDL_HAPTIC_LEFTRIGHT;
				break;
			default:
				return;
		}
		eff->joy = dev->joy;
	}
	else if (dev->haptic)
	{
		const char *effName = NULL;
		int32_t query = SDL_HapticQuery(dev->haptic);
		switch (eff->guid.a)
		{
			case FORCE_CONST:
			{
				/* Use Sine effect instead of Constant effect if it doesn't exists */
				if (query & SDL_HAPTIC_CONSTANT)
					eff->effect.type = SDL_HAPTIC_CONSTANT;
				else if (query & SDL_HAPTIC_SINE)
					eff->effect.type = SDL_HAPTIC_SINE;
				effName = "Constant";
				break;
			}
			case FORCE_SQUARE:
				/* Use Sine effect instead of Square (SDL2 doesn't have Square effect) */
				if (query & SDL_HAPTIC_SINE)
					eff->effect.type = SDL_HAPTIC_SINE;
				effName = "Sine";
				break;
			case FORCE_SPRING:
				if (query & SDL_HAPTIC_SPRING)
					eff->effect.type = SDL_HAPTIC_SPRING;
				effName = "Spring";
				break;
		}

		int32_t joyIdx = dev->guid.b;
		if (eff->effect.type != 0)
		{
			eff->haptic = dev->haptic;
			if (eff->guid.a == FORCE_CONST && eff->effect.type == SDL_HAPTIC_SINE)
			{
				printf("Effect: \"%s\" will be converted to effect: \"Sine\"\n", effName); fflush(stdout);
			}
		}
		else
		{
			printf("Effect: \"%s\" not found for joystick: %d\n", effName, joyIdx); fflush(stdout);
		}
	}
}

static void ensureJoyOpen(DirectInputDevice *dev)
{
	int32_t joyIdx = dev->guid.b;
	SDL_Joystick *joy = dev->joy;

	int32_t i;

	if (joy && !SDL_JoystickGetAttached(joy))
	{
		if (dev->haptic)
		{
			printf("Closed haptic for joystick index: %d\n", joyIdx); fflush(stdout);
			SDL_HapticClose(dev->haptic);
			dev->haptic = NULL;
		}

		for (i = 0; i < dev->num_effects; ++i)
		{
			memset(&dev->effects[i]->effect, 0, sizeof(SDL_HapticEffect));
			dev->effects[i]->playing = false;
			dev->effects[i]->joy = NULL;
			dev->effects[i]->haptic = NULL;
			dev->effects[i]->effect_idx = -1;
		}

		SDL_JoystickClose(joy);
		dev->joy = joy = NULL;

		g_joyPaths[joyIdx] = NULL;

		dev->rumble = false;

		printf("Closed joystick at index: %d\n", joyIdx); fflush(stdout);
	}

	if (!joy)
	{
		const int32_t n = SDL_NumJoysticks();
		for (i = 0; i < n; ++i)
		{
			const char *name = SDL_JoystickNameForIndex(i);
#ifdef __ANDROID__
			if (n > 1 && name && strcmp(name, "Android Accelerometer") == 0)
				continue;
#else
			if (name && strstr(name, "SynPS/2"))
				continue;
#endif

			const char *anotherPath = g_joyPaths[1 - joyIdx];
			const char *path = SDL_JoystickPathForIndex(i);
			if (anotherPath && strcmp(path, anotherPath) == 0)
				continue; //Joystick already open at another index

			dev->joy = joy = SDL_JoystickOpen(i);
			if (dev->joy)
			{
				g_joyPaths[joyIdx] = path;
				printf("Joystick \"%s\" opened at system index: %d at index: %d at: %s\n", SDL_JoystickName(joy), i, joyIdx, path); fflush(stdout);
			}

			break;
		}
		if (!joy)
			return;

		dev->haptic = SDL_HapticOpenFromJoystick(joy);
		if (dev->haptic)
		{
			printf("Haptic opened for joystick index: %d", joyIdx);
		}
		else
		{
			/* Try to open haptic by matching the name with joystick name */
			const char *joyName = SDL_JoystickName(joy);
			const int32_t n = SDL_NumHaptics();
			for (i = 0; i < n; ++i)
			{
				if (SDL_HapticOpened(i) == SDL_TRUE)
					continue;

				const char *name = SDL_HapticName(i);
				if (strcmp(name, joyName) == 0)
				{
					dev->haptic = SDL_HapticOpen(i);
					if (dev->haptic)
					{
						printf("Haptic \"%s\" opened at system index: %d for joystick index: %d", name, i, joyIdx);
					}
					break;
				}
			}
		}

		if (dev->haptic)
		{
			printf(", num axes: %d\n", SDL_HapticNumAxes(dev->haptic));
			fflush(stdout);

			/* Re-apply gain */
			if (dev->gain < 100)
				SDL_HapticSetGain(dev->haptic, dev->gain);
		}
#if SDL_VERSION_ATLEAST(2, 0, 9)
		else if (SDL_JoystickGetType(joy) == SDL_JOYSTICK_TYPE_GAMECONTROLLER)
		{
			/* Use rumble as a fallback */
# if SDL_VERSION_ATLEAST(2, 0, 18)
			dev->rumble = SDL_JoystickHasRumble(joy);
# else
			dev->rumble = (SDL_JoystickRumble(joy, 0, 0, 0) == 0);
# endif
			if (dev->rumble)
			{
				printf("Using rumble for joystick index: %d\n", joyIdx); fflush(stdout);
			}
		}
#endif

		/* Re-open effects */
		for (i = 0; i < dev->num_effects; ++i)
			maybeInitEffect(dev, dev->effects[i]);
	}
}

static void maybeRestartEffect(DirectInputEffect *eff)
{
	if (!eff->playing)
		return;

//	fprintf(stderr, "[%p] Start effect 0x%.2X\n", eff, eff->effect.type);

	if (eff->joy)
	{
#if SDL_VERSION_ATLEAST(2, 0, 9)
		const SDL_HapticLeftRight *lr = &eff->effect.leftright;
		uint32_t gain = SDL_min(*eff->gain, 100u);
		if (gain > 0)
		{
			SDL_JoystickRumble(eff->joy, lr->large_magnitude * gain / 100, lr->small_magnitude * gain / 100, lr->length);
		}
#endif
	}
	else if (eff->haptic && eff->effect_idx >= 0)
	{
		SDL_HapticRunEffect(eff->haptic, eff->effect_idx, 1);
	}
}
static void maybeStopEffect(DirectInputEffect *eff, BOOL pause)
{
	if (!eff->playing)
		return;

//	fprintf(stderr, "[%p] Stop effect 0x%.2X\n", eff, eff->effect.type);

	if (eff->joy)
	{
#if SDL_VERSION_ATLEAST(2, 0, 9)
		SDL_JoystickRumble(eff->joy, 0, 0, 0);
#endif
	}
	else if (eff->haptic && eff->effect_idx >= -1)
	{
		SDL_HapticStopEffect(eff->haptic, eff->effect_idx);
	}

	if (!pause)
		eff->playing = false;
}

static void setEffect(DirectInputEffect *dinputEffect, const DIEFFECT *di_eff)
{
	uint32_t length = convertDiLength(di_eff->duration);
	switch (dinputEffect->guid.a)
	{
		case FORCE_CONST:
		{
			const DICONSTANTFORCE *di_constant = (const DICONSTANTFORCE *)di_eff->typeSpecificParams;
			switch (dinputEffect->effect.type)
			{
				case SDL_HAPTIC_CONSTANT:
				{
					SDL_HapticConstant *sdl_constant = &dinputEffect->effect.constant;
					sdl_constant->length = length;
					sdl_constant->level = convertDiToS16(di_constant->magnitude);
					if (SDL_HapticNumAxes(dinputEffect->haptic) == 1)
					{
						sdl_constant->direction.type = SDL_HAPTIC_CARTESIAN;
						int32_t direction = di_eff->rglDirection[0] / 100;
	//					fprintf(stderr, "Constant: %d\n", direction);
						if (direction > 0 && direction < 180)
						{
							int32_t tmp = direction;
							if (tmp > 90)
								tmp = 180 - tmp;
							sdl_constant->level = sdl_constant->level * tmp / 90; //Reduce level if not 90 degrees
							sdl_constant->direction.dir[0] = 1;
						}
						else if (direction > 180 && direction < 360)
						{
							int32_t tmp = direction - 180;
							if (tmp > 90)
								tmp = 180 - tmp;
							sdl_constant->level = sdl_constant->level * tmp / 90; //Reduce level if not 270 degrees
							sdl_constant->direction.dir[0] = -1;
						}
						else if (SDL_HapticQuery(dinputEffect->haptic) & SDL_HAPTIC_SINE)
						{
							/* Use sine force for 0 or 180 (can't determine the direction) */
							SDL_HapticEffect backup = dinputEffect->effect;
							memset(&dinputEffect->effect, 0, sizeof(SDL_HapticEffect));
							dinputEffect->effect.type = SDL_HAPTIC_SINE;
							dinputEffect->constantToSineDivider = 2;
							setEffect(dinputEffect, di_eff);
							dinputEffect->constantToSineDivider = 0;
							dinputEffect->effect = backup;
							return;
						}
						else
						{
							/* Disable effect if sine force is not supported for 0 or 180 */
							sdl_constant->level = 0;
						}
					}
					else
					{
						sdl_constant->direction.type = SDL_HAPTIC_POLAR;
						sdl_constant->direction.dir[0] = di_eff->rglDirection[0];
					}
					break;
				}
				case SDL_HAPTIC_SINE:
				{
					/* Convert constant force to sine force */
					SDL_HapticPeriodic *sdl_periodic = &dinputEffect->effect.periodic;
					sdl_periodic->length = length;
					sdl_periodic->period = 75;
					sdl_periodic->magnitude = convertDiToS16(di_constant->magnitude);
					if (dinputEffect->constantToSineDivider > 0)
						sdl_periodic->magnitude /= dinputEffect->constantToSineDivider;
					sdl_periodic->direction.type = SDL_HAPTIC_CARTESIAN;
					break;
				}
			}
			break;
		}
		case FORCE_SQUARE:
		{
			const DIPERIODIC *di_periodic = (const DIPERIODIC *)di_eff->typeSpecificParams;
			switch (dinputEffect->effect.type)
			{
				case SDL_HAPTIC_SINE:
				{
					SDL_HapticPeriodic *sdl_periodic = &dinputEffect->effect.periodic;
					sdl_periodic->length = length;
					sdl_periodic->period = convertDiLength(di_periodic->period);
					sdl_periodic->magnitude = convertDiToS16(di_periodic->magnitude);
					sdl_periodic->offset = convertDiToS16(di_periodic->offset);
					sdl_periodic->phase = di_periodic->phase;
					sdl_periodic->direction.type = SDL_HAPTIC_CARTESIAN;
					break;
				}
				case SDL_HAPTIC_LEFTRIGHT:
				{
					/* Rumble */
					SDL_HapticLeftRight *sdl_lr = &dinputEffect->effect.leftright;
					sdl_lr->length = length;
					sdl_lr->large_magnitude = convertDiToS16(di_periodic->magnitude);
					sdl_lr->small_magnitude = sdl_lr->large_magnitude;
					break;
				}
			}
			break;
		}
		case FORCE_SPRING:
		{
			const DICONDITION *di_condition = (const DICONDITION *)di_eff->typeSpecificParams;
			SDL_HapticCondition *sdl_condition = &dinputEffect->effect.condition;
			sdl_condition->length = length;
			sdl_condition->center[0] = convertDiToS16(di_condition[0].offset);
#if USE_ORIGINAL_SPRING_VALUES // When center is negative, other values are almost binary (max/off, game bug?)
			/* Deadband always 0, saturation and coeff always the same */
			sdl_condition->right_sat[0] = convertDiToU16(di_condition[0].positiveSaturation);
			sdl_condition->left_sat[0] = convertDiToU16(di_condition[0].negativeSaturation);
			sdl_condition->right_coeff[0] = convertDiToS16(di_condition[0].positiveCoefficient);
			sdl_condition->left_coeff[0] = convertDiToS16(di_condition[0].negativeCoefficient);
			sdl_condition->deadband[0] = convertDiToU16(di_condition[0].deadBand);
#else // Set saturation and coeff from center value
			int32_t val = SDL_abs(sdl_condition->center[0]);
			sdl_condition->right_sat[0]   = sdl_condition->left_sat[0]   = val * 2;
			sdl_condition->right_coeff[0] = sdl_condition->left_coeff[0] = val;
#endif
			sdl_condition->direction.type = SDL_HAPTIC_CARTESIAN;

//			fprintf(stderr, "Spring: %6d %6d\n",
//				sdl_condition->right_coeff[0],
//				sdl_condition->center[0]
//			);

			break;
		}
	}

	if (dinputEffect->haptic)
	{
		if (dinputEffect->effect_idx >= 0 && SDL_HapticUpdateEffect(dinputEffect->haptic, dinputEffect->effect_idx, &dinputEffect->effect) != 0)
		{
			/* Usually happens when we changed effect type */
			SDL_HapticDestroyEffect(dinputEffect->haptic, dinputEffect->effect_idx);
			dinputEffect->effect_idx = -1;
		}
		if (dinputEffect->effect_idx < 0)
		{
			dinputEffect->effect_idx = SDL_HapticNewEffect(dinputEffect->haptic, &dinputEffect->effect);
			if (dinputEffect->effect_idx < 0)
			{
				printf("%s (effect type: 0x%.2X)\n", SDL_GetError(), dinputEffect->effect.type); fflush(stdout);
			}
		}
	}
}

/// DirectInputObject

MAYBE_STATIC REALIGN STDCALL uint32_t QueryInterface(void **this, const IID *const riid, void **object)
{
	/* Joystick only */
	++((DirectInputObject *)(*this - sizeof(DirectInputObject)))->ref;
	*object = this;
//	fprintf(stderr, "QueryInterface: 0x%X %p\n", (*riid)[0], *this);
	return 0;
}
MAYBE_STATIC REALIGN STDCALL uint32_t Release(void **this)
{
	DirectInputObject *dinputObj = (DirectInputObject *)(*this - sizeof(DirectInputObject));
	if (--dinputObj->ref)
		return 0;

	if (dinputObj->is_device)
	{
		DirectInputDevice *dinputDev = (*(DirectInputDevice **)this);
		if (dinputDev->guid.a == JOYSTICK)
		{
			int32_t joyIdx = dinputDev->guid.b;

//			fprintf(stderr, "Release: close device %p %d\n", dinputDev->joy, joyIdx);

			int32_t i;
			for (i = 0; i != dinputDev->num_effects; ++i)
				free((void *)dinputDev->effects[i] - sizeof(DirectInputObject));
			free(dinputDev->effects);

			if (dinputDev->haptic)
				SDL_HapticClose(dinputDev->haptic);

			if (dinputDev->joy)
				SDL_JoystickClose(dinputDev->joy);

			g_joyPaths[joyIdx] = NULL;
		}
	}

	free(dinputObj);
	free(this);

//	fprintf(stderr, "Release: 0x%p\n", *this);
	return 0;
}

/// DirectInputEffect

MAYBE_STATIC REALIGN STDCALL uint32_t SetParameters(DirectInputEffect **this, const DIEFFECT *eff, uint32_t flags)
{
//	fprintf(stderr, "[%p] SetParameters: %X %X\n", *this, (*this)->effect.type, flags);
	setEffect(*this, eff);
	maybeRestartEffect(*this);
	return 0;
}
MAYBE_STATIC REALIGN STDCALL uint32_t Start(DirectInputEffect **this, uint32_t iterations, uint32_t flags)
{
//	fprintf(stderr, "[%p] Start: %X %d %X\n", *this, (*this)->effect.type, iterations, flags);
	(*this)->playing = true;
	maybeRestartEffect(*this);
	return 0;
}
MAYBE_STATIC REALIGN STDCALL uint32_t Stop(DirectInputEffect **this)
{
//	fprintf(stderr, "[%p] Stop: %X\n", *this, (*this)->effect.type);
	maybeStopEffect(*this, false);
	return 0;
}
MAYBE_STATIC REALIGN STDCALL uint32_t Download(DirectInputEffect **this)
{
//	fprintf(stderr, "[%p] Download: %X\n", *this, (*this)->real_type);
	return 0;
}
MAYBE_STATIC REALIGN STDCALL uint32_t Unload(DirectInputEffect **this)
{
//	fprintf(stderr, "[%p] Unload: %X\n", *this, (*this)->effect.type);
	maybeStopEffect(*this, false);
	return 0;
}

/// DirectInputDevice

MAYBE_STATIC REALIGN STDCALL uint32_t GetCapabilities(DirectInputDevice **this, DIDEVCAPS *devCaps)
{
	/* Joystick only */
	if ((*this)->guid.a == JOYSTICK)
	{
	//	fprintf(stderr, "GetCapabilities %p\n", *this);
		memset(&devCaps->flags, 0, sizeof(DIDEVCAPS) - sizeof(uint32_t));
		devCaps->flags = 0x100; //DIDC_FORCEFEEDBACK
		devCaps->buttons = 32;
		devCaps->axes = 6;
	}
	return 0;
}
MAYBE_STATIC REALIGN STDCALL uint32_t SetProperty(DirectInputDevice **this, const GUID *const rguidProp, const DIPROPHEADER *pdiph)
{
	if (rguidProp == (void *)0x7 /*DIPROP_FFGAIN*/)
	{
		(*this)->gain = ((const DIPROPDWORD *)pdiph)->dwData / 100;
		if ((*this)->haptic)
			SDL_HapticSetGain((*this)->haptic, (*this)->gain);
	}
	return 0;
}
MAYBE_STATIC REALIGN STDCALL uint32_t Acquire(DirectInputDevice **this)
{
//	fprintf(stderr, "Acquire: %p %X\n", *this);
	return 0;
}
MAYBE_STATIC REALIGN STDCALL uint32_t Unacquire(DirectInputDevice **this)
{
//	fprintf(stderr, "Unacquire: %u\n", (*this)->ref);
	return 0;
}
MAYBE_STATIC REALIGN STDCALL uint32_t GetDeviceState(DirectInputDevice **this, uint32_t cbData, void *data)
{
	/* Joystick only */
	if (!data || cbData != sizeof(DIJOYSTATE) || (*this)->guid.a != JOYSTICK)
		return 0;

	DIJOYSTATE *joyState = (DIJOYSTATE *)data;
	SDL_memset4(joyState->axes, 0x7FFF, 8);
	memset(joyState->buttons, 0, sizeof joyState->buttons);

	SDL_Joystick *joy = (*this)->joy;
	if (!joy)
		return 0;

	int32_t joyIdx = (*this)->guid.b;

	int32_t numButtons = SDL_min(SDL_JoystickNumButtons(joy), 32);
	int32_t numAxes = SDL_min(SDL_JoystickNumAxes(joy), 6);

	int32_t i;

	if (joystickEscButton[joyIdx] >= 0 && joystickEscButton[joyIdx] < numButtons)
	{
		simulateKey(SDLK_ESCAPE, SDL_SCANCODE_ESCAPE, SDL_JoystickGetButton(joy, joystickEscButton[joyIdx]), &(*this)->escPressed);
	}
	if (joystickResetButton[joyIdx] >= 0 && joystickResetButton[joyIdx] < numButtons)
	{
		simulateKey(SDLK_F11 + joyIdx, SDL_SCANCODE_F11 + joyIdx, SDL_JoystickGetButton(joy, joystickResetButton[joyIdx]), &(*this)->resetPressed);
	}

	for (i = 0; i < numButtons; ++i)
	{
		if (i == joystickEscButton[joyIdx] || i == joystickResetButton[joyIdx])
			continue; //Skip joystick button assigned as keyboard keys
		joyState->buttons[i] = SDL_JoystickGetButton(joy, i) << 7;
	}

	for (i = 0; i < numAxes; ++i)
	{
		if (joystickAxes[joyIdx][i] < 0)
			continue;

		int32_t *axis = &joyState->axes[i < 3 ? i : i + 2];
		*axis = (uint16_t)SDL_JoystickGetAxis(joy, joystickAxes[joyIdx][i]) ^ 0x8000;
		if (joystickAxes[joyIdx][i + 6] > 0)
			*axis = (*axis >> 1) + 32768;
		else if (joystickAxes[joyIdx][i + 6] < 0)
			*axis = 65535 - (*axis >> 1);
	}

	int32_t localJoystickAxisValueShift = joystickAxisValueShift[joyIdx];
	if (localJoystickAxisValueShift < 0 || localJoystickAxisValueShift > 32767)
	{
		switch (SDL_JoystickGetType(joy))
		{
			case SDL_JOYSTICK_TYPE_GAMECONTROLLER:
				localJoystickAxisValueShift = 3072;
				break;
			case SDL_JOYSTICK_TYPE_WHEEL:
				localJoystickAxisValueShift = 6144;
				break;
			default:
				localJoystickAxisValueShift = 0;
				break;
		}
	}
	if (localJoystickAxisValueShift != 0)
	{
		if (joyState->axes[0] < 0x8000)
			joyState->axes[0] -= localJoystickAxisValueShift;
		else if (joyState->axes[0] > 0x8000)
			joyState->axes[0] += localJoystickAxisValueShift;

		if (joyState->axes[0] > 0xFFFF)
			joyState->axes[0] = 0xFFFF;
		else if (joyState->axes[0] < 0x0000)
			joyState->axes[0] = 0x0000;
	}

	return 0;
}
MAYBE_STATIC REALIGN STDCALL uint32_t GetDeviceData(DirectInputDevice **this, uint32_t cbObjectData, DIDEVICEOBJECTDATA *rgdod, uint32_t *pdwInOut, uint32_t dwFlags)
{
	/* Mouse only. This implementation forces the absolute position of the mouse cursor. */
	if (!rgdod || !pdwInOut || (*this)->guid.a != MOUSE || *pdwInOut < 3)
		return 0;

	uint32_t i;
	memset(rgdod, 0, *pdwInOut * sizeof(DIDEVICEOBJECTDATA));
	rgdod[0].dwOfs = 0; //Mouse X
	rgdod[1].dwOfs = 4; //Mouse Y
	rgdod[2].dwOfs = 12; //Mouse Click
	for (i = 3; i < *pdwInOut; ++i)
		rgdod[i].dwOfs = 8; //Nothing

	if (mousePositionX != (*this)->lastX || mousePositionY != (*this)->lastY)
	{
		/* Move the mouse cursor if game changes cursor position */
		SDL_WarpMouseInWindow(NULL, (mousePositionX / dpr * winWidth / 640.0f) + 0.5f, (mousePositionY / dpr * winHeight / 480.0f) + 0.5f);
		(*this)->lastX = mousePositionX;
		(*this)->lastY = mousePositionY;
	}
	else
	{
		if (touchId != 0)
		{
			(*this)->lastX += touchDX * dpr * 640.0f + 0.5f;
			(*this)->lastY += touchDY * dpr * 480.0f + 0.5f;
			touchDX = touchDY = 0.0f;
			rgdod[0].dwData = (*this)->lastX - mousePositionX;
			rgdod[1].dwData = (*this)->lastY - mousePositionY;
		}
		else
		{
			static int32_t lastMouseButton;
			int32_t x = 0, y = 0;
			int32_t mouseButton = SDL_GetRelativeMouseState(&x, &y) & SDL_BUTTON_LMASK;
			if (x || y) /* Only when mouse moved */
			{
				SDL_GetMouseState(&x, &y);
				(*this)->lastX = (x * dpr * 640.0f / winWidth)  + 0.5f;
				(*this)->lastY = (y * dpr * 480.0f / winHeight) + 0.5f;
				rgdod[0].dwData = (*this)->lastX - mousePositionX;
				rgdod[1].dwData = (*this)->lastY - mousePositionY;
			}
			if (!lastMouseButton)
				rgdod[2].dwData = -mouseButton;
			lastMouseButton = mouseButton;
		}
	}

	return 0;
}
MAYBE_STATIC REALIGN STDCALL uint32_t SetDataFormat(DirectInputDevice **this, const DIDATAFORMAT *df)
{
	/* NFSIISE uses standard data format:
	 * 	Mouse    - c_dfDIMouse
	 * 	Joystick - c_dfDIJoystick
	*/
	return 0;
}
MAYBE_STATIC REALIGN STDCALL uint32_t SetEventNotification(DirectInputDevice **this, void *hEvent)
{
//	fprintf(stderr, "SetEventNotification: %p 0x%p\n", *this, hEvent);
	return 0;
}
MAYBE_STATIC REALIGN STDCALL uint32_t SetCooperativeLevel(DirectInputDevice **this, void *hwnd, uint32_t dwFlags)
{
//	fprintf(stderr, "SetCooperativeLevel: %p %p 0x%X\n", *this, hwnd, dwFlags);
	return 0;
}
MAYBE_STATIC REALIGN STDCALL uint32_t CreateEffect(DirectInputDevice **this, const GUID *const rguid, const DIEFFECT *di_eff, DirectInputEffect ***deff, void *punkOuter)
{
	/* Joystick only */
	DirectInputEffect *dinput_eff = (DirectInputEffect *)calloc(1, sizeof(DirectInputObject) + sizeof(DirectInputEffect));
	((DirectInputObject *)dinput_eff)->ref = 1;
	dinput_eff = (void *)dinput_eff + sizeof(DirectInputObject);
	dinput_eff->gain = &(*this)->gain;
	dinput_eff->effect_idx = -1;

	dinput_eff->SetParameters = WRAP_NAME(SetParameters);
	dinput_eff->Start = WRAP_NAME(Start);
	dinput_eff->Stop = WRAP_NAME(Stop);
	dinput_eff->Download = WRAP_NAME(Download);
	dinput_eff->Unload = WRAP_NAME(Unload);

	memcpy(&dinput_eff->guid, rguid, sizeof(GUID));

	maybeInitEffect(*this, dinput_eff);
	setEffect(dinput_eff, di_eff);

//	fprintf(stderr, "%X %X %d\n", dinputEff->guid.a, dinputEff->effect.type, dinputEff->effect_idx);

	*deff = malloc(sizeof(void *));
	**deff = dinput_eff;

	(*this)->num_effects += 1;

	(*this)->effects = (DirectInputEffect **)realloc((*this)->effects, (*this)->num_effects * sizeof(DirectInputEffect *));
	(*this)->effects[(*this)->num_effects - 1] = dinput_eff;

	return 0;
}
MAYBE_STATIC REALIGN STDCALL uint32_t GetObjectInfo(DirectInputDevice **this, DIDEVICEOBJECTINSTANCEA *pdidoi, uint32_t dwObj, uint32_t dwHow)
{
	/* Joystick only */
//	fprintf(stderr, "GetObjectInfo: %p %d %d\n", *this, dwObj, dwHow);
	memset(&pdidoi->guidType, 0, sizeof(DIDEVICEOBJECTINSTANCEA) - sizeof(uint32_t));
	return 0;
}
MAYBE_STATIC REALIGN STDCALL uint32_t SendForceFeedbackCommand(DirectInputDevice **this, uint32_t flags)
{
	/* Joystick only */
//	fprintf(stderr, "[%p] SendForceFeedbackCommand: %X\n", *this, flags);
	int32_t i;
	switch (flags)
	{
		case 0x01: //DISFFC_RESET
		case 0x02: //DISFFC_STOPALL
			for (i = 0; i < (*this)->num_effects; ++i)
				maybeStopEffect((*this)->effects[i], false);
			break;
		case 0x04: //DISFFC_PAUSE
		case 0x20: //DISFFC_SETACTUATORSOFF
			for (i = 0; i < (*this)->num_effects; ++i)
				maybeStopEffect((*this)->effects[i], true);
			break;
		case 0x08: //DISFFC_CONTINUE
		case 0x10: //DISFFC_SETACTUATORSON
			for (i = 0; i < (*this)->num_effects; ++i)
			{
				if ((*this)->effects[i]->guid.a == FORCE_SQUARE)
					maybeRestartEffect((*this)->effects[i]);
			}
			break;
	}
	return 0;
}
MAYBE_STATIC REALIGN STDCALL uint32_t Poll(DirectInputDevice **this)
{
	/* Joystick only */

	SDL_JoystickUpdate();

	ensureJoyOpen(*this);

	return 0;
}

/// DirectInput

MAYBE_STATIC REALIGN STDCALL uint32_t CreateDevice(void **this, const GUID *const rguid, DirectInputDevice ***directInputDevice, void *unkOuter)
{
	DirectInputDevice *dinputDev = (DirectInputDevice *)calloc(1, sizeof(DirectInputObject) + sizeof(DirectInputDevice));
	((DirectInputObject *)dinputDev)->ref = 1;
	((DirectInputObject *)dinputDev)->is_device = true;
	dinputDev = (void *)dinputDev + sizeof(DirectInputObject);

	dinputDev->QueryInterface = WRAP_NAME(QueryInterface);
	dinputDev->Release = WRAP_NAME(Release);

	dinputDev->GetCapabilities = WRAP_NAME(GetCapabilities);
	dinputDev->SetProperty = WRAP_NAME(SetProperty);
	dinputDev->Acquire = WRAP_NAME(Acquire);
	dinputDev->Unacquire = WRAP_NAME(Unacquire);
	dinputDev->GetDeviceState = WRAP_NAME(GetDeviceState);
	dinputDev->GetDeviceData = WRAP_NAME(GetDeviceData);
	dinputDev->SetDataFormat = WRAP_NAME(SetDataFormat);
	dinputDev->SetEventNotification = WRAP_NAME(SetEventNotification);
	dinputDev->SetCooperativeLevel = WRAP_NAME(SetCooperativeLevel);
	dinputDev->GetObjectInfo = WRAP_NAME(GetObjectInfo);
	dinputDev->CreateEffect = WRAP_NAME(CreateEffect);
	dinputDev->SendForceFeedbackCommand = WRAP_NAME(SendForceFeedbackCommand);
	dinputDev->Poll = WRAP_NAME(Poll);

	memcpy(&dinputDev->guid, rguid, sizeof(GUID));

	dinputDev->gain = 255;

	if (dinputDev->guid.a == MOUSE || dinputDev->guid.a == JOYSTICK)
	{
		*directInputDevice = malloc(sizeof(void *));
		**directInputDevice = dinputDev;
		return 0;
	}

//	fprintf(stderr, "CreateDevice: error 0x%.8X\n", dinputDev->guid.a);
	free((void *)dinputDev - sizeof(DirectInputObject));
	return -1;
}
MAYBE_STATIC REALIGN STDCALL uint32_t EnumDevices(void **this, uint32_t devType, DIENUMDEVICESCALLBACKA callback, void *ref, uint32_t dwFlags)
{
	if (devType != 4 /* DIDEVTYPE_JOYSTICK */)
		return 0;

	uint32_t i;
	for (i = 0; i < 2; ++i)
	{
		DIDEVICEINSTANCEA deviceInstance = {0};
		deviceInstance.guidInstance.a = JOYSTICK;
		deviceInstance.guidInstance.b = i;
#ifdef NFS_CPP
		if (!wrap_stdcall2_ret(dinput_game_thread, callback, &deviceInstance, ref))
#else
		if (!callback(&deviceInstance, ref))
#endif
		{
			break;
		}
	}
	return 0;
}

/// Entrypoint

REALIGN STDCALL uint32_t DirectInputCreateA_wrap(MAYBE_THIS void *hInstance, uint32_t version, DirectInput ***directInputA, void *unkOuter)
{
	DirectInput *dinput = (DirectInput *)calloc(1, sizeof(DirectInputObject) + sizeof(DirectInput));
	((DirectInputObject *)dinput)->ref = 1;
	dinput = (void *)dinput + sizeof(DirectInputObject);

	dinput->Release = WRAP_NAME(Release);
	dinput->CreateDevice = WRAP_NAME(CreateDevice);
	dinput->EnumDevices = WRAP_NAME(EnumDevices);

	*directInputA = malloc(sizeof(void *));
	**directInputA = dinput;

#ifdef NFS_CPP
	dinput_game_thread = this;
#endif

	return 0;
}
