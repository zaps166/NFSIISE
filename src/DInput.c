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

#include <SDL2/SDL_events.h>

#define MOUSE        0x6F1D2B60
#define JOYSTICK     0x6F1D2B70
#define FORCE_CONST  0x13541C20
#define FORCE_SQUARE 0x13541C22
#define FORCE_SPRING 0x13541C27

extern SDL_Window *sdlWin;
extern int32_t winWidth, winHeight;
extern double dpr;

extern int32_t joystickAxes[2][8], joystickButtons[2][15];
extern int32_t joystickAxisValueShift[2];
extern int32_t joystick0EscButton;

extern BOOL useHapticPolar;
extern BOOL useSpringForceFeedbackEffect;
extern int32_t forceFeedbackDevice;

#ifdef NFS_CPP
	extern uint32_t *mousePositionX, *mousePositionY;
	#define mousePositionX (*mousePositionX)
	#define mousePositionY (*mousePositionY)
#else
	extern uint32_t mousePositionX, mousePositionY;
#endif

extern int32_t touchpadJoyIdx;

#define CONVERT(x) (((x)*0x7FFF)/10000)
#define CONVERT_LENGTH(x) (((x) == (SDL_HAPTIC_INFINITY)) ? (SDL_HAPTIC_INFINITY) : ((x) / 1000))

