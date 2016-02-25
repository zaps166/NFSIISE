#ifndef DINPUT_H
#define DINPUT_H

#include "Wrapper.h"

#include <SDL2/SDL_joystick.h>
#include <SDL2/SDL_haptic.h>

#define DIRECTINPUT_VERSION 0x0500

typedef struct
{
	uint32_t a, b, c, d;
} GUID;
typedef uint32_t IID[4];

typedef struct
{
	uint32_t size;
	GUID guidInstance;
	GUID guidProduct;
	uint32_t devType;
	char tszInstanceName[MAX_PATH];
	char tszProductName[MAX_PATH];
#if (DIRECTINPUT_VERSION >= 0x0500)
	GUID guidFFDriver;
	uint16_t usagePage;
	uint16_t usage;
#endif
} DIDEVICEINSTANCEA;

typedef struct
{
	uint32_t dwSize;
	GUID guidType;
	uint32_t dwOfs;
	uint32_t dwType;
	uint32_t dwFlags;
	char tszName[MAX_PATH];
#if (DIRECTINPUT_VERSION >= 0x0500)
	uint32_t dwFFMaxForce;
	uint32_t dwFFForceResolution;
	uint16_t wCollectionNumber;
	uint16_t wDesignatorIndex;
	uint16_t wUsagePage;
	uint16_t wUsage;
	uint32_t dwDimension;
	uint16_t wExponent;
	uint16_t wReserved;
#endif
} DIDEVICEOBJECTINSTANCEA;

typedef struct
{
	const GUID *pguid;
	uint32_t dwOfs;
	uint32_t dwType;
	uint32_t dwFlags;
} DIOBJECTDATAFORMAT;

typedef struct
{
	uint32_t dwSize;
	uint32_t dwObjSize;
	uint32_t dwFlags;
	uint32_t dwDataSize;
	uint32_t dwNumObjs;
	DIOBJECTDATAFORMAT *rgodf;
} DIDATAFORMAT;

typedef struct
{
	uint32_t dwSize;
	uint32_t dwHeaderSize;
	uint32_t dwObj;
	uint32_t dwHow;
} DIPROPHEADER;
typedef struct
{
	DIPROPHEADER diph;
	uint32_t dwData;
} DIPROPDWORD;

typedef struct
{
	uint32_t size;
	uint32_t flags;
	uint32_t devType;
	uint32_t axes;
	uint32_t buttons;
	uint32_t nPOVs;
	uint32_t FFSamplePeriod;
	uint32_t FFMinTimeResolution;
	uint32_t firmwareRevision;
	uint32_t hardwareRevision;
	uint32_t FFDriverVersion;
} DIDEVCAPS;

typedef struct
{
	uint32_t dwOfs;
	uint32_t dwData;
	uint32_t dwTimeStamp;
	uint32_t dwSequence;
#if (DIRECTINPUT_VERSION >= 0x0800)
	uintptr_t uAppData;
#endif
} DIDEVICEOBJECTDATA;

typedef struct
{
	int32_t axes[6];
// 	uint32_t lX;
// 	uint32_t lY;
// 	uint32_t lZ;
// 	uint32_t lRx; //unsupported
// 	uint32_t lRy; //unsupported
// 	uint32_t lRz;
	uint32_t rglSlider[2]; //unsupported
	uint32_t rgdwPOV[4]; //unsupported
	uint8_t  buttons[32]; //only 15 buttons
} DIJOYSTATE;

typedef struct
{
	uint32_t sSize;
	uint32_t attackLevel;
	uint32_t attackTime;
	uint32_t fadeLevel;
	uint32_t fadeTime;
} DIENVELOPE;