static inline void setEnvelope(uint16_t *attack_length, uint16_t *attack_level, uint16_t *fade_length, uint16_t *fade_level, DIENVELOPE *envelope)
{
	*attack_length = envelope->attackTime / 1000;
	*attack_level = CONVERT(envelope->attackLevel);
	*fade_length = envelope->fadeTime / 1000;
	*fade_level = CONVERT(envelope->fadeLevel);
}
static void setEffect(DirectInputEffect *dinputEffect, const DIEFFECT *di_eff)
{
	uint32_t i;
	switch (dinputEffect->real_type)
	{
		case SDL_HAPTIC_CONSTANT:
		{
			DICONSTANTFORCE *di_constant = (DICONSTANTFORCE *)di_eff->typeSpecificParams;
			if (dinputEffect->effect.type == SDL_HAPTIC_SINE)
			{
				SDL_HapticPeriodic *periodic = &dinputEffect->effect.periodic;
				if (di_constant)
					periodic->magnitude = CONVERT(di_constant->magnitude);
				periodic->length = CONVERT_LENGTH(di_eff->duration);
// 				printf("Constant as Sine: %d, %d\n", periodic->length, periodic->magnitude);
			}
			else
			{
				SDL_HapticConstant *constant = &dinputEffect->effect.constant;
				if (di_constant)
					constant->level = CONVERT(di_constant->magnitude);
				constant->length = CONVERT_LENGTH(di_eff->duration);

#ifdef SDL_HAPTIC_STEERING_AXIS
				constant->direction.type = useHapticPolar ? SDL_HAPTIC_POLAR : SDL_HAPTIC_STEERING_AXIS; //di_eff->flags shows that POLAR is used (0x20)
#else
#	warning "SDL_HAPTIC_STEERING_AXIS requires SDL 2.0.14 or newer!"
				constant->direction.type = SDL_HAPTIC_POLAR; //di_eff->flags shows that POLAR is used (0x20)
#endif

				for (i = 0; i < di_eff->cAxes; ++i) {
					int dir;
					//SDL_HAPTIC_STEERING_AXIS uses cardinal
					if (constant->direction.type == SDL_HAPTIC_STEERING_AXIS)
					{
						/*
						switch(di_eff->rglDirection[i])
						{
							case 9000: //East
							//case 18000: //South
								dir = 1;
								break;
							//case 0: //North
							case 27000: //West
								dir = -1;
								break;
							default:
								dir = 0;
								break;
						}
						*/
						if(di_eff->rglDirection[i] > 0 && di_eff->rglDirection[i] < 18000)
							dir = 1;
						else if (di_eff->rglDirection[i] > 18000 && di_eff->rglDirection[i] < 36000)
							dir = -1;
						else 
							dir = 0;
					}
					else
					{
						dir = di_eff->rglDirection[i];
					}
					
					constant->direction.dir[i] = dir;
				}

// 				printf("Constant: %d %d %d, %X\n", constant->length, constant->level, di_eff->cAxes, di_eff->flags);
			}
		} break;
		case SDL_HAPTIC_SINE:
		{
			DIPERIODIC *di_periodic = (DIPERIODIC *)di_eff->typeSpecificParams;
			SDL_HapticPeriodic *periodic = &dinputEffect->effect.periodic;

#ifdef SDL_HAPTIC_STEERING_AXIS
				periodic->direction.type = useHapticPolar ? SDL_HAPTIC_POLAR : SDL_HAPTIC_STEERING_AXIS; //di_eff->flags shows that POLAR is used (0x20)
#else
#	warning "SDL_HAPTIC_STEERING_AXIS requires SDL 2.0.14 or newer!"
				periodic->direction.type = SDL_HAPTIC_POLAR; //di_eff->flags shows that POLAR is used (0x20)
#endif

			if (di_periodic)
			{
				periodic->magnitude = CONVERT(di_periodic->magnitude);
				periodic->offset = CONVERT(di_periodic->offset);
				periodic->period = (uint16_t)CONVERT_LENGTH(di_periodic->period);
				periodic->phase = di_periodic->phase;
			}
			periodic->length = CONVERT_LENGTH(di_eff->duration);
			if (di_eff->envelope)
				setEnvelope(&periodic->attack_length, &periodic->attack_level, &periodic->fade_length, &periodic->fade_level, di_eff->envelope);
// 			printf("Square as Sine: %d\n", periodic->magnitude);
		} break;
		case SDL_HAPTIC_SPRING:
		{
			/* Deadband always 0, Coeff and Saturation always the same */
			if (dinputEffect->effect.type == SDL_HAPTIC_SPRING)
			{
				/* Is it OK? I can't test it! */
				SDL_HapticCondition *condition = &dinputEffect->effect.condition;

#ifdef SDL_HAPTIC_STEERING_AXIS
				condition->direction.type = useHapticPolar ? SDL_HAPTIC_POLAR : SDL_HAPTIC_STEERING_AXIS; //di_eff->flags shows that POLAR is used (0x20)
#else
#	warning "SDL_HAPTIC_STEERING_AXIS requires SDL 2.0.14 or newer!"
				condition->direction.type = SDL_HAPTIC_POLAR; //di_eff->flags shows that POLAR is used (0x20)
#endif

				for (i = 0; i < di_eff->cAxes; ++i)
				{
					DICONDITION *di_condition = (DICONDITION *)di_eff->typeSpecificParams + i;
					condition->center[i] = CONVERT(di_condition->lOffset);
					condition->right_coeff[i] = CONVERT(di_condition->lPositiveCoefficient);
					condition->left_coeff[i] = CONVERT(di_condition->lNegativeCoefficient);
					condition->right_sat[i] = CONVERT(di_condition->dwPositiveSaturation);
					condition->left_sat[i] = CONVERT(di_condition->dwNegativeSaturation);
					condition->deadband[i] = CONVERT(di_condition->lDeadBand);


					//Force center spring. Experimental
					// condition->center[i] = 0;
					// condition->right_coeff[i] = 12000;
					// condition->left_coeff[i] = 12000;
					// condition->right_sat[i] =  0;
					// condition->left_sat[i] =  0;
					// condition->deadband[i] = 0;

// 					printf("Spring[%d]: %d %d %d %d %d %d\n", i, condition->center[i], condition->right_coeff[i], condition->left_coeff[i], condition->right_sat[i], condition->left_sat[i], condition->deadband[i]);
				}
				condition->length = CONVERT_LENGTH(di_eff->duration);
			}
			else if (dinputEffect->effect.type == SDL_HAPTIC_CONSTANT && di_eff->cAxes)
			{
				/* Simulate Spring with Constant - this probably works bad :D */

				SDL_HapticConstant *constant = &dinputEffect->effect.constant;
				DICONDITION *di_condition = (DICONDITION *)di_eff->typeSpecificParams;

				int32_t axis = *dinputEffect->xAxis * 20000 / 65535 - 10000;
				int32_t force;
				if (*dinputEffect->xAxis > 0)
					force = di_condition->lPositiveCoefficient * (axis - di_condition->lOffset);
				else
					force = di_condition->lNegativeCoefficient * (axis - di_condition->lOffset);

				constant->direction.type = SDL_HAPTIC_CARTESIAN;
				constant->direction.dir[0] = (force == 0) ? 0 : (force < 0 ? -1 : 1);
				constant->attack_level = SDL_abs(force / 3052);
				constant->attack_length = (uint16_t)CONVERT_LENGTH(di_eff->duration);

// 				printf("Spring as Constant: coeffP: %d, coeffN: %d, offset: %d, xAxis: %d, force: %d, attack: %d\n", di_condition->lPositiveCoefficient, di_condition->lNegativeCoefficient, di_condition->lOffset, axis, force, force / 3052);
			}
		} break;
	}
}