typedef struct
{
	uint32_t magnitude;
} DICONSTANTFORCE;
typedef struct
{
	uint32_t magnitude;
	uint32_t offset;
	uint32_t phase;
	uint32_t period;
} DIPERIODIC;
typedef struct
{
	uint32_t lOffset;
	uint32_t lPositiveCoefficient;
	uint32_t lNegativeCoefficient;
	uint32_t dwPositiveSaturation;
	uint32_t dwNegativeSaturation;
	uint32_t lDeadBand;
} DICONDITION;

typedef struct
{
	uint32_t size;
	uint32_t flags;
	uint32_t duration;
	uint32_t samplePeriod;
	uint32_t gain;
	uint32_t triggerButton;
	uint32_t triggerRepeatInterval;
	uint32_t cAxes;
	uint32_t *rgdwAxes;
	uint32_t *rglDirection;
	DIENVELOPE *envelope;
	uint32_t cbTypeSpecificParams;
	void *typeSpecificParams;
} DIEFFECT;

typedef void DIEFFESCAPE;
typedef void DIEFFECTINFOA;

typedef BOOL (STDCALL *DIENUMDEVICESCALLBACKA)(const DIDEVICEINSTANCEA *, void *);

typedef struct
{
	uint32_t ref;
	BOOL is_device;
} DirectInputObject;

typedef struct DirectInputEffect
{
	/*** IUnknown methods ***/
	uint32_t (STDCALL *QueryInterface)(void **this, const IID *const riid, void **object);
	uint32_t (STDCALL *AddRef)(void **this);
	uint32_t (STDCALL *Release)(void **this);
	/*** IDirectInputEffect methods ***/
	uint32_t (STDCALL *Initialize)(struct DirectInputEffect **this, void *hInstance, uint32_t, GUID *);
	uint32_t (STDCALL *GetEffectGuid)(struct DirectInputEffect **this, const GUID *const);
	uint32_t (STDCALL *GetParameters)(struct DirectInputEffect **this, DIEFFECT *, uint32_t);
	uint32_t (STDCALL *SetParameters)(struct DirectInputEffect **this, const DIEFFECT *eff, uint32_t flags);
	uint32_t (STDCALL *Start)(struct DirectInputEffect **this, uint32_t iterations, uint32_t flags);
	uint32_t (STDCALL *Stop)(struct DirectInputEffect **this);
	uint32_t (STDCALL *GetEffectStatus)(struct DirectInputEffect **this, uint32_t *);
	uint32_t (STDCALL *Download)(struct DirectInputEffect **this);
	uint32_t (STDCALL *Unload)(struct DirectInputEffect **this);
	uint32_t (STDCALL *Escape)(struct DirectInputEffect **this, DIEFFESCAPE *);
	/* My variables */
	GUID guid;
	SDL_Haptic *haptic;
	SDL_HapticEffect effect;
	uint16_t real_type;
	int effect_idx;
} DirectInputEffect;

typedef struct DirectInputDevice
{
	/*** IUnknown methods ***/
	uint32_t (STDCALL *QueryInterface)(void **this, const IID *const riid, void **object);
	uint32_t (STDCALL *AddRef)(void **this);
	uint32_t (STDCALL *Release)(void **this);
	/*** IDirectInputDeviceA methods ***/
	uint32_t (STDCALL *GetCapabilities)(struct DirectInputDevice **this, DIDEVCAPS *devCaps);
	uint32_t (STDCALL *EnumObjects)(struct DirectInputDevice **this, void *callback, void *ref, uint32_t dwFlags);
	uint32_t (STDCALL *GetProperty)(struct DirectInputDevice **this, const GUID *const rguidProp, DIPROPHEADER *pdiph);
	uint32_t (STDCALL *SetProperty)(struct DirectInputDevice **this, const GUID *const rguidProp, const DIPROPHEADER *pdiph);
	uint32_t (STDCALL *Acquire)(struct DirectInputDevice **this);
	uint32_t (STDCALL *Unacquire)(struct DirectInputDevice **this);
	uint32_t (STDCALL *GetDeviceState)(struct DirectInputDevice **this, uint32_t cbData, void *data);
	uint32_t (STDCALL *GetDeviceData)(struct DirectInputDevice **this, uint32_t cbObjectData, DIDEVICEOBJECTDATA *rgdod, uint32_t *pdwInOut, uint32_t dwFlags);
	uint32_t (STDCALL *SetDataFormat)(struct DirectInputDevice **this, const DIDATAFORMAT *df);
	uint32_t (STDCALL *SetEventNotification)(struct DirectInputDevice **this, void *hEvent);
	uint32_t (STDCALL *SetCooperativeLevel)(struct DirectInputDevice **this, void *hwnd, uint32_t dwFlags);
	uint32_t (STDCALL *GetObjectInfo)(struct DirectInputDevice **this, DIDEVICEOBJECTINSTANCEA *pdidoi, uint32_t dwObj, uint32_t dwHow);
	uint32_t (STDCALL *GetDeviceInfo)(struct DirectInputDevice **this, DIDEVICEINSTANCEA *pdidi);
	uint32_t (STDCALL *RunControlPanel)(struct DirectInputDevice **this, void *hwndOwner, uint32_t dwFlags);
	uint32_t (STDCALL *Initialize)(struct DirectInputDevice **this, void *hinst, uint32_t dwVersion, const GUID *const rguid);
	/*** IDirectInputDevice2A methods ***/
	uint32_t (STDCALL *CreateEffect)(struct DirectInputDevice **this, const GUID *const rguid, const DIEFFECT *eff, DirectInputEffect ***deff, void *punkOuter);
	uint32_t (STDCALL *EnumEffects)(struct DirectInputDevice **this, void *callback, void *pvRef, uint32_t effType);
	uint32_t (STDCALL *GetEffectInfo)(struct DirectInputDevice **this, DIEFFECTINFOA *pdei, const GUID *const rguid);
	uint32_t (STDCALL *GetForceFeedbackState)(struct DirectInputDevice **this, uint32_t *out);
	uint32_t (STDCALL *SendForceFeedbackCommand)(struct DirectInputDevice **this, uint32_t flags);
	uint32_t (STDCALL *EnumCreatedEffectObjects)(struct DirectInputDevice **this, void *callback, void *pvRef, uint32_t fl);
	uint32_t (STDCALL *Escape)(struct DirectInputDevice **this, DIEFFESCAPE *pesc);
	uint32_t (STDCALL *Poll)(struct DirectInputDevice **this );
	uint32_t (STDCALL *SendDeviceData)(struct DirectInputDevice **this, uint32_t cbObjectData, const DIDEVICEOBJECTDATA *rgdod, uint32_t *inOut, uint32_t fl);
	/* My variables */
	GUID guid;
	SDL_Joystick *joy;
	SDL_Haptic *haptic;
	uint32_t num_effects;
	DirectInputEffect **effects;
} DirectInputDevice;

typedef struct
{
	/*** IUnknown methods ***/
	uint32_t (STDCALL *QueryInterface)(void **this, const IID *const riid, void **object);
	uint32_t (STDCALL *AddRef)(void **this);
	uint32_t (STDCALL *Release)(void **this);
	/*** IDirectInputA methods ***/
	uint32_t (STDCALL *CreateDevice)(void **this, const GUID *const rguid, DirectInputDevice ***directInputDevice, void *unkOuter);
	uint32_t (STDCALL *EnumDevices)(void **this, uint32_t devType, DIENUMDEVICESCALLBACKA callback, void *ref, uint32_t dwFlags);
	uint32_t (STDCALL *GetDeviceStatus)(void **this, const GUID *const rguidInstance);
	uint32_t (STDCALL *RunControlPanel)(void **this, void *hwndOwner, uint32_t dwFlags);
	uint32_t (STDCALL *Initialize)(void **this, void *hInstance, uint32_t dwVersion);
} DirectInput;

#endif // DINPUT_H