static SDL_Haptic *openHaptic(SDL_Joystick *joy)
{
	SDL_Haptic *haptic = NULL;
	if (forceFeedbackDevice > -1)
	{
		haptic = SDL_HapticOpen(forceFeedbackDevice);
	}
	else
	{
		haptic = SDL_HapticOpenFromJoystick(joy);
		if (!haptic)
			haptic = SDL_HapticOpen(0);
	}
	return haptic;
}

MAYBE_STATIC REALIGN STDCALL uint32_t QueryInterface(void **this, const IID *const riid, void **object)
{
	/* Joystick only */
	++((DirectInputObject *)(*this - sizeof(DirectInputObject)))->ref;
	*object = this;
// 	printf("QueryInterface: 0x%X %p\n", (*riid)[0], *this);
	return 0;
}
MAYBE_STATIC REALIGN STDCALL uint32_t Release(void **this)
{
	DirectInputObject *dinputObj = (DirectInputObject *)(*this - sizeof(DirectInputObject));
	if (!--dinputObj->ref)
	{
		if (dinputObj->is_device)
		{
			DirectInputDevice *dinputDev = (*(DirectInputDevice **)this);
			uint32_t i;
// 			printf("Release: close device %p\n", dinputDev->joy);

			for (i = 0; i != dinputDev->num_effects; ++i)
				free((void *)dinputDev->effects[i] - sizeof(DirectInputObject));
			free(dinputDev->effects);

			SDL_HapticClose(dinputDev->haptic);
			SDL_JoystickClose(dinputDev->joy);
		}
// 		printf("Release: free 0x%p\n", *this);
		free(dinputObj);
		free(this);
	}
// 	printf("Release: 0x%p\n", *this);
	return 0;
}

MAYBE_STATIC REALIGN STDCALL uint32_t SetParameters(DirectInputEffect **this, const DIEFFECT *eff, uint32_t flags)
{
// 	printf("SetParameters: %X %X\n", flags, (*this)->real_type);
	if ((*this)->haptic)
	{
		setEffect(*this, eff);
		if (!SDL_HapticUpdateEffect((*this)->haptic, (*this)->effect_idx, &(*this)->effect))
		{
			if ((*this)->real_type != SDL_HAPTIC_SINE)
				SDL_HapticRunEffect((*this)->haptic, (*this)->effect_idx, 1);
		}
	}
	return 0;
}
MAYBE_STATIC REALIGN STDCALL uint32_t Start(DirectInputEffect **this, uint32_t iterations, uint32_t flags)
{
// 	printf("Start: %X\n", (*this)->real_type);
	if ((*this)->real_type == SDL_HAPTIC_SINE)
		SDL_HapticRunEffect((*this)->haptic, (*this)->effect_idx, iterations);
	return 0;
}
MAYBE_STATIC REALIGN STDCALL uint32_t Stop(DirectInputEffect **this)
{
// 	printf("Stop: %X\n", (*this)->real_type);
	SDL_HapticStopEffect((*this)->haptic, (*this)->effect_idx);
	return 0;
}
MAYBE_STATIC REALIGN STDCALL uint32_t Download(DirectInputEffect **this)
{
// 	printf("Download: %X\n", (*this)->real_type);
	return 0;
}
MAYBE_STATIC REALIGN STDCALL uint32_t Unload(DirectInputEffect **this)
{
// 	printf("Unload: %X\n", (*this)->real_type);
	SDL_HapticStopEffect((*this)->haptic, (*this)->effect_idx);
	return 0;
}

MAYBE_STATIC REALIGN STDCALL uint32_t GetCapabilities(DirectInputDevice **this, DIDEVCAPS *devCaps)
{
	/* Joystick only */
	if ((*this)->guid.a == JOYSTICK)
	{
	// 	printf("GetCapabilities %p\n", *this);
		memset(devCaps, 0, sizeof(DIDEVCAPS));
		if ((*this)->haptic)
			devCaps->flags = 0x100; //DIDC_FORCEFEEDBACK
		devCaps->buttons = 15;
		devCaps->axes = 4;
	}
	return 0;
}
MAYBE_STATIC REALIGN STDCALL uint32_t SetProperty(DirectInputDevice **this, const GUID *const rguidProp, const DIPROPHEADER *pdiph)
{
	if ((uint32_t)rguidProp == 7 /*DIPROP_FFGAIN*/)
		SDL_HapticSetGain((*this)->haptic, ((const DIPROPDWORD *)pdiph)->dwData / 100);
	return 0;
}
MAYBE_STATIC REALIGN STDCALL uint32_t Acquire(DirectInputDevice **this)
{
// 	printf("Acquire: %p %X\n", *this);
	return 0;
}
MAYBE_STATIC REALIGN STDCALL uint32_t Unacquire(DirectInputDevice **this)
{
// 	printf("Unacquire: %u\n", (*this)->ref);
	return 0;
}
MAYBE_STATIC REALIGN STDCALL uint32_t GetDeviceState(DirectInputDevice **this, uint32_t cbData, void *data)
{
	/* Joystick only */
	if (data && cbData == sizeof(DIJOYSTATE) && (*this)->guid.a == JOYSTICK)
	{
		const int32_t joyIdx = (*this)->guid.b;
		uint32_t i;

		DIJOYSTATE *joyState = (DIJOYSTATE *)data;
		SDL_memset4(joyState->axes, 0x7FFF, 6);
		memset(joyState->buttons, 0, sizeof joyState->buttons);

		SDL_Joystick *joy = (*this)->joy;

		/* Check if joystick is unplugged */
		if (!SDL_JoystickGetAttached(joy))
		{
			/* Close haptic */
			if ((*this)->haptic)
			{
				SDL_HapticClose((*this)->haptic);
				for (i = 0; i < (*this)->num_effects; ++i)
				{
					(*this)->effects[i]->haptic = NULL;
					(*this)->effects[i]->effect_idx = -1;
				}
				(*this)->haptic = NULL;
			}
			/* Close joystick */
			SDL_JoystickClose(joy);

			/* Try to open a joystick */
			if (!((*this)->joy = joy = SDL_JoystickOpen(joyIdx)))
				return 0; //Cannot open the joystick

			/* Reopen haptic */
			if ((*this)->num_effects)
			{
				(*this)->haptic = openHaptic(joy);
				for (i = 0; i < (*this)->num_effects; ++i)
				{
					(*this)->effects[i]->haptic = (*this)->haptic;
					(*this)->effects[i]->effect_idx = SDL_HapticNewEffect((*this)->haptic, &(*this)->effects[i]->effect);
				}
			}
		}

		uint32_t numButtons = SDL_JoystickNumButtons(joy);
		uint32_t numAxes = SDL_JoystickNumAxes(joy);
		if (numButtons > 15)
			numButtons = 15;
		if (numAxes > 4)
			numAxes = 4;

		const BOOL simulateEsc = (joyIdx == 0 && joystick0EscButton >= 0 && joystick0EscButton < numButtons);

		if (simulateEsc)
		{
			/* Simulate ESC key on Joystick */

			const uint8_t escJoy = SDL_JoystickGetButton(joy, joystick0EscButton);
			static BOOL escJoyPressed = false;

			SDL_Event event;
			memset(&event, 0, sizeof event);
			event.key.keysym.sym = SDLK_ESCAPE;
			event.key.keysym.scancode = 41;

			if (escJoy && !escJoyPressed)
			{
				event.type = SDL_KEYDOWN;
				SDL_PushEvent(&event);
				escJoyPressed = true;
			}
			else if (!escJoy && escJoyPressed)
			{
				event.type = SDL_KEYUP;
				SDL_PushEvent(&event);
				escJoyPressed = false;
			}
		}

		for (i = 0; i < numButtons; ++i)
		{
			const int32_t joystickButton = joystickButtons[joyIdx][i];
			if (simulateEsc && joystickButton == joystick0EscButton)
				continue; //Skip button which is used as Escape key
			joyState->buttons[i] = SDL_JoystickGetButton(joy, joystickButton) << 7;
		}

		for (i = 0; i < numAxes; ++i)
		{
			int32_t *axis = &joyState->axes[i < 3 ? i : 5];
			*axis = (uint16_t)SDL_JoystickGetAxis(joy, joystickAxes[joyIdx][i]) ^ 0x8000;
			if (joystickAxes[joyIdx][i + 4] > 0)
				*axis = (*axis >> 1) + 32768;
			else if (joystickAxes[joyIdx][i + 4] < 0)
				*axis = 65535 - (*axis >> 1);
		}
		if (numAxes > 0)
			(*this)->xAxis = joyState->axes[0]; //For Spring effect, when Constant Force is used instead
		if (joystickAxisValueShift[joyIdx])
		{
			if (joyState->axes[0] < 0x8000)
				joyState->axes[0] -= joystickAxisValueShift[joyIdx];
			else if (joyState->axes[0] > 0x8000)
				joyState->axes[0] += joystickAxisValueShift[joyIdx];

			if (joyState->axes[0] > 0xFFFF)
				joyState->axes[0] = 0xFFFF;
			else if (joyState->axes[0] < 0x0000)
				joyState->axes[0] = 0x0000;
		}
	}
	return 0;
}
MAYBE_STATIC REALIGN STDCALL uint32_t GetDeviceData(DirectInputDevice **this, uint32_t cbObjectData, DIDEVICEOBJECTDATA *rgdod, uint32_t *pdwInOut, uint32_t dwFlags)
{
	/* Mouse only. This implementation forces the absolute position of the mouse cursor. */
	if (rgdod && pdwInOut && (*this)->guid.a == MOUSE && *pdwInOut >= 3)
	{
		static uint32_t lastX, lastY;
		uint32_t i;
		memset(rgdod, 0, *pdwInOut * sizeof(DIDEVICEOBJECTDATA));
		rgdod[0].dwOfs = 0; //Mouse X
		rgdod[1].dwOfs = 4; //Mouse Y
		rgdod[2].dwOfs = 12; //Mouse Click
		for (i = 3; i < *pdwInOut; ++i)
			rgdod[i].dwOfs = 8; //Nothing
		if (mousePositionX != lastX || mousePositionY != lastY)
		{
			/* Move the mouse cursor if game changes cursor position */
			SDL_WarpMouseInWindow(NULL, (mousePositionX / dpr * winWidth / 640.0f) + 0.5f, (mousePositionY / dpr * winHeight / 480.0f) + 0.5f);
			lastX = mousePositionX;
			lastY = mousePositionY;
		}
		else
		{
			static BOOL lastMouseButton;
			int32_t x, y;
			const BOOL mouseButton = SDL_GetRelativeMouseState(&x, &y) & SDL_BUTTON_LMASK;
			if (x || y)
			{
				/* Only when mouse moved */
				SDL_GetMouseState(&x, &y);
				lastX = (x * dpr * 640.0f / winWidth)  + 0.5f;
				lastY = (y * dpr * 480.0f / winHeight) + 0.5f;
				/* Set as absolute position */
				rgdod[0].dwData = lastX - mousePositionX;
				rgdod[1].dwData = lastY - mousePositionY;
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
// 	printf("SetEventNotification: %p 0x%p\n", *this, hEvent);
	return 0;
}
MAYBE_STATIC REALIGN STDCALL uint32_t SetCooperativeLevel(DirectInputDevice **this, void *hwnd, uint32_t dwFlags)
{
// 	printf("SetCooperativeLevel: %p %p 0x%X\n", *this, hwnd, dwFlags);
	return 0;
}
MAYBE_STATIC REALIGN STDCALL uint32_t CreateEffect(DirectInputDevice **this, const GUID *const rguid, const DIEFFECT *eff, DirectInputEffect ***deff, void *punkOuter)
{
	/* Joystick only */
	DirectInputEffect *dinputEff = (DirectInputEffect *)calloc(1, sizeof(DirectInputObject) + sizeof(DirectInputEffect));
	((DirectInputObject *)dinputEff)->ref = 1;
	dinputEff = (void *)dinputEff + sizeof(DirectInputObject);
	dinputEff->xAxis = &(*this)->xAxis;

	dinputEff->SetParameters = WRAP_NAME(SetParameters);
	dinputEff->Start = WRAP_NAME(Start);
	dinputEff->Stop = WRAP_NAME(Stop);
	dinputEff->Download = WRAP_NAME(Download);
	dinputEff->Unload = WRAP_NAME(Unload);

	memcpy(&dinputEff->guid, rguid, sizeof(GUID));

	switch (rguid->a)
	{
		case FORCE_CONST:
			/* Use Sine effect instead of Constant if it doesn't exists */
			dinputEff->effect.type = (SDL_HapticQuery((*this)->haptic) & SDL_HAPTIC_CONSTANT) ? SDL_HAPTIC_CONSTANT : SDL_HAPTIC_SINE;
			dinputEff->real_type = SDL_HAPTIC_CONSTANT;
			break;
		case FORCE_SQUARE:
			/* Use Sine effect instead of Square (SDL 2.0 doesn't have square)*/
			dinputEff->real_type = dinputEff->effect.type = SDL_HAPTIC_SINE;
			break;
		case FORCE_SPRING:
			/* If there is no Spring effect, use Constant Force instead */
			dinputEff->effect.type = (SDL_HapticQuery((*this)->haptic) & SDL_HAPTIC_SPRING) ? SDL_HAPTIC_SPRING : SDL_HAPTIC_CONSTANT;
			dinputEff->real_type = SDL_HAPTIC_SPRING;
			break;
	}
	setEffect(dinputEff, eff);
	if (rguid->a == FORCE_SPRING && !useSpringForceFeedbackEffect)
		dinputEff->effect_idx = -1;
	else
		dinputEff->effect_idx = SDL_HapticNewEffect((*this)->haptic, &dinputEff->effect);

// 	printf("%X %d %s\n", dinputEff->guid.a, dinputEff->effect_idx, dinputEff->effect_idx == -1 ? SDL_GetError() : "");

	if (dinputEff->effect_idx != -1)
		dinputEff->haptic = (*this)->haptic;

	*deff = malloc(sizeof(void *));
	**deff = dinputEff;

	(*this)->effects = (DirectInputEffect **)realloc((*this)->effects, ++(*this)->num_effects * sizeof(DirectInputEffect *));
	(*this)->effects[(*this)->num_effects - 1] = dinputEff;

	return 0;
}
MAYBE_STATIC REALIGN STDCALL uint32_t GetObjectInfo(DirectInputDevice **this, DIDEVICEOBJECTINSTANCEA *pdidoi, uint32_t dwObj, uint32_t dwHow)
{
	/* Joystick only */
	memset(pdidoi, 0, sizeof(DIDEVICEOBJECTINSTANCEA));
// 	printf("GetObjectInfo: %p %d %d\n", *this, dwObj, dwHow);
	return 0;
}
MAYBE_STATIC REALIGN STDCALL uint32_t SendForceFeedbackCommand(DirectInputDevice **this, uint32_t flags)
{
	/* Joystick only */
// 	printf("SendForceFeedbackCommand: %X\n", flags);
	switch (flags)
	{
		case 0x01: //DISFFC_RESET
		case 0x02: //DISFFC_STOPALL
			SDL_HapticStopAll((*this)->haptic);
			break;
		case 0x10: //DISFFC_SETACTUATORSON
// 			SDL_HapticUnpause((*this)->haptic);
			break;
		case 0x20: //DISFFC_SETACTUATORSOFF
// 			SDL_HapticPause((*this)->haptic);
			SDL_HapticStopAll((*this)->haptic);
			break;
	}
	return 0;
}
MAYBE_STATIC REALIGN STDCALL uint32_t Poll(DirectInputDevice **this)
{
	/* Joystick only */
	SDL_JoystickUpdate();
	return 0;
}

MAYBE_STATIC REALIGN STDCALL uint32_t CreateDevice(void **this, const GUID *const rguid, DirectInputDevice ***directInputDevice, void *unkOuter)
{
	DirectInputDevice *dinputDev = (DirectInputDevice *)calloc(1, sizeof(DirectInputObject) + sizeof(DirectInputDevice));
	((DirectInputObject *)dinputDev)->ref = 1;
	((DirectInputObject *)dinputDev)->is_device = 1;
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

	BOOL isOK = true;
	if (dinputDev->guid.a == JOYSTICK)
	{
		dinputDev->joy = SDL_JoystickOpen(dinputDev->guid.b);
		if (!dinputDev->joy)
			isOK = false;
		else
			dinputDev->haptic = openHaptic(dinputDev->joy);
	}
	if (isOK && (dinputDev->guid.a == MOUSE || dinputDev->guid.a == JOYSTICK))
	{
		*directInputDevice = malloc(sizeof(void *));
		**directInputDevice = dinputDev;
		return 0;
	}
// 	printf("CreateDevice: error 0x%.8X\n", dinputDev->guid.a);
	free((void *)dinputDev - sizeof(DirectInputObject));
	return -1;
}
MAYBE_STATIC REALIGN STDCALL uint32_t EnumDevices(void **this, uint32_t devType, DIENUMDEVICESCALLBACKA callback, void *ref, uint32_t dwFlags)
{
	if (devType == 4 /* DIDEVTYPE_JOYSTICK */)
	{
		DIDEVICEINSTANCEA deviceInstance;
		memset(&deviceInstance, 0, sizeof deviceInstance);
		uint32_t i, n = SDL_NumJoysticks();
		for (i = 0; i < n; ++i)
		{
			if (i == touchpadJoyIdx)
				continue;
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
	}
	return 0;
}

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
