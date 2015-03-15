[BITS 32]

global start

global dword_5637CC
global dword_5637D8
global dword_4DB1B0
global dword_4DDA70
global dword_5637A0


extern SDL_NumJoysticks
extern SDL_GetTicks

extern iSNDdllversion_
extern iSNDdirectsetfunctions_
extern iSNDdirectcaps_
extern iSNDdirectstart_
extern iSNDdirectserve_
extern iSNDdirectstop_

extern grAlphaBlendFunction
extern grAlphaCombine
extern grAlphaTestFunction
extern grAlphaTestReferenceValue
extern grBufferClear
extern grBufferSwap
extern grChromakeyMode
extern grChromakeyValue
extern grClipWindow
extern grColorCombine
extern grCullMode
extern grDepthBiasLevel
extern grDepthBufferFunction
extern grDepthBufferMode
extern grDepthMask
extern grDitherMode
extern grDrawLine
extern grDrawTriangle
extern grFogColorValue
extern grFogMode
extern grFogTable
extern grGammaCorrectionValue
extern grGlideInit
extern grGlideShutdown
extern grLfbLock
extern grLfbUnlock
extern grRenderBuffer
extern grSstIdle
extern grSstIsBusy
extern grSstQueryHardware
extern grSstSelect
extern grSstStatus
extern grSstWinClose
extern grSstWinOpen
extern grTexCalcMemRequired
extern grTexClampMode
extern grTexCombine
extern grTexCombineFunction
extern grTexDownloadMipMap
extern grTexDownloadTable
extern grTexFilterMode
extern grTexMaxAddress
extern grTexMinAddress
extern grTexMipMapMode
extern grTexSource
extern guFogGenerateExp

extern WrapperCreateWindow
extern WrapperAtExit
extern WrapperInit
extern startTimer
extern stopTimer
extern fopen_c

extern vsprintf
extern calloc
extern malloc
extern fclose
extern fscanf
extern fgets
extern time
extern free


extern DefWindowProcA_wrap
extern DestroyWindow_wrap
extern DispatchMessageA_wrap
extern GetKeyboardType_wrap
extern GetMessageA_wrap
extern MessageBoxA_wrap
extern PostMessageA_wrap
extern SetForegroundWindow_wrap
extern ShowCursor_wrap
extern SystemParametersInfoA_wrap

extern CloseHandle_wrap
extern CreateEventA_wrap
extern CreateFileA_wrap
extern CreateFileMappingA_wrap
extern CreateThread_wrap
extern DeleteCriticalSection_wrap
extern DeleteFileA_wrap
extern DuplicateHandle_wrap
extern EnterCriticalSection_wrap
extern ExitProcess_wrap
extern FindClose_wrap
extern FindFirstFileA_wrap
extern FindNextFileA_wrap
extern FlushFileBuffers_wrap
extern GetCommState_wrap
extern GetCurrentDirectoryA_wrap
extern GetCurrentProcess_wrap
extern GetCurrentThreadId_wrap
extern GetCurrentThread_wrap
extern GetFileAttributesA_wrap
extern GetFileSize_wrap
extern GetLastError_wrap
extern GetModuleHandleA_wrap
extern GetOverlappedResult_wrap
extern GetSystemInfo_wrap
extern GlobalMemoryStatus_wrap
extern InitializeCriticalSection_wrap
extern LeaveCriticalSection_wrap
extern MapViewOfFile_wrap
extern PurgeComm_wrap
extern ReadFile_wrap
extern ResumeThread_wrap
extern SetCommState_wrap
extern SetCommTimeouts_wrap
extern SetCurrentDirectoryA_wrap
extern SetEndOfFile_wrap
extern SetEvent_wrap
extern SetFileAttributesA_wrap
extern SetFilePointer_wrap
extern SetThreadPriority_wrap
extern SleepEx_wrap
extern TerminateThread_wrap
extern UnmapViewOfFile_wrap
extern WaitForMultipleObjects_wrap
extern WriteFile_wrap

extern timeBeginPeriod_wrap
extern timeEndPeriod_wrap
extern timeGetDevCaps_wrap

extern DirectInputCreateA_wrap

extern inet_addr_wrap
extern listen_wrap
extern inet_ntoa_wrap
extern gethostbyname_wrap
extern gethostname_wrap
extern connect_wrap
extern accept_wrap
extern WSAFDIsSet_wrap
extern select_wrap
extern send_wrap
extern recv_wrap
extern sendto_wrap
extern getsockname_wrap
extern bind_wrap
extern htons_wrap
extern ioctlsocket_wrap
extern setsockopt_wrap
extern WSAGetLastError_wrap
extern closesocket_wrap
extern socket_wrap
extern WSACleanup_wrap
extern WSAStartup_wrap
extern recvfrom_wrap

section .text

dword_401010: times 0Ch dd 0
	times 2 db 0
word_401042: dw 0
	times 0Ch dd 0
dword_401074: dd 534F4A59h
	db 53h, 4Ah
word_40107A: dw 6A79h
	dd 6A73736Fh

sub_401080: ;SUBROUTINE
	mov dword [dword_4D1FEC], 15Eh
	ret
;sub_401080 endp

sub_401090: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 78h
	mov edi, eax
	mov ecx, edx
	mov ebx, 1
	xor edx, edx
	xor esi, esi
	xor eax, eax
	mov [esp+3Ch], dx
	mov [esp+40h], ebx
	mov [esp+44h], edx
	mov [esp+64h], esi
	mov dword [dword_4D2310], eax
	xor edx, edx
	mov [esp+4], edx
	mov [esp+8], edx
	mov edx, 0FFFFFFFFh
	xor eax, eax

loc_4010D3:
	mov [esp+5Ch], dx
	movsx edx, ax
	cmp dword [edi+edx*4], 0
	jnz loc_401847
	test cx, cx
	jbe loc_401852
	cmp cx, 1
	jnz loc_4010F9
	mov ebp, aMemc ; "memc"

loc_4010F9:
	mov eax, dword [dword_4D40B8]
	mov edx, ebp
	call sub_482EB4
	mov cx, [eax+4]
	mov eax, [eax+0Ch]
	shl eax, 14h
	xor ebx, ebx
	sar eax, 14h
	mov edx, 1E0h
	mov [esp+54h], ax
	movsx eax, cx
	call sub_482474
	mov edx, eax
	mov [esp+0Ch], eax
	call sub_428A20
	call sub_405C70
	call unknown_libname_4 ; Watcom v9-*1.5 32bit NT runtime
	xor ebx, ebx
	mov eax, [esp+52h]
	mov edx, [edx+20h]
	sar eax, 10h
	mov [esp+10h], edx
	mov edx, eax
	mov eax, [esp+10h]
	mov [esp+38h], cx
	call sub_4850B0
	call sub_4824BC
	test cx, cx
	jl loc_401239
	add ecx, 1E8h
	mov [esp+28h], ecx

loc_401173:
	call sub_428A20
	mov ebx, [esp+52h]
	mov eax, [esp+0Ch]
	mov edx, 0C00h
	xor ecx, ecx
	sar ebx, 10h
	mov eax, [eax+20h]
	call sub_405B60
	mov ebx, [esp+36h]
	mov edx, 2C00h
	mov eax, aBsld ; "bsld"
	xor ecx, ecx
	sar ebx, 10h
	call sub_405B30
	xor eax, eax
	mov ecx, 62h
	mov [esp+68h], ax
	mov eax, [esp+28h]
	mov [esp+18h], cx
	mov [esp+70h], ax

loc_4011C4:
	mov edx, [esp+66h]
	movsx eax, si
	sar edx, 10h
	add eax, edx
	shl eax, 2
	add eax, edi
	cmp dword [eax], 0
	jz loc_401214
	push 0
	mov ebx, [esp+1Ah]
	mov edx, [esp+72h]
	mov ecx, 12h
	mov eax, [eax]
	push 0
	sar ebx, 10h
	sar edx, 10h
	call sub_4054E0
	mov edx, [esp+18h]
	mov ebx, [esp+68h]
	add edx, 16h
	inc ebx
	mov [esp+18h], dx
	mov [esp+68h], bx
	cmp bx, 8
	jl loc_4011C4

loc_401214:
	call sub_405C70
	mov ebx, [esp+28h]
	mov ecx, [esp+38h]
	sub ebx, 8
	sub ecx, 8
	mov [esp+28h], ebx
	mov [esp+38h], cx
	test cx, cx
	jge loc_401173

loc_401239:
	mov ebx, 294h
	mov edx, 28h
	mov [esp+74h], bx
	mov [esp+2Ch], dx

loc_40124D:
	call sub_428A20
	mov ebx, [esp+52h]
	mov eax, [esp+0Ch]
	mov edx, 0C00h
	xor ecx, ecx
	sar ebx, 10h
	mov eax, [eax+20h]
	call sub_405B60
	mov edx, 2800h
	mov eax, ebp
	xor ecx, ecx
	xor ebx, ebx
	call sub_405B30
	mov eax, 62h
	xor edx, edx
	mov [esp+30h], ax
	mov [esp+20h], dx

loc_40128D:
	mov eax, [esp+1Eh]
	movsx edx, si
	sar eax, 10h
	add eax, edx
	shl eax, 2
	add eax, edi
	mov ecx, [eax]
	test ecx, ecx
	jz loc_4012DC
	push 0
	mov ebx, [esp+32h]
	mov edx, 1E8h
	mov eax, ecx
	push 0
	mov ecx, 12h
	sar ebx, 10h
	call sub_4054E0
	mov ebx, [esp+30h]
	mov ecx, [esp+20h]
	add ebx, 16h
	inc ecx
	mov [esp+30h], bx
	mov [esp+20h], cx
	cmp cx, 8
	jl loc_40128D

loc_4012DC:
	mov eax, [esp+2Ah]
	mov edx, 2C00h
	sar eax, 10h
	xor ecx, ecx
	mov [esp+14h], eax
	mov ebx, eax
	mov eax, aTsld ; "tsld"
	call sub_405B30
	push 0
	mov edx, [esp+76h]
	mov ecx, 12h
	xor eax, eax
	push 0
	mov al, byte [byte_512DFB]
	sar edx, 10h
	mov ebx, dword (dword_4D1FEC+2)[eax*2]
	mov eax, 77h
	sar ebx, 10h
	call sub_41B710
	call sub_4053A0
	test si, si
	jz loc_401347
	mov ebx, [esp+14h]
	mov edx, 2C00h
	mov eax, aUppd ; "uppd"
	xor ecx, ecx
	add ebx, 2
	call sub_405B30

loc_401347:
	mov edx, [esp+5Ah]
	movsx eax, si
	sar edx, 10h
	add eax, 7
	cmp eax, edx
	jge loc_401373
	mov ebx, [esp+2Ah]
	mov edx, 2C00h
	mov eax, aDwnd ; "dwnd"
	sar ebx, 10h
	xor ecx, ecx
	add ebx, 2
	call sub_405B30

loc_401373:
	call sub_405C70
	mov edx, [esp+74h]
	mov ebx, [esp+2Ch]
	sub edx, 4
	sub ebx, 4
	mov [esp+74h], dx
	mov [esp+2Ch], bx
	test bx, bx
	jge loc_40124D
	call sub_4833C7
	mov eax, [esp+5Ah]
	mov ebx, 1
	sar eax, 10h
	mov dword [dword_4D2310], ebx
	cmp eax, 0FFFFFFFFh
	jnz loc_40185C
	mov eax, 0FFFFFFFFh
	mov edx, 104h
	mov [esp+3Ch], ax
	mov eax, 262h

loc_4013CD:
	call sub_4242C0
	mov ecx, 127h
	mov ebx, 280h
	mov edx, 55h
	mov eax, 1C2h
	call sub_4222C0
	cmp word [esp+44h], 0
	jnz loc_40169F

loc_4013F7:
	xor eax, eax
	mov ebx, [esp+8]
	call sub_403550
	call sub_4833C7
	add ebx, eax
	mov edx, [esp+40h]
	mov [esp+8], ebx
	test dx, dx
	jz loc_401885

loc_40141A:
	call sub_428A20
	mov eax, [esp+0Ch]
	mov edx, 0C00h
	xor ebx, ebx
	xor ecx, ecx
	mov [esp+40h], ebx
	mov ebx, [esp+52h]
	mov eax, [eax+20h]
	sar ebx, 10h
	call sub_405B60
	mov edx, 2800h
	mov eax, ebp
	xor ecx, ecx
	xor ebx, ebx
	call sub_405B30
	mov ecx, 62h
	xor eax, eax
	mov [esp+4Ch], cx
	mov [esp+1Ch], ax

loc_401460:
	mov edx, [esp+1Ah]
	movsx eax, si
	sar edx, 10h
	add edx, eax
	lea eax, 0[edx*4]
	add eax, edi
	mov ecx, [eax]
	test ecx, ecx
	jz loc_4014C2
	mov ebx, [esp+3Ah]
	sar ebx, 10h
	cmp edx, ebx
	jnz loc_401897
	push 2

loc_40148C:
	mov ebx, [esp+4Eh]
	mov edx, 1E8h
	mov eax, ecx
	push 0
	mov ecx, 12h
	sar ebx, 10h
	call sub_4054E0
	mov ebx, [esp+1Ch]
	mov edx, [esp+4Ch]
	inc ebx
	add edx, 16h
	mov [esp+1Ch], bx
	mov [esp+4Ch], dx
	cmp bx, 8
	jl loc_401460

loc_4014C2:
	mov edx, 2800h
	mov eax, aTsld ; "tsld"
	xor ecx, ecx
	xor ebx, ebx
	call sub_405B30
	mov eax, [esp+3Ah]
	sar eax, 10h
	cmp eax, 0FFFFFFFFh
	jnz loc_40189E
	mov eax, 2

loc_4014EA:
	cwde
	push eax
	xor eax, eax
	mov ecx, 12h
	mov al, byte [byte_512DFB]
	mov edx, 26Ch
	push 0
	mov ebx, dword (dword_4D1FEC+2)[eax*2]
	mov eax, 77h
	sar ebx, 10h
	call sub_41B710
	call sub_4053A0
	test si, si
	jz loc_401533
	mov ebx, 2
	mov edx, 2C00h
	mov eax, aUppd ; "uppd"
	xor ecx, ecx
	call sub_405B30

loc_401533:
	mov edx, [esp+5Ah]
	movsx eax, si
	sar edx, 10h
	add eax, 7
	cmp eax, edx
	jge loc_40155A
	mov ebx, 2
	mov edx, 2C00h
	mov eax, aDwnd ; "dwnd"
	xor ecx, ecx
	call sub_405B30

loc_40155A:
	call sub_405C70

loc_401564:
	call sub_423B90
	call sub_405960
	xor edx, edx
	mov [esp+48h], eax
	mov [esp+60h], edx
	test ax, ax
	jnz loc_40194D
	mov ecx, 1E0h
	mov ebx, 28h
	mov eax, 258h
	xor edx, edx
	call sub_423DC0
	test eax, eax
	jz loc_4018A5
	mov eax, [esp+3Ah]
	sar eax, 10h
	cmp eax, 0FFFFFFFFh
	jz loc_4015D5
	mov eax, [esp+3Ch]
	mov ecx, 0FFFFFFFFh
	mov [esp+64h], eax
	mov eax, 1
	mov edx, 7Fh
	mov [esp+40h], eax
	mov eax, 1
	mov [esp+3Ch], cx

loc_4015D0:
	call sub_4423F0

loc_4015D5:
	mov ebx, 1

loc_4015DA:
	cmp word [esp+48h], 0
	jz loc_401683
	mov eax, [esp+8]
	cmp eax, [esp+4]
	jle loc_401683
	add eax, 0Fh
	mov ecx, 1
	mov [esp+4], eax
	mov eax, [esp+48h]
	mov [esp+40h], ecx
	cmp ax, 4800h
	jnb loc_401954
	cmp ax, 0Dh
	jnb loc_4019CB
	cmp ax, 9
	jnz loc_40165F

loc_401622:
	mov eax, [esp+5Ah]
	sar eax, 10h
	cmp eax, 0FFFFFFFFh
	jle loc_40165F
	mov eax, [esp+3Ah]
	sar eax, 10h
	cmp eax, 0FFFFFFFFh
	jle loc_401A04
	mov ecx, 0FFFFFFFFh
	mov eax, [esp+3Ch]
	mov [esp+3Ch], cx
	mov [esp+64h], eax

loc_401650:
	mov edx, 7Fh
	mov eax, 1
	call sub_4423F0

loc_40165F:
	test bx, bx
	jnz loc_401683
	mov eax, [esp+3Ah]
	sar eax, 10h
	cmp eax, 0FFFFFFFFh
	jnz loc_401ABE
	mov edx, 104h
	mov eax, 262h

loc_40167E:
	call sub_4242C0

loc_401683:
	mov edx, [esp+8]
	call sub_4833C7
	add edx, eax
	mov ebx, [esp+44h]
	mov [esp+8], edx
	test bx, bx
	jz loc_4013F7

loc_40169F:
	xor ecx, ecx
	mov eax, 1E8h
	mov dword [dword_4D2310], ecx
	xor ecx, ecx
	mov [esp+50h], eax
	mov [esp+34h], cx

loc_4016B7:
	call sub_428A20
	mov ebx, [esp+52h]
	mov eax, [esp+0Ch]
	mov edx, 0C00h
	xor ecx, ecx
	sar ebx, 10h
	mov eax, [eax+20h]
	call sub_405B60
	mov ebx, [esp+32h]
	mov edx, 2C00h
	mov eax, ebp
	xor ecx, ecx
	sar ebx, 10h
	call sub_405B30
	mov eax, 62h
	xor edx, edx
	mov [esp+24h], ax
	mov eax, [esp+50h]
	mov [esp+58h], dx
	mov [esp+6Ch], ax

loc_401705:
	mov edx, [esp+56h]
	movsx eax, si
	sar edx, 10h
	add eax, edx
	shl eax, 2
	add eax, edi
	cmp dword [eax], 0
	jz loc_401755
	push 0
	mov ebx, [esp+26h]
	mov edx, [esp+6Eh]
	mov ecx, 12h
	mov eax, [eax]
	push 0
	sar ebx, 10h
	sar edx, 10h
	call sub_4054E0
	mov ebx, [esp+24h]
	mov ecx, [esp+58h]
	add ebx, 16h
	inc ecx
	mov [esp+24h], bx
	mov [esp+58h], cx
	cmp cx, 8
	jl loc_401705

loc_401755:
	mov eax, [esp+32h]
	mov edx, 2C00h
	sar eax, 10h
	xor ecx, ecx
	mov [esp], eax
	mov ebx, eax
	mov eax, aTsld ; "tsld"
	call sub_405B30
	test si, si
	jz loc_40178E
	mov ebx, [esp]
	mov edx, 2C00h
	mov eax, aUppd ; "uppd"
	xor ecx, ecx
	add ebx, 2
	call sub_405B30

loc_40178E:
	mov edx, [esp+5Ah]
	movsx eax, si
	sar edx, 10h
	add eax, 7
	cmp eax, edx
	jge loc_4017BA
	mov ebx, [esp+32h]
	mov edx, 2C00h
	mov eax, aDwnd ; "dwnd"
	sar ebx, 10h
	xor ecx, ecx
	add ebx, 2
	call sub_405B30

loc_4017BA:
	call sub_405C70
	mov edx, [esp+50h]
	mov ebx, [esp+34h]
	add edx, 0Ch
	add ebx, 0Ch
	mov [esp+50h], edx
	mov [esp+34h], bx
	cmp bx, 0D2h
	jle loc_4016B7
	mov esi, 1
	mov ecx, 1E0h
	mov ebx, 280h
	xor edx, edx
	xor eax, eax
	mov dword [dword_4D2310], esi
	call sub_4222C0
	mov eax, [esp+0Ch]
	mov esi, [esp+3Ch]
	call sub_482DA0
	test si, si
	jl loc_40181E
	mov eax, [esp+3Ah]
	sar eax, 10h
	cmp dword [edi+eax*4], 0
	jnz loc_401825

loc_40181E:
	mov word [esp+3Ch], 0FFFFh

loc_401825:
	cmp word [esp+48h], 1Bh
	jz loc_401839
	mov eax, [esp+3Ah]
	sar eax, 10h
	cmp eax, 0FFFFFFFFh
	jnz loc_40183E

loc_401839:
	mov eax, 0FFFFFFFFh

loc_40183E:
	add esp, 78h
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_401847:
	mov edx, [esp+5Ch]
	inc edx
	inc eax
	jmp loc_4010D3

loc_401852:
	mov ebp, aBsld ; "bsld"
	jmp loc_4010F9

loc_40185C:
	mov edx, [esp+3Ah]
	movsx eax, si
	sar edx, 10h
	sub edx, eax
	lea eax, 0[edx*4]
	sub eax, edx
	shl eax, 2
	sub eax, edx
	add eax, eax
	lea edx, [eax+6Dh]
	mov eax, 226h
	jmp loc_4013CD

loc_401885:
	cmp dword [dword_4D2094], 0
	jnz loc_40141A
	jmp loc_401564

loc_401897:
	push 0
	jmp loc_40148C

loc_40189E:
	xor eax, eax
	jmp loc_4014EA

loc_4018A5:
	mov edx, 16h
	mov eax, 62h
	call sub_423DF0
	test ax, ax
	jl loc_4018FF
	cmp ax, 7
	jg loc_401926
	mov ebx, [esp+3Ah]
	add eax, esi
	sar ebx, 10h
	movsx edx, ax
	cmp ebx, edx
	jz loc_4015D5
	mov ebx, [esp+5Ah]
	sar ebx, 10h
	cmp edx, ebx
	jg loc_4015D5
	mov [esp+3Ch], ax
	mov eax, 1
	mov edx, 7Fh
	mov [esp+40h], eax
	mov eax, 1
	jmp loc_4015D0

loc_4018FF:
	mov eax, [esp+5Ah]
	sar eax, 10h
	cmp eax, 0FFFFFFFFh
	jz loc_4015D5
	mov ebx, 1
	mov edx, 4800h
	mov [esp+60h], ebx
	mov [esp+48h], edx
	jmp loc_4015D5

loc_401926:
	mov eax, [esp+5Ah]
	sar eax, 10h
	cmp eax, 0FFFFFFFFh
	jz loc_4015D5
	mov ecx, 5000h
	mov ebx, 1
	mov [esp+48h], ecx
	mov [esp+60h], ebx
	jmp loc_4015D5

loc_40194D:
	xor ebx, ebx
	jmp loc_4015DA

loc_401954:
	ja loc_401980
	mov eax, [esp+5Ah]
	sar eax, 10h
	cmp eax, 0FFFFFFFFh
	jz loc_40165F
	mov edx, [esp+3Ah]
	sar edx, 10h
	cmp edx, 0FFFFFFFFh
	jnz loc_401A68
	mov [esp+3Ch], si
	jmp loc_40165F

loc_401980:
	cmp ax, 4D00h
	jnb loc_401995
	cmp ax, 4B00h
	jz loc_401622
	jmp loc_40165F

loc_401995:
	jbe loc_401622
	cmp ax, 5000h
	jnz loc_40165F
	mov edx, [esp+5Ah]
	sar edx, 10h
	cmp edx, 0FFFFFFFFh
	jz loc_40165F
	mov eax, [esp+3Ah]
	sar eax, 10h
	cmp eax, 0FFFFFFFFh
	jnz loc_401A12
	mov [esp+3Ch], si
	jmp loc_40165F

loc_4019CB:
	jbe loc_4019EF
	cmp ax, 1Bh
	jnz loc_40165F
	mov edx, 7Fh
	mov eax, 3
	call sub_4423F0
	mov [esp+44h], ecx
	jmp loc_40165F

loc_4019EF:
	mov edx, 7Fh
	xor eax, eax
	call sub_4423F0
	mov [esp+44h], ecx
	jmp loc_40165F

loc_401A04:
	mov eax, [esp+64h]
	mov [esp+3Ch], ax
	jmp loc_401650

loc_401A12:
	cmp dword [edi+eax*4+4], 0
	jnz loc_401A39
	cmp word [esp+60h], 0
	jz loc_40165F
	cmp edx, 0FFFFFFFFh
	jz loc_40165F
	xor eax, eax
	mov [esp+40h], eax
	jmp loc_40165F

loc_401A39:
	mov edx, 7Fh
	mov eax, 1
	call sub_4423F0
	inc word [esp+3Ch]
	mov edx, [esp+3Ah]
	movsx eax, si
	sar edx, 10h
	sub edx, eax
	cmp edx, 7
	jle loc_40165F
	inc esi
	jmp loc_40165F

loc_401A68:
	mov edx, [esp+3Ch]
	test dx, dx
	jnz loc_401A8F
	cmp word [esp+60h], 0
	jz loc_40165F
	cmp eax, 0FFFFFFFFh
	jz loc_40165F
	mov [esp+40h], edx
	jmp loc_40165F

loc_401A8F:
	mov edx, 7Fh
	mov eax, 1
	call sub_4423F0
	sub [esp+3Ch], cx
	mov edx, [esp+3Ah]
	movsx eax, si
	sar edx, 10h
	sub edx, eax
	test edx, edx
	jge loc_40165F
	sub esi, ecx
	jmp loc_40165F

loc_401ABE:
	movsx edx, si
	sub eax, edx
	imul edx, eax, 16h
	mov eax, 226h
	add edx, 6Dh
	jmp loc_40167E
;sub_401090 endp

sub_401AE0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 34h
	mov edx, 1
	lea edi, [esp+8]
	mov eax, 2FAh
	mov ecx, 348h
	mov esi, dword_401074
	xor ebx, ebx
	mov [esp+28h], edx
	mov [esp+30h], bx
	movsd
	movsw
	mov [esp+24h], edx
	mov edi, esp
	mov esi, word_40107A
	mov edx, aCNfs2seFront_1 ; "c:\\nfs2se\\frontend\\common\\Dialog.c"
	mov ebx, 20h
	movsd
	movsw
	call sub_41B710
	call sub_482424
	mov edi, eax
	mov eax, 2FAh
	lea esi, [esp+54h]
	call sub_41B710
	call sub_482424
	mov dword [dword_4DB1D8], edx
	mov edx, [esp+50h]
	mov ebp, eax
	shl edx, 2
	mov eax, aDialogargv ; "DialogArgv"
	add edx, 4
	mov dword [dword_4DB1DC], ecx
	call sub_484498
	mov ebx, [esp+50h]
	mov [esp+14h], eax
	xor edx, edx
	test ebx, ebx
	jle loc_401B90
	mov ecx, eax

loc_401B78:
	mov eax, [esi]
	add esi, 4
	call sub_41B710
	mov [ecx], eax
	inc edx
	mov eax, [esp+50h]
	add ecx, 4
	cmp edx, eax
	jl loc_401B78

loc_401B90:
	mov eax, [esp+50h]
	mov edx, [esp+14h]
	shl eax, 2
	add eax, edx
	xor ebx, ebx
	mov dword [eax], dword_4C8014
	mov edx, dword [dword_4DAB80]
	mov eax, dword [dword_4DAB7C]
	call sub_482474
	mov [esp+18h], eax
	call sub_4825A8
	mov eax, dword [dword_4D4D24]
	mov eax, [eax+20h]
	xor ecx, ecx
	call sub_483470
	call sub_4824BC

loc_401BD7:
	call sub_405910
	test eax, eax
	jz loc_401BE9
	mov eax, ecx
	call sub_403550
	jmp loc_401BD7

loc_401BE9:
	mov edx, ebp
	mov eax, ebp
	sar edx, 1Fh
	sub eax, edx
	sar eax, 1
	mov edx, 168h
	sub edx, eax
	mov [esp+1Ch], edx
	mov edx, edi
	mov eax, edi
	sar edx, 1Fh
	sub eax, edx
	sar eax, 1
	mov edx, 118h
	sub edx, eax
	mov [esp+10h], edx

loc_401C15:
	cmp word [esp+24h], 0
	jnz loc_401C72
	mov eax, dword [dword_4D4D24]
	call sub_4825A8
	mov eax, [esp+18h]
	mov eax, [eax+20h]
	call sub_4834C4
	call sub_428A20
	mov eax, dword [dword_4D4D24]
	mov eax, [eax+20h]
	call sub_426B70
	call sub_405C70
	mov eax, [esp+18h]
	call sub_482DA0
	mov eax, [esp+14h]
	call sub_4848FC
	mov eax, [esp+2Eh]
	sar eax, 10h
	add esp, 34h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_401C72:
	xor eax, eax
	call sub_403550
	cmp word [esp+28h], 0
	jz loc_401E30
	call sub_428A20
	mov eax, [esp+18h]
	xor edx, edx
	mov eax, [eax+20h]
	mov [esp+28h], edx
	call sub_483470
	mov eax, [esp+50h]
	mov edx, [esp+14h]
	inc eax
	mov ebx, [esp+30h]
	call sub_402E80
	mov [esp+20h], eax
	test bx, bx
	jz loc_401E03
	push 2
	mov esi, [esp+22h]
	mov eax, 2FAh
	mov ecx, 12h
	push 2
	sar esi, 10h
	mov edx, 118h
	mov ebx, esi
	call sub_41B710
	call sub_4054E0
	push 1

loc_401CE3:
	mov eax, 2FBh
	mov ecx, 12h
	push 2
	mov edx, 168h
	mov ebx, esi
	call sub_41B710
	call sub_4054E0
	call sub_405C70

loc_401D0A:
	mov ecx, 1Ch
	mov edx, [esp+20h]
	mov eax, [esp+10h]
	mov ebx, edi
	call sub_423DC0
	test eax, eax
	jz loc_401D47
	cmp word [esp+30h], 1
	jz loc_401D39
	mov edx, 2Dh
	mov eax, 1
	call sub_4423F0

loc_401D39:
	mov esi, 1
	mov [esp+28h], esi
	mov [esp+30h], si

loc_401D47:
	mov ecx, 1Ch
	mov edx, [esp+20h]
	mov eax, [esp+1Ch]
	mov ebx, ebp
	call sub_423DC0
	test eax, eax
	jz loc_401D86
	cmp word [esp+30h], 0
	jz loc_401D76
	mov edx, 2Dh
	mov eax, 1
	call sub_4423F0

loc_401D76:
	mov ecx, 1
	xor ebx, ebx
	mov [esp+28h], ecx
	mov [esp+30h], bx

loc_401D86:
	cmp word [esp+2Ch], 0
	jz loc_401E3A
	call sub_405910
	mov ebx, eax
	test ax, ax
	jz loc_401DA4
	xor edx, edx
	mov [esp+2Ch], edx

loc_401DA4:
	test bx, bx
	jz loc_401C15
	cmp bx, 4Eh
	jnb loc_401E56
	cmp bx, 0Dh
	jnb loc_401ECB

loc_401DC1:
	xor eax, eax
	xor ecx, ecx
	mov al, byte [byte_512DFB]
	movsx edx, bx
	mov cl, [esp+eax+8]
	cmp ecx, edx
	jnz loc_401F1F

loc_401DD9:
	mov edx, 7Fh
	xor eax, eax
	mov ebx, 1
	call sub_4423F0
	xor esi, esi
	mov [esp+30h], bx
	mov [esp+28h], ebx
	mov [esp+24h], esi
	call sub_4833C7
	jmp loc_401C15

loc_401E03:
	push 1
	mov esi, [esp+22h]
	mov eax, 2FAh
	mov ecx, 12h
	push 2
	sar esi, 10h
	mov edx, 118h
	mov ebx, esi
	call sub_41B710
	call sub_4054E0
	push 2
	jmp loc_401CE3

loc_401E30:
	call sub_423B90
	jmp loc_401D0A

loc_401E3A:
	call sub_405910
	xor ebx, ebx
	test eax, eax
	jnz loc_401DA4
	mov dword [esp+2Ch], 1
	jmp loc_401DA4

loc_401E56:
	jbe loc_401E69
	cmp bx, 4B00h
	jnb loc_401E8E
	cmp bx, 6Eh
	jnz loc_401DC1

loc_401E69:
	mov edx, 7Fh
	xor eax, eax
	call sub_4423F0
	xor eax, eax
	mov edx, 1
	mov [esp+30h], ax
	mov [esp+28h], edx
	mov [esp+24h], eax
	jmp loc_401DC1

loc_401E8E:
	jbe loc_401E9B
	cmp bx, 4D00h
	jnz loc_401DC1

loc_401E9B:
	mov edx, 7Fh
	mov eax, 1
	mov ecx, [esp+30h]
	call sub_4423F0
	test cx, cx
	jnz loc_401F0A
	mov eax, 1
	mov esi, 1
	mov [esp+30h], ax
	mov [esp+28h], esi
	jmp loc_401DC1

loc_401ECB:
	jbe loc_401EF3
	cmp bx, 1Bh
	jnz loc_401DC1
	mov edx, 7Fh
	xor eax, eax
	xor esi, esi
	call sub_4423F0
	mov [esp+30h], si
	mov [esp+24h], esi
	jmp loc_401DC1

loc_401EF3:
	mov edx, 7Fh
	xor eax, eax
	call sub_4423F0
	xor edx, edx
	mov [esp+24h], edx
	jmp loc_401DC1

loc_401F0A:
	xor eax, eax
	mov esi, 1
	mov [esp+30h], ax
	mov [esp+28h], esi
	jmp loc_401DC1

loc_401F1F:
	mov al, [esp+eax]
	and eax, 0FFh
	cmp eax, edx
	jz loc_401DD9
	call sub_4833C7
	jmp loc_401C15
;sub_401AE0 endp

sub_401F40: ;SUBROUTINE
	push esi
	push edi
	push ebp
	sub esp, 94h
	mov ebp, eax
	mov [esp+74h], bx
	mov ebx, 1
	mov edi, 0FFFFFFFFh
	mov esi, word_401042
	xor ecx, ecx
	mov [esp+68h], edx
	mov [esp+7Ch], ecx
	mov [esp+78h], cx
	mov [esp+88h], di
	mov ecx, 0Ch
	mov edi, esp
	mov edx, dword_4C8014
	mov [esp+8Ch], ebx
	rep movsd
	movsw
	mov [esp+6Ch], edx
	mov edi, ebp
	xor ecx, ecx
	mov esi, ebp
	mov dword [dword_4D2310], ecx
	call sub_402A00
	mov [esp+80h], eax
	sub ecx, ecx
	dec ecx
	xor eax, eax
	repne scasb
	not ecx
	dec ecx
	mov edi, esp
	xor ebx, ebx
	push edi

loc_401FB8:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_401FD0
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_401FB8

loc_401FD0:
	pop edi
	mov edx, dword [dword_4DAB80]
	mov eax, dword [dword_4DAB7C]
	call sub_482474
	mov [esp+70h], eax
	call sub_4825A8
	mov eax, dword [dword_4D4D24]
	mov [esp+84h], cx
	mov eax, [eax+20h]
	xor edx, edx
	call sub_483470
	call sub_4824BC

loc_402006:
	call sub_405910
	test eax, eax
	jnz loc_402077

loc_40200F:
	mov esi, [esp+86h]
	sar esi, 10h
	cmp esi, 0FFFFFFFFh
	jz loc_402080
	mov eax, dword [dword_4D4D24]
	call sub_4825A8
	mov eax, [esp+70h]
	mov eax, [eax+20h]
	call sub_4834C4
	push 1
	call sub_497680
	mov eax, dword [dword_4D4D24]
	mov eax, [eax+20h]
	call sub_426B70
	call sub_4824BC
	mov eax, [esp+70h]
	mov ebx, 1
	call sub_482DA0
	mov eax, ebp
	mov dword [dword_4D2310], ebx
	call sub_402960
	mov eax, esi
	add esp, 94h
	pop ebp
	pop edi
	pop esi
	ret 4

loc_402077:
	mov eax, edx
	call sub_403550
	jmp loc_402006

loc_402080:

	call sub_403550
	cmp word [esp+8Ch], 0
	jz loc_40215A
	mov esi, esp
	lea edi, [esp+34h]
	mov ebx, [esp+78h]
	xor edx, edx
	push edi

loc_4020AA:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_4020C2
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_4020AA

loc_4020C2:
	pop edi
	mov [esp+8Ch], edx
	test bx, bx
	jz loc_4020FA
	mov esi, a_ ; "_"
	lea edi, [esp+34h]
	push edi
	sub ecx, ecx
	dec ecx
	mov al, 0
	repne scasb
	dec edi

loc_4020E1:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_4020F9
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_4020E1

loc_4020F9:
	pop edi

loc_4020FA:
	call sub_4287C0
	mov eax, [esp+70h]
	mov eax, [eax+20h]
	lea edx, [esp+68h]
	call sub_483470
	mov eax, 2
	call sub_402E80
	push 2
	push 0
	movsx ebx, ax
	lea eax, [esp+8]
	call sub_482424
	mov edx, eax
	sar edx, 1Fh
	sub eax, edx
	sar eax, 1
	mov esi, eax
	mov eax, dword [dword_4DAB7C]
	mov edx, eax
	sar edx, 1Fh
	sub eax, edx
	sar eax, 1
	sub eax, esi
	mov ecx, 12h
	movsx edx, ax
	lea eax, [esp+3Ch]
	call sub_4054E0
	call sub_405C70

loc_40215A:
	cmp word [esp+90h], 0
	jz loc_402210
	call sub_405910
	mov edx, eax
	test ax, ax
	jz loc_40217E
	xor edi, edi
	mov [esp+90h], edi

loc_40217E:
	test dx, dx
	jz loc_4021D5
	cmp dx, 0Dh
	jnz loc_40222F
	mov esi, esp
	mov edi, ebp
	push edi

loc_402192:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_4021AA
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_402192

loc_4021AA:
	pop edi
	mov word [esp+88h], 1

loc_4021B5:
	mov eax, [esp+82h]
	mov edi, 1
	xor dl, dl
	sar eax, 10h
	mov [esp+8Ch], edi
	mov [esp+eax], dl
	call sub_4833C7

loc_4021D5:
	mov edx, [esp+7Ch]
	call sub_4833C7
	add edx, eax
	mov [esp+7Ch], edx
	cmp dx, 0Fh
	jl loc_40200F
	mov dh, [esp+78h]
	mov ecx, 1
	xor esi, esi
	xor dh, 1
	mov [esp+8Ch], ecx
	mov [esp+7Ch], esi
	mov [esp+78h], dh
	jmp loc_40200F

loc_402210:
	call sub_405910
	xor edx, edx
	test eax, eax
	jnz loc_40217E
	mov dword [esp+90h], 1
	jmp loc_40217E

loc_40222F:
	cmp dx, 1Bh
	jnz loc_402244
	xor ecx, ecx
	mov [esp+88h], cx
	jmp loc_4021B5

loc_402244:
	movsx eax, dx
	call sub_402AE0
	test eax, eax
	jz loc_4021B5
	cmp dx, 8
	jnz loc_402295
	mov eax, [esp+84h]
	test ax, ax
	jle loc_402295
	cmp word [esp+80h], 0
	jz loc_402287
	xor edx, edx
	mov [esp+84h], dx
	mov [esp+80h], edx
	jmp loc_4021B5

loc_402287:
	dec eax
	mov [esp+84h], ax
	jmp loc_4021B5

loc_402295:
	mov eax, [esp+72h]
	mov ebx, [esp+82h]
	sar eax, 10h
	sar ebx, 10h
	cmp ebx, eax
	jge loc_4022F5
	cmp dx, 1Fh
	jle loc_4022F5
	cmp dx, 0FFh
	jge loc_4022F5
	cmp word [esp+80h], 0
	jz loc_4022D3
	xor ebx, ebx
	mov [esp+84h], bx
	mov [esp+80h], ebx

loc_4022D3:
	mov esi, [esp+84h]
	mov eax, [esp+82h]
	inc esi
	sar eax, 10h
	mov [esp+84h], si
	mov [esp+eax], dl
	jmp loc_4021B5

loc_4022F5:
	cmp word [esp+80h], 0
	jz loc_4021B5
	xor ecx, ecx
	mov [esp+84h], cx
	mov [esp+80h], ecx
	cmp dx, 1Fh
	jle loc_4021B5
	cmp dx, 0FFh
	jge loc_4021B5
	mov edi, 1
	mov [esp], dl
	mov [esp+84h], di
	jmp loc_4021B5
;sub_401F40 endp

sub_402340: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	mov ebx, eax
	mov esi, edx
	xor edx, edx

loc_402349:
	mov eax, dword [dword_4E5010]
	add eax, 96h
	cmp eax, dword [dword_5637F4]
	jle loc_402364
	mov eax, edx
	call sub_483EB0
	jmp loc_402349

loc_402364:
	mov eax, dword [dword_4D4D24]
	call sub_4825A8
	mov eax, [ebx+20h]
	call sub_4834C4
	push 1
	call sub_497680
	mov eax, dword [dword_4D4D24]
	mov eax, [eax+20h]
	call sub_426B70
	call sub_4824BC
	mov eax, ebx
	call sub_482DA0
	test esi, esi
	jnz loc_4023A9
	mov dword [dword_4D2310], 1
	pop esi
	pop ecx
	pop ebx
	ret

loc_4023A9:
	mov eax, 303h
	call sub_402CD0
	mov eax, 100h
	call sub_4833E7
	mov dword [dword_4D2310], 1
	pop esi
	pop ecx
	pop ebx
	ret
;sub_402340 endp

sub_4023D0: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	sub esp, 8
	mov edi, eax
	mov esi, edx
	mov eax, dword [dword_4DAB7C]
	xor edx, edx
	xor ebx, ebx
	mov dword [dword_4D2310], edx
	mov edx, dword [dword_4DAB80]
	call sub_482474
	mov ecx, eax
	call sub_4825A8
	mov eax, dword [dword_4D4D24]
	mov eax, [eax+20h]
	call sub_483470
	call sub_4824BC
	mov eax, edi
	call sub_41B710
	mov [esp], eax
	mov eax, esi
	mov edx, esp
	call sub_41B710
	mov [esp+4], eax
	call sub_428A20
	mov eax, 2
	call sub_402E80
	call sub_405C70
	mov eax, dword [dword_5637F4]
	mov dword [dword_4E5010], eax
	mov eax, ecx
	add esp, 8
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_4023D0 endp

sub_402460: ;SUBROUTINE
	push esi
	push edi
	push ebp
	sub esp, 98h
	mov ebp, eax
	mov [esp+90h], bx
	mov [esp+94h], ecx
	mov edi, 0FFFFFFFFh
	xor ecx, ecx
	mov esi, dword_401010
	mov [esp+80h], ecx
	mov [esp+74h], cx
	mov [esp+78h], di
	mov ecx, 0Ch
	mov edi, esp
	movsx eax, dx
	mov edx, dword_4C8014
	rep movsd
	movsw
	call sub_41B710
	mov [esp+68h], eax
	mov [esp+70h], edx
	lea eax, [esp+34h]
	xor ecx, ecx
	mov [esp+6Ch], eax
	mov eax, ebp
	mov dword [dword_4D2310], ecx
	call sub_402A00
	mov [esp+88h], eax
	mov eax, 2FCh
	mov ebx, 1
	call sub_41B710
	mov edx, eax
	mov eax, ebp
	mov [esp+84h], ebx
	call strcmp_
	test eax, eax
	jnz loc_4024FF
	mov [esp+88h], ebx

loc_4024FF:
	mov edi, ebp
	sub ecx, ecx
	dec ecx
	xor eax, eax
	repne scasb
	not ecx
	dec ecx
	mov esi, ebp
	mov edi, esp
	xor ebx, ebx
	push edi

loc_402512:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_40252A
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_402512

loc_40252A:
	pop edi
	mov edx, dword [dword_4DAB80]
	mov eax, dword [dword_4DAB7C]
	call sub_482474
	mov [esp+70h], eax
	call sub_4825A8
	mov eax, dword [dword_4D4D24]
	mov [esp+8Ch], cx
	mov eax, [eax+20h]
	xor edx, edx
	call sub_483470
	call sub_4824BC

loc_402560:
	call sub_405910
	test eax, eax
	jz loc_402572
	mov eax, edx
	call sub_403550
	jmp loc_402560

loc_402572:
	mov eax, [esp+76h]
	sar eax, 10h
	cmp eax, 0FFFFFFFFh
	jnz loc_4028E6
	xor eax, eax
	mov ebx, [esp+84h]
	call sub_403550
	test bx, bx
	jz loc_40262C
	mov esi, esp
	lea edi, [esp+34h]
	push edi

loc_4025A0:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_4025B8
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_4025A0

loc_4025B8:
	pop edi
	call sub_428A20
	mov eax, [esp+70h]
	lea edx, [esp+68h]
	xor ecx, ecx
	mov eax, [eax+20h]
	mov esi, [esp+74h]
	call sub_483470
	mov eax, 2
	mov [esp+84h], ecx
	call sub_402E80
	test si, si
	jz loc_402627
	push 2
	push 0
	movsx ebx, ax
	lea eax, [esp+8]
	call sub_482424
	mov edx, eax
	sar edx, 1Fh
	sub eax, edx
	sar eax, 1
	mov esi, eax
	mov eax, dword [dword_4DAB7C]
	mov edx, eax
	sar edx, 1Fh
	sub eax, edx
	sar eax, 1
	add eax, esi
	mov ecx, 12h
	movsx edx, ax
	mov eax, a_ ; "_"
	call sub_4054E0

loc_402627:
	call sub_405C70

loc_40262C:
	cmp word [esp+7Ch], 0
	jz loc_4026E1
	call sub_405910
	mov edx, eax
	test ax, ax
	jz loc_40264A
	xor ebx, ebx
	mov [esp+7Ch], ebx

loc_40264A:
	test dx, dx
	jz loc_40269D
	cmp dx, 0Dh
	jnz loc_4026FD
	mov esi, esp
	mov edi, ebp
	push edi

loc_40265E:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_402676
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_40265E

loc_402676:
	pop edi
	mov word [esp+78h], 1

loc_40267E:
	mov eax, [esp+8Ah]
	sar eax, 10h
	xor dl, dl
	mov [esp+eax], dl
	mov dword [esp+84h], 1
	call sub_4833C7

loc_40269D:
	mov edx, [esp+80h]
	call sub_4833C7
	add edx, eax
	mov [esp+80h], edx
	cmp dx, 0Fh
	jl loc_402572
	mov dh, [esp+74h]
	mov ecx, 1
	xor esi, esi
	xor dh, 1
	mov [esp+84h], ecx
	mov [esp+80h], esi
	mov [esp+74h], dh
	jmp loc_402572

loc_4026E1:
	call sub_405910
	xor edx, edx
	test eax, eax
	jnz loc_40264A
	mov dword [esp+7Ch], 1
	jmp loc_40264A

loc_4026FD:
	cmp dx, 1Bh
	jnz loc_40270F
	xor esi, esi
	mov [esp+78h], si
	jmp loc_40267E

loc_40270F:
	cmp word [esp+94h], 2
	jz loc_40272A
	movsx eax, dx
	call sub_402AE0
	test eax, eax
	jz loc_40267E

loc_40272A:
	cmp word [esp+94h], 2
	jnz loc_4027A3
	cmp dx, 20h
	jz loc_40267E
	cmp dx, 2Ah
	jz loc_40267E
	cmp dx, 2Fh
	jz loc_40267E
	cmp dx, 3Fh
	jz loc_40267E
	cmp dx, 3Ch
	jz loc_40267E
	cmp dx, 3Eh
	jz loc_40267E
	cmp dx, 22h
	jz loc_40267E
	cmp dx, 3Ah
	jz loc_40267E
	cmp dx, 5Ch
	jz loc_40267E
	cmp dx, 7Ch
	jz loc_40267E
	cmp dx, 2Eh
	jz loc_40267E

loc_4027A3:
	cmp dx, 8
	jnz loc_4027E6
	mov edi, [esp+8Ch]
	test di, di
	jle loc_4027E6
	cmp word [esp+88h], 0
	jz loc_4027D6
	xor ebx, ebx
	mov [esp+8Ch], bx
	mov [esp+88h], ebx
	jmp loc_40267E

loc_4027D6:
	mov edx, edi
	dec edx
	mov [esp+8Ch], dx
	jmp loc_40267E

loc_4027E6:
	cmp word [esp+94h], 0
	jnz loc_402839
	cmp dx, 30h
	jle loc_40267E
	cmp dx, 39h
	jge loc_40267E
	mov ebx, [esp+8Eh]
	mov eax, [esp+8Ah]
	sar ebx, 10h
	sar eax, 10h
	cmp eax, ebx
	jge loc_40267E
	mov edi, [esp+8Ch]
	inc edi
	mov [esp+eax], dl
	mov [esp+8Ch], di
	jmp loc_40267E

loc_402839:
	mov eax, [esp+8Eh]
	mov ebx, [esp+8Ah]
	sar eax, 10h
	sar ebx, 10h
	cmp ebx, eax
	jge loc_40289C
	cmp dx, 1Fh
	jle loc_40289C
	cmp dx, 0FFh
	jge loc_40289C
	cmp word [esp+88h], 0
	jz loc_40287A
	xor ebx, ebx
	mov [esp+8Ch], bx
	mov [esp+88h], ebx

loc_40287A:
	mov esi, [esp+8Ch]
	mov eax, [esp+8Ah]
	inc esi
	sar eax, 10h
	mov [esp+8Ch], si
	mov [esp+eax], dl
	jmp loc_40267E

loc_40289C:
	cmp word [esp+88h], 0
	jz loc_40267E
	xor ecx, ecx
	mov [esp+8Ch], cx
	mov [esp+88h], ecx
	cmp dx, 1Fh
	jle loc_40267E
	cmp dx, 0FFh
	jge loc_40267E
	mov edi, 1
	mov [esp], dl
	mov [esp+8Ch], di
	jmp loc_40267E

loc_4028E6:
	mov eax, dword [dword_4D4D24]
	call sub_4825A8
	mov eax, [esp+70h]
	mov eax, [eax+20h]
	call sub_4834C4
	push 1
	call sub_497680
	mov eax, dword [dword_4D4D24]
	mov eax, [eax+20h]
	call sub_426B70
	call sub_4824BC
	mov eax, [esp+70h]
	mov edi, ebp
	call sub_482DA0
	sub ecx, ecx
	dec ecx
	xor eax, eax
	repne scasb
	not ecx
	dec ecx
	test ecx, ecx
	jz loc_40294B

loc_40292F:
	mov eax, [esp+76h]
	mov ebx, 1
	sar eax, 10h
	mov dword [dword_4D2310], ebx
	add esp, 98h
	pop ebp
	pop edi
	pop esi
	ret

loc_40294B:
	xor edx, edx
	mov [esp+78h], dx
	jmp loc_40292F
;sub_402460 endp

sub_402960: ;SUBROUTINE
	push ecx
	push edx
	push esi
	push edi
	push ebp
	mov ebp, eax
	mov edi, eax
	sub ecx, ecx
	dec ecx
	xor eax, eax
	repne scasb
	not ecx
	dec ecx
	mov edx, ecx
	mov esi, ecx
	test ecx, ecx
	jz loc_40299F
	mov ecx, 1
	xor eax, eax
	test edx, edx
	jle loc_402995
	mov edx, ebp

loc_402988:
	cmp byte [edx], 20h
	jz loc_40298F
	xor ecx, ecx

loc_40298F:
	inc eax
	inc edx
	cmp eax, esi
	jl loc_402988

loc_402995:
	test ecx, ecx
	jnz loc_40299F
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	ret

loc_40299F:
	mov eax, 2A1h
	call sub_41B710
	mov edi, ebp
	mov esi, eax
	push edi

loc_4029AE:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_4029C6
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_4029AE

loc_4029C6:
	pop edi
	mov esi, a1 ; "1"
	push edi
	sub ecx, ecx
	dec ecx
	mov al, 0
	repne scasb
	dec edi

loc_4029D5:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_4029ED
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_4029D5

loc_4029ED:
	pop edi
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	ret
;sub_402960 endp

sub_402A00: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	sub esp, 14h
	mov ebx, eax
	mov eax, 2A1h
	mov edi, esp
	call sub_41B710
	mov esi, eax
	push edi

loc_402A19:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_402A31
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_402A19

loc_402A31:
	pop edi
	mov esi, a1 ; "1"
	mov edi, esp
	mov edx, ebx
	push edi
	sub ecx, ecx
	dec ecx
	mov al, 0
	repne scasb
	dec edi

loc_402A44:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_402A5C
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_402A44

loc_402A5C:
	pop edi
	mov eax, esp
	call strcmp_
	test eax, eax
	jnz loc_402A76

loc_402A68:
	mov eax, 1
	add esp, 14h
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_402A76:
	mov eax, 2A1h
	mov edi, esp
	call sub_41B710
	mov esi, eax
	push edi

loc_402A85:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_402A9D
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_402A85

loc_402A9D:
	pop edi
	mov esi, a2 ; "2"
	mov edi, esp
	mov edx, ebx
	push edi
	sub ecx, ecx
	dec ecx
	mov al, 0
	repne scasb
	dec edi

loc_402AB0:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_402AC8
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_402AB0

loc_402AC8:
	pop edi
	mov eax, esp
	call strcmp_
	test eax, eax
	jz loc_402A68
	xor eax, eax
	add esp, 14h
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_402A00 endp

sub_402AE0: ;SUBROUTINE
	cmp eax, 8
	jz loc_402C37
	cmp eax, 5300h
	jz loc_402C37
	cmp eax, 20h
	jl loc_402B02
	cmp eax, 22h
	jle loc_402C37

loc_402B02:
	cmp eax, 26h
	jl loc_402B10
	cmp eax, 3Ah
	jle loc_402C37

loc_402B10:
	cmp eax, 3Bh
	jz loc_402C37
	cmp eax, 3Fh
	jz loc_402C37
	cmp eax, 41h
	jl loc_402B30
	cmp eax, 5Dh
	jle loc_402C37

loc_402B30:
	cmp eax, 5Fh
	jl loc_402B3E
	cmp eax, 7Dh
	jle loc_402C37

loc_402B3E:
	cmp eax, 91h
	jz loc_402C37
	cmp eax, 92h
	jz loc_402C37
	cmp eax, 0A1h
	jz loc_402C37
	cmp eax, 0B0h
	jz loc_402C37
	cmp eax, 0BFh
	jz loc_402C37
	cmp eax, 0C1h
	jz loc_402C37
	cmp eax, 0E1h
	jz loc_402C37
	cmp eax, 0C4h
	jz loc_402C37
	cmp eax, 0E4h
	jz loc_402C37
	cmp eax, 0C5h
	jz loc_402C37
	cmp eax, 0E5h
	jz loc_402C37
	cmp eax, 0C7h
	jz loc_402C37
	cmp eax, 0E7h
	jz loc_402C37
	cmp eax, 0C9h
	jz loc_402C37
	cmp eax, 0E9h
	jz loc_402C37
	cmp eax, 0CDh
	jz loc_402C37
	cmp eax, 0EDh
	jz loc_402C37
	cmp eax, 0D1h
	jz loc_402C37
	cmp eax, 0F1h
	jz loc_402C37
	cmp eax, 0D3h
	jz loc_402C37
	cmp eax, 0F3h
	jz loc_402C37
	cmp eax, 0D6h
	jz loc_402C37
	cmp eax, 0F6h
	jz loc_402C37
	cmp eax, 0DAh
	jz loc_402C37
	cmp eax, 0FAh
	jz loc_402C37
	cmp eax, 0DCh
	jz loc_402C37
	cmp eax, 0FCh
	jnz loc_402C3D

loc_402C37:
	mov eax, 1
	ret

loc_402C3D:
	xor eax, eax
	ret
;sub_402AE0 endp

sub_402C40: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	sub esp, 50h
	mov esi, dword_512F4C
	mov edi, esp
	mov ecx, 1
	mov ebx, 8
	mov edx, 2E7h
	push edi

loc_402C5F:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_402C77
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_402C5F

loc_402C77:
	pop edi
	mov eax, esp
	call sub_402460
	test eax, eax
	jnz loc_402C8C
	add esp, 50h
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_402C8C:
	mov eax, esp
	mov esi, esp
	mov edi, dword_512F4C
	call sub_402960
	push edi

loc_402C9B:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_402CB3
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_402C9B

loc_402CB3:
	pop edi
	mov eax, 1
	add esp, 50h
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_402C40 endp

sub_402CD0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 0Ch
	mov esi, eax
	mov edi, 2
	mov edx, dword_4C8014
	xor ecx, ecx
	mov [esp], edx
	call sub_41B710
	mov [esp+4], eax
	cmp esi, 30Ch
	jz loc_402D55

loc_402CFB:
	mov edx, dword [dword_4DAB80]
	mov eax, dword [dword_4DAB7C]
	xor ebp, ebp
	xor ebx, ebx
	mov dword [dword_4D2310], ebp
	call sub_482474
	mov ebx, eax
	call sub_4825A8
	mov eax, dword [dword_4D4D24]
	mov eax, [eax+20h]
	mov edx, esp
	call sub_483470
	call sub_4824BC
	mov eax, edi
	call sub_402E80
	call sub_405C70
	xor edx, edx

loc_402D43:
	call sub_405910
	test eax, eax
	jz loc_402D78
	mov eax, edx
	call sub_403550
	jmp loc_402D43

loc_402D55:
	mov eax, 30Dh
	call sub_41B710
	mov ebx, dword [dword_4D1FEC]
	mov edi, 3
	add ebx, ebx
	mov [esp+8], eax
	mov dword [dword_4D1FEC], ebx
	jmp loc_402CFB

loc_402D78:
	call sub_4833C7
	xor edx, edx

loc_402D7F:
	call sub_405910
	test eax, eax
	jnz loc_402DA0
	cmp ecx, dword [dword_4D1FEC]
	jge loc_402DA0
	call sub_4833C7
	add ecx, eax
	mov eax, edx
	call sub_403550
	jmp loc_402D7F

loc_402DA0:
	cmp esi, 30Ch
	jnz loc_402DBB
	mov eax, dword [dword_4D1FEC]
	mov edx, eax
	sar edx, 1Fh
	sub eax, edx
	sar eax, 1
	mov dword [dword_4D1FEC], eax

loc_402DBB:
	mov edx, 1
	mov eax, dword [dword_4D4D24]
	mov dword [dword_4D2310], edx
	call sub_4825A8
	mov eax, [ebx+20h]
	call sub_4834C4
	push edx
	call sub_497680
	mov eax, dword [dword_4D4D24]
	mov eax, [eax+20h]
	call sub_426B70
	call sub_4824BC
	mov eax, ebx
	call sub_482DA0
	add esp, 0Ch
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_402CD0 endp

sub_402E10: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	sub esp, 0Ch
	mov edx, eax
	mov ebx, dword_4C8014
	mov ecx, 2
	mov [esp], ebx
	call sub_41B710
	mov [esp+4], eax
	cmp edx, 30Ch
	jz loc_402E46
	mov edx, esp
	mov eax, ecx
	call sub_402E80
	add esp, 0Ch
	pop edx
	pop ecx
	pop ebx
	ret

loc_402E46:
	push esi
	mov eax, 30Dh
	call sub_41B710
	mov esi, dword [dword_4D1FEC]
	mov ecx, 3
	add esi, esi
	mov [esp+0Ch], eax
	mov dword [dword_4D1FEC], esi
	pop esi
	mov edx, esp
	mov eax, ecx
	call sub_402E80
	add esp, 0Ch
	pop edx
	pop ecx
	pop ebx
	ret
;sub_402E10 endp

sub_402E80: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 1Ch
	mov ebp, eax
	mov [esp], edx
	mov eax, 12h
	call sub_4056F0
	xor edi, edi
	xor esi, esi
	test ebp, ebp
	jle loc_402EBF
	mov ebx, edx

loc_402EA1:
	mov eax, [ebx]
	call sub_482424
	mov edx, eax
	test esi, esi
	jnz loc_402EB1
	lea edx, [eax+3Ch]

loc_402EB1:
	cmp edx, edi
	jle loc_402EB7
	mov edi, edx

loc_402EB7:
	inc esi
	add ebx, 4
	cmp esi, ebp
	jl loc_402EA1

loc_402EBF:
	add edi, 1Eh
	cmp ebp, 1
	jg loc_403061
	xor esi, esi

loc_402ECD:
	mov edx, dword [dword_4DAB7C]
	sub edx, edi
	mov eax, edx
	sar edx, 1Fh
	sub eax, edx
	sar eax, 1
	mov edx, dword [dword_4DAB80]
	sub edx, esi
	mov [esp+4], eax
	mov eax, edx
	sar edx, 1Fh
	sub eax, edx
	sar eax, 1
	xor ebx, ebx
	mov [esp+8], eax
	call sub_428A20
	mov edx, esi
	mov eax, edi
	mov ecx, 0B4h
	call sub_482474
	mov ebx, [esp+8]
	mov esi, eax
	call sub_4825A8
	mov eax, 0FF080808h
	mov edx, [esp+4]
	call sub_48266C
	call sub_482740
	call sub_428A20
	mov eax, [esi+20h]
	call sub_482C78
	mov eax, esi
	call sub_482DA0
	xor edx, edx
	mov eax, [esp+4]
	mov ecx, dword [dword_4DAB80]
	mov ebx, dword [dword_4DAB7C]
	add eax, 14h
	mov esi, [esp+4]
	call sub_482E00
	sub esi, 13Bh
	mov edx, aDbar ; "dbar"
	mov eax, dword [dword_4D4C78]
	mov ebx, [esp+8]
	call sub_482EA8
	add esi, edi
	sub ebx, 1Fh
	mov edx, esi
	call sub_48330C
	mov ecx, dword [dword_4DAB80]
	mov ebx, dword [dword_4DAB7C]
	xor edx, edx
	xor eax, eax
	call sub_482E00
	mov ebx, [esp+8]
	mov edx, aDlog ; "dlog"
	mov eax, dword [dword_4D4C78]
	mov ecx, [esp+4]
	call sub_482EA8
	sub ecx, 0A4h
	sub ebx, 8Eh
	mov edx, ecx
	xor esi, esi
	call sub_4833A0
	test ebp, ebp
	jle loc_403051
	mov eax, [esp+8]
	sub eax, 19h
	lea edx, [edi-3Ch]
	mov [esp+18h], ax
	mov eax, edx
	sar edx, 1Fh
	sub eax, edx
	sar eax, 1
	mov edx, [esp+4]
	add edx, 3Ch
	add edx, eax
	mov [esp+10h], edx
	mov edx, edi
	mov eax, edi
	sar edx, 1Fh
	sub eax, edx
	sar eax, 1
	mov edx, [esp+4]
	add edx, eax
	imul eax, esi, 1Eh
	mov ebx, [esp+8]
	add ebx, 0Fh
	sub eax, 1Eh
	mov edi, [esp]
	add eax, ebx
	mov [esp+0Ch], edx
	mov [esp+14h], ax

loc_40301B:
	mov eax, [edi]
	test esi, esi
	jz loc_403075
	push 2
	mov ebx, [esp+16h]
	mov edx, [esp+10h]

loc_40302B:
	mov ecx, 12h
	push 2
	sar ebx, 10h
	movsx edx, dx
	call sub_4054E0
	mov edx, [esp+14h]
	add edi, 4
	add edx, 1Eh
	inc esi
	mov [esp+14h], dx
	cmp esi, ebp
	jl loc_40301B

loc_403051:
	mov eax, [esp+8]
	add eax, 0Fh
	add esp, 1Ch
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_403061:
	lea eax, [ebp-1]
	add eax, eax
	mov edx, eax
	shl eax, 4
	sub eax, edx
	lea esi, [eax+1Eh]
	jmp loc_402ECD

loc_403075:
	mov ebx, [esp+16h]
	push esi
	mov edx, [esp+14h]
	jmp loc_40302B
;sub_402E80 endp

sub_403080: ;SUBROUTINE
	push edx
	mov edx, dword [dword_4E5098]
	test edx, edx
	jnz loc_40308D
	pop edx
	ret

loc_40308D:
	push ecx
	mov eax, edx
	xor ecx, ecx
	call sub_4848FC
	mov dword [dword_4E5098], ecx
	pop ecx
	pop edx
	ret
;sub_403080 endp

sub_4030A0: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	mov ecx, eax
	mov esi, a000 ; "000"
	mov edi, dword_4E5074
	mov ebx, 1
	xor edx, edx
	push edi

loc_4030B8:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_4030D0
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_4030B8

loc_4030D0:
	pop edi
	mov dword [dword_4E507C], edx
	mov dword [dword_4E5078], ebx
	mov dword [dword_4E5080], edx
	mov dword [dword_4E5088], edx
	mov dword [dword_4E508C], edx
	mov dword [dword_4E5090], edx
	xor ah, ah
	mov dword [dword_4E5094], edx
	mov byte [byte_4E5084], ah
	mov byte [byte_4E5085], ah
	mov byte [byte_4E5086], ah
	cmp ecx, 5
	jnz loc_403116
	xor ecx, ecx

loc_403116:
	mov ebx, dword off_4D2004[ecx*4]
	push ebx
	push ebx
	mov edi, dword [dword_5134CC]
	push edi
	push aSSS_viv ; "%s%s\\%s.viv"
	push dword_4E504C
	call sprintf_
	add esp, 14h
	mov eax, dword_4E504C
	call sub_403150
	mov dword [dword_4E5098], eax
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_4030A0 endp

sub_403150: ;SUBROUTINE
	push ebx
	push ecx
	push edx

; 	sub esp, 10h ;Below code prevents crash with languages without voice (uninitialized memory, game BUG?)
	push 1
	push 0
	push 0
	push 0

	call sub_485930
	mov ebx, 10h
	mov edx, esp
	xor eax, eax
	call sub_485AA4
	mov edx, eax
	test eax, eax
	jz loc_403263
	xor ecx, ecx

loc_403175:
	mov eax, ecx
	call sub_483EB0
	mov eax, edx
	call sub_485BDC
	test eax, eax
	jz loc_403175
	mov edx, [esp]
	mov eax, [esp]
	and edx, 0FFh
	and eax, 0FF00h
	shl edx, 18h
	shl eax, 8
	or eax, edx
	mov edx, [esp]
	and edx, 0FF0000h
	shr edx, 8
	or edx, eax
	mov eax, [esp]
	and eax, 0FF000000h
	shr eax, 18h
	or edx, eax
	mov eax, [esp+0Ch]
	mov [esp], edx
	mov edx, [esp+0Ch]
	and eax, 0FF00h
	and edx, 0FFh
	shl eax, 8
	shl edx, 18h
	or edx, eax
	mov eax, [esp+0Ch]
	and eax, 0FF0000h
	shr eax, 8
	or edx, eax
	mov eax, [esp+0Ch]
	and eax, 0FF000000h
	shr eax, 18h
	or edx, eax
	mov eax, [esp+8]
	mov [esp+0Ch], edx
	mov edx, [esp+8]
	and eax, 0FF00h
	and edx, 0FFh
	shl eax, 8
	shl edx, 18h
	or edx, eax
	mov eax, [esp+8]
	and eax, 0FF0000h
	shr eax, 8
	or edx, eax
	mov eax, [esp+8]
	and eax, 0FF000000h
	shr eax, 18h
	or edx, eax
	mov ecx, 199h
	mov [esp+8], edx
	mov edx, aCNfs2seFronten ; "c:\\nfs2se\\frontend\\common\\Feaudio.c"
	xor ebx, ebx
	mov dword [dword_4DB1D8], edx
	mov edx, [esp+0Ch]
	mov eax, aLumpyhead ; "lumpyhead"
	add edx, 20h
	mov dword [dword_4DB1DC], ecx
	call sub_4844B0
	mov ecx, eax
	test eax, eax
	jnz loc_40326A

loc_403263:
	add esp, 10h
	pop edx
	pop ecx
	pop ebx
	ret

loc_40326A:
	mov ebx, [esp+0Ch]
	mov edx, eax
	add ebx, 20h
	xor eax, eax
	call sub_485AA4
	mov edx, eax
	test eax, eax
	jz loc_403263
	xor ebx, ebx

loc_403282:
	mov eax, ebx
	call sub_483EB0
	mov eax, edx
	call sub_485BDC
	test eax, eax
	jz loc_403282
	mov edx, [ecx]
	mov eax, [ecx]
	and edx, 0FFh
	and eax, 0FF00h
	shl edx, 18h
	shl eax, 8
	or edx, eax
	mov eax, [ecx]
	and eax, 0FF0000h
	shr eax, 8
	or eax, edx
	mov edx, [ecx]
	and edx, 0FF000000h
	shr edx, 18h
	or eax, edx
	mov [ecx], eax
	mov edx, [ecx+0Ch]
	mov eax, [ecx+0Ch]
	and edx, 0FFh
	and eax, 0FF00h
	shl edx, 18h
	shl eax, 8
	or edx, eax
	mov eax, [ecx+0Ch]
	and eax, 0FF0000h
	shr eax, 8
	or edx, eax
	mov eax, [ecx+0Ch]
	and eax, 0FF000000h
	shr eax, 18h
	or edx, eax
	mov [ecx+0Ch], edx
	mov eax, [ecx+8]
	mov edx, [ecx+8]
	and eax, 0FF00h
	and edx, 0FFh
	shl eax, 8
	shl edx, 18h
	or edx, eax
	mov eax, [ecx+8]
	and eax, 0FF0000h
	shr eax, 8
	or eax, edx
	mov edx, [ecx+8]
	and edx, 0FF000000h
	shr edx, 18h
	or eax, edx
	mov [ecx+8], eax
	mov eax, ecx
	add esp, 10h
	pop edx
	pop ecx
	pop ebx
	ret
;sub_403150 endp

sub_403340: ;SUBROUTINE
	push esi
	push edi
	push ebp
	sub esp, 8
	mov ebp, eax
	mov edi, edx
	mov [esp+4], ebx
	mov [esp], ecx
	mov eax, [esp+4]
	xor ebx, ebx
	mov [eax], ebx
	mov [ecx], ebx
	test ebp, ebp
	jz loc_40336C
	lea esi, [ebp+10h]

loc_403362:
	mov eax, ebx
	mov edx, [ebp+8]
	inc ebx
	cmp eax, edx
	jb loc_403373

loc_40336C:
	add esp, 8
	pop ebp
	pop edi
	pop esi
	ret

loc_403373:
	lea ecx, [esi+8]
	mov eax, edi
	mov edx, ecx
	call strcmp_
	test eax, eax
	jz loc_403398
	mov dl, [ecx]
	mov eax, ecx
	test dl, dl
	jz loc_403393

loc_40338B:
	mov dh, [eax+1]
	inc eax
	test dh, dh
	jnz loc_40338B

loc_403393:
	lea esi, [eax+1]
	jmp loc_403362

loc_403398:
	mov ecx, [esi]
	mov eax, [esi]
	and ecx, 0FFh
	and eax, 0FF00h
	shl ecx, 18h
	shl eax, 8
	or eax, ecx
	mov ecx, [esi]
	and ecx, 0FF0000h
	shr ecx, 8
	or ecx, eax
	mov eax, [esi]
	and eax, 0FF000000h
	shr eax, 18h
	or ecx, eax
	mov eax, [esp+4]
	mov [eax], ecx
	mov ecx, [esi+4]
	mov eax, [esi+4]
	and ecx, 0FFh
	and eax, 0FF00h
	shl ecx, 18h
	shl eax, 8
	or eax, ecx
	mov ecx, [esi+4]
	and ecx, 0FF0000h
	shr ecx, 8
	or ecx, eax
	mov eax, [esi+4]
	and eax, 0FF000000h
	shr eax, 18h
	or ecx, eax
	mov eax, [esp]
	mov [eax], ecx
	add esp, 8
	pop ebp
	pop edi
	pop esi
	ret
;sub_403340 endp

sub_403410: ;SUBROUTINE
	push esi
	push edi
	push ebp
	sub esp, 4
	mov edi, eax
	mov ebp, edx
	mov esi, ebx
	mov [esp], ecx
	test ebx, ebx
	jnz loc_40342E
	xor ecx, ecx

loc_403425:
	mov eax, ecx
	add esp, 4
	pop ebp
	pop edi
	pop esi
	ret

loc_40342E:
	mov edx, aCNfs2seFronten ; "c:\\nfs2se\\frontend\\common\\Feaudio.c"
	mov ecx, 14Fh
	mov eax, aStreambuffer ; "streamBuffer"
	xor ebx, ebx
	mov dword [dword_4DB1D8], edx
	mov edx, esi
	mov dword [dword_4DB1DC], ecx
	call sub_4844B0
	mov ecx, eax
	test eax, eax
	jz loc_403425
	mov eax, edi
	call sub_485930
	mov ebx, esi
	mov edx, ecx
	mov eax, ebp
	mov esi, [esp]
	call sub_485AA4
	mov [esi], eax
	mov eax, ecx
	add esp, 4
	pop ebp
	pop edi
	pop esi
	ret
;sub_403410 endp

sub_403480: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push ebp
	mov ecx, eax
	call sub_403920
	mov eax, dword [dword_4D5A30]
	mov dword [dword_4E509C], eax
	cmp eax, 7Fh
	jle loc_4034A5
	mov dword [dword_4E509C], 7Fh

loc_4034A5:
	mov ebx, 4
	mov eax, dword_4E5074
	mov edx, ecx
	xor esi, esi
	call strncpy_
	mov dword [dword_4E507C], esi
	mov ah, [ecx]
	mov dword [dword_4E5080], esi
	cmp ah, 63h
	jz loc_40354C
	mov eax, 1

loc_4034D4:
	mov dword [dword_4E5078], eax
	xor dl, dl
	xor ebp, ebp
	mov eax, dword_4E5074
	mov byte [byte_4E5084], dl
	mov byte [byte_4E5085], dl
	mov byte [byte_4E5086], dl
	mov dword [dword_4E5088], ebp
	mov dword [dword_4E508C], ebp
	mov dword [dword_4E5090], ebp
	mov dword [dword_4E5094], ebp
	call sub_403860
	test eax, eax
	jz loc_40353C
	cmp dword [dword_4D5A30], 0
	jz loc_40353C
	mov eax, dword [dword_4D5A28]
	mov edx, eax
	sar edx, 1Fh
	shl edx, 2
	sbb eax, edx
	sar eax, 2
	mov edx, eax
	mov eax, 0Ah
	call sub_4864A0

loc_40353C:
	call sub_4038F0
	mov eax, 1
	pop ebp
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_40354C:
	xor eax, eax
	jmp loc_4034D4
;sub_403480 endp

sub_403550: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	xor eax, eax
	call sub_483EB0
	call sub_403920
	cmp byte [byte_4E5084], 0
	jnz loc_4035AB

loc_40356B:
	cmp byte [byte_4E5085], 0
	jnz loc_4035CA

loc_403574:
	cmp dword [dword_4D1FFC], 0
	jz loc_403737

loc_403581:
	cmp byte [byte_4E5084], 0
	jz loc_40368F
	xor edx, edx

loc_403590:
	mov eax, dword [dword_4E5094]
	call sub_485BDC
	test eax, eax
	jnz loc_40368F
	mov eax, edx
	call sub_483EB0
	jmp loc_403590

loc_4035AB:
	mov eax, dword [dword_4E5094]
	call sub_485BDC
	test eax, eax
	jz loc_40356B
	xor dl, dl
	mov byte [byte_4E5084], dl
	mov byte [byte_4E5086], 1
	jmp loc_40356B

loc_4035CA:
	mov eax, dword [dword_4E5080]
	call sub_486040
	test eax, eax
	jz loc_403574
	mov ebx, 0FFFFFFFFh
	mov eax, dword [dword_4E5080]
	xor edx, edx
	call sub_486080
	mov eax, dword [dword_4E507C]
	call sub_486404
	mov edx, dword [dword_4E5090]
	test edx, edx
	jz loc_40360C
	mov eax, edx
	xor ecx, ecx
	call sub_4848FC
	mov dword [dword_4E5090], ecx

loc_40360C:
	mov ebx, dword [dword_4E5088]
	test ebx, ebx
	jz loc_403625
	mov eax, ebx
	xor esi, esi
	call sub_4848FC
	mov dword [dword_4E5088], esi

loc_403625:
	cmp byte [byte_4E5084], 0
	jz loc_403656
	xor edx, edx

loc_403630:
	mov eax, dword [dword_4E5094]
	call sub_485BDC
	test eax, eax
	jnz loc_403647
	mov eax, edx
	call sub_483EB0
	jmp loc_403630

loc_403647:
	xor cl, cl
	mov byte [byte_4E5084], cl
	mov byte [byte_4E5086], 1

loc_403656:
	xor al, al
	xor edi, edi
	mov byte [byte_4E5085], al
	mov ah, byte [byte_4E5084]
	mov dword [dword_4E507C], edi
	test ah, ah
	jnz loc_403574
	cmp byte [byte_4E5086], 0
	jnz loc_403574
	mov dword [dword_4D1FFC], 1
	jmp loc_403581

loc_40368F:
	cmp byte [byte_4E5085], 0
	jz loc_4036B3
	mov ebx, 0FFFFFFFFh
	mov eax, dword [dword_4E5080]
	xor edx, edx
	call sub_486080
	mov eax, dword [dword_4E507C]
	call sub_486404

loc_4036B3:
	mov eax, 64h
	mov edx, dword [dword_4D5A28]
	call sub_4864A0
	mov edx, dword [dword_4E508C]
	test edx, edx
	jz loc_4036DC
	mov eax, edx
	xor ecx, ecx
	call sub_4848FC
	mov dword [dword_4E508C], ecx

loc_4036DC:
	mov ebx, dword [dword_4E5090]
	test ebx, ebx
	jz loc_4036F5
	mov eax, ebx
	xor esi, esi
	call sub_4848FC
	mov dword [dword_4E5090], esi

loc_4036F5:
	mov edi, dword [dword_4E5088]
	test edi, edi
	jz loc_40370E
	mov eax, edi
	xor ebp, ebp
	call sub_4848FC
	mov dword [dword_4E5088], ebp

loc_40370E:
	xor ah, ah
	xor dh, dh
	mov byte [byte_4E5086], ah
	mov byte [byte_4E5085], ah
	xor eax, eax
	mov byte [byte_4E5084], dh
	mov dword [dword_4D1FFC], eax

loc_40372B:
	call sub_4038F0
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_403737:
	cmp byte [byte_4E5086], 0
	jz loc_40372B
	mov bl, byte [byte_4E5085]
	test bl, bl
	jnz loc_40372B
	cmp byte [byte_4E5084], 0
	jnz loc_40372B
	mov eax, dword_4E5074
	call sub_403770
	mov byte [byte_4E5086], bl
	call sub_4038F0
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_403550 endp

sub_403770: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 10h
	mov ecx, eax
	mov edx, [eax+18h]
	test edx, edx
	jnz loc_40378C

loc_403782:
	add esp, 10h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_40378C:
	add eax, 8
	call sub_485364
	cmp eax, 7
	jnz loc_403838
	mov ebx, aCNfs2seFronten ; "c:\\nfs2se\\frontend\\common\\Feaudio.c"
	mov esi, 81h
	mov eax, [ecx+8]
	mov dword [dword_4DB1D8], ebx
	mov dword [dword_4DB1DC], esi
	call sub_485160
	mov edx, eax
	xor ebx, ebx
	mov eax, aComheader ; "comHeader"
	call sub_484498
	mov edx, [ecx+8]
	mov [ecx+14h], eax
	call sub_485218
	mov edi, [ecx+18h]
	test edi, edi
	jz loc_4037E9
	mov eax, edi
	call sub_4848FC
	mov dword [ecx+18h], 0

loc_4037E9:
	mov eax, esp
	call sub_485380
	mov al, [ecx+8]
	mov [esp+4], al
	mov al, byte [dword_4E509C]
	xor ebp, ebp
	mov [esp+8], al
	mov eax, esp
	mov [esp], ebp
	call sub_4853C0
	mov [ecx+0Ch], eax
	mov eax, [ecx+4]
	mov byte [ecx+11h], 1
	test eax, eax
	jz loc_403782
	mov ah, [ecx+2]
	cmp ah, 39h
	jb loc_403847
	mov byte [ecx+12h], 0
	mov byte [ecx+10h], 0
	add esp, 10h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_403838:
	mov eax, [ecx+18h]
	mov dword [ecx+18h], 0
	mov [ecx+1Ch], eax
	jmp loc_4037E9

loc_403847:
	mov dl, ah
	inc dl
	mov eax, ecx
	mov [ecx+2], dl
	call sub_403860
	add esp, 10h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_403770 endp

sub_403860: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	sub esp, 8
	mov esi, eax
	mov ecx, esp
	lea ebx, [esp+4]
	mov eax, dword [dword_4E5098]
	mov edx, esi
	call sub_403340
	cmp dword [esp+4], 0
	jz loc_4038C8
	cmp dword [esp], 0
	jz loc_4038C8
	mov ebx, [esi+18h]
	test ebx, ebx
	jz loc_40389E
	mov eax, ebx
	call sub_4848FC
	mov dword [esi+18h], 0

loc_40389E:
	mov ebx, [esp]
	mov edx, [esp+4]
	mov eax, dword_4E504C
	lea ecx, [esi+20h]
	call sub_403410
	mov edi, [esi+20h]
	mov [esi+18h], eax
	test edi, edi
	jnz loc_4038D3
	test eax, eax
	jz loc_4038C8
	call sub_4848FC
	mov [esi+18h], edi

loc_4038C8:
	xor eax, eax
	add esp, 8
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4038D3:
	mov byte [esi+12h], 0
	mov eax, 1
	mov byte [esi+10h], 1
	add esp, 8
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_403860 endp

sub_4038F0: ;SUBROUTINE
	push ecx
	push edx
	mov edx, dword [dword_4D2000]
	test edx, edx
	jz loc_403909
	lea ecx, [edx-1]
	mov dword [dword_4D2000], ecx
	test ecx, ecx
	jz loc_40390C

loc_403909:
	pop edx
	pop ecx
	ret

loc_40390C:
	mov eax, dword_4E5014
	call sub_4825A8
	pop edx
	pop ecx
	ret
;sub_4038F0 endp

sub_403920: ;SUBROUTINE
	push ecx
	push edx
	mov edx, dword [dword_4D2000]
	test edx, edx
	jnz loc_403962
	pop edx
	pop ecx
	ret
loc_403962:
	lea ecx, [edx+1]
	mov dword [dword_4D2000], ecx
	pop edx
	pop ecx
	ret
;sub_403920 endp

sub_403970: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 0Ch
	mov esi, eax
	mov edi, 1
	xor edx, edx
	xor eax, eax
	xor ebp, ebp
	mov al, byte [byte_512DA8]
	mov [esp+4], edx
	mov [esp+8], eax
	mov eax, esi
	mov [esp], edx
	call sub_410E80

loc_40399D:
	call sub_4833C7
	add ebp, eax
	xor edx, edx
	mov eax, esi
	call sub_40BBE0
	test eax, eax
	jz loc_403ADC

loc_4039B5:
	call sub_40EB20
	call sub_428A20
	mov edx, 400h
	mov eax, [esi+4]
	xor ecx, ecx
	xor ebx, ebx
	call sub_405B30
	mov eax, dword [dword_4D2314+2]
	sar eax, 10h
	mov edx, 1000h
	mov eax, dword dword_4D231C[eax*4]
	xor ecx, ecx
	xor ebx, ebx
	mov eax, [eax+20h]
	call sub_405B60
	mov eax, esi
	call sub_40FA90
	cmp byte [byte_512DFB], 2
	jnz loc_403AEA
	mov ecx, 1
	mov ebx, 4Dh
	mov edx, 12Ch

loc_403A13:
	mov eax, 137h
	call sub_405580
	call sub_405C70

loc_403A27:
	call sub_423B90
	mov ecx, 1E0h
	mov eax, esi
	mov ebx, 87h
	call sub_423CA0
	xor edx, edx
	mov edi, eax
	mov eax, 1F9h
	call sub_423DC0
	mov byte [byte_512DA8], al
	mov ebx, [esp+8]
	and eax, 0FFh
	cmp eax, ebx
	jz loc_403A75
	mov edx, 2Dh
	mov [esp+8], eax
	mov eax, 1
	mov edi, 1
	call sub_4423F0

loc_403A75:
	call sub_405960
	mov edx, eax
	test ax, ax
	jz loc_403AC4
	cmp ebp, [esp]
	jle loc_403AC4
	mov edi, 1
	lea ecx, [ebp+0Fh]
	mov bx, [esi+0Ah]
	mov [esp], ecx
	cmp bx, 0Ah
	jge loc_403B04
	cmp ax, 4B00h
	jnz loc_403AFE

loc_403AA1:
	mov edx, 7Fh
	xor eax, eax
	call sub_4423F0
	cmp byte [byte_512DA8], 0
	jnz loc_403B14
	mov al, 1

loc_403AB8:
	mov byte [byte_512DA8], al
	mov eax, esi
	call sub_423E10

loc_403AC4:
	mov ebx, [esp+4]
	test ebx, ebx
	jz loc_40399D
	mov eax, ebx
	add esp, 0Ch
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_403ADC:
	test di, di
	jnz loc_4039B5
	jmp loc_403A27

loc_403AEA:
	mov ecx, 1
	mov ebx, 4Dh
	mov edx, 16Bh
	jmp loc_403A13

loc_403AFE:
	cmp ax, 4D00h
	jz loc_403AA1

loc_403B04:
	movsx edx, dx
	mov eax, esi
	call sub_410414
	mov [esp+4], eax
	jmp loc_403AC4

loc_403B14:
	xor al, al
	jmp loc_403AB8
;sub_403970 endp

sub_403B20: ;SUBROUTINE
	push ecx
	mov ah, 1
	mov ch, byte [byte_512DA9]
	mov byte [byte_512DD9], ah
	mov byte [byte_512DD6], ah
	mov byte [byte_512DF3], ah
	mov byte [byte_512DF4], ah
	mov byte [byte_512DF2], ah
	mov byte [byte_512DD8], ah
	cmp ch, ah
	jnz loc_403BAD
	mov eax, dword [dword_512E34]
	call sub_403BE0
	mov byte [byte_512DD6], al
	mov eax, dword [dword_512E44]
	call sub_403BE0
	mov byte [byte_512DD8], al
	mov eax, dword [dword_512E4C]
	call sub_403BE0
	mov byte [byte_512DD9], al
	mov eax, dword [dword_512E38]
	call sub_403BE0
	mov byte [byte_512DF2], al
	mov eax, dword [dword_512E48]
	call sub_403BE0
	mov byte [byte_512DF3], al
	mov eax, dword [dword_512E50]
	call sub_403BE0
	mov byte [byte_512DF4], al
	pop ecx
	ret

loc_403BAD:
	mov eax, dword [dword_512E0C]
	call sub_403BE0
	mov byte [byte_512DD6], al
	mov eax, dword [dword_512E14]
	call sub_403BE0
	mov byte [byte_512DD8], al
	mov eax, dword [dword_512E18]
	call sub_403BE0
	mov byte [byte_512DD9], al
	pop ecx
	ret
;sub_403B20 endp

sub_403BE0: ;SUBROUTINE
	push ebx
	push edx
	mov edx, eax
	and edx, 0FFh
	cmp edx, 1
	jz loc_403BF7

loc_403BEF:
	mov eax, 1
	pop edx
	pop ebx
	ret

loc_403BF7:
	sar eax, 1Ch
	xor ebx, ebx
	xor edx, edx
	movsx eax, al
	call sub_421BD0
	test eax, eax
	jz loc_403BEF
	test byte [eax+8], 4
	jnz loc_403BEF
	xor eax, eax
	pop edx
	pop ebx
	ret
;sub_403BE0 endp

sub_403C20: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 84h
	mov [esp+64h], eax
	xor edx, edx
	call sub_410E80
	mov [esp+74h], edx
	mov edx, 1
	mov eax, 140h
	mov [esp+80h], edx
	mov edx, 0C8h
	call sub_4242C0

loc_403C56:
	call sub_405960
	test eax, eax
	jnz loc_403C56
	mov [esp+78h], eax
	xor esi, esi
	mov ebp, 0Ch

loc_403C6A:
	mov ebx, [esp+78h]
	mov edx, esi
	xor ecx, ecx
	shl ebx, 2

loc_403C75:
	mov word (dword_512ED4+2)[edx], 0FFh
	xor edi, edi
	mov [esp+ebx], ecx
	mov word (dword_512F1C+2)[edx], di
	mov edi, [esp+78h]
	mov [esp+ebx+30h], eax
	cmp ebp, edi
	jg loc_403DB7

loc_403C9A:
	inc ecx
	add edx, 2
	cmp ecx, 6
	jl loc_403C75
	inc eax
	add esi, 0Ch
	cmp eax, 2
	jl loc_403C6A
	mov eax, [esp+78h]
	shl eax, 2
	mov [esp+60h], eax
	mov [esp+70h], eax

loc_403CBB:
	cmp dword [esp+74h], 0
	jz loc_403DC4

loc_403CC6:
	xor ebp, ebp
	xor edi, edi

loc_403CCA:
	mov ebx, ebp
	xor esi, esi

loc_403CCE:
	mov edx, esi
	mov eax, edi
	call sub_477BA0
	mov edx, eax
	sar edx, 1Fh
	shl edx, 8
	sbb eax, edx
	sar eax, 8
	mov edx, dword dword_512ED4[ebx]
	lea ecx, [eax+eax*8]
	sar edx, 10h
	add edx, ecx
	mov dword [esp+7Ch], 0Ah
	mov eax, edx
	sar edx, 1Fh
	idiv dword [esp+7Ch]
	mov edx, dword dword_512F1C[ebx]
	sar edx, 10h
	mov word (dword_512EEC+2)[ebx], ax
	add edx, ecx
	mov ecx, 0Ah
	mov eax, edx
	sar edx, 1Fh
	idiv ecx
	add ebx, 2
	inc esi
	mov word dword_512F04[ebx], ax
	cmp esi, 6
	jl loc_403CCE
	inc edi
	add ebp, 0Ch
	cmp edi, 2
	jl loc_403CCA
	mov ebp, 0FFh
	xor eax, eax

loc_403D41:
	mov edx, dword off_4D206C[eax*4]
	mov edx, [edx]
	mov ecx, edx
	and ecx, ebp
	cmp ecx, 1
	jnz loc_403DA0
	mov ecx, edx
	sar ecx, 1Ch
	imul edi, ecx, 0Ch
	mov eax, edx
	mov esi, edx
	mov ebx, edx
	sar eax, 18h
	sar esi, 10h
	sar ebx, 8
	and eax, 0Fh
	and esi, ebp
	mov edx, eax
	and ebx, ebp
	shl edx, 10h
	add eax, eax
	shl ecx, 14h
	add eax, edi
	add edx, ecx
	cmp esi, ebx
	jge loc_403FAC
	mov ecx, dword dword_512F04[eax]
	sar ecx, 10h
	mov eax, dword dword_512F1C[eax]

loc_403D96:
	shl ecx, 8
	sar eax, 10h
	add edx, ecx
	add eax, edx

loc_403DA0:
	inc eax
	cmp eax, 0Ah
	jl loc_403D41
	mov eax, [esp+74h]
	add esp, 84h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_403DB7:
	inc edi
	add ebx, 4
	mov [esp+78h], edi
	jmp loc_403C9A

loc_403DC4:
	call sub_4833C7
	mov eax, [esp+64h]
	xor edx, edx
	call sub_40BBE0
	test eax, eax
	jz loc_403F82

loc_403DDC:
	call sub_40EB20
	call sub_428A20
	mov eax, [esp+64h]
	xor edx, edx
	xor ecx, ecx
	xor ebx, ebx
	mov [esp+80h], edx
	mov eax, [eax+4]
	mov edx, 400h
	call sub_405B30
	mov eax, dword [dword_4D2314+2]
	sar eax, 10h
	mov edx, 1000h
	mov eax, dword dword_4D231C[eax*4]
	xor ecx, ecx
	xor ebx, ebx
	mov eax, [eax+20h]
	call sub_405B60
	mov eax, [esp+64h]
	call sub_40FA90
	cmp dword [esp+78h], 0
	jle loc_403EB7
	mov ebp, [esp+60h]
	xor ebx, ebx

loc_403E3E:
	mov edi, [esp+ebx]
	mov esi, [esp+ebx+30h]
	mov edx, edi
	mov eax, esi
	call sub_477BA0
	mov edx, eax
	sar edx, 1Fh
	shl edx, 8
	sbb eax, edx
	sar eax, 8
	imul edx, esi, 0Ch
	mov ecx, eax
	lea eax, [edi+edi]
	add edx, eax
	mov eax, dword dword_512ED4[edx]
	sar eax, 10h
	cmp ecx, eax
	jge loc_403E84
	mov eax, ecx
	mov word (dword_512ED4+2)[edx], cx
	test ax, ax
	jl loc_403F93

loc_403E84:
	imul esi, 0Ch
	lea edx, [edi+edi]
	add edx, esi
	mov eax, dword dword_512F1C[edx]
	sar eax, 10h
	cmp ecx, eax
	jle loc_403EB0
	mov word (dword_512F1C+2)[edx], cx
	cmp cx, 100h
	jle loc_403EB0
	mov word (dword_512F1C+2)[edx], 100h

loc_403EB0:
	add ebx, 4
	cmp ebx, ebp
	jl loc_403E3E

loc_403EB7:
	cmp dword [esp+78h], 0
	jle loc_403F65
	mov ebp, 0F0h
	mov eax, [esp+70h]
	mov esi, 0F4h
	xor edi, edi
	mov [esp+68h], eax

loc_403ED6:
	mov ebx, 118h
	mov eax, [esp+edi+30h]
	mov edx, 3000h
	mov [esp+6Ch], eax
	mov eax, [esp+edi]
	mov ecx, ebp
	mov [esp+7Ch], eax
	mov eax, aCali ; "cali"
	call sub_405B30
	imul edx, [esp+6Ch], 0Ch
	mov eax, [esp+7Ch]
	add eax, eax
	add edx, eax
	mov ecx, esi
	mov eax, aCtab ; "ctab"
	mov ebx, dword dword_512ED4[edx]
	mov [esp+6Ch], edx
	sar ebx, 10h
	mov edx, 3000h
	add ebx, 145h
	call sub_405B30
	mov ebx, [esp+6Ch]
	add edi, 4
	mov edx, 3000h
	mov ebx, dword dword_512F1C[ebx]
	mov eax, aCtab ; "ctab"
	sar ebx, 10h
	mov ecx, esi
	add ebx, 145h
	add ebp, 2Dh
	call sub_405B30
	mov ebx, [esp+68h]
	add esi, 2Dh
	cmp edi, ebx
	jl loc_403ED6

loc_403F65:
	call sub_405C70

loc_403F6A:
	call sub_405960
	cmp ax, 1Bh
	jnz loc_403FA1

loc_403F75:
	mov dword [esp+74h], 0FFFFFFFFh
	jmp loc_403CC6

loc_403F82:
	cmp word [esp+80h], 0
	jnz loc_403DDC
	jmp loc_403F6A

loc_403F93:
	xor eax, eax
	mov word (dword_512ED4+2)[edx], ax
	jmp loc_403E84

loc_403FA1:
	cmp ax, 0Dh
	jz loc_403F75
	jmp loc_403CBB

loc_403FAC:
	mov ecx, dword dword_512EEC[eax]
	sar ecx, 10h
	mov eax, dword dword_512ED4[eax]
	jmp loc_403D96
;sub_403C20 endp

sub_403FC0: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 40h
	mov [esp+2Ch], eax
	mov [esp+34h], edx
	mov ebx, 1
	xor edx, edx
	mov eax, [esp+34h]
	mov [esp+38h], edx
	mov [esp+18h], edx
	mov [esp+20h], edx
	mov dl, [eax+9]
	mov [esp+28h], ebx
	cmp dl, 0Dh
	jz loc_404154

loc_403FF7:
	mov eax, [esp+18h]
	mov edx, [esp+34h]
	shl eax, 2
	mov edx, [edx+0Ch]
	add eax, edx
	mov edx, [eax]
	mov [esp+24h], edx
	mov dword [eax], 0
	mov edi, 1
	xor esi, esi

loc_40401A:
	mov edx, esi
	mov ecx, esi
	mov ebx, esi

loc_404020:
	cmp si, word (dword_512F34+2)[ecx]
	jz loc_404036
	mov eax, edx
	call sub_477B70
	test eax, eax
	jz loc_404036
	mov ebx, edi

loc_404036:
	inc edx
	add ecx, 2
	cmp edx, 2
	jl loc_404020
	test ebx, ebx
	jnz loc_40401A
	mov eax, dword_4E50A0
	mov ebp, 1
	mov [esp+3Ch], ebx
	mov [esp+1Ch], ebx
	mov [esp+30h], eax

loc_404059:
	mov eax, [esp+3Ch]
	cmp word (dword_512F34+2)[eax], 0
	jz loc_404111
	mov esi, [esp+3Ch]
	mov ebx, [esp+30h]
	xor eax, eax
	mov esi, dword byte_512F38[esi]
	xor edx, edx
	sar esi, 10h

loc_404080:
	mov edi, 1
	mov cl, al
	shl edi, cl
	test esi, edi
	jz loc_40416A
	lea ecx, [edx+ebx]

loc_404094:
	mov [esp+edx], ecx
	inc eax
	add edx, 4
	cmp eax, 6
	jl loc_404080
	push 0
	mov ebx, [esp+18h]
	mov esi, [esp+14h]
	push ebx
	mov edi, [esp+14h]
	mov eax, [esp+10h]
	push esi
	mov ecx, [esp+10h]
	xor edx, edx
	push edi
	mov ebx, [esp+10h]
	xor esi, esi
	push eax
	mov eax, [esp+30h]
	mov edi, [esp+50h]
	call sub_477C10
	xor ebx, ebx

loc_4040D1:
	mov cl, bl
	mov eax, dword byte_512F38[edi]
	mov edx, ebp
	sar eax, 10h
	shl edx, cl
	test eax, edx
	jz loc_404108
	mov ecx, [esp+esi]
	mov eax, [ecx]
	mov edx, eax
	sar edx, 1Fh
	shl edx, 8
	sbb eax, edx
	sar eax, 8
	mov [ecx], eax
	mov eax, [esp+esi]
	mov edx, [eax]
	test edx, edx
	jl loc_404171
	mov eax, edx

loc_404103:
	mov edx, [esp+esi]
	mov [edx], eax

loc_404108:
	inc ebx
	add esi, 4
	cmp ebx, 6
	jl loc_4040D1

loc_404111:
	mov ebx, [esp+3Ch]
	mov esi, [esp+1Ch]
	mov ecx, [esp+30h]
	add ebx, 2
	inc esi
	add ecx, 18h
	mov [esp+3Ch], ebx
	mov [esp+1Ch], esi
	mov [esp+30h], ecx
	cmp esi, 2
	jl loc_404059
	mov ecx, 1Ch
	xor edx, edx

loc_404140:
	mov eax, ecx
	call sub_486550
	test eax, eax
	jz loc_404175

loc_40414B:
	mov eax, edx
	call sub_403550
	jmp loc_404140

loc_404154:
	cmp byte [byte_512DA8], 0
	jz loc_403FF7
	mov [esp+18h], ebx
	jmp loc_403FF7

loc_40416A:
	xor ecx, ecx
	jmp loc_404094

loc_404171:
	xor eax, eax
	jmp loc_404103

loc_404175:
	call sub_424240
	test eax, eax
	jnz loc_40414B
	mov esi, [esp+18h]
	shl esi, 2
	mov ebp, 135h
	xor edi, edi

loc_40418C:
	cmp edi, [esp+28h]
	jnz loc_40419F
	mov eax, [esp+20h]
	add esp, 40h
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_40419F:
	call sub_428A20
	mov eax, [esp+2Ch]
	mov edx, 400h
	mov ecx, edi
	mov ebx, edi
	mov eax, [eax+4]
	call sub_405B30
	mov eax, dword [dword_4D2314+2]
	sar eax, 10h
	mov edx, 1000h
	mov eax, dword dword_4D231C[eax*4]
	mov ecx, edi
	mov ebx, edi
	mov eax, [eax+20h]
	call sub_405B60
	mov eax, [esp+2Ch]
	call sub_40FA90
	mov eax, [esp+34h]
	mov eax, [eax]
	sar eax, 10h
	call sub_41B670
	mov eax, 120h
	call sub_41B710
	call sub_482424
	mov eax, [esp+34h]
	cmp byte [eax+9], 0Dh
	jnz loc_4042D1
	mov ecx, 1
	mov ebx, 4Dh
	mov edx, 16Bh

loc_40421C:
	mov eax, ebp
	call sub_405580
	call sub_405C70
	mov eax, edi
	call sub_403550
	call sub_482030
	mov edx, eax
	sar edx, 10h
	cmp edx, 3Bh
	jge loc_404304

loc_404247:
	cmp edx, 0FFFFFFFFh
	jz loc_40426C
	and eax, 0FFFFh
	cmp eax, 1Bh
	jnz loc_404312
	mov eax, [esp+34h]
	mov eax, [eax+0Ch]
	mov edx, [esp+24h]
	mov [esp+28h], edi
	mov [esi+eax], edx

loc_40426C:
	cmp edi, [esp+38h]
	jnz loc_40427B
	call sub_404360
	mov [esp+38h], eax

loc_40427B:
	mov ecx, [esp+38h]
	cmp edi, ecx
	jz loc_40418C
	mov edx, 7Fh
	xor eax, eax
	call sub_4423F0
	mov edx, [esp+2Ch]
	mov eax, ecx
	call sub_404590
	mov edx, [esp+18h]
	mov eax, [esp+34h]
	shl edx, 2
	mov eax, [eax+0Ch]
	add eax, edx
	mov [eax], ecx
	call sub_404540
	test eax, eax
	jnz loc_40433E
	or byte [byte_4D3468], 1
	mov eax, [esp+20h]
	add esp, 40h
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_4042D1:
	mov eax, ebp
	call sub_41B650
	movsx ebx, ax
	mov eax, ebp
	call sub_41B710
	call sub_482424
	mov edx, eax
	sar edx, 1Fh
	sub eax, edx
	sar eax, 1
	mov edx, 19Ah
	sub edx, eax
	mov ecx, 1
	movsx edx, dx
	jmp loc_40421C

loc_404304:
	cmp edx, 44h
	jg loc_404247
	jmp loc_40426C

loc_404312:
	test eax, eax
	jz loc_40426C
	cmp eax, 0Dh
	jz loc_40426C
	call toupper_
	shl eax, 10h
	add edx, eax
	shl edx, 8
	xor dl, dl
	add edx, 4
	mov [esp+38h], edx
	jmp loc_40426C

loc_40433E:
	and byte [byte_4D3468], 0FEh
	mov eax, [esp+20h]
	add esp, 40h
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_403FC0 endp

sub_404360: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 20h
	xor esi, esi
	mov [esp+18h], esi
	mov [esp+0Ch], esi
	mov [esp], esi
	mov [esp+4], esi
	mov [esp+8], esi
	mov [esp+10h], esi

loc_404382:
	mov eax, [esp]
	cmp word (dword_512F34+2)[eax], 0
	jnz loc_4043E2

loc_40438F:
	mov ecx, [esp]
	mov ebx, [esp+6]
	mov edi, [esp+10h]
	mov ebp, [esp+18h]
	mov ah, [esp+0Fh]
	add ecx, 2
	add ebx, 10h
	add edi, 18h
	inc ebp
	inc ah
	mov [esp], ecx
	mov [esp+6], bx
	mov [esp+10h], edi
	mov ebx, [esp+8]
	mov [esp+18h], ebp
	add ebx, 0Ch
	mov [esp+0Fh], ah
	mov [esp+8], ebx
	cmp ebp, 2
	jge loc_4043D6
	test esi, esi
	jz loc_404382

loc_4043D6:
	mov eax, esi
	add esp, 20h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4043E2:
	mov eax, [esp+18h]
	call sub_477B70
	mov ebp, eax
	test eax, eax
	jz loc_404443
	mov edi, [esp]
	mov edx, [esp+0Ch]
	mov ecx, 1
	xor eax, eax

loc_4043FF:
	mov ebx, dword dword_512F34[edi]
	sar ebx, 10h
	cmp eax, ebx
	jl loc_404424

loc_40440C:
	xor edx, edx

loc_40440E:
	mov eax, [esp+18h]
	call sub_477B70
	test eax, eax
	jz loc_404443
	mov eax, edx
	call sub_483EB0
	jmp loc_40440E

loc_404424:
	test esi, esi
	jnz loc_40440C
	test ebp, ecx
	jz loc_40443F
	mov esi, edx
	and si, 0FF00h
	add esi, 2

loc_404436:
	inc eax
	add edx, 100h
	jmp loc_4043FF

loc_40443F:
	add ecx, ecx
	jmp loc_404436

loc_404443:
	mov edx, 1
	xor ebp, ebp
	mov [esp+1Ch], edx
	test esi, esi
	jnz loc_40438F
	mov eax, [esp]
	mov ebx, [esp+8]
	mov ecx, [esp+4]
	mov edi, [esp+10h]
	mov [esp+14h], eax

loc_404469:
	mov eax, [esp+14h]
	mov eax, dword byte_512F38[eax]
	sar eax, 10h
	mov edx, [esp+1Ch]
	test eax, edx
	jnz loc_40449D

loc_40447E:
	add ecx, 10000h
	add edi, 4
	inc ebp
	add ebx, 2
	cmp ebp, 6
	jge loc_40438F
	test esi, esi
	jz loc_404469
	jmp loc_40438F

loc_40449D:
	mov eax, [esp+18h]
	mov edx, ebp
	call sub_477BA0
	mov edx, eax
	sar edx, 1Fh
	shl edx, 8
	sbb eax, edx
	sar eax, 8
	test eax, eax
	jl loc_4044E5

loc_4044B9:
	mov edx, dword dword_4E50A0[edi]
	sub eax, edx
	cmp eax, 40h
	jle loc_404505
	cmp edx, 40h
	jge loc_4044E9
	lea eax, [ecx+14ECh]

loc_4044D1:
	shl eax, 8
	xor al, al
	lea esi, [eax+1]

loc_4044D9:
	mov edx, [esp+1Ch]
	add edx, edx
	mov [esp+1Ch], edx
	jmp loc_40447E

loc_4044E5:
	xor eax, eax
	jmp loc_4044B9

loc_4044E9:
	mov eax, dword dword_512F04[ebx]
	sar eax, 10h
	shl eax, 8
	lea edx, [ecx+eax]
	mov eax, dword dword_512F1C[ebx]
	sar eax, 10h
	add eax, edx
	jmp loc_4044D1

loc_404505:
	cmp eax, 0FFFFFFC0h
	jge loc_4044D9
	cmp edx, 0C0h
	jle loc_40451A
	lea eax, [ecx+0EC14h]
	jmp loc_4044D1

loc_40451A:
	mov eax, dword dword_512EEC[ebx]
	sar eax, 10h
	shl eax, 8
	lea edx, [ecx+eax]
	mov eax, dword dword_512ED4[ebx]
	sar eax, 10h
	add eax, edx
	jmp loc_4044D1
;sub_404360 endp

sub_404540: ;SUBROUTINE
	push edx
	cmp byte [byte_512DA9], 1
	jnz loc_40456A
	xor eax, eax

loc_40454C:
	mov edx, dword off_4D201C[eax]
	cmp dword [edx], 0
	jz loc_404566
	add eax, 4
	cmp eax, 50h
	jl loc_40454C
	mov eax, 1
	pop edx
	ret

loc_404566:
	xor eax, eax
	pop edx
	ret

loc_40456A:
	xor eax, eax

loc_40456C:
	mov edx, dword off_4D206C[eax]
	cmp dword [edx], 0
	jz loc_404566
	add eax, 4
	cmp eax, 28h
	jl loc_40456C
	mov eax, 1
	pop edx
	ret
;sub_404540 endp

sub_404590: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 10h
	mov ecx, eax
	test eax, eax
	jz loc_4045DE
	mov edx, eax
	and edx, 0FFh
	cmp edx, 3
	jnz loc_40460B
	mov bh, byte [byte_512DA9]
	and ecx, 0FFFFFFh
	cmp bh, 1
	jnz loc_4045E7
	xor eax, eax

loc_4045BE:
	mov edx, dword off_4D201C[eax]
	mov ebx, [edx]
	and ebx, 0FFFFFFh
	cmp ebx, ecx
	jnz loc_4045D6
	mov dword [edx], 0

loc_4045D6:
	add eax, 4
	cmp eax, 50h
	jnz loc_4045BE

loc_4045DE:
	add esp, 10h
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_4045E7:
	xor eax, eax

loc_4045E9:
	mov edx, dword off_4D206C[eax]
	mov ebx, [edx]
	and ebx, 0FFFFFFh
	cmp ebx, ecx
	jnz loc_404601
	mov dword [edx], 0

loc_404601:
	add eax, 4
	cmp eax, 28h
	jz loc_4045DE
	jmp loc_4045E9

loc_40460B:
	mov bl, byte [byte_512DA9]
	mov esi, ecx
	mov edi, ecx
	and eax, 0FF0000FFh
	and esi, 0FF0000h
	and edi, 0FF00h
	cmp bl, 1
	jnz loc_4046B4
	mov [esp+4], edx
	mov [esp+0Ch], eax
	xor edx, edx

loc_404639:
	mov eax, dword off_4D201C[edx]
	mov ebx, [eax]
	cmp ecx, ebx
	jnz loc_404655

loc_404645:
	mov dword [eax], 0

loc_40464B:
	add edx, 4
	cmp edx, 50h
	jz loc_4045DE
	jmp loc_404639

loc_404655:
	mov ebp, [esp+0Ch]
	and ebx, 0FF0000FFh
	cmp ebx, ebp
	jnz loc_40464B
	cmp dword [esp+4], 1
	jnz loc_40464B
	mov ebx, [eax]
	and ebx, 0FF0000h
	cmp ebx, esi
	jz loc_404681
	mov eax, [eax]
	and eax, 0FF00h
	cmp eax, edi
	jnz loc_404689

loc_404681:
	mov eax, dword off_4D201C[edx]
	jmp loc_404645

loc_404689:
	mov ebp, esi
	sar ebp, 8
	and ebp, 0FF00h
	cmp eax, ebp
	jz loc_404681
	mov eax, edi
	shl eax, 8
	and eax, 0FF0000h
	cmp ebx, eax
	jz loc_404681
	add edx, 4
	cmp edx, 50h
	jz loc_4045DE
	jmp loc_404639

loc_4046B4:
	mov [esp], edx
	mov [esp+8], eax
	xor edx, edx

loc_4046BD:
	mov eax, dword off_4D206C[edx]
	mov ebx, [eax]
	cmp ecx, ebx
	jnz loc_4046DD

loc_4046C9:
	mov dword [eax], 0

loc_4046CF:
	add edx, 4
	cmp edx, 28h
	jz loc_4045DE
	jmp loc_4046BD

loc_4046DD:
	mov ebp, [esp+8]
	and ebx, 0FF0000FFh
	cmp ebx, ebp
	jnz loc_4046CF
	cmp dword [esp], 1
	jnz loc_4046CF
	mov ebx, [eax]
	and ebx, 0FF0000h
	cmp ebx, esi
	jz loc_404708
	mov eax, [eax]
	and eax, 0FF00h
	cmp eax, edi
	jnz loc_404710

loc_404708:
	mov eax, dword off_4D206C[edx]
	jmp loc_4046C9

loc_404710:
	mov ebp, esi
	sar ebp, 8
	and ebp, 0FF00h
	cmp eax, ebp
	jz loc_404708
	mov eax, edi
	shl eax, 8
	and eax, 0FF0000h
	cmp ebx, eax
	jz loc_404708
	add edx, 4
	cmp edx, 28h
	jz loc_4045DE
	jmp loc_4046BD
;sub_404590 endp

sub_404740: ;SUBROUTINE
	push esi
	push edi
	push ebp
	mov ebp, esp
	sub esp, 0ACh
	and esp, 0FFFFFFF8h
	mov [esp+78h], eax
	mov esi, edx
	mov [esp+8Ch], ebx
	mov eax, [eax]
	sar eax, 10h
	call sub_41B6F0
	mov [esp+90h], eax
	test ecx, ecx
	jnz loc_40497E
	mov eax, [esp+78h]
	mov eax, [eax]
	sar eax, 10h
	call sub_41B6D0
	mov [esp+6Ch], eax
	mov [esp+68h], eax

loc_40478A:
	cmp dword [esp+90h], 12h
	jnz loc_4049C4
	mov eax, 0Ah
	mov edi, 50h
	mov [esp], eax
	mov [esp+4], edi

loc_4047A9:
	cmp byte [byte_512DFB], 5
	jz loc_4049DA

loc_4047B6:
	lea eax, [esi+8Ah]
	xor edx, edx
	xor edi, edi
	mov [esp+74h], eax
	mov [esp+88h], edx

loc_4047CB:
	mov eax, [esp+78h]
	mov ecx, [esp+4]
	mov eax, [eax+0Ch]
	add ecx, esi
	mov eax, [edi+eax]
	mov [esp+0A4h], ecx
	mov edx, eax
	mov ecx, eax
	and edx, 0FFh
	sar ecx, 8
	sar eax, 18h
	mov [esp+84h], ecx
	mov [esp+7Ch], eax
	cmp edx, 2
	jnb loc_404A2B
	cmp edx, 1
	jnz loc_404BE1
	mov eax, [esp+edi+66h]
	sar eax, 10h
	push eax
	mov eax, [esp+92h]
	sar eax, 10h
	movsx edx, si
	mov [esp+9Ch], eax
	mov eax, [esp+8Eh]
	push 3
	sar eax, 10h
	mov ecx, [esp+0A0h]
	mov [esp+9Ch], eax
	mov eax, 121h
	mov ebx, [esp+9Ch]
	call sub_41B710
	call sub_4054E0
	mov eax, 121h
	mov edx, [esp]
	call sub_41B710
	call sub_482424
	add eax, esi
	add edx, eax
	mov [esp+80h], edx
	mov eax, [esp+84h]
	sar eax, 14h
	inc eax
	push eax
	push aD_4 ; "%d"
	lea eax, [esp+10h]
	push eax
	call sprintf_
	add esp, 0Ch
	mov eax, [esp+edi+66h]
	sar eax, 10h
	mov edx, [esp+7Eh]
	push eax
	mov ecx, [esp+9Ch]
	mov ebx, [esp+98h]
	push 3
	sar edx, 10h
	lea eax, [esp+10h]
	call sub_4054E0
	mov eax, [esp+edi+66h]
	sar eax, 10h
	mov esi, [esp+0A4h]
	push eax
	mov ecx, [esp+9Ch]
	mov ebx, [esp+98h]
	push 3
	mov eax, 123h
	movsx edx, si
	call sub_41B710
	call sub_4054E0
	mov eax, 123h
	mov ebx, [esp]
	call sub_41B710
	call sub_482424
	add eax, ebx
	add esi, eax
	mov eax, [esp+7Ch]
	and eax, 0Fh
	push eax
	push aD_4 ; "%d"
	lea eax, [esp+10h]
	push eax
	call sprintf_
	add esp, 0Ch
	mov eax, [esp+edi+66h]
	sar eax, 10h
	push eax
	movsx edx, si
	mov ecx, [esp+9Ch]
	push 3
	mov ebx, [esp+9Ch]

loc_40493A:
	lea eax, [esp+10h]

loc_40493E:
	call sub_4054E0
	mov eax, [esp+78h]
	cmp byte [eax+9], 0Dh
	jnz loc_404C11
	mov eax, [esp+88h]
	inc eax
	add edi, 4
	mov [esp+88h], eax
	cmp eax, 2
	jge loc_404C11
	cmp eax, 1
	jnz loc_4047CB
	mov esi, [esp+74h]
	jmp loc_4047CB

loc_40497E:
	mov eax, [esp+78h]
	mov eax, [eax]
	sar eax, 10h
	call sub_41B6B0
	mov [esp+6Ch], eax
	mov [esp+68h], eax
	mov eax, [esp+78h]
	cmp byte [eax+9], 0Dh
	jnz loc_40478A
	mov eax, [eax]
	mov ecx, 1
	sar eax, 10h
	xor edx, edx
	call sub_41B6D0
	mov dl, byte [byte_512DA8]
	sub ecx, edx
	mov [esp+ecx*4+68h], eax
	jmp loc_40478A

loc_4049C4:
	mov ebx, 6
	mov ecx, 42h
	mov [esp], ebx
	mov [esp+4], ecx
	jmp loc_4047A9

loc_4049DA:
	mov eax, [esp+4]
	mov [esp+0A8h], eax
	fild dword [esp+0A8h]
	mov eax, [esp]
	fld st0
	mov [esp+0A8h], eax
	fmul qword [dbl_4C8114]
	fild dword [esp+0A8h]
	fld st0
	fmul qword [dbl_4C811C]
	fxch st2
	fstp st3
	fxch st2
	call __CHP
	fistp dword [esp+4]
	fstp st1
	call __CHP
	fistp dword [esp]
	jmp loc_4047B6

loc_404A2B:
	jbe loc_404AB4
	cmp edx, 4
	jnz loc_404BE1
	mov eax, [esp+edi+66h]
	sar eax, 10h
	push eax
	mov eax, [esp+92h]
	sar eax, 10h
	movsx edx, si
	mov [esp+74h], eax
	mov eax, [esp+8Eh]
	push 3
	sar eax, 10h
	mov ecx, [esp+78h]
	mov [esp+0B0h], eax
	mov eax, 120h
	mov ebx, [esp+0B0h]
	call sub_41B710
	call sub_4054E0
	lea edx, [esp+8]
	mov eax, [esp+84h]
	call sub_404C20
	mov eax, [esp+edi+66h]
	sar eax, 10h
	mov esi, [esp+0A4h]
	push eax
	mov ecx, [esp+74h]
	mov ebx, [esp+0ACh]
	push 3
	movsx edx, si
	jmp loc_40493A

loc_404AB4:
	mov eax, [esp+edi+66h]
	sar eax, 10h
	push eax
	mov eax, [esp+92h]
	sar eax, 10h
	movsx edx, si
	mov [esp+0A0h], eax
	mov eax, [esp+8Eh]
	push 3
	sar eax, 10h
	mov ecx, [esp+0A4h]
	mov [esp+0A8h], eax
	mov eax, 121h
	mov ebx, [esp+0A8h]
	call sub_41B710
	call sub_4054E0
	mov eax, 121h
	mov edx, [esp]
	call sub_41B710
	call sub_482424
	add eax, esi
	add edx, eax
	mov [esp+80h], edx
	mov eax, [esp+7Ch]
	inc eax
	push eax
	push aD_4 ; "%d"
	lea eax, [esp+10h]
	push eax
	call sprintf_
	add esp, 0Ch
	mov eax, [esp+edi+66h]
	sar eax, 10h
	mov edx, [esp+7Eh]
	push eax
	mov ecx, [esp+0A0h]
	mov ebx, [esp+0A4h]
	push 3
	sar edx, 10h
	lea eax, [esp+10h]
	call sub_4054E0
	mov eax, [esp+edi+66h]
	sar eax, 10h
	mov esi, [esp+0A4h]
	push eax
	mov ecx, [esp+0A0h]
	mov ebx, [esp+0A4h]
	push 3
	mov eax, 122h
	movsx edx, si
	call sub_41B710
	call sub_4054E0
	mov eax, 122h
	mov ecx, [esp]
	call sub_41B710
	call sub_482424
	add eax, ecx
	add esi, eax
	mov eax, [esp+84h]
	add eax, 41h
	push eax
	push aC_0 ; "%c"
	lea eax, [esp+10h]
	push eax
	call sprintf_
	add esp, 0Ch
	mov eax, [esp+edi+66h]
	sar eax, 10h
	push eax
	movsx edx, si
	mov ecx, [esp+0A0h]
	push 3
	mov ebx, [esp+0A8h]
	jmp loc_40493A

loc_404BE1:
	mov ecx, [esp+8Eh]
	mov eax, [esp+edi+66h]
	mov ebx, [esp+8Ah]
	sar eax, 10h
	movsx edx, si
	push eax
	sar ecx, 10h
	push 3
	mov eax, 136h
	sar ebx, 10h
	call sub_41B710
	jmp loc_40493E

loc_404C11:
	mov esp, ebp
	pop ebp
	pop edi
	pop esi
	ret
;sub_404740 endp

sub_404C20: ;SUBROUTINE
	push ecx
	mov ecx, eax
	and eax, 0FFFFh
	cmp eax, 39h
	jnz loc_404C5B
	mov eax, 124h

loc_404C32:
	push edi
	push esi
	call sub_41B710
	mov esi, eax
	mov edi, edx
	push edi

loc_404C3E:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_404C56
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_404C3E

loc_404C56:
	pop edi
	pop esi
	pop edi
	pop ecx
	ret

loc_404C5B:
	cmp eax, 1Ch
	jnz loc_404C67
	mov eax, 125h
	jmp loc_404C32

loc_404C67:
	cmp eax, 52h
	jnz loc_404C73
	mov eax, 126h
	jmp loc_404C32

loc_404C73:
	cmp eax, 53h
	jnz loc_404C7F
	mov eax, 127h
	jmp loc_404C32

loc_404C7F:
	cmp eax, 47h
	jnz loc_404C8B
	mov eax, 128h
	jmp loc_404C32

loc_404C8B:
	cmp eax, 4Fh
	jnz loc_404C97
	mov eax, 129h
	jmp loc_404C32

loc_404C97:
	cmp eax, 49h
	jnz loc_404CA3
	mov eax, 12Ah
	jmp loc_404C32

loc_404CA3:
	cmp eax, 51h
	jnz loc_404CAF
	mov eax, 12Bh
	jmp loc_404C32

loc_404CAF:
	cmp eax, 48h
	jnz loc_404CBE
	mov eax, 12Ch
	jmp loc_404C32

loc_404CBE:
	cmp eax, 50h
	jnz loc_404CCD
	mov eax, 12Dh
	jmp loc_404C32

loc_404CCD:
	cmp eax, 4Bh
	jnz loc_404CDC
	mov eax, 12Eh
	jmp loc_404C32

loc_404CDC:
	cmp eax, 4Dh
	jnz loc_404CEB
	mov eax, 12Fh
	jmp loc_404C32

loc_404CEB:
	cmp eax, 0Eh
	jnz loc_404CFA
	mov eax, 130h
	jmp loc_404C32

loc_404CFA:
	cmp eax, 0Fh
	jnz loc_404D09
	mov eax, 131h
	jmp loc_404C32

loc_404D09:
	cmp eax, 4Ch
	jnz loc_404D18
	mov eax, 132h
	jmp loc_404C32

loc_404D18:
	mov eax, ecx
	sar eax, 10h
	call toupper_
	push eax
	push aC_0 ; "%c"
	push edx
	call sprintf_
	add esp, 0Ch
	pop ecx
	ret
;sub_404C20 endp

sub_404D40: ;SUBROUTINE
	and eax, 0FFh
	ret
;sub_404D40 endp

sub_404D50: ;SUBROUTINE
	shl edx, 8
	movsx eax, al
	xor dl, dl
	add eax, edx
	ret
;sub_404D50 endp

sub_404D60: ;SUBROUTINE
	cmp word [word_4D231A], 0
	jnz loc_404D6D
	xor eax, eax
	ret

loc_404D6D:
	call sub_405A60
	test eax, eax
	jnz loc_404D84
	mov eax, 1
	call sub_486550
	test eax, eax
	jz loc_404D8A

loc_404D84:
	mov eax, 1
	ret

loc_404D8A:
	mov eax, 39h
	call sub_486550
	test eax, eax
	jnz loc_404D84
	mov eax, 1Ch
	call sub_486550
	test eax, eax
	jnz loc_404D84
	mov eax, 48h
	call sub_486550
	test eax, eax
	jnz loc_404D84
	mov eax, 50h
	call sub_486550
	test eax, eax
	jnz loc_404D84
	mov eax, 4Bh
	call sub_486550
	test eax, eax
	jnz loc_404D84
	mov eax, 4Dh
	call sub_486550
	test eax, eax
	jnz loc_404D84
	cmp dword [dword_4D4C88], 0
	jnz loc_404D84
	ret
;sub_404D60 endp

off_404DF0: dd loc_404EF1
	dd loc_404EFF ; jump table for switch statement
	dd loc_404F1D
	dd loc_404F53
off_404E00: dd loc_404EB4
	dd loc_404FD8
	dd loc_405018
	dd loc_405056
	dd loc_405095
	dd loc_4050CC
	dd loc_4050FA
	dd loc_40512F
	dd loc_404EDA
	dd loc_40518A
	dd loc_40515C
	dd loc_4051B7
	dd loc_4051E5
	dd loc_405221
	dd loc_405263
	dd loc_4052A3
	dd loc_4052E5

sub_404E44: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	mov ebp, eax
	test eax, eax
	jz loc_404EE3
	mov ah, byte [byte_512DA9]
	test ah, ah
	jz loc_404E67
	cmp ah, 1
	jnz loc_404EE3

loc_404E67:
	cmp byte [byte_512DAA], 0
	jnz loc_404EE3
	mov eax, ebp
	call toupper_
	mov edx, dword [dword_4D219C]
	mov ebp, eax
	cmp edx, 3 ; switch 4 cases
	jbe loc_404EEA

loc_404E88:
	mov esi, dword_4E50D0 ; jumptable 00404EEA default case
	xor ecx, ecx

loc_404E8F:
	lea edi, 0[ecx*4]
	mov edx, esi
	mov eax, ebp
	mov ebx, dword off_4D2158[edi]
	call sub_405320
	test eax, eax
	jz loc_404EDA
	cmp ecx, 10h
	ja loc_404EDA
	jmp off_404E00[edi]

loc_404EB4:
	mov edx, 7Fh
	mov eax, 5
	call sub_4423F0
	cmp byte [byte_512DBD], 3
	jnb loc_404EDA
	mov byte [byte_512DBD], 3
	mov byte [byte_512DBF], 0Eh

loc_404EDA:
	inc ecx
	add esi, 4
	cmp ecx, 11h
	jl loc_404E8F

loc_404EE3:
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_404EEA:
	jmp off_404DF0[edx*4] ; switch jump

loc_404EF1:
	cmp eax, 47h ; jumptable 00404EEA case 0
	jnz loc_404E88 ; jumptable 00404EEA default case
	inc edx
	mov dword [dword_4D219C], edx
	jmp loc_404E88 ; jumptable 00404EEA default case

loc_404EFF:
	cmp eax, 4Fh ; jumptable 00404EEA case 1
	jnz loc_404F10
	inc edx
	mov dword [dword_4D219C], edx
	jmp loc_404E88 ; jumptable 00404EEA default case

loc_404F10:
	xor ecx, ecx
	mov dword [dword_4D219C], ecx
	jmp loc_404E88 ; jumptable 00404EEA default case

loc_404F1D:
	cmp eax, 30h ; jumptable 00404EEA case 2
	jl loc_404F46
	cmp eax, 39h
	jg loc_404F46
	lea ecx, [eax-30h]
	lea eax, 0[ecx*4]
	add eax, ecx
	inc edx
	add eax, eax
	mov dword [dword_4D219C], edx
	mov dword [dword_4D21A0], eax
	jmp loc_404E88 ; jumptable 00404EEA default case

loc_404F46:
	xor edx, edx
	mov dword [dword_4D219C], edx
	jmp loc_404E88 ; jumptable 00404EEA default case

loc_404F53:
	cmp eax, 30h ; jumptable 00404EEA case 3
	jl loc_404F9B
	cmp eax, 39h
	jg loc_404F9B
	mov edx, dword [dword_4D21A0]
	sub eax, 30h
	add edx, eax
	mov dword [dword_4D21A0], edx
	cmp edx, 16h
	jnz loc_404FA7

loc_404F73:
	mov dword [dword_4D21A0], 14h

loc_404F7D:
	mov edx, 7Fh
	mov eax, 5
	call sub_4423F0
	mov al, byte [dword_4D21A0]
	mov byte [byte_4D1FE8], al
	mov byte [byte_4D1FE9], al

loc_404F9B:
	xor eax, eax
	mov dword [dword_4D219C], eax
	jmp loc_404E88 ; jumptable 00404EEA default case

loc_404FA7:
	cmp edx, 18h
	jz loc_404F73
	cmp edx, 19h
	jz loc_404F73
	cmp edx, 1Dh
	jz loc_404F73
	cmp edx, 1Eh
	jz loc_404F73
	cmp edx, 20h
	jz loc_404F73
	cmp edx, 12h
	jz loc_404F73
	jl loc_404F9B
	cmp edx, 33h
	jle loc_404F7D
	xor eax, eax
	mov dword [dword_4D219C], eax
	jmp loc_404E88 ; jumptable 00404EEA default case

loc_404FD8:
	mov edx, 7Fh
	mov eax, 5
	call sub_4423F0
	cmp byte [byte_512DBD], 2
	jnb loc_404EDA
	mov dl, 0Dh
	mov ah, 2
	mov byte [byte_512DBF], dl
	mov byte [byte_512DBD], ah
	inc ecx
	add esi, 4
	cmp ecx, 11h
	jl loc_404E8F
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_405018:
	mov edx, 7Fh
	mov eax, 5
	call sub_4423F0
	cmp byte [byte_512DBD], 1
	jnb loc_404EDA
	mov byte [byte_512DBD], 1
	mov byte [byte_512DBF], 0Ch
	inc ecx
	add esi, 4
	cmp ecx, 11h
	jl loc_404E8F
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_405056:
	mov edx, 7Fh
	mov eax, 5
	call sub_4423F0
	mov ah, byte [byte_512DBC]
	mov dl, 7
	or ah, 1
	mov byte [byte_512DB0], dl
	mov byte [byte_512DBC], ah
	call sub_40EB20
	inc ecx
	add esi, 4
	cmp ecx, 11h
	jl loc_404E8F
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_405095:
	mov edx, 7Fh
	mov eax, 5
	call sub_4423F0
	mov eax, 34Eh
	call sub_402CD0
	mov dword [dword_4E5508], 1
	inc ecx
	add esi, 4
	cmp ecx, 11h
	jl loc_404E8F
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4050CC:
	mov edx, 7Fh
	mov eax, 5
	mov edi, 1
	call sub_4423F0
	mov dword [dword_4E5514], edi
	inc ecx
	add esi, 4
	cmp ecx, 11h
	jl loc_404E8F
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4050FA:
	mov edx, 7Fh
	mov eax, 5
	mov ebx, 1
	call sub_4423F0
	mov al, 1
	mov dword [dword_4D209C], ebx
	mov byte [byte_512DBE], al
	inc ecx
	add esi, 4
	cmp ecx, 11h
	jl loc_404E8F
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_40512F:
	mov edx, 7Fh
	mov eax, 5
	call sub_4423F0
	mov dword [dword_4E550C], 1
	inc ecx
	add esi, 4
	cmp ecx, 11h
	jl loc_404E8F
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_40515C:
	mov edx, 7Fh
	mov eax, 5
	mov edi, 1
	call sub_4423F0
	mov dword [dword_4E5504], edi
	inc ecx
	add esi, 4
	cmp ecx, 11h
	jl loc_404E8F
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_40518A:
	mov edx, 7Fh
	mov eax, 5
	call sub_4423F0
	mov dword [dword_4E5500], 1
	inc ecx
	add esi, 4
	cmp ecx, 11h
	jl loc_404E8F
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4051B7:
	mov edx, 7Fh
	mov eax, 5
	mov ebx, 1
	call sub_4423F0
	mov dword [dword_4E54F8], ebx
	inc ecx
	add esi, 4
	cmp ecx, 11h
	jl loc_404E8F
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4051E5:
	mov edx, 7Fh
	mov eax, 5
	mov bl, 2Bh
	call sub_4423F0
	mov edx, 1
	mov byte [byte_4D1FE8], bl
	mov byte [byte_4D1FE9], bl
	mov dword [dword_4E54F8], edx
	inc ecx
	add esi, 4
	cmp ecx, 11h
	jl loc_404E8F
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_405221:
	mov edx, 7Fh
	mov eax, 5
	mov edi, 1
	call sub_4423F0
	mov dl, 2Ah
	mov dword [dword_4E5508], edi
	mov dword [dword_4E54F8], edi
	mov byte [byte_4D1FE8], dl
	mov byte [byte_4D1FE9], dl
	inc ecx
	add esi, 4
	cmp ecx, 11h
	jl loc_404E8F
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_405263:
	mov edx, 7Fh
	mov eax, 5
	call sub_4423F0
	mov edx, 1
	mov al, 14h
	mov dword [dword_4E5508], edx
	mov byte [byte_4D1FE8], al
	mov byte [byte_4D1FE9], al
	mov dword [dword_4E54F8], edx
	inc ecx
	add esi, 4
	cmp ecx, 11h
	jl loc_404E8F
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4052A3:
	mov edx, 7Fh
	mov eax, 5
	mov edi, 1
	mov bl, 23h
	call sub_4423F0
	mov dword [dword_4E5508], edi
	mov byte [byte_4D1FE8], bl
	mov byte [byte_4D1FE9], bl
	mov dword [dword_4E54F8], edi
	inc ecx
	add esi, 4
	cmp ecx, 11h
	jl loc_404E8F
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4052E5:
	mov edx, 7Fh
	mov eax, 5
	mov ebx, 1
	call sub_4423F0
	mov dword [dword_4E54FC], ebx
	inc ecx
	add esi, 4
	cmp ecx, 11h
	jl loc_404E8F
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_404E44 endp

sub_405320: ;SUBROUTINE
	push ecx
	call toupper_
	lea ecx, [eax+9]
	mov eax, [edx]
	mov al, [ebx+eax]
	and eax, 0FFh
	cmp ecx, eax
	jnz loc_40534A
	mov ecx, [edx]
	inc ecx
	add ebx, ecx
	mov [edx], ecx
	cmp byte [ebx], 0
	jnz loc_405350
	mov eax, 1
	pop ecx
	ret

loc_40534A:
	mov dword [edx], 0

loc_405350:
	xor eax, eax
	pop ecx
	ret
;sub_405320 endp

sub_4053A0: ;SUBROUTINE
	push esi
	push edi
	push ebp
	sub esp, 14h
	mov ebp, eax
	mov [esp+0Ch], dx
	mov [esp+8], bx
	movsx eax, cx
	call sub_4056F0
	call sub_4871F0
	mov [esp], eax
	fild dword [esp]
	fmul qword [dbl_4C818C]
	mov edx, [esp+24h]
	mov edi, ebp
	call __CHP
	fistp dword [esp+4]
	sub ecx, ecx
	dec ecx
	xor eax, eax
	repne scasb
	not ecx
	dec ecx
	mov edi, ecx
	mov eax, ebp
	cmp dx, 1
	jz loc_4053F4
	cmp dx, 4
	jnz loc_405419

loc_4053F4:
	mov edx, [esp+0Ch]
	call sub_482424

loc_4053FD:
	sub edx, eax
	mov [esp+0Ch], dx

loc_405404:
	xor ecx, ecx

loc_405406:
	movsx eax, di
	movsx esi, cx
	cmp esi, eax
	jl loc_40543C
	add esp, 14h
	pop ebp
	pop edi
	pop esi
	ret 8

loc_405419:
	cmp dx, 2
	jz loc_405425
	cmp dx, 5
	jnz loc_405404

loc_405425:
	call sub_482424
	mov edx, eax
	sar edx, 1Fh
	sub eax, edx
	sar eax, 1
	mov edx, [esp+0Ah]
	sar edx, 10h
	jmp loc_4053FD

loc_40543C:
	mov ebx, 1
	lea eax, [esp+10h]
	mov edx, ebp
	call strncpy_
	lea eax, [esi+ebp]
	mov al, [eax]
	and eax, 0FFh
	push eax
	push aC ; "%c "
	lea eax, [esp+18h]
	push eax
	call sprintf_
	add esp, 0Ch
	cmp word [esp+24h], 2
	jle loc_40549D
	imul esi, [esp+4]
	mov eax, 8
	call sub_405D10
	mov eax, [esp+6]
	sar eax, 10h
	add eax, esi
	mov edx, [esp+0Ah]
	lea ebx, [eax+1]
	sar edx, 10h
	lea eax, [esp+10h]
	inc edx
	call sub_405CF0

loc_40549D:
	mov eax, [esp+26h]
	sar eax, 10h
	mov eax, dword dword_4D20B0[eax*4]
	mov ebx, [esp+4]
	call sub_405D10
	movsx eax, cx
	imul eax, ebx
	mov ebx, [esp+6]
	mov edx, [esp+0Ah]
	sar ebx, 10h
	sar edx, 10h
	add ebx, eax
	lea eax, [esp+10h]
	inc ecx
	call sub_405CF0
	jmp loc_405406
;sub_4053A0 endp

sub_4054E0: ;SUBROUTINE
	push esi
	push edi
	push ebp
	mov ebp, eax
	mov esi, edx
	mov edi, ebx
	mov ebx, [esp+10h]
	movsx eax, cx
	call sub_4056F0
	mov ecx, ebp
	cmp bx, 1
	jz loc_405503
	cmp bx, 4
	jnz loc_405538

loc_405503:
	mov eax, ecx
	call sub_482424
	sub esi, eax

loc_40550C:
	cmp bx, 2
	jg loc_40555D

loc_405512:
	mov eax, [esp+12h]
	sar eax, 10h
	movsx ebx, di
	mov eax, dword dword_4D20B0[eax*4]
	movsx edx, si
	call sub_405D10
	mov eax, ecx
	call sub_405CF0
	pop ebp
	pop edi
	pop esi
	ret 8

loc_405538:
	cmp bx, 2
	jz loc_405544
	cmp bx, 5
	jnz loc_40550C

loc_405544:
	mov eax, ecx
	call sub_482424
	mov edx, eax
	sar edx, 1Fh
	sub eax, edx
	sar eax, 1
	movsx edx, si
	sub edx, eax
	mov esi, edx
	jmp loc_40550C

loc_40555D:
	mov eax, 8
	call sub_405D10
	movsx ebx, di
	movsx edx, si
	inc ebx
	inc edx
	mov eax, ecx
	call sub_405CF0
	jmp loc_405512
;sub_4054E0 endp

sub_405580: ;SUBROUTINE
	push esi
	push edi
	sub esp, 10h
	mov [esp+0Ch], ax
	mov esi, edx
	mov [esp+4], bx
	mov edi, ecx
	mov ecx, [esp+0Ah]
	sar ecx, 10h
	mov eax, ecx
	call sub_41B6F0
	mov ebx, eax
	mov eax, ecx
	call sub_41B690
	mov edx, eax
	mov [esp+8], eax
	xor eax, eax
	mov [esp], ax
	movsx eax, bx
	call sub_4056F0
	mov eax, ecx
	call sub_41B710
	mov ecx, eax
	cmp dx, 1
	jz loc_4055D3
	cmp dx, 4
	jnz loc_40563A

loc_4055D3:
	mov eax, ecx
	call sub_482424
	sub esi, eax

loc_4055DC:
	cmp word [esp+8], 2
	jle loc_405601
	mov eax, 8
	mov ebx, [esp+2]
	call sub_405D10
	movsx edx, si
	sar ebx, 10h
	inc edx
	mov eax, ecx
	inc ebx
	call sub_405CF0

loc_405601:
	cmp di, 1
	jnb loc_405662
	test di, di
	jz loc_405688

loc_405610:
	mov eax, [esp-2]
	mov ebx, [esp+2]
	sar eax, 10h
	movsx edx, si
	mov eax, dword dword_4D20B0[eax*4]
	sar ebx, 10h
	call sub_405D10
	mov eax, ecx
	call sub_405CF0
	add esp, 10h
	pop edi
	pop esi
	ret

loc_40563A:
	cmp dx, 2
	jz loc_405646
	cmp dx, 5
	jnz loc_4055DC

loc_405646:
	mov eax, ecx
	call sub_482424
	mov edx, eax
	sar edx, 1Fh
	sub eax, edx
	sar eax, 1
	movsx edx, si
	sub edx, eax
	mov esi, edx
	jmp loc_4055DC

loc_405662:
	jbe loc_405676
	cmp di, 2
	jnz loc_405610
	mov ax, word [dword_4D20D4]
	mov [esp], ax
	jmp loc_405610

loc_405676:
	mov eax, [esp+0Ah]
	sar eax, 10h
	call sub_41B6B0
	mov [esp], ax
	jmp loc_405610

loc_405688:
	mov eax, [esp+0Ah]
	sar eax, 10h
	call sub_41B6D0
	mov [esp], ax
	jmp loc_405610
;sub_405580 endp

sub_4056A0: ;SUBROUTINE
	mov dword [dword_4D20D4], eax
	ret
;sub_4056A0 endp

sub_4056B0: ;SUBROUTINE
	mov eax, dword [dword_4E5118]
	call sub_4848FC
	mov eax, dword [dword_4E5114]
	call sub_4848FC
	mov eax, dword [dword_4E54A8]
	call sub_4848FC
	mov eax, dword [dword_4E54A4]
	call sub_4848FC
	mov eax, dword [dword_4E511C]
	jmp sub_4848FC
;sub_4056B0 endp

sub_4056F0: ;SUBROUTINE
	push ecx
	push edx
	mov edx, eax
	mov eax, dword [dword_4E54A8+2]
	sar eax, 10h
	cmp eax, edx
	jz loc_405728
	mov ecx, dword [dword_4D20A0]
	mov word [dword_4E54AC], dx
	test ecx, ecx
	jnz loc_40572B

loc_405711:
	cmp edx, 10h
	jnb loc_405737
	cmp edx, 0Dh
	jnb loc_405751

loc_40571B:
	cmp dword [dword_4D20A0], 0
	jnz loc_4057B0

loc_405728:
	pop edx
	pop ecx
	ret

loc_40572B:
	mov eax, dword [dword_4D4D24]
	call sub_4825A8
	jmp loc_405711

loc_405737:
	jbe loc_405784
	cmp edx, 12h
	jb loc_40571B
	jbe loc_40579A
	cmp edx, 24h
	jnz loc_40571B
	mov eax, dword_4E53F0
	call sub_4871C8
	jmp loc_40571B

loc_405751:
	jbe loc_40576E
	cmp edx, 0Eh
	jnz loc_40571B
	mov eax, dword_4E51D4
	call sub_4871C8
	cmp dword [dword_4D20A0], 0
	jnz loc_4057B0
	pop edx
	pop ecx
	ret

loc_40576E:
	mov eax, dword_4E5288
	call sub_4871C8
	cmp dword [dword_4D20A0], 0
	jnz loc_4057B0
	pop edx
	pop ecx
	ret

loc_405784:
	mov eax, dword_4E5120
	call sub_4871C8
	cmp dword [dword_4D20A0], 0
	jnz loc_4057B0
	pop edx
	pop ecx
	ret

loc_40579A:
	mov eax, dword_4E533C
	call sub_4871C8
	cmp dword [dword_4D20A0], 0
	jnz loc_4057B0
	pop edx
	pop ecx
	ret

loc_4057B0:
	call sub_4824BC
	pop edx
	pop ecx
	ret
;sub_4056F0 endp

sub_4057C0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 100h
	mov ecx, dword [dword_5134B8]
	push ecx
	push aSswiss13_ffn ; "%sswiss13.ffn"
	lea eax, [esp+8]
	xor edx, edx
	push eax
	mov dword [dword_4D2098], edx
	call sprintf_
	add esp, 0Ch
	mov edx, 20h
	mov eax, esp
	call sub_486F40
	mov dword [dword_4E54A8], eax
	call sub_487060
	mov eax, dword_4E5288
	call sub_4871B0
	mov ebx, dword [dword_5134B8]
	push ebx
	push aSfixed14_ffn ; "%sfixed14.ffn"
	lea eax, [esp+8]
	push eax
	call sprintf_
	add esp, 0Ch
	mov edx, 20h
	mov eax, esp
	call sub_486F40
	mov dword [dword_4E5118], eax
	call sub_487060
	mov eax, dword_4E51D4
	call sub_4871B0
	mov esi, dword [dword_5134B8]
	push esi
	push aSswiss16_ffn ; "%sswiss16.ffn"
	lea eax, [esp+8]
	push eax
	call sprintf_
	add esp, 0Ch
	mov edx, 20h
	mov eax, esp
	call sub_486F40
	mov dword [dword_4E5114], eax
	call sub_487060
	mov eax, dword_4E5120
	call sub_4871B0
	mov edi, dword [dword_5134B8]
	push edi
	push aSswiss18_ffn ; "%sswiss18.ffn"
	lea eax, [esp+8]
	push eax
	call sprintf_
	add esp, 0Ch
	mov edx, 20h
	mov eax, esp
	call sub_486F40
	mov dword [dword_4E54A4], eax
	call sub_487060
	mov eax, dword_4E533C
	call sub_4871B0
	mov ebp, dword [dword_5134B8]
	push ebp
	push aSswiss36_ffn ; "%sswiss36.ffn"
	lea eax, [esp+8]
	push eax
	call sprintf_
	add esp, 0Ch
	mov edx, 20h
	mov eax, esp
	call sub_486F40
	mov dword [dword_4E511C], eax
	call sub_487060
	mov eax, dword_4E53F0
	mov edx, 0FFFFFFFFh
	call sub_4871B0
	mov word [dword_4E54AC], dx
	add esp, 100h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_4057C0 endp

sub_405910: ;SUBROUTINE
	xor eax, eax
	call sub_403550
	call sub_405A30
	call sub_424280
	test eax, eax
	jz loc_40592B
	mov eax, 0Dh
	ret

loc_40592B:
	push edx
	call sub_482030
	and eax, 0FFFFh
	jnz loc_405958
	mov edx, dword [dword_5637F4]
	cmp edx, dword [dword_4D20A8]
	jle loc_405958
	mov eax, dword [dword_5637F4]
	add eax, 28h
	mov dword [dword_4D20A8], eax
	call sub_405A60

loc_405958:
	pop edx
	ret
;sub_405910 endp

sub_405960: ;SUBROUTINE
	push edx
	call sub_405A30
	xor eax, eax
	call sub_403550
	call sub_424280
	test eax, eax
	jz loc_40597D
	mov eax, 0Dh
	pop edx
	ret

loc_40597D:
	call sub_482030
	mov edx, eax
	xor dx, ax
	shr edx, 10h
	cmp edx, 44h
	jz loc_4059E4
	and eax, 0FFFFh
	mov edx, eax
	call sub_404E44
	test edx, edx
	jnz loc_4059C0
	mov eax, dword [dword_5637F4]
	cmp eax, dword [dword_4D20A8]
	jle loc_4059C0
	mov eax, dword [dword_5637F4]
	add eax, 1Eh
	mov dword [dword_4D20A8], eax
	call sub_405A60
	mov edx, eax

loc_4059C0:
	call sub_482030
	and eax, 0FFFFh
	jz loc_4059E0

loc_4059CC:
	call sub_404E44
	call sub_482030
	and eax, 0FFFFh
	jnz loc_4059CC
	lea eax, [eax+0]

loc_4059E0:
	mov eax, edx
	pop edx
	ret

loc_4059E4:
	mov eax, 36h
	call sub_486550
	test eax, eax
	jz loc_405A05

loc_4059F2:
	mov eax, 1
	call sub_428910
	call sub_486F28
	xor eax, eax
	pop edx
	ret

loc_405A05:
	mov eax, 2Ah
	call sub_486550
	test eax, eax
	jnz loc_4059F2
	call sub_428910
	call sub_486F28
	xor eax, eax
	pop edx
	ret
;sub_405960 endp

sub_405A30: ;SUBROUTINE
	mov eax, 38h
	call sub_486550
	test eax, eax
	jnz loc_405A3F

locret_405A3E:
	ret

loc_405A3F:
	mov eax, 19h
	call sub_486550
	test eax, eax
	jz locret_405A3E

	push edx
	sub esp, 50h
	mov edx, dword [dword_4D9668]
	inc edx
	push edx
	push aScn04d_tga ; "scn%04d.tga"
	lea eax, [esp+8]
	push eax
	mov dword [dword_4D9668], edx
	call sprintf_
	add esp, 0Ch
	call unknown_libname_4 ; Watcom v9-*1.5 32bit NT runtime
	mov eax, esp
	call sub_487538
	call sub_4824BC
	add esp, 50h
	pop edx
	ret
;sub_405A30 endp

sub_405A60: ;SUBROUTINE
	push ebx
	mov eax, 0Fh
	call sub_486550
	xor ebx, ebx
	test eax, eax
	jnz loc_405A99
	push edi
	push esi
	push edx
	push ecx
	xor esi, esi
	xor ecx, ecx
	xor edi, edi

loc_405A7B:
	cmp di, word (dword_512F34+2)[esi]
	jnz loc_405A9D

loc_405A84:
	inc ecx
	add esi, 2
	cmp ecx, 2
	jge loc_405A91
	test ebx, ebx
	jz loc_405A7B

loc_405A91:
	mov eax, ebx
	pop ecx
	pop edx
	pop esi
	pop edi
	pop ebx
	ret

loc_405A99:
	xor eax, eax
	pop ebx
	ret

loc_405A9D:
	mov eax, ecx
	call sub_477B70
	test eax, eax
	jz loc_405AAF
	mov ebx, 0Dh
	jmp loc_405A84

loc_405AAF:
	test byte word_512F3A[esi], 1
	jz loc_405AE4
	mov edx, edi
	mov eax, ecx
	call sub_477BA0
	mov edx, eax
	sar edx, 1Fh
	shl edx, 8
	sbb eax, edx
	sar eax, 8
	cmp eax, 0C0h
	jl loc_405ADA
	mov ebx, 4D00h

loc_405ADA:
	cmp eax, 40h
	jg loc_405AE4
	mov ebx, 4B00h

loc_405AE4:
	test byte word_512F3A[esi], 2
	jz loc_405A84
	mov edx, 1
	mov eax, ecx
	call sub_477BA0
	mov edx, eax
	sar edx, 1Fh
	shl edx, 8
	sbb eax, edx
	sar eax, 8
	cmp eax, 0C0h
	jl loc_405B12
	mov ebx, 5000h

loc_405B12:
	cmp eax, 40h
	jg loc_405A84
	mov ebx, 4800h
	jmp loc_405A84
;sub_405A60 endp

sub_405B30: ;SUBROUTINE
	push esi
	push edi
	mov edi, edx
	mov esi, dword [dword_4D40B8]
	mov edx, eax
	mov eax, esi
	call sub_482EA8
	test eax, eax
	jnz loc_405B4A
	pop edi
	pop esi
	ret

loc_405B4A:
	movsx edx, di
	call sub_405B60
	pop edi
	pop esi
	ret
;sub_405B30 endp

sub_405B60: ;SUBROUTINE
	push esi
	push edi
	mov esi, ebx
	mov ebx, ecx
	mov ecx, edx
	and ch, 1
	movsx ecx, cx
	mov edi, ecx
	not edi
	and edx, edi
	cmp dx, 1800h
	jnb loc_405BA1
	cmp dx, 0C00h
	jnb loc_405BFF
	cmp dx, 400h
	jb loc_405B9E
	jbe loc_405C1B
	cmp dx, 800h
	jz loc_405C23

loc_405B9E:
	pop edi
	pop esi
	ret

loc_405BA1:
	jbe loc_405C3F
	cmp dx, 2400h
	jnb loc_405BCC
	cmp dx, 1C00h
	jb loc_405B9E
	jbe loc_405C49
	cmp dx, 2000h
	jnz loc_405B9E
	mov edx, esi
	call sub_482D7C
	pop edi
	pop esi
	ret

loc_405BCC:
	jbe loc_405C53
	cmp dx, 2C00h
	jnb loc_405BE8
	cmp dx, 2800h
	jnz loc_405B9E
	call sub_483384
	pop edi
	pop esi
	ret

loc_405BE8:
	jbe loc_405C5D
	cmp dx, 3000h
	jnz loc_405B9E
	mov edx, esi
	call sub_48330C
	pop edi
	pop esi
	ret

loc_405BFF:
	jbe loc_405C2D
	cmp dx, 1000h
	jb loc_405B9E
	jbe loc_405C37
	cmp dx, 1400h
	jnz loc_405B9E
	mov edx, esi
	call sub_486D2C
	pop edi
	pop esi
	ret

loc_405C1B:
	call sub_483470
	pop edi
	pop esi
	ret

loc_405C23:
	mov edx, esi
	call sub_483494
	pop edi
	pop esi
	ret

loc_405C2D:
	mov edx, esi
	call sub_483460
	pop edi
	pop esi
	ret

loc_405C37:
	call sub_486D10
	pop edi
	pop esi
	ret

loc_405C3F:
	mov edx, esi
	call sub_486C60
	pop edi
	pop esi
	ret

loc_405C49:
	mov edx, ecx
	call sub_482D58
	pop edi
	pop esi
	ret

loc_405C53:
	mov edx, esi
	call sub_482C78
	pop edi
	pop esi
	ret

loc_405C5D:
	mov edx, esi
	call sub_4833A0
	pop edi
	pop esi
	ret
;sub_405B60 endp

sub_405C70: ;SUBROUTINE
	push edx
	xor edx, edx
	call sub_428770
	mov dword [dword_4D2094], edx
	pop edx
	ret
;sub_405C70 endp

sub_405CF0: ;SUBROUTINE
	cmp dword [dword_4D20A0], 0
	jz sub_486A30
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 8
	mov esi, eax
	mov edi, edx
	mov [esp+4], ebx
	mov eax, dword [dword_4D20A4]
	or eax, 0FF000000h
	mov [esp], eax
	cmp byte [esi], 0
	jz loc_426C27

loc_426BC1:
	mov ebp, dword [dword_4E54AC]
	mov al, [esi]
	cmp ebp, 24h
	jnz loc_426C3E
	cmp al, 20h
	jnz loc_426C2F
	mov ah, 0FAh

loc_426BD8:
	xor edx, edx
	mov dl, ah
	xor ebx, ebx
	mov bl, byte byte_4EC3AC[edx]
	and eax, 0FFh
	push eax
	mov ecx, [esp+4]
	push ecx
	movzx ebp, byte byte_4EC2B0[edx]
	push 33h
	xor eax, eax
	mov ecx, edi
	push ebx
	mov ebx, [esp+14h]
	mov al, byte byte_4EC0B8[edx]
	push ebx
	xor ebx, ebx
	mov eax, dword dword_4EC4B0[eax*4]
	mov bl, byte byte_4EC1B4[edx]
	mov edx, ebp
	inc esi
	call sub_426C50
	mov dl, [esi]
	add edi, eax
	test dl, dl
	jnz loc_426BC1

loc_426C27:
	add esp, 8
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret

loc_426C2F:
	cmp al, 0D6h
	jnz loc_426C37
	mov ah, 0FBh
	jmp loc_426BD8

loc_426C37:
	mov ah, al
	add ah, 9Fh
	jmp loc_426BD8

loc_426C3E:
	mov ah, al
	sub ah, 20h
	jmp loc_426BD8
;sub_405CF0 endp

sub_405D10: ;SUBROUTINE
	push edx
	mov edx, eax
	cmp dword [dword_4D20A0], 0
	jz loc_405D23
	mov dword [dword_4D20A4], eax
	pop edx
	ret

loc_405D23:
	push ecx
	xor eax, eax
	call sub_48266C
	mov ecx, eax
	mov eax, edx
	mov edx, ecx
	call sub_48266C
	call sub_486560
	pop ecx
	pop edx
	ret
;sub_405D10 endp

dword_405D40: dd 10001h, 0
	times 2 db 0
word_405D4A: dw 2
	dd 2, 0
dword_405D54: dd 20002h, 10002h
	times 2 db 0
word_405D5E: dw 1
	dd 1, 0
dword_405D68: times 2 dd 0
	db 1, 0
word_405D72: dw 1
	times 2 dd 0
dword_405D7C: dd 6050200h, 0D0B0A09h, 1211100Fh, 17161513h
dword_405D8C: dd 0
	dd 2, 4, 5, 3, 6, 7, 8, 0
off_405DB0: dd loc_406099
	dd loc_406962 ; jump table for switch statement
	dd loc_406C54
	dd loc_406C54
	dd loc_406C54
off_405DC4: dd loc_406107
	dd loc_406F7C ; jump table for switch statement
	dd loc_406F8C
	dd loc_406107

sub_405DD4: ;SUBROUTINE
	push ecx
	push edx
	push edi
	push ebp
	sub esp, 9Ch
	mov [esp+68h], eax
	mov edx, 18h
	mov eax, 1E00h
	call sub_463930
	xor eax, eax

loc_405DF3:
	add eax, 4
	xor edx, edx
	mov dword dword_4E54B4[eax], edx
	cmp eax, 40h
	jnz loc_405DF3
	push esi
	push ebx
	mov eax, dword [dword_512D9E]
	sar eax, 10h
	call sub_4880DA
	call sub_403B20
	mov ah, byte [byte_512DA9]
	test ah, ah
	jz loc_406888
	cmp ah, 1
	jz loc_406888

loc_405E2E:
	xor bh, bh
	xor ecx, ecx
	mov byte [byte_4D1FE9], bh
	mov dword [dword_4E5508], ecx
	mov dword [dword_4E5514], ecx
	mov dword [dword_4E5510], ecx
	mov dword [dword_4E550C], ecx
	mov dword [dword_4E5504], ecx
	mov dword [dword_4E5500], ecx
	mov dword [dword_4E54F8], ecx
	mov dword [dword_4E54FC], ecx
	mov byte [byte_4D1FE8], bh

loc_405E6E:
	mov edx, 10000h
	mov eax, [esp+70h]
	call sub_488168
	mov eax, [esp+70h]
	lea ecx, [eax+4]
	mov dword [eax], 7
	mov dword [ecx], 1
	add ecx, 4
	mov dword [ecx], 0Ch
	add ecx, 4
	mov eax, dword [dword_512D9E]
	add ecx, 4
	sar eax, 10h
	mov [ecx-4], eax
	mov dword [ecx], 0Eh
	add ecx, 4
	mov dword [ecx], 0
	add ecx, 4
	mov dword [ecx], 0Fh
	add ecx, 4
	mov dword [ecx], 3
	add ecx, 4
	mov dword [ecx], 13h
	add ecx, 4
	xor eax, eax
	add ecx, 4
	mov al, byte [byte_512DFB]
	mov [ecx-4], eax
	mov dword [ecx], 1Eh
	xor eax, eax
	mov al, byte [byte_512DFA]
	mov [ecx+4], eax
	add ecx, 4
	mov al, byte [byte_512DA9]
	add ecx, 4
	cmp al, 1
	jnz loc_4068AB
	cmp byte [byte_512DAA], 2
	jnz loc_4068AB
	xor eax, eax
	call sub_4072D0
	test ax, ax
	jz loc_4068A4
	mov eax, 1
	call sub_4072D0
	test ax, ax
	jz loc_4068A4
	mov eax, 1

loc_405F3B:
	mov dword [ecx], 6
	add ecx, 4
	mov [ecx], eax
	lea eax, [ecx+8]
	mov bl, byte [byte_512DAA]
	add ecx, 4
	lea edx, [eax+4]
	cmp bl, 3
	jnz loc_4068B7
	mov dword [ecx], 2
	mov ecx, edx
	mov dword [eax], 0

loc_405F6C:
	lea ebx, [ecx+4]
	lea esi, [ecx+8]
	lea eax, [ecx+0Ch]
	lea edx, [ecx+10h]
	cmp byte [byte_512DAB], 2
	jnz loc_4068CA
	mov dword [ecx], 5
	mov dword [ebx], 1
	mov dword [esi], 21h
	mov ecx, edx
	mov dword [eax], 0

loc_405F9F:
	mov bh, byte [byte_512DAA]
	cmp bh, 2
	jnz loc_4068F1

loc_405FAE:
	mov eax, 1

loc_405FB3:
	mov dword [ecx], 4
	add ecx, 4
	add ecx, 4
	mov [ecx-4], eax
	mov dword [ecx], 9
	add ecx, 4
	xor eax, eax
	add ecx, 4
	mov al, byte [byte_512DAE]
	mov [ecx-4], eax
	mov dword [ecx], 0Ah
	xor eax, eax
	add ecx, 4
	mov al, byte [byte_512DB0]
	add ecx, 4
	call sub_407160
	cwde
	mov [ecx-4], eax
	mov dword [ecx], 1Dh
	xor eax, eax
	add ecx, 4
	mov al, byte [byte_512DB0]
	add ecx, 4
	call sub_41AE70
	mov [ecx-4], eax
	mov dword [ecx], 3
	add ecx, 4
	add ecx, 4
	call sub_407190
	mov [ecx-4], eax
	mov dword [ecx], 1Fh
	add ecx, 4
	xor eax, eax
	add ecx, 4
	mov al, byte [byte_512DBA]
	mov [ecx-4], eax
	mov dword [ecx], 20h
	add ecx, 4
	xor eax, eax
	add ecx, 4
	mov al, byte [byte_512DBB]
	mov [ecx-4], eax
	mov dword [ecx], 22h
	mov bl, byte [byte_512DAA]
	add ecx, 4
	cmp bl, 2
	jnz loc_406929
	cmp byte [byte_512DB0], 0
	jz loc_406929
	mov eax, ecx
	call sub_407310
	nop

loc_40607C:
	mov ecx, eax
	mov eax, eax

loc_406080:
	mov al, byte [byte_512DA9]
	xor edi, edi
	xor esi, esi
	cmp al, 4
	ja loc_4060CC
	and eax, 0FFh ; switch 5 cases
	jmp off_405DB0[eax*4] ; switch jump

loc_406099:
	mov edx, 1 ; jumptable 00406092 case 0
	mov ebx, 9
	mov eax, byte_512E84
	mov [esp+68h], esi
	mov [esp+6Ch], edx
	mov edx, dword_512F4C
	mov esi, 1
	call strncpy_
	mov eax, ecx
	xor edx, edx
	mov edi, esi
	call sub_4073B0
	mov ecx, eax

loc_4060CC:
	mov dword [ecx], 10h
	add ecx, 4
	add ecx, 4
	mov eax, [esp+6Ch]
	mov [ecx-4], eax
	mov eax, [esp+68h]
	mov dword [ecx], 8
	mov [ecx+4], eax
	add ecx, 4
	mov al, byte [byte_512DAA]
	add ecx, 4
	cmp al, 3
	ja loc_406129
	and eax, 0FFh ; switch 4 cases
	jmp off_405DC4[eax*4] ; switch jump

loc_406107:
	cmp byte [byte_512DA9], 1 ; jumptable 00406100 cases 0,3
	jnz loc_406F52
	cmp byte [byte_512DF6], 2
	jnz loc_406F47
	mov dword [esp+74h], 6

loc_406129:
	mov edx, [esp+74h]
	xor eax, eax
	xor ebp, ebp
	mov [esp+78h], eax
	test edx, edx
	jle loc_406209

loc_40613D:
	mov eax, edi
	call sub_4072D0
	test ax, ax
	jz loc_406FB4
	cmp byte [byte_512DAA], 0
	jz loc_406F9C

loc_40615A:
	lea ebx, [esp+34h]
	lea edx, [esp+30h]
	mov eax, ebp
	call sub_407880
	mov ebx, eax

loc_40616B:
	mov eax, ebp
	call sub_4077A0
	mov [esp+34h], eax
	mov edx, eax
	mov eax, ebx
	call sub_4077F0
	mov [esp+30h], eax
	mov dword [ecx], 7Bh
	add ecx, 4
	add ecx, 4
	add ecx, 4
	mov [ecx-8], esi
	mov [ecx-4], ebx
	mov dword [ecx], 7Dh
	add ecx, 4
	add ecx, 4
	mov [ecx-4], esi
	mov dword [ecx], 1
	add ecx, 4
	mov dword [ecx], 7Eh
	add ecx, 4
	add ecx, 4
	mov [ecx-4], esi
	add ecx, 4
	mov eax, [esp+30h]
	mov [ecx-4], eax
	mov dword [ecx], 7Ch
	add ecx, 4
	add ecx, 4
	mov [ecx-4], esi
	mov dword [ecx], 2
	add ecx, 4
	mov dword [ecx], 87h
	add ecx, 4
	add ecx, 4
	mov [ecx-4], esi
	add ecx, 4
	mov eax, [esp+34h]
	inc esi
	mov [ecx-4], eax

loc_4061FB:
	mov ebx, [esp+74h]
	inc ebp
	inc edi
	cmp ebp, ebx
	jl loc_40613D

loc_406209:
	mov eax, [esp+78h]
	mov edi, [esp+74h]
	sub edi, eax
	mov dl, byte [byte_512DF6]
	mov [esp+74h], edi
	cmp dl, 2
	jnz loc_406FD6
	mov dh, byte [byte_512DF5]
	cmp dh, 0Bh
	jbe loc_406FD6
	cmp dh, 0Ch
	jnz loc_406FBD
	mov eax, 0Ch

loc_406243:
	mov dword [ecx], 12h
	add ecx, 4
	add ecx, 4
	mov [ecx-4], eax
	mov eax, [esp+74h]
	mov dword [ecx], 11h
	mov [ecx+4], eax
	add ecx, 4
	mov al, byte [byte_512DF8]
	add ecx, 4
	test al, al
	jnz loc_4063A1
	cmp byte [byte_512DF6], 2
	jz loc_4063A1
	cmp byte [byte_512DAA], 0
	jnz loc_4063A1
	cmp byte [byte_512DB0], 0
	jz loc_4063A1
	call sub_407780
	cmp dword [dword_4E54F8], 0
	jz loc_406FF2
	mov bl, byte [byte_512DF6]
	mov edi, 0Bh
	test bl, bl
	jz loc_4062BF
	mov edi, 0Ah

loc_4062BF:
	cmp byte [byte_512DA9], 1
	jz loc_406FE2

loc_4062CC:
	xor edx, edx

loc_4062CE:
	mov bl, byte [byte_4D1FE8]
	test bl, bl
	jz loc_406FE8
	xor eax, eax
	mov al, bl

loc_4062E0:
	mov [esp+edx+18h], eax
	add edx, 4
	call sub_407830
	mov [esp+edx+4], eax
	cmp edx, 10h
	jnz loc_4062CE

loc_4062F5:
	xor ebx, ebx
	test edi, edi
	jle loc_4063A1

loc_4062FF:
	mov dword [ecx], 7Bh
	add ecx, 4
	mov edx, dword [dword_4E54F8]
	mov [ecx], esi
	add ecx, 4
	test edx, edx
	jz loc_406FFC
	mov ebp, 4
	mov edx, ebx
	mov eax, ebx
	sar edx, 1Fh
	idiv ebp
	mov edx, [esp+edx*4+18h]

loc_40632D:
	add ecx, 4
	mov [ecx-4], edx
	mov dword [ecx], 7Dh
	add ecx, 4
	add ecx, 4
	mov [ecx-4], esi
	mov dword [ecx], 1
	add ecx, 4
	mov dword [ecx], 7Eh
	add ecx, 4
	mov ebp, dword [dword_4E54F8]
	mov [ecx], esi
	add ecx, 4
	test ebp, ebp
	jz loc_407008
	mov ebp, 4
	mov edx, ebx
	mov eax, ebx
	sar edx, 1Fh
	idiv ebp
	mov edx, [esp+edx*4+8]

loc_406379:
	add ecx, 4
	mov [ecx-4], edx
	mov dword [ecx], 7Ch
	add ecx, 4
	add ecx, 4
	inc ebx
	mov [ecx-4], esi
	inc esi
	mov dword [ecx], 4
	add ecx, 4
	cmp ebx, edi
	jl loc_4062FF

loc_4063A1:
	mov dword [ecx], 0Dh
	mov [ecx+4], esi
	add ecx, 4
	mov bh, byte [byte_512DA9]
	add ecx, 4
	cmp bh, 1
	jnz loc_407046
	xor eax, eax
	call sub_4072D0
	test ax, ax
	jz loc_407014
	xor edx, edx

loc_4063D1:
	cmp byte [byte_512DBB], 0
	jz loc_40701E
	mov eax, 24h

loc_4063E3:
	mov [ecx], eax
	mov eax, dword dword_512E34[edx*4]
	call sub_4071D0
	mov [ecx+4], eax
	add ecx, 4
	mov bh, byte [byte_512DBB]
	add ecx, 4
	test bh, bh
	jz loc_407028
	mov eax, 23h

loc_40640D:
	mov [ecx], eax
	add ecx, 4
	mov eax, dword dword_512E3C[edx*4]
	add ecx, 4
	call sub_4071D0
	mov [ecx-4], eax
	mov dword [ecx], 25h
	add ecx, 4
	add ecx, 4
	mov eax, dword dword_512E44[edx*4]
	mov [ecx-4], eax
	mov dword [ecx], 26h
	add ecx, 4
	add ecx, 4
	mov eax, dword dword_512E4C[edx*4]
	mov [ecx-4], eax
	mov dword [ecx], 52h
	add ecx, 4
	add ecx, 4
	mov eax, dword dword_512E54[edx*4]
	mov [ecx-4], eax
	mov dword [ecx], 53h
	add ecx, 4
	add ecx, 4
	mov eax, dword dword_512E5C[edx*4]
	mov [ecx-4], eax
	mov dword [ecx], 2Bh
	add ecx, 4
	add ecx, 4
	mov eax, dword dword_512E64[edx*4]
	mov [ecx-4], eax
	mov dword [ecx], 2Ch
	add ecx, 4
	add ecx, 4
	mov eax, dword dword_512E6C[edx*4]
	mov [ecx-4], eax
	mov dword [ecx], 2Dh
	add ecx, 4
	add ecx, 4
	mov eax, dword dword_512E74[edx*4]
	mov [ecx-4], eax
	mov dword [ecx], 2Eh
	add ecx, 4
	add ecx, 4
	mov eax, dword dword_512E7C[edx*4]
	mov edx, 57h
	mov [ecx-4], eax
	mov eax, 4
	mov dword [ecx], 28h
	call sub_404D50
	mov [ecx+4], eax
	add ecx, 4
	xor eax, eax
	add ecx, 4
	call sub_4072D0
	test ax, ax
	jz loc_40660E
	cmp byte [byte_512DBB], 0
	jz loc_407032
	mov eax, 30h

loc_406514:
	mov [ecx], eax
	mov eax, dword [dword_512E38]
	call sub_4071D0
	mov [ecx+4], eax
	add ecx, 4
	mov ah, byte [byte_512DBB]
	add ecx, 4
	test ah, ah
	jz loc_40703C
	mov eax, 2Fh

loc_40653C:
	mov [ecx], eax
	add ecx, 4
	mov eax, dword [dword_512E40]
	add ecx, 4
	call sub_4071D0
	mov [ecx-4], eax
	mov dword [ecx], 31h
	add ecx, 4
	add ecx, 4
	mov eax, dword [dword_512E48]
	mov [ecx-4], eax
	mov dword [ecx], 32h
	add ecx, 4
	add ecx, 4
	mov eax, dword [dword_512E50]
	mov [ecx-4], eax
	mov dword [ecx], 54h
	add ecx, 4
	add ecx, 4
	mov eax, dword [dword_512E58]
	mov [ecx-4], eax
	mov dword [ecx], 55h
	add ecx, 4
	add ecx, 4
	mov eax, dword [dword_512E60]
	mov [ecx-4], eax
	mov dword [ecx], 37h
	add ecx, 4
	add ecx, 4
	mov eax, dword [dword_512E68]
	mov [ecx-4], eax
	mov dword [ecx], 38h
	add ecx, 4
	add ecx, 4
	mov eax, dword [dword_512E70]
	mov [ecx-4], eax
	mov dword [ecx], 39h
	add ecx, 4
	add ecx, 4
	mov eax, dword [dword_512E78]
	mov [ecx-4], eax
	mov dword [ecx], 3Ah
	add ecx, 4
	add ecx, 4
	mov eax, dword [dword_512E80]
	mov edx, 58h
	mov [ecx-4], eax
	mov eax, 4
	mov dword [ecx], 34h

loc_406601:
	add ecx, 4
	call sub_404D50
	mov [ecx], eax
	add ecx, 4

loc_40660E:
	mov edx, 1
	mov dword [ecx], 3Bh
	add ecx, 4
	mov eax, 4
	add ecx, 4
	call sub_404D50
	mov [ecx-4], eax
	mov edx, 48h
	mov dword [ecx], 3Ch
	add ecx, 4
	mov eax, 4
	add ecx, 4
	call sub_404D50
	mov [ecx-4], eax
	mov edx, 50h
	mov dword [ecx], 3Dh
	add ecx, 4
	mov eax, 4
	add ecx, 4
	call sub_404D50
	mov [ecx-4], eax
	mov edx, 4Bh
	mov dword [ecx], 3Eh
	add ecx, 4
	mov eax, 4
	add ecx, 4
	call sub_404D50
	mov [ecx-4], eax
	mov edx, 4Dh
	mov dword [ecx], 3Fh
	add ecx, 4
	mov eax, 4
	add ecx, 4
	call sub_404D50
	mov edx, 1Ch
	mov [ecx-4], eax
	mov eax, 4
	mov dword [ecx], 40h
	add ecx, 4
	call sub_404D50
	mov [ecx], eax
	add ecx, 4
	pop ebx
	pop esi
	mov edx, 19h
	mov dword [ecx], 41h
	add ecx, 4
	mov eax, 4
	add ecx, 4
	call sub_404D50
	mov [ecx-4], eax
	mov edx, 0Fh
	mov dword [ecx], 43h
	add ecx, 4
	mov eax, 4
	add ecx, 4
	call sub_404D50
	mov [ecx-4], eax
	mov edx, 44h
	mov dword [ecx], 44h
	add ecx, 4
	mov eax, 4
	add ecx, 4
	call sub_404D50
	mov [ecx-4], eax
	mov dword [ecx], 15h
	add ecx, 4
	mov dword [ecx], 0
	add ecx, 4
	mov dword [ecx], 16h
	add ecx, 4
	mov dword [ecx], 0
	add ecx, 4
	mov dword [ecx], 17h
	add ecx, 4
	xor eax, eax
	add ecx, 4
	mov al, byte [byte_512ED1]
	mov [ecx-4], eax
	mov dword [ecx], 18h
	add ecx, 4
	xor eax, eax
	add ecx, 4
	mov al, byte [byte_512ED0]
	mov [ecx-4], eax
	mov dword [ecx], 19h
	add ecx, 4
	xor eax, eax
	add ecx, 4
	mov al, byte [byte_512ED2]
	mov [ecx-4], eax
	mov dword [ecx], 1Ch
	xor eax, eax
	add ecx, 4
	mov al, byte [byte_512F3F]
	mov edx, dword [dword_4E5508]
	mov [ecx], eax
	add ecx, 4
	xor eax, eax
	test edx, edx
	jz loc_4067A9
	mov eax, 4

loc_4067A9:
	cmp dword [dword_4E5514], 0
	jz loc_4067B4
	or al, 8

loc_4067B4:
	mov dl, byte [byte_512DAA]
	cmp dl, 2
	jz loc_4067DA
	cmp dl, 1
	jz loc_4067DA
	cmp byte [byte_512DD0], 0
	jz loc_4067CF
	or al, 10h

loc_4067CF:
	cmp byte [byte_512DEB], 0
	jz loc_4067DA
	or al, 20h

loc_4067DA:
	cmp dword [dword_4E550C], 0
	jz loc_4067E5
	or al, 80h

loc_4067E5:
	cmp dword [dword_4E5504], 0
	jz loc_4067F1
	or ah, 2

loc_4067F1:
	cmp dword [dword_4E5500], 0
	jz loc_4067FD
	or ah, 1

loc_4067FD:
	cmp dword [dword_4E54F8], 0
	jz loc_406812
	cmp byte [byte_512DF8], 0
	jnz loc_406812
	or ah, 4

loc_406812:
	cmp dword [dword_4E54FC], 0
	jz loc_40681E
	or ah, 8

loc_40681E:
	cmp dword [dword_4E54F8], 0
	jz loc_40683C
	cmp byte [byte_512DF8], 0
	jnz loc_40683C
	cmp byte [byte_4D1FE8], 25h
	jbe loc_40683C
	or ah, 10h

loc_40683C:
	cmp byte [byte_512DA9], 1
	ja loc_406854
	mov dl, byte [byte_512DAA]
	cmp dl, 3
	jz loc_406856
	test dl, dl
	jz loc_406856

loc_406854:
	xor eax, eax

loc_406856:
	mov dword [ecx], 14h
	add ecx, 4
	add ecx, 4
	mov edi, [esp+68h]
	mov [ecx-4], eax
	lea edx, [ecx+4]
	mov eax, edi
	sub edx, edi
	mov dword [ecx], 0
	call sub_488168
	mov eax, edi
	add esp, 9Ch
	pop ebp
	pop edi
	pop edx
	pop ecx
	ret

loc_406888:
	mov dh, byte [byte_512DAA]
	test dh, dh
	jz loc_405E6E
	cmp dh, 3
	jnz loc_405E2E
	jmp loc_405E6E

loc_4068A4:
	xor eax, eax
	jmp loc_405F3B

loc_4068AB:
	xor eax, eax
	mov al, byte [byte_512DA9]
	jmp loc_405F3B

loc_4068B7:
	mov dword [ecx], 2
	xor ecx, ecx
	mov cl, bl
	mov [eax], ecx
	mov ecx, edx
	jmp loc_405F6C

loc_4068CA:
	mov dword [ecx], 5
	xor ecx, ecx
	mov cl, byte [byte_512DAB]
	mov [ebx], ecx
	mov dword [esi], 21h
	xor ecx, ecx
	mov cl, byte [byte_512DAB]
	mov [eax], ecx
	mov ecx, edx
	jmp loc_405F9F

loc_4068F1:
	cmp bh, 1
	jz loc_405FAE
	cmp byte [byte_512DD0], 0
	jnz loc_405FAE
	cmp byte [byte_512DEB], 0
	jz loc_40691D
	cmp byte [byte_512DA9], 1
	jz loc_405FAE

loc_40691D:
	xor eax, eax
	mov al, byte [byte_512DAD]
	jmp loc_405FB3

loc_406929:
	cmp byte [byte_512DAA], 1
	jnz loc_40693B
	cmp dword [dword_4D76B8], 0
	jnz loc_406956

loc_40693B:
	mov dword [ecx], 0Dh
	xor eax, eax
	add ecx, 4

loc_406946:
	mov [ecx], eax
	inc eax
	add ecx, 4
	cmp eax, 0Ch
	jle loc_406946
	jmp loc_406080

loc_406956:
	mov eax, ecx
	call sub_407380
	jmp loc_40607C

loc_406962:
	xor eax, eax ; jumptable 00406092 case 1
	call sub_4072D0
	movsx edx, ax
	mov eax, 1
	call sub_4072D0
	cwde
	mov ebx, 9
	add edx, eax
	mov eax, byte_512E84
	mov [esp+6Ch], edx
	mov edx, dword_512F4C
	call strncpy_
	mov ebx, 9
	mov edx, byte_512F55
	mov eax, byte_512E8D
	call strncpy_
	xor eax, eax
	mov [esp+68h], esi
	call sub_4072D0
	test ax, ax
	jz loc_4069C5
	mov eax, ecx
	xor edx, edx
	mov esi, 1
	call sub_4073B0
	mov ecx, eax

loc_4069C5:
	mov eax, 1
	call sub_4072D0
	inc edi
	test ax, ax
	jz loc_406B92
	lea ebx, [ecx+4]
	lea edx, [ecx+8]
	lea eax, [ecx+0Ch]
	cmp byte [byte_4D1FE9], 0
	jz loc_406B98
	mov dword [ecx], 7Bh
	xor ecx, ecx
	mov [ebx], esi
	mov cl, byte [byte_4D1FE9]

loc_4069FF:
	mov [edx], ecx
	mov ecx, eax
	mov dword [ecx], 7Dh
	add ecx, 4
	add ecx, 4
	xor eax, eax
	mov [ecx-4], esi
	add ecx, 4
	mov al, byte [byte_512DDB]
	mov [ecx-4], eax
	mov dword [ecx], 7Eh
	xor eax, eax
	mov [ecx+4], esi
	mov al, byte [byte_512DDA]
	add ecx, 4
	mov al, byte byte_512DDC[eax]
	add ecx, 4
	add ecx, 4
	and eax, 0FFh
	mov [ecx-4], eax
	mov dword [ecx], 7Ch
	add ecx, 4
	add ecx, 4
	lea eax, [ecx+8]
	lea edx, [eax+4]
	mov [esp+64h], edx
	lea edx, [eax+8]
	lea ebx, [eax+0Ch]
	mov [esp+60h], ebx
	lea ebx, [eax+10h]
	mov [esp+50h], ebx
	lea ebx, [eax+14h]
	mov [esp+48h], ebx
	lea ebx, [eax+18h]
	mov [esp+4Ch], ebx
	lea ebx, [eax+1Ch]
	mov [esp+54h], ebx
	lea ebx, [eax+20h]
	lea ebp, [eax+24h]
	mov [esp+5Ch], ebp
	lea ebp, [eax+28h]
	mov [esp+58h], ebp
	lea ebp, [eax+2Ch]
	mov [esp+44h], ebp
	lea ebp, [eax+30h]
	mov [ecx-4], esi
	mov [esp+40h], ebp
	lea ebp, [eax+34h]
	mov dword [ecx], 1
	mov [esp+3Ch], ebp
	lea ebp, [eax+38h]
	add ecx, 4
	cmp byte [byte_512DAA], 0
	jz loc_406BAD
	mov dword [ecx], 82h
	mov [eax], esi
	mov ecx, [esp+64h]
	mov eax, dword [dword_4D22E0]
	mov [ecx], eax
	mov eax, [esp+60h]
	mov dword [edx], 83h
	mov [eax], esi
	mov edx, [esp+50h]
	mov eax, dword [dword_4D22E0]
	mov [edx], eax
	mov eax, [esp+48h]
	mov dword [eax], 84h
	mov eax, [esp+4Ch]
	mov [eax], esi
	mov edx, [esp+54h]
	mov eax, dword [dword_4D22F0]
	mov [edx], eax
	mov eax, [esp+5Ch]
	mov dword [ebx], 85h
	mov [eax], esi
	mov edx, [esp+58h]
	mov eax, dword [dword_4D22FC]
	mov [edx], eax
	mov eax, [esp+44h]
	mov dword [eax], 86h
	mov eax, [esp+40h]
	mov [eax], esi
	mov edx, [esp+3Ch]
	mov eax, dword [dword_4D2308]

loc_406B39:
	mov ecx, ebp
	mov [edx], eax
	mov dword [ecx], 7Fh
	add ecx, 4
	add ecx, 4
	xor eax, eax
	mov [ecx-4], esi
	add ecx, 4
	mov al, byte [byte_512DF2]
	mov [ecx-4], eax
	mov dword [ecx], 80h
	add ecx, 4
	add ecx, 4
	xor eax, eax
	mov [ecx-4], esi
	add ecx, 4
	mov al, byte [byte_512DF3]
	mov [ecx-4], eax
	mov dword [ecx], 81h
	add ecx, 4
	add ecx, 4
	xor eax, eax
	mov [ecx-4], esi
	add ecx, 4
	mov al, byte [byte_512DF4]
	inc esi
	mov [ecx-4], eax

loc_406B92:
	inc edi
	jmp loc_4060CC

loc_406B98:
	mov dword [ecx], 7Bh
	xor ecx, ecx
	mov [ebx], esi
	mov cl, byte [byte_512DDA]
	jmp loc_4069FF

loc_406BAD:
	mov dword [ecx], 82h
	mov [eax], esi
	xor eax, eax
	mov al, byte [byte_512DEE]
	mov ecx, [esp+64h]
	mov eax, dword dword_4D22E0[eax*4]
	mov [ecx], eax
	mov eax, [esp+60h]
	mov dword [edx], 83h
	mov [eax], esi
	xor eax, eax
	mov al, byte [byte_512DEF]
	mov edx, [esp+50h]
	mov eax, dword dword_4D22E0[eax*4]
	mov [edx], eax
	mov eax, [esp+48h]
	mov dword [eax], 84h
	mov eax, [esp+4Ch]
	mov [eax], esi
	xor eax, eax
	mov al, byte [byte_512DEC]
	mov edx, [esp+54h]
	mov eax, dword dword_4D22EC[eax*4]
	mov [edx], eax
	mov eax, [esp+5Ch]
	mov dword [ebx], 85h
	mov [eax], esi
	xor eax, eax
	mov al, byte [byte_512DF1]
	mov edx, [esp+58h]
	mov eax, dword dword_4D22F8[eax*4]
	mov [edx], eax
	mov eax, [esp+44h]
	mov dword [eax], 86h
	mov eax, [esp+40h]
	mov [eax], esi
	xor eax, eax
	mov al, byte [byte_512DF0]
	mov edx, [esp+3Ch]
	mov eax, dword dword_4D2304[eax*4]
	jmp loc_406B39

loc_406C54:
	mov eax, dword [dword_513408+2] ; jumptable 00406092 cases 2-4
	sar eax, 10h
	mov [esp+68h], eax
	mov eax, dword [dword_513408]
	lea edx, [esi+esi]
	sar eax, 10h
	xor edi, edi
	mov [esp+6Ch], eax

loc_406C71:
	mov eax, dword [dword_513408]
	sar eax, 10h
	cmp edi, eax
	jge loc_4060CC
	mov dword [ecx], 7Bh
	add ecx, 4
	mov [ecx], esi
	add ecx, 4
	mov eax, dword dword_512F98[edx]
	add ecx, 4
	sar eax, 10h
	mov [ecx-4], eax
	mov dword [ecx], 7Dh
	add ecx, 4
	mov [ecx], esi
	add ecx, 4
	mov eax, dword dword_512FA8[edx]
	add ecx, 4
	sar eax, 10h
	mov [ecx-4], eax
	mov dword [ecx], 7Eh
	add ecx, 4
	mov [ecx], esi
	add ecx, 4
	mov eax, dword dword_512FB8[edx]
	add ecx, 4
	sar eax, 10h
	mov [ecx-4], eax
	mov dword [ecx], 7Ch
	add ecx, 4
	add ecx, 4
	lea eax, [ecx+8]
	lea ebx, [eax+4]
	mov [esp+98h], ebx
	lea ebx, [eax+8]
	mov [esp+38h], ebx
	lea ebx, [eax+0Ch]
	mov [esp+80h], ebx
	lea ebx, [eax+10h]
	mov [esp+28h], ebx
	lea ebx, [eax+14h]
	mov [esp+90h], ebx
	lea ebx, [eax+18h]
	mov [esp+88h], ebx
	lea ebx, [eax+1Ch]
	mov [esp+0A0h], ebx
	lea ebx, [eax+20h]
	mov [esp+94h], ebx
	lea ebx, [eax+24h]
	mov [esp+2Ch], ebx
	lea ebx, [eax+28h]
	lea ebp, [eax+2Ch]
	mov [esp+9Ch], ebx
	lea ebx, [eax+30h]
	mov [esp+84h], ebx
	lea ebx, [eax+34h]
	mov [ecx-4], esi
	mov [esp+8Ch], ebx
	lea ebx, [eax+38h]
	mov dword [ecx], 1
	mov [esp+7Ch], ebx
	mov bl, byte [byte_512DAA]
	add ecx, 4
	test bl, bl
	jz loc_406E76
	mov dword [ecx], 82h
	mov [eax], esi
	mov ecx, [esp+98h]
	mov eax, dword [dword_4D22E0]
	mov [ecx], eax
	mov eax, [esp+38h]
	mov dword [eax], 83h
	mov eax, [esp+80h]
	mov [eax], esi
	mov ecx, [esp+28h]
	mov eax, dword [dword_4D22E0]
	mov [ecx], eax
	mov eax, [esp+90h]
	mov dword [eax], 84h
	mov eax, [esp+88h]
	mov [eax], esi
	mov ecx, [esp+0A0h]
	mov eax, dword [dword_4D22F0]
	mov [ecx], eax
	mov eax, [esp+94h]
	mov dword [eax], 85h
	mov eax, [esp+2Ch]
	mov [eax], esi
	mov ecx, [esp+9Ch]
	mov eax, dword [dword_4D22FC]
	mov [ecx], eax
	mov eax, [esp+84h]
	mov dword [ebp+0], 86h
	mov [eax], esi
	mov ecx, [esp+8Ch]
	mov eax, dword [dword_4D2308]

loc_406E0F:
	mov [ecx], eax
	mov ecx, [esp+7Ch]
	mov dword [ecx], 7Fh
	add ecx, 4
	mov [ecx], esi
	add ecx, 4
	mov eax, dword dword_513018[edx]
	add ecx, 4
	sar eax, 10h
	mov [ecx-4], eax
	mov dword [ecx], 80h
	add ecx, 4
	mov [ecx], esi
	add ecx, 4
	mov eax, dword dword_513028[edx]
	add ecx, 4
	sar eax, 10h
	mov [ecx-4], eax
	mov dword [ecx], 81h
	add ecx, 4
	add edx, 2
	inc edi
	mov [ecx], esi
	add ecx, 4
	mov eax, dword dword_513036[edx]
	add ecx, 4
	sar eax, 10h
	inc esi
	mov [ecx-4], eax
	jmp loc_406C71

loc_406E76:
	mov dword [ecx], 84h
	mov [eax], esi
	mov eax, dword dword_512FC8[edx]
	sar eax, 10h
	mov ecx, [esp+98h]
	mov eax, dword dword_4D22EC[eax*4]
	mov [ecx], eax
	mov eax, [esp+38h]
	mov dword [eax], 82h
	mov eax, [esp+80h]
	mov [eax], esi
	mov eax, dword dword_512FD8[edx]
	sar eax, 10h
	mov ecx, [esp+28h]
	mov eax, dword dword_4D22E0[eax*4]
	mov [ecx], eax
	mov eax, [esp+90h]
	mov dword [eax], 83h
	mov eax, [esp+88h]
	mov [eax], esi
	mov eax, dword dword_512FE8[edx]
	sar eax, 10h
	mov ecx, [esp+0A0h]
	mov eax, dword dword_4D22E0[eax*4]
	mov [ecx], eax
	mov eax, [esp+94h]
	mov dword [eax], 86h
	mov eax, [esp+2Ch]
	mov [eax], esi
	mov eax, dword dword_512FF8[edx]
	sar eax, 10h
	mov ecx, [esp+9Ch]
	mov eax, dword dword_4D2304[eax*4]
	mov [ecx], eax
	mov eax, [esp+84h]
	mov dword [ebp+0], 85h
	mov [eax], esi
	mov eax, dword dword_513008[edx]
	sar eax, 10h
	mov ecx, [esp+8Ch]
	mov eax, dword dword_4D22F8[eax*4]
	jmp loc_406E0F

loc_406F47:
	xor ebx, ebx
	mov [esp+74h], ebx
	jmp loc_406129

loc_406F52:
	cmp byte [byte_512DF6], 2
	jnz loc_406F6C
	mov eax, 7
	sub eax, edi
	inc eax
	mov [esp+74h], eax
	jmp loc_406129

loc_406F6C:
	xor eax, eax
	mov al, byte [byte_512DF6]
	mov [esp+74h], eax
	jmp loc_406129

loc_406F7C:
	mov eax, 8 ; jumptable 00406100 case 1
	sub eax, edi
	mov [esp+74h], eax
	jmp loc_406129

loc_406F8C:
	mov eax, 9 ; jumptable 00406100 case 2
	sub eax, edi
	mov [esp+74h], eax
	jmp loc_406129

loc_406F9C:
	mov ah, byte [byte_512DF5]
	cmp ah, 0Bh
	ja loc_40615A
	xor ebx, ebx
	mov bl, ah
	jmp loc_40616B

loc_406FB4:
	inc dword [esp+78h]
	jmp loc_4061FB

loc_406FBD:
	cmp dh, 0Dh
	jnz loc_406FCC
	mov eax, 0Dh
	jmp loc_406243

loc_406FCC:
	mov eax, 0Eh
	jmp loc_406243

loc_406FD6:
	xor eax, eax
	mov al, byte [byte_512DF5]
	jmp loc_406243

loc_406FE2:
	dec edi
	jmp loc_4062CC

loc_406FE8:
	call sub_40764C
	jmp loc_4062E0

loc_406FF2:
	mov edi, 4
	jmp loc_4062F5

loc_406FFC:
	call sub_40764C
	mov edx, eax
	jmp loc_40632D

loc_407008:
	call sub_407830
	mov edx, eax
	jmp loc_406379

loc_407014:
	mov edx, 1
	jmp loc_4063D1

loc_40701E:
	mov eax, 23h
	jmp loc_4063E3

loc_407028:
	mov eax, 24h
	jmp loc_40640D

loc_407032:
	mov eax, 2Fh
	jmp loc_406514

loc_40703C:
	mov eax, 30h
	jmp loc_40653C

loc_407046:
	cmp byte [byte_512DBB], 0
	jz loc_40714A
	mov eax, 24h

loc_407058:
	mov [ecx], eax
	mov eax, dword [dword_512E0C]
	call sub_4071D0
	mov [ecx+4], eax
	add ecx, 4
	mov ah, byte [byte_512DBB]
	add ecx, 4
	test ah, ah
	jz loc_407154
	mov eax, 23h

loc_407080:
	mov [ecx], eax
	add ecx, 4
	mov eax, dword [dword_512E10]
	add ecx, 4
	call sub_4071D0
	mov [ecx-4], eax
	mov dword [ecx], 25h
	add ecx, 4
	add ecx, 4
	mov eax, dword [dword_512E14]
	mov [ecx-4], eax
	mov dword [ecx], 26h
	add ecx, 4
	add ecx, 4
	mov eax, dword [dword_512E18]
	mov [ecx-4], eax
	mov dword [ecx], 52h
	add ecx, 4
	add ecx, 4
	mov eax, dword [dword_512E1C]
	mov [ecx-4], eax
	mov dword [ecx], 53h
	add ecx, 4
	add ecx, 4
	mov eax, dword [dword_512E20]
	mov [ecx-4], eax
	mov dword [ecx], 2Bh
	add ecx, 4
	add ecx, 4
	mov eax, dword [dword_512E24]
	mov [ecx-4], eax
	mov dword [ecx], 2Ch
	add ecx, 4
	add ecx, 4
	mov eax, dword [dword_512E28]
	mov [ecx-4], eax
	mov dword [ecx], 2Dh
	add ecx, 4
	add ecx, 4
	mov eax, dword [dword_512E2C]
	mov [ecx-4], eax
	mov dword [ecx], 2Eh
	add ecx, 4
	add ecx, 4
	mov eax, dword [dword_512E30]
	mov edx, 57h
	mov [ecx-4], eax
	mov eax, 4
	mov dword [ecx], 28h
	jmp loc_406601

loc_40714A:
	mov eax, 23h
	jmp loc_407058

loc_407154:
	mov eax, 24h
	jmp loc_407080
;sub_405DD4 endp

sub_407160: ;SUBROUTINE
	push ecx
	push esi
	push edi
	sub esp, 20h
	mov ecx, 8
	mov edi, esp
	mov esi, dword_405D8C
	rep movsd
	test ax, ax
	jl loc_40717F
	cmp ax, 8
	jle loc_407181

loc_40717F:
	xor eax, eax

loc_407181:
	cwde
	mov ax, [esp+eax*4]
	add esp, 20h
	pop edi
	pop esi
	pop ecx
	ret
;sub_407160 endp

sub_407190: ;SUBROUTINE
	mov al, byte [byte_512DAA]
	cmp al, 1
	jb loc_4071AB
	jbe loc_4071A5
	cmp al, 2
	jnz loc_4071AB
	mov eax, 2
	ret

loc_4071A5:
	mov eax, 4
	ret

loc_4071AB:
	xor eax, eax
	mov al, byte [byte_512DB8]
	ret
;sub_407190 endp

off_4071C0: dd loc_40720E
	dd loc_407220 ; jump table for switch statement
	dd loc_407262
	dd loc_407294

sub_4071D0: ;SUBROUTINE
	push ecx
	mov ecx, eax
	and eax, 0FFh
	cmp eax, 1
	jnz loc_40721C
	push edx
	push ebx
	mov edx, ecx
	mov eax, ecx
	and edx, 0FF0000h
	and eax, 0FF00h
	sar edx, 10h
	sar eax, 8
	mov bl, byte [byte_512E00]
	sub edx, eax
	cmp bl, 3
	ja loc_40720E ; jumptable 00407207 case 0
	and ebx, 0FFh ; switch 4 cases
	jmp off_4071C0[ebx*4] ; switch jump

loc_40720E:
	shl eax, 8 ; jumptable 00407207 case 0
	xor ch, ch
	and eax, 0FF00h
	or ecx, eax
	pop ebx
	pop edx

loc_40721C:
	mov eax, ecx
	pop ecx
	ret

loc_407220:
	test edx, edx ; jumptable 00407207 case 1
	jl loc_407242
	mov ebx, edx
	shl edx, 2
	sub edx, ebx
	sar edx, 2
	add eax, edx
	shl eax, 8
	xor ch, ch
	and eax, 0FF00h
	or ecx, eax
	pop ebx
	pop edx
	mov eax, ecx
	pop ecx
	ret

loc_407242:
	neg edx
	mov ebx, edx
	shl edx, 2
	sub edx, ebx
	sar edx, 2
	sub eax, edx
	shl eax, 8
	xor ch, ch
	and eax, 0FF00h
	or ecx, eax
	pop ebx
	pop edx
	mov eax, ecx
	pop ecx
	ret

loc_407262:
	test edx, edx ; jumptable 00407207 case 2
	jl loc_40727C
	sar edx, 1
	add eax, edx
	shl eax, 8
	xor ch, ch
	and eax, 0FF00h
	or ecx, eax
	pop ebx
	pop edx
	mov eax, ecx
	pop ecx
	ret

loc_40727C:
	neg edx
	sar edx, 1
	sub eax, edx
	shl eax, 8
	xor ch, ch
	and eax, 0FF00h
	or ecx, eax
	pop ebx
	pop edx
	mov eax, ecx
	pop ecx
	ret

loc_407294:
	test edx, edx ; jumptable 00407207 case 3
	jl loc_4072AF
	sar edx, 2
	add eax, edx
	shl eax, 8
	xor ch, ch
	and eax, 0FF00h
	or ecx, eax
	pop ebx
	pop edx
	mov eax, ecx
	pop ecx
	ret

loc_4072AF:
	neg edx
	sar edx, 2
	sub eax, edx
	shl eax, 8
	xor ch, ch
	and eax, 0FF00h
	or ecx, eax
	pop ebx
	pop edx
	mov eax, ecx
	pop ecx
	ret
;sub_4071D0 endp

sub_4072D0: ;SUBROUTINE
	push edx
	cmp byte [byte_512DA9], 4
	jnz loc_4072E7
	mov edx, dword [dword_513408]
	sar edx, 10h
	cmp eax, edx
	jl loc_407307

loc_4072E7:
	cmp byte [byte_512DAA], 2
	jnz loc_407307
	cmp dword [dword_4D76BC], 0
	jz loc_407307
	lea edx, [eax+eax]
	mov eax, dword [dword_4D76BC]
	mov ax, [edx+eax]
	pop edx
	ret

loc_407307:
	mov eax, 1
	pop edx
	ret
;sub_4072D0 endp

sub_407310: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	mov esi, dword [dword_4D76BC]
	mov ecx, eax
	mov eax, dword [dword_512264]
	cmp eax, 9
	jl loc_40735A
	nop

loc_407328:
	add ecx, 4
	xor edx, edx
	mov [ecx-4], eax

loc_407330:
	xor ebx, ebx
	mov bl, byte byte_513074[edx]
	cmp ebx, eax
	jg loc_407346
	mov edi, eax
	add ecx, 4
	sub edi, ebx
	mov [ecx-4], edi

loc_407346:
	inc edx
	cmp edx, 9
	jl loc_407330
	mov eax, ecx
	mov dword [dword_4D76BC], esi
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_40735A:
	jge loc_407328
	lea edx, [eax+eax]

loc_40735F:
	mov ebx, esi
	movsx ebx, word [edx+ebx]
	add edx, 2
	add eax, ebx
	cmp edx, 12h
	jl loc_40735F
	jmp loc_407328
;sub_407310 endp

sub_407380: ;SUBROUTINE
	push ecx
	push edx
	mov edx, eax
	add edx, 4
	mov dword [eax], 8
	xor eax, eax

loc_40738F:
	xor ecx, ecx
	add edx, 4
	mov cl, byte byte_512AD0[eax]
	inc eax
	mov [edx-4], ecx
	cmp eax, 8
	jl loc_40738F
	mov eax, edx
	pop edx
	pop ecx
	ret
;sub_407380 endp

sub_4073B0: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 28h
	lea esi, [eax+4]
	lea ecx, [eax+8]
	lea ebx, [eax+0Ch]
	cmp byte [byte_4D1FE8], 0
	jnz loc_407574
	mov dword [eax], 7Bh
	xor eax, eax
	mov [esi], edx
	mov al, byte [byte_512DBF]

loc_4073DD:
	mov [ecx], eax
	mov eax, ebx
	mov dword [eax], 7Dh
	add eax, 4
	add eax, 4
	xor ecx, ecx
	mov [eax-4], edx
	add eax, 4
	mov cl, byte [byte_512DC0]
	mov [eax-4], ecx
	mov dword [eax], 7Eh
	xor ecx, ecx
	mov [eax+4], edx
	mov cl, byte [byte_512DBF]
	add eax, 4
	mov cl, byte byte_512DC1[ecx]
	add eax, 4
	add eax, 4
	and ecx, 0FFh
	mov [eax-4], ecx
	mov dword [eax], 7Ch
	add eax, 4
	add eax, 4
	lea ecx, [eax+8]
	lea ebx, [ecx+4]
	mov [esp], ebx
	lea ebx, [ecx+8]
	mov [esp+8], ebx
	lea ebx, [ecx+0Ch]
	mov [esp+0Ch], ebx
	lea ebx, [ecx+10h]
	mov [esp+24h], ebx
	lea ebx, [ecx+14h]
	lea esi, [ecx+18h]
	lea edi, [ecx+1Ch]
	lea ebp, [ecx+20h]
	mov [esp+4], esi
	lea esi, [ecx+24h]
	mov [esp+1Ch], esi
	lea esi, [ecx+28h]
	mov [esp+20h], esi
	lea esi, [ecx+2Ch]
	mov [eax-4], edx
	mov [esp+10h], esi
	lea esi, [ecx+30h]
	mov dword [eax], 1
	mov [esp+14h], esi
	lea esi, [ecx+34h]
	add eax, 4
	mov [esp+18h], esi
	lea esi, [ecx+38h]
	cmp byte [byte_512DAA], 0
	jz loc_407588
	mov dword [eax], 82h
	mov [ecx], edx
	mov ecx, [esp]
	mov eax, dword [dword_4D22E0]
	mov [ecx], eax
	mov eax, [esp+8]
	mov dword [eax], 83h
	mov eax, [esp+0Ch]
	mov [eax], edx
	mov ecx, [esp+24h]
	mov eax, dword [dword_4D22E0]
	mov [ecx], eax
	mov eax, [esp+4]
	mov dword [ebx], 84h
	mov [eax], edx
	mov eax, dword [dword_4D22F0]
	mov [edi], eax
	mov eax, [esp+1Ch]
	mov dword [ebp+0], 85h
	mov [eax], edx
	mov ecx, [esp+20h]
	mov eax, dword [dword_4D22FC]
	mov [ecx], eax
	mov eax, [esp+10h]
	mov dword [eax], 86h
	mov eax, [esp+14h]
	mov [eax], edx
	mov ecx, [esp+18h]
	mov eax, dword [dword_4D2308]

loc_407511:
	mov [ecx], eax
	mov eax, esi
	mov dword [eax], 7Fh
	add eax, 4
	add eax, 4
	xor ecx, ecx
	mov [eax-4], edx
	add eax, 4
	mov cl, byte [byte_512DD6]
	mov [eax-4], ecx
	mov dword [eax], 80h
	add eax, 4
	add eax, 4
	xor ecx, ecx
	mov [eax-4], edx
	add eax, 4
	mov cl, byte [byte_512DD8]
	mov [eax-4], ecx
	mov dword [eax], 81h
	add eax, 4
	mov [eax], edx
	add eax, 4
	xor edx, edx
	add eax, 4
	mov dl, byte [byte_512DD9]
	mov [eax-4], edx
	add esp, 28h
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_407574:
	mov dword [eax], 7Bh
	xor eax, eax
	mov [esi], edx
	mov al, byte [byte_4D1FE8]
	jmp loc_4073DD

loc_407588:
	mov dword [eax], 82h
	xor eax, eax
	mov [ecx], edx
	mov al, byte [byte_512DD3]
	mov ecx, [esp]
	mov eax, dword dword_4D22E0[eax*4]
	mov [ecx], eax
	mov eax, [esp+8]
	mov dword [eax], 83h
	mov eax, [esp+0Ch]
	mov [eax], edx
	xor eax, eax
	mov al, byte [byte_512DD4]
	mov ecx, [esp+24h]
	mov eax, dword dword_4D22E0[eax*4]
	mov [ecx], eax
	mov eax, [esp+4]
	mov dword [ebx], 84h
	mov [eax], edx
	xor eax, eax
	mov al, byte [byte_512DD2]
	mov eax, dword dword_4D22EC[eax*4]
	mov [edi], eax
	mov eax, [esp+1Ch]
	mov dword [ebp+0], 85h
	mov [eax], edx
	xor eax, eax
	mov al, byte [byte_512DD7]
	mov ecx, [esp+20h]
	mov eax, dword dword_4D22F8[eax*4]
	mov [ecx], eax
	mov eax, [esp+10h]
	mov dword [eax], 86h
	mov eax, [esp+14h]
	mov [eax], edx
	xor eax, eax
	mov al, byte [byte_512DD5]
	mov ecx, [esp+18h]
	mov eax, dword dword_4D2304[eax*4]
	jmp loc_407511
;sub_4073B0 endp

off_407630: dd loc_40766C
	dd loc_407685 ; jump table for switch statement
	dd loc_40769E
	dd loc_4076B7
	dd loc_4076D0
	dd loc_4076E9
	dd loc_407702

sub_40764C: ;SUBROUTINE
	push edx
	mov dl, byte [byte_512DB0]
	dec dl
	mov eax, 12h
	cmp dl, 6
	ja loc_407683
	and edx, 0FFh ; switch 7 cases
	jmp off_407630[edx*4] ; switch jump

loc_40766C:
	xor eax, eax ; jumptable 00407665 case 0
	mov al, byte [byte_4D22A8]
	call sub_407720
	mov al, byte byte_4D22A9[eax]
	and eax, 0FFh

loc_407683:
	pop edx
	ret

loc_407685:
	xor eax, eax ; jumptable 00407665 case 1
	mov al, byte [byte_4D22D3]
	call sub_407720
	mov al, byte byte_4D22D4[eax]
	and eax, 0FFh
	pop edx
	ret

loc_40769E:
	xor eax, eax ; jumptable 00407665 case 2
	mov al, byte [byte_4D22B1]
	call sub_407720
	mov al, byte byte_4D22B2[eax]
	and eax, 0FFh
	pop edx
	ret

loc_4076B7:
	xor eax, eax ; jumptable 00407665 case 3
	mov al, byte [byte_4D22BA]
	call sub_407720
	mov al, byte byte_4D22BB[eax]
	and eax, 0FFh
	pop edx
	ret

loc_4076D0:
	xor eax, eax ; jumptable 00407665 case 4
	mov al, byte [byte_4D22C6]
	call sub_407720
	mov al, byte byte_4D22C7[eax]
	and eax, 0FFh
	pop edx
	ret

loc_4076E9:
	xor eax, eax ; jumptable 00407665 case 5
	mov al, byte [byte_4D22CD]
	call sub_407720
	mov al, byte byte_4D22CE[eax]
	and eax, 0FFh
	pop edx
	ret

loc_407702:
	xor eax, eax ; jumptable 00407665 case 6
	mov al, byte [byte_4D22D9]
	call sub_407720
	mov al, byte byte_4D22DA[eax]
	and eax, 0FFh
	pop edx
	ret
;sub_40764C endp

sub_407720: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	mov ecx, eax
	mov bl, byte [byte_50B480]
	xor edx, edx
	mov dl, bl
	mov dl, byte byte_4D5A49[edx]
	and edx, 0FFh
	mov eax, edx
	sar edx, 1Fh
	idiv ecx
	inc bl
	mov ah, byte byte_4E551A[edx]
	mov byte [byte_50B480], bl
	test ah, ah
	jz loc_407768

loc_407754:
	inc edx
	mov eax, edx
	sar edx, 1Fh
	idiv ecx
	cmp byte byte_4E551A[edx], 0
	jnz loc_407754
	lea eax, [eax+0]

loc_407768:
	mov bh, 1
	mov eax, edx
	mov byte byte_4E551A[edx], bh
	pop edx
	pop ecx
	pop ebx
	ret
;sub_407720 endp

sub_407780: ;SUBROUTINE
	push edx
	xor eax, eax

loc_407783:
	inc eax
	xor dl, dl
	mov byte byte_4E5519[eax], dl
	cmp eax, 0Bh
	jl loc_407783
	pop edx
	ret
;sub_407780 endp

sub_4077A0: ;SUBROUTINE
	push edx
	cmp byte [byte_512DA9], 4
	jnz loc_4077BA
	mov dh, byte [byte_512DAA]
	cmp dh, 1
	jz loc_4077D3
	cmp dh, 2
	jz loc_4077D3

loc_4077BA:
	cmp byte [byte_512DAA], 1
	jnz loc_4077D5
	add eax, dword [dword_512DA4]

loc_4077C9:
	cmp eax, 0Bh
	jl loc_4077D3
	sub eax, 0Bh
	jmp loc_4077C9

loc_4077D3:
	pop edx
	ret

loc_4077D5:
	cmp byte [byte_512DA9], 1
	ja loc_4077C9
	add eax, dword [dword_4D76CC]
	jmp loc_4077C9
;sub_4077A0 endp

sub_4077F0: ;SUBROUTINE
	push ebx
	push ecx
	mov cl, byte byte_4D407D[eax*2]
	and ecx, 0FFh
	test ecx, ecx
	jle loc_40781A

loc_407803:
	xor ebx, ebx
	inc edx
	mov bl, byte byte_4D407C[eax*2]
	mov eax, edx
	sar edx, 1Fh
	idiv ecx
	lea eax, [ebx+edx]
	pop ecx
	pop ebx
	ret

loc_40781A:
	mov ecx, 1
	jmp loc_407803
;sub_4077F0 endp

sub_407830: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	sub esp, 10h
	mov edi, esp
	mov bl, byte [byte_50B480]
	xor edx, edx
	mov esi, dword_405D7C
	mov dl, bl
	movsd
	movsd
	movsd
	movsd
	mov dl, byte byte_4D5A49[edx]
	and edx, 0FFh
	mov ecx, 10h
	mov eax, edx
	sar edx, 1Fh
	idiv ecx
	inc bl
	xor eax, eax
	mov byte [byte_50B480], bl
	mov al, [esp+edx]
	add esp, 10h
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_407830 endp

sub_407880: ;SUBROUTINE
	push esi
	push edi
	mov esi, eax
	mov edi, edx
	mov ah, byte [byte_512DAA]
	test ah, ah
	jnz loc_4078F4

loc_407890:
	mov dl, byte [byte_512DF5]
	cmp dl, 0Eh
	jnz loc_40797B

loc_40789F:
	mov dword [dword_4D22A4], 2

loc_4078A9:
	cmp esi, 0Ah
	jle loc_4078B3
	mov esi, 0Ah

loc_4078B3:
	mov edx, dword [dword_4D22A4]
	lea eax, [esi+esi]
	cmp edx, 2
	jnz loc_407A6F
	mov edx, dword dword_4D2266[eax]
	sar edx, 10h
	mov [edi], edx
	mov edx, dword dword_4D227C[eax]
	sar edx, 10h
	mov [ebx], edx
	cmp byte [byte_512DAA], 2
	jnz loc_407A63
	mov eax, dword dword_4D2292[eax]
	sar eax, 10h
	pop edi
	pop esi
	ret

loc_4078F4:
	cmp ah, 3
	jz loc_407890
	mov dh, byte [byte_512DA9]
	cmp dh, 1
	jz loc_40799B
	cmp dh, 4
	jnz loc_4079F7

loc_407911:
	push ecx
	cmp byte [byte_512DAA], 2
	jz loc_407A15

loc_40791F:
	xor eax, eax
	xor ecx, ecx
	xor edx, edx
	mov dword [dword_4D22A4], eax

loc_40792A:
	mov eax, dword [dword_513408]
	sar eax, 10h
	cmp ecx, eax
	jge loc_407A22
	mov eax, dword dword_512F98[edx]
	sar eax, 10h
	call sub_407BE0
	test eax, eax
	jz loc_40795F
	cmp dword [dword_4D22A4], 0
	jnz loc_40795F
	mov dword [dword_4D22A4], 1

loc_40795F:
	mov eax, dword dword_512F98[edx]
	sar eax, 10h
	call sub_407BB0
	test eax, eax
	jnz loc_407A33
	inc ecx
	add edx, 2
	jmp loc_40792A

loc_40797B:
	cmp dl, 0Dh
	jnz loc_40798F
	mov dword [dword_4D22A4], 1
	jmp loc_4078A9

loc_40798F:
	xor eax, eax
	mov dword [dword_4D22A4], eax
	jmp loc_4078A9

loc_40799B:
	xor eax, eax
	mov al, byte [byte_512DBF]
	inc esi
	call sub_407BB0
	test eax, eax
	jnz loc_40789F
	mov al, byte [byte_512DDA]
	call sub_407BB0
	test eax, eax
	jnz loc_40789F
	mov al, byte [byte_512DBF]
	call sub_407BE0
	test eax, eax
	jz loc_4079DF

loc_4079D0:
	mov dword [dword_4D22A4], 1
	jmp loc_4078A9

loc_4079DF:
	mov al, byte [byte_512DDA]
	call sub_407BE0
	test eax, eax
	jnz loc_4079D0

loc_4079ED:
	mov dword [dword_4D22A4], eax
	jmp loc_4078A9

loc_4079F7:
	cmp dh, 2
	jz loc_407911
	xor eax, eax
	mov al, byte [byte_512DBF]
	call sub_407BB0
	test eax, eax
	jz loc_407A46
	jmp loc_40789F

loc_407A15:
	cmp byte [byte_512DB0], 0
	jz loc_40791F

loc_407A22:
	mov eax, dword [dword_513408]
	sar eax, 10h
	dec eax
	add esi, eax
	pop ecx
	jmp loc_4078A9

loc_407A33:
	mov dword [dword_4D22A4], 2
	inc ecx
	add edx, 2
	jmp loc_40792A

loc_407A46:
	mov al, byte [byte_512DBF]
	call sub_407BE0
	test eax, eax
	jz loc_4079ED
	mov dword [dword_4D22A4], 1
	jmp loc_4078A9

loc_407A63:
	mov eax, dword dword_4D2258[eax]
	sar eax, 10h
	pop edi
	pop esi
	ret

loc_407A6F:
	cmp edx, 1
	jnz loc_407AAB
	mov edx, dword dword_4D221C[eax]
	sar edx, 10h
	mov [edi], edx
	mov edx, dword dword_4D2232[eax]
	sar edx, 10h
	mov [ebx], edx
	cmp byte [byte_512DAA], 2
	jnz loc_407A9F
	mov eax, dword dword_4D2248[eax]
	sar eax, 10h
	pop edi
	pop esi
	ret

loc_407A9F:
	mov eax, dword dword_4D220E[eax]
	sar eax, 10h
	pop edi
	pop esi
	ret

loc_407AAB:
	mov edx, dword dword_4D21D2[eax]
	sar edx, 10h
	mov [edi], edx
	mov edx, dword dword_4D21E8[eax]
	sar edx, 10h
	mov [ebx], edx
	cmp byte [byte_512DAA], 2
	jnz loc_407AD6
	mov eax, dword dword_4D21FE[eax]
	sar eax, 10h
	pop edi
	pop esi
	ret

loc_407AD6:
	mov eax, dword dword_4D21C4[eax]
	sar eax, 10h
	pop edi
	pop esi
	ret
;sub_407880 endp

sub_407AF0: ;SUBROUTINE
	push edx
	mov dl, byte [byte_512F43]
	cmp dl, 2
	jz loc_407B08
	cmp dl, 1
	jnz loc_407B0F
	call sub_407BE0
	pop edx
	ret

loc_407B08:
	call sub_407BB0
	pop edx
	ret

loc_407B0F:
	call sub_407C10
	pop edx
	ret
;sub_407AF0 endp

sub_407B20: ;SUBROUTINE
	push ebx
	push edx
	xor edx, edx
	mov dl, byte [byte_512DB0]
	add edx, edx
	mov bx, word word_4D21B4[edx]
	cmp bx, 2
	jz loc_407B47
	cmp bx, 1
	jnz loc_407B4F
	call sub_407BE0
	pop edx
	pop ebx
	ret

loc_407B47:
	call sub_407BB0
	pop edx
	pop ebx
	ret

loc_407B4F:
	call sub_407C10
	pop edx
	pop ebx
	ret
;sub_407B20 endp

sub_407B60: ;SUBROUTINE
	xor eax, eax
	mov al, byte [byte_512DB0]
	mov al, byte word_4D21B4[eax*2]
	mov byte [byte_512F43], al
	ret
;sub_407B60 endp

sub_407B80: ;SUBROUTINE
	push edx
	mov edx, eax
	call sub_407C10
	test eax, eax
	jz loc_407B90
	xor eax, eax
	pop edx
	ret

loc_407B90:
	mov eax, edx
	call sub_407BE0
	test eax, eax
	jz loc_407BA2
	mov eax, 1
	pop edx
	ret

loc_407BA2:
	mov eax, 2
	pop edx
	ret
;sub_407B80 endp

sub_407BB0: ;SUBROUTINE
	cmp eax, 2
	jz loc_407BC9
	cmp eax, 0Ah
	jz loc_407BC9
	cmp eax, 5
	jz loc_407BC9
	cmp eax, 8
	jz loc_407BC9
	cmp eax, 0Eh
	jnz loc_407BCF

loc_407BC9:
	mov eax, 1
	ret

loc_407BCF:
	xor eax, eax
	ret
;sub_407BB0 endp

sub_407BE0: ;SUBROUTINE
	cmp eax, 6
	jz loc_407BF9
	cmp eax, 4
	jz loc_407BF9
	cmp eax, 9
	jz loc_407BF9
	cmp eax, 0Bh
	jz loc_407BF9
	cmp eax, 0Dh
	jnz loc_407BFF

loc_407BF9:
	mov eax, 1
	ret

loc_407BFF:
	xor eax, eax
	ret
;sub_407BE0 endp

sub_407C10: ;SUBROUTINE
	test eax, eax
	jz loc_407C28
	cmp eax, 3
	jz loc_407C28
	cmp eax, 7
	jz loc_407C28
	cmp eax, 1
	jz loc_407C28
	cmp eax, 0Ch
	jnz loc_407C2E

loc_407C28:
	mov eax, 1
	ret

loc_407C2E:
	xor eax, eax
	ret
;sub_407C10 endp

sub_407C40: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	sub esp, 4E78h
	mov si, word [dword_512264]
	mov dx, word [dword_512268]
	mov eax, esp
	add esi, edx
	xor ebx, ebx
	movsx edx, si
	xor ecx, ecx
	call sub_41A570
	xor edx, edx
	xor eax, eax

loc_407C6D:
	movsx edi, si
	cmp ecx, edi
	jl loc_407D63
	cmp dword [dword_512208], 1
	jle loc_407D8E
	mov edx, dword [dword_4D76BC]
	xor eax, eax

loc_407C8D:
	mov cx, [edx+eax]
	add eax, 2
	add ebx, ecx
	cmp eax, 12h
	jnz loc_407C8D
	nop

loc_407C9C:
	cmp bx, 1
	jge loc_407CA7
	mov ebx, 1

loc_407CA7:
	mov ecx, dword [dword_512208]
	cmp ecx, 2
	jl loc_407D96

loc_407CB6:
	movsx eax, bx
	movsx ecx, si
	lea edx, [eax+1]
	cmp ecx, edx
	jle loc_407DB5
	lea ebx, [esp+4E60h]
	lea edx, [esp+4E30h]
	mov di, [esp+eax*2+4E60h]
	mov eax, ecx
	call sub_41B2D0
	mov eax, [esp+ecx*2+4E5Ch]
	sar eax, 10h
	imul eax, 684h
	mov edx, [esp+eax+234h]
	movsx eax, di
	imul eax, 684h
	xor ebx, ebx
	add edx, 2EE00h
	xor ecx, ecx
	mov [esp+eax+234h], edx
	mov edx, 3E8h
	xor eax, eax

loc_407D1C:
	movsx edi, si
	cmp ecx, edi
	jl loc_407DE2
	lea ebx, [esp+4E60h]
	lea edx, [esp+4E30h]
	mov eax, edi
	call sub_41B2D0
	xor ebx, ebx
	xor edi, edi

loc_407D40:
	movsx eax, si
	cmp ebx, eax
	jge loc_407DB5
	xor eax, eax
	xor ecx, ecx

loc_407D4B:
	mov edx, [esp+eax+4E5Eh]
	sar edx, 10h
	inc ecx
	cmp edx, ebx
	jz loc_407E29
	add eax, 2
	jmp loc_407D4B

loc_407D63:
	mov edi, [esp+eax+234h]
	mov [esp+edx+4E30h], edi
	mov edi, [esp+eax+278h]
	add edx, 4
	add eax, 684h
	mov [esp+edi*2+4E5Eh], cx
	inc ecx
	jmp loc_407C6D

loc_407D8E:
	mov ebx, esi
	dec ebx
	jmp loc_407C9C

loc_407D96:
	cmp dword [dword_512264], 2
	jl loc_407DA8
	cmp ecx, 1
	jnz loc_407CB6

loc_407DA8:
	cmp dword [dword_512264], 3
	jge loc_407CB6

loc_407DB5:
	xor eax, eax
	xor edx, edx

loc_407DB9:
	movsx ecx, si
	cmp edx, ecx
	jge loc_407E3C
	mov ecx, dword [dword_4D5EF8]
	lea ebx, [ecx+eax]
	inc edx
	mov ecx, [esp+eax+278h]
	add eax, 684h
	mov [ebx+278h], ecx
	jmp loc_407DB9

loc_407DE2:
	mov edi, [esp+eax+21Ch]
	cmp dword [edi], 24h
	jz loc_407E10

loc_407DEE:
	add edx, 3E8h
	add ebx, 4
	mov edi, [esp+eax+234h]
	add eax, 684h
	inc ecx
	mov [esp+ebx+4E2Ch], edi
	jmp loc_407D1C

loc_407E10:
	cmp dword [esp+eax+234h], 0
	jg loc_407DEE
	lea edi, [edx+186A0h]
	mov [esp+eax+234h], edi
	jmp loc_407DEE

loc_407E29:
	add edi, 684h
	inc ebx
	mov [esp+edi-40Ch], ecx
	jmp loc_407D40

loc_407E3C:
	add esp, 4E78h
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_407C40 endp

sub_407E50: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	mov edi, dword [dword_4D5EF8]
	xor eax, eax
	mov edx, 1
	mov al, byte [byte_512DFB]
	call sub_4030A0
	mov edx, 10h
	mov ecx, dword [dword_4DAB84]
	mov dword [dword_4DAB84], edx
	call sub_486F1C
	mov edx, dword [dword_4DAB88]
	mov eax, edx
	mov esi, 1
	or al, 4
	xor ebx, ebx
	mov dword [dword_4DAB88], eax
	call sub_408260
	call sub_408260
	call sub_428990
	call sub_47D410
	mov dword [dword_512214], ebx
	call sub_445A60
	mov bl, byte [byte_512DB8]
	call sub_407190
	mov byte [byte_512DB8], al
	mov eax, off_4D3D90
	mov dword [dword_4D2310], esi
	call sub_40F5C0
	mov ebp, eax
	mov byte [byte_512DB8], bl
	xor eax, eax
	xor ebx, ebx
	mov dword [dword_4D2310], eax
	call sub_408BF0
	call sub_4762E0
	mov dword [dword_4D21AC], ebx
	call sub_403080
	call sub_4761E0
	call sub_423C40
	mov edi, dword [dword_4D5EF8]
	mov dword [dword_4DAB84], ecx
	mov dword [dword_4DAB88], edx
	test edi, edi
	jz loc_407FCF
	cmp dword [dword_512214], 0
	jnz loc_407FCF
	cmp dword [dword_5121F8], 2
	jnz loc_407F98
	mov edx, dword [dword_512268]
	mov esi, dword [dword_512264]
	xor eax, eax
	add esi, edx
	mov edx, 9

loc_407F4D:
	inc eax
	mov byte byte_513073[eax], dl
	cmp eax, 9
	jl loc_407F4D
	mov ecx, dword [dword_512208]
	mov dword [dword_4D5EF8], edi
	cmp ecx, 2
	jl loc_407F6F
	call sub_407C40

loc_407F6F:
	mov edi, dword [dword_4D5EF8]
	xor eax, eax
	test esi, esi
	jle loc_407F98
	mov ecx, edi
	xor edx, edx

loc_407F7F:
	inc eax
	mov bl, [ecx+edx+278h]
	add edx, 684h
	mov byte byte_513073[eax], bl
	cmp eax, esi
	jl loc_407F7F
	nop

loc_407F98:
	cmp byte [byte_512DAA], 1
	jnz loc_407FC0
	mov ecx, edi
	xor edx, edx
	xor eax, eax

loc_407FA7:
	inc eax
	mov bl, [ecx+edx+278h]
	add edx, 684h
	mov byte byte_512ACF[eax], bl
	cmp eax, 8
	jl loc_407FA7

loc_407FC0:
	mov eax, edi
	mov dword [dword_4D5EF8], edi
	call sub_4848FC
	xor edi, edi

loc_407FCF:
	mov ebx, dword [dword_4D76B8]
	mov dword [dword_4D5EF8], edi
	test ebx, ebx
	jz loc_407FFE
	cmp word [ebx+2C0h], 6
	jle loc_407FFE
	cmp dword [dword_512214], 2
	jz loc_407FFE
	call sub_41A350
	xor eax, eax
	mov dword [dword_4D76B8], eax

loc_407FFE:
	call sub_4289F0
	mov edi, dword [dword_4D5EF8]
	mov eax, ebp
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_407E50 endp

sub_408020: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	mov edx, sub_4242E0
	mov ebp, 10h
	mov edi, dword [dword_4DAB84]
	xor ah, ah
	xor ebx, ebx
	mov dword [off_4DAC4C], edx
	mov byte [byte_4D1FE8], ah
	mov byte [byte_4D1FE9], ah
	mov dword [dword_4E5508], ebx
	mov dword [dword_4E5514], ebx
	mov dword [dword_4E5510], ebx
	mov dword [dword_4E550C], ebx
	mov dword [dword_4E5504], ebx
	mov dword [dword_4E5500], ebx
	mov dword [dword_4E54F8], ebx
	mov dword [dword_4E54FC], ebx
	mov dword [dword_4DAB84], ebp
	call sub_486F1C
	mov esi, dword [dword_4DAB88]
	mov eax, esi
	or al, 4
	mov dword [dword_4DAB88], eax
	call sub_445A60
	call sub_408260
	mov eax, 11h
	xor edx, edx
	call sub_421FA0
	xor eax, eax
	call sub_422060
	call sub_408260
	call sub_428990
	cmp dword [dword_4D21B0], 0
	jnz loc_4081E2

loc_4080CA:
	xor eax, eax
	xor edx, edx
	mov al, byte [byte_512DFB]
	call sub_4030A0
	cmp byte [byte_512DAA], 2
	jnz loc_40821B
	cmp dword [dword_4D76BC], 0
	jnz loc_40821B
	xor ah, ah
	mov byte [byte_512DAA], ah

loc_4080FA:
	mov cl, byte [byte_50B480]
	xor edx, edx
	mov dl, cl
	mov dl, byte byte_4D5A49[edx]
	and edx, 0FFh
	mov ebx, 0Bh
	mov eax, edx
	sar edx, 1Fh
	idiv ebx
	inc cl
	mov byte [byte_50B480], cl
	mov eax, off_4D3EC4
	mov dword [dword_4D76CC], edx
	call sub_40F5C0 ;Funkcja menu
	mov ecx, eax

loc_408136:
	xor eax, eax
	mov al, byte [byte_512DB0]
	xor ebp, ebp
	call sub_41AE70
	mov dword [dword_512DB4], eax
	call sub_403080
	call sub_4762E0
	mov dword [dword_4D21AC], ebp
	call sub_408BF0
	call sub_423C40
	mov dword [dword_4DAB84], edi
	mov dword [dword_4DAB88], esi
	call sub_4761E0
	cmp byte [byte_512DAA], 1
	jnz loc_408199
	cmp dword [dword_4D76B8], 0
	jnz loc_408199
	cmp dword [dword_512214], 2
	jz loc_408199
	call sub_41A370
	call sub_41A490

loc_408199:
	mov ebx, dword [dword_4D231C]
	test ebx, ebx
	jz loc_4081B2
	mov eax, ebx
	xor esi, esi
	call sub_4848FC
	mov dword [dword_4D231C], esi

loc_4081B2:
	mov edi, dword [dword_4D2320]
	test edi, edi
	jz loc_4081CB
	mov eax, edi
	xor ebp, ebp
	call sub_4848FC
	mov dword [dword_4D2320], ebp

loc_4081CB:
	mov eax, dword [dword_4D2324]
	test eax, eax
	jnz loc_40823D
	call sub_4289F0
	mov eax, ecx
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4081E2:
	xor edx, edx
	mov dword [dword_4D21B0], edx
	call sub_4083D0
	cmp byte [byte_512ECC], 0
	jnz loc_40820C
	call sub_476250
	mov eax, aTitleav_dct ; "titleav.dct"
	call sub_4242F0
	call sub_4769D0

loc_40820C:
	call sub_408450
	call sub_486F28
	jmp loc_4080CA

loc_40821B:
	cmp byte [byte_512DAA], 2
	jnz loc_40822B
	call sub_4082B4
	mov ecx, eax

loc_40822B:
	cmp byte [byte_512DAA], 2
	jnz loc_4080FA
	jmp loc_408136

loc_40823D:
	xor edx, edx
	call sub_4848FC
	mov dword [dword_4D2324], edx
	call sub_4289F0
	mov eax, ecx
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_408020 endp

sub_408260: ;SUBROUTINE
	call sub_428A20
	mov eax, 0FF000000h
	call sub_48266C
	call sub_482740
	call sub_4824BC
	call unknown_libname_4 ; Watcom v9-*1.5 32bit NT runtime
	mov eax, 0FF000000h
	call sub_48266C
	call sub_482740
	jmp sub_4824BC
;sub_408260 endp

off_4082A0: dd loc_4082D5
	dd loc_408325 ; jump table for switch statement
	dd loc_40832C
	dd loc_40832C
	dd loc_40832C

sub_4082B4: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	mov edx, dword [dword_4D76BC]
	mov al, byte [byte_512DA9]
	cmp al, 4
	ja loc_4082DA
	and eax, 0FFh ; switch 5 cases
	jmp off_4082A0[eax*4] ; switch jump

loc_4082D5:
	mov ebp, 1 ; jumptable 004082CE case 0

loc_4082DA:
	xor ecx, ecx
	test ebp, ebp
	jle loc_4082F3
	lea esi, [ebp+ebp+0]
	mov ebx, edx
	xor eax, eax

loc_4082E8:
	cmp word [ebx+eax], 0
	jz loc_40839B

loc_4082F3:
	cmp ecx, ebp
	jnz loc_4083B6
	mov dword [dword_4D76BC], edx
	test edx, edx
	jnz loc_4083AC

loc_408309:
	xor bl, bl
	xor edx, edx
	mov byte [byte_512DAA], bl
	mov eax, 0FFFFFFFDh
	mov dword [dword_4D76BC], edx
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_408325:
	mov ebp, 2 ; jumptable 004082CE case 1
	jmp loc_4082DA

loc_40832C:
	mov ebx, dword [dword_512264] ; jumptable 004082CE cases 2-4
	xor ecx, ecx
	test ebx, ebx
	jle loc_408346
	lea esi, [ebx+ebx]
	xor eax, eax
	mov ebx, edx

loc_40833F:
	cmp word [ebx+eax], 0
	jz loc_40837C

loc_408346:
	cmp ecx, dword [dword_512264]
	jnz loc_408386

loc_40834E:
	xor ebp, ebp

loc_408350:
	test ebp, ebp
	jle loc_4082DA
	mov edi, 24h
	lea ebx, [ebp+ebp+0]
	mov ecx, edx
	xor eax, eax

loc_408361:
	cmp word [ecx+eax], 0
	jnz loc_40836F
	mov word (dword_512F98+2)[eax], di

loc_40836F:
	add eax, 2
	cmp eax, ebx
	jge loc_4082DA
	jmp loc_408361

loc_40837C:
	add eax, 2
	inc ecx
	cmp eax, esi
	jl loc_40833F
	jmp loc_408346

loc_408386:
	cmp word [word_51345A], 0
	jnz loc_40834E
	mov ebp, dword [dword_513408]
	sar ebp, 10h
	jmp loc_408350

loc_40839B:
	add eax, 2
	inc ecx
	cmp eax, esi
	jl loc_4082E8
	jmp loc_4082F3

loc_4083AC:
	call sub_41A2A0
	jmp loc_408309

loc_4083B6:
	inc byte [byte_512DB0]
	mov eax, 0FFFFFFFDh
	mov dword [dword_4D76BC], edx
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_4082B4 endp

sub_4083D0: ;SUBROUTINE
	cmp byte [byte_512ECC], 0
	jnz loc_4083DA
	ret

loc_4083DA:
	push edx
	push ecx
	push ebx
	mov dl, byte [byte_4D3E2C]
	mov bl, byte [byte_4D3E68]
	mov cl, byte [byte_4D2FE0]
	mov eax, dword [off_4D26B0]
	or dl, 1
	or bl, 1
	or cl, 1
	mov byte [byte_4D3E2C], dl
	mov byte [byte_4D3E68], bl
	mov byte [byte_4D2FE0], cl
	mov dh, byte [byte_4D3E40]
	mov bh, byte [byte_4D3E7C]
	mov ch, [eax+8]
	or dh, 1
	or bh, 1
	or ch, 1
	mov byte [byte_4D3E40], dh
	mov byte [byte_4D3E7C], bh
	mov edx, 2
	mov [eax+8], ch
	mov word [word_4D3ECE], dx
	pop ebx
	pop ecx
	pop edx
	ret
;sub_4083D0 endp

sub_408450: ;SUBROUTINE
	push ecx
	push edx
	sub esp, 50h
	mov edx, dword [dword_5134B4]
	push edx
	push aStitle_qfs ; "%stitle.qfs"
	lea eax, [esp+8]
	push eax
	call sprintf_
	add esp, 0Ch
	xor edx, edx
	mov eax, esp
	call sub_488058
	mov dl, byte [byte_512ECC]
	mov ecx, eax
	test dl, dl
	jz loc_408499

loc_408483:
	push ebx
	xor ebx, ebx

loc_408486:
	call sub_405A60
	cmp eax, 0Dh
	jnz loc_4084A0

loc_408490:
	mov eax, ebx
	call sub_403550
	jmp loc_408486

loc_408499:
	call sub_408558
	jmp loc_408483

loc_4084A0:
	call sub_424240
	test eax, eax
	jnz loc_408490
	call sub_486F28
	cmp word [byte_4E5518], 0
	jnz loc_4084F5

loc_4084B8:
	call sub_4833C7
	xor edx, edx
	xor ebx, ebx

loc_4084C1:
	call sub_486E5C
	test eax, eax
	jnz loc_408505
	call sub_405A60
	cmp eax, 0Dh
	jz loc_408505
	call sub_424240
	test eax, eax
	jnz loc_408505
	cmp edx, 1F4h
	jge loc_408505
	call sub_4833C7
	add edx, eax
	mov eax, ebx
	call sub_403550
	jmp loc_4084C1

loc_4084F5:
	xor ebx, ebx
	mov word [byte_4E5518], bx
	call sub_408610
	jmp loc_4084B8

loc_408505:
	test ecx, ecx
	jnz loc_40851F

loc_408509:
	xor edx, edx
	pop ebx

loc_40850C:
	call sub_405A60
	cmp eax, 0Dh
	jnz loc_408528

loc_408516:
	mov eax, edx
	call sub_403550
	jmp loc_40850C

loc_40851F:
	mov eax, ecx
	call sub_4848FC
	jmp loc_408509

loc_408528:
	call sub_424240
	test eax, eax
	jnz loc_408516
	call sub_486F28
	add esp, 50h
	pop edx
	pop ecx
	ret
;sub_408450 endp

off_408540: dd loc_40858F
	dd loc_4085AD ; jump table for switch statement
	dd loc_4085B4
	dd loc_4085BB
	dd loc_4085C2
	dd loc_4085C9

sub_408558: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	mov ecx, eax
	mov edx, aBack ; "back"
	call sub_482EB4
	mov ebx, eax
	mov edx, eax
	call sub_428A20
	mov eax, ebx
	call sub_483470
	mov bl, byte [byte_512DFB]
	cmp bl, 5
	ja loc_4085D0
	and ebx, 0FFh ; switch 6 cases
	jmp off_408540[ebx*4] ; switch jump

loc_40858F:
	mov edx, aEngl ; jumptable 00408588 case 0

loc_408594:
	mov eax, ecx
	call sub_482EB4
	mov edx, eax
	mov eax, edx
	call sub_486D10
	call sub_428770
	pop edx
	pop ecx
	pop ebx
	ret

loc_4085AD:
	mov edx, aGerm ; jumptable 00408588 case 1
	jmp loc_408594

loc_4085B4:
	mov edx, aFren ; jumptable 00408588 case 2
	jmp loc_408594

loc_4085BB:
	mov edx, aSpan ; jumptable 00408588 case 3
	jmp loc_408594

loc_4085C2:
	mov edx, aItly ; jumptable 00408588 case 4
	jmp loc_408594

loc_4085C9:
	mov edx, aSwed ; jumptable 00408588 case 5
	jmp loc_408594

loc_4085D0:
	mov dword [dword_4DB1D8], aCNfs2seFront_0 ; "c:\\nfs2se\\frontend\\common\\Front.c"
	xor ecx, ecx
	mov cl, byte [byte_512DFB]
	push ecx
	mov ebx, 2C9h
	push aBugUnsupported ; "BUG: unsupported language <%d>\n"
	mov dword [dword_4DB1DC], ebx
	call sub_4840F0
	add esp, 8
	mov eax, edx
	call sub_486D10
	call sub_428770
	pop edx
	pop ecx
	pop ebx
	ret
;sub_408558 endp

sub_408610: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	sub esp, 48h
	mov edi, esp
	mov esi, dword_405D40
	movsd
	movsd
	movsw
	lea edi, [esp+0Ch]
	mov esi, word_405D4A
	movsd
	movsd
	movsw
	lea edi, [esp+18h]
	mov esi, dword_405D54
	movsd
	movsd
	movsw
	lea edi, [esp+24h]
	mov esi, word_405D5E
	movsd
	movsd
	movsw
	lea edi, [esp+30h]
	mov esi, dword_405D68
	movsd
	movsd
	movsw
	mov ah, 2
	lea edi, [esp+3Ch]
	mov esi, word_405D72
	mov byte [byte_512ECD], ah
	movsd
	movsd
	movsw
	call sub_4879D0
	mov edx, dword [dword_4DABA4]
	mov ecx, 4
	test edx, edx
	jnz loc_4086D6

loc_408680:
	mov dl, [esp+ecx*2]
	mov byte [byte_512ECE], dl
	mov dl, [esp+ecx*2+0Ch]
	mov eax, [esp+ecx*2+2Eh]
	mov byte [byte_512ECF], dl
	mov dl, [esp+ecx*2+18h]
	sar eax, 10h
	mov byte [byte_512ED0], dl
	mov dl, [esp+ecx*2+24h]
	mov dword [dword_4D69C0], eax
	mov byte [byte_512ED2], dl
	mov dl, [esp+ecx*2+3Ch]
	mov ecx, 3FC00000h
	mov byte [byte_512ED1], dl
	mov dword [dword_4D4D20], ecx
	call sub_428990
	add esp, 48h
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4086D6:
	call sub_487BF4
	mov edx, eax
	mov ebx, 0F4240h
	sar edx, 1Fh
	idiv ebx
	cmp eax, 0A6h
	jg loc_4086F3
	mov ecx, 3

loc_4086F3:
	cmp eax, 85h
	jg loc_4086FF
	mov ecx, 2

loc_4086FF:
	cmp eax, 64h
	jg loc_408709
	mov ecx, 1

loc_408709:
	cmp eax, 5Ah
	jg loc_408710
	xor ecx, ecx

loc_408710:
	cmp eax, 78h
	jg loc_408680
	xor dl, dl
	mov byte [byte_512ECD], dl
	jmp loc_408680
;sub_408610 endp

sub_408730: ;SUBROUTINE
	push ecx
	push edx
	push ebp
	sub esp, 118h
	xor edx, edx
	mov ecx, dword [dword_4D76BC]
	mov [esp+108h], edx
	test ecx, ecx
	jz loc_408905

loc_408750:
	cmp byte [byte_512DA9], 1
	ja loc_408917

loc_40875D:
	push edi
	push esi
	push ebx
	mov esi, dword [dword_5134C8]
	push esi
	push aSconfig_dat ; "%sconfig.dat"
	lea eax, [esp+14h]
	push eax
	lea ecx, [esp+11Ch]
	lea ebx, [esp+120h]
	call sprintf_
	add esp, 0Ch
	lea edx, [esp+118h]
	lea eax, [esp+0Ch]
	call sub_4877BC
	mov edi, [esp+118h]
	test edi, edi
	jnz loc_408926
	mov ecx, 1
	mov ebp, 1
	mov word [byte_4E5518], cx

loc_4087B7:
	call sub_408DF0

loc_4087BC:
	xor dl, dl
	xor ebx, ebx
	xor esi, esi
	mov byte [byte_512DAA], dl
	mov dword [dword_512F48], ebx
	mov byte [byte_512DA9], dl

loc_4087D4:
	add esi, 2
	xor edi, edi
	mov word dword_512F34[esi], di
	cmp esi, 4
	jnz loc_4087D4
	call sub_421F10
	mov esi, 2
	xor edx, edx
	mov [esp+120h], esi
	mov edi, eax
	mov [esp+120h], edx
	test eax, eax
	jle loc_4088A6
	xor esi, esi

loc_40880B:
	cmp dword [esp+120h], 2
	jge loc_4088A6
	mov eax, [esp+11Dh]
	lea ebx, [esp+10Ch]
	lea edx, [esp+108h]
	sar eax, 18h
	call sub_421BD0
	test eax, eax
	jz loc_40888C
	cmp dword [esp+108h], 0
	jz loc_408870
	push 0
	push 0
	push 0
	push 0
	lea edx, [esp+12Ch]
	mov eax, [esp+130h]
	push 0
	xor ecx, ecx
	xor ebx, ebx
	call sub_477C10
	test eax, eax
	jnz loc_408870
	mov [esp+108h], eax

loc_408870:
	mov eax, [esp+108h]
	mov word (dword_512F34+2)[esi], ax
	mov eax, [esp+10Ch]
	mov word word_512F3A[esi], ax

loc_40888C:
	mov ecx, [esp+120h]
	inc ecx
	add esi, 2
	mov [esp+120h], ecx
	cmp edi, ecx
	jg loc_40880B

loc_4088A6:
	call sub_4793B0
	mov byte [byte_512ED3], al
	test edi, edi
	jnz loc_4088B9
	call sub_408A30

loc_4088B9:
	xor eax, eax
	push eax
	call time
	add esp, 4
	mov word [dword_512D9E+2], ax
	xor eax, eax
	xor eax, eax
	push eax
	call time
	add esp, 4
	mov byte [byte_50B480], al
	call sub_408B40
	mov eax, aRemote ; "remote"
	mov edx, dword [dword_513468]
	call strcmp_
	test eax, eax
	jnz loc_408A16
	mov al, 1
	mov byte [byte_512ECC], al
	mov eax, ebp
	pop ebx
	pop esi
	pop edi
	add esp, 118h
	pop ebp
	pop edx
	pop ecx
	ret

loc_408905:
	cmp dword [dword_4D76B8], 0
	jnz loc_408750
	jmp loc_40875D

loc_408917:
	mov eax, dword_54B46C
	add esp, 118h
	pop ebp
	pop edx
	pop ecx
	ret

loc_408926:
	mov ebp, [esp+110h]
	cmp ebp, 2ACh
	jz loc_408974
	mov ebx, 1
	mov eax, edi
	mov word [byte_4E5518], bx
	call sub_487950
	mov ecx, dword [dword_5134C8]
	push ecx
	push aSconfig_dat ; "%sconfig.dat"
	lea eax, [esp+14h]
	push eax
	call sprintf_
	add esp, 0Ch
	lea eax, [esp+0Ch]
	mov ebp, 1
	call sub_4879AE
	jmp loc_4087B7

loc_408974:
	mov eax, aCNfs2seFront_0 ; "c:\\nfs2se\\frontend\\common\\Front.c"
	xor edx, edx
	xor ebx, ebx
	mov word [byte_4E5518], dx
	mov dword [dword_4DB1D8], eax
	mov edx, 23Fh
	mov eax, aFrontend ; "frontend"
	mov dword [dword_4DB1DC], edx
	mov edx, ebp
	mov ecx, 2ACh
	call sub_484498
	mov ebx, [esp+110h]
	mov ebp, eax
	mov edx, eax
	mov eax, [esp+118h]
	mov edi, (dword_512D9E+2)
	call sub_487958
	mov eax, [esp+118h]
	mov esi, ebp
	call sub_487950
	push edi
	mov eax, ecx
	shr ecx, 2
	rep movsd
	mov cl, al
	and cl, 3
	rep movsb
	pop edi
	mov eax, ebp
	call sub_4848FC
	xor eax, eax
	mov al, byte [byte_512DFE]
	mov dword [dword_4D5A30], eax
	mov dword [dword_4D5A34], eax
	xor eax, eax
	mov al, byte [byte_512DFD]
	mov dword [dword_4D5A2C], eax
	xor eax, eax
	mov al, byte [byte_512DFC]
	xor ebp, ebp
	mov dword [dword_4D5A28], eax
	jmp loc_4087BC

loc_408A16:
	xor al, al
	mov byte [byte_512ECC], al
	mov eax, ebp
	pop ebx
	pop esi
	pop edi
	add esp, 118h
	pop ebp
	pop edx
	pop ecx
	ret
;sub_408730 endp

sub_408A30: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	mov eax, dword [dword_512E0C]
	mov edx, dword [dword_512E10]
	mov ecx, dword [dword_512E14]
	or eax, edx
	mov ebx, dword [dword_512E18]
	or eax, ecx
	mov esi, dword [dword_512E1C]
	or eax, ebx
	mov edi, dword [dword_512E20]
	or eax, esi
	mov ebp, dword [dword_512E24]
	or eax, edi
	mov edx, dword [dword_512E28]
	or eax, ebp
	mov ecx, dword [dword_512E2C]
	or eax, edx
	mov ebx, dword [dword_512E30]
	or eax, ecx
	mov esi, dword [dword_512E34]
	or eax, ebx
	mov edi, dword [dword_512E3C]
	or eax, esi
	mov ebp, dword [dword_512E44]
	or eax, edi
	mov edx, dword [dword_512E4C]
	or eax, ebp
	mov ecx, dword [dword_512E54]
	or eax, edx
	mov ebx, dword [dword_512E5C]
	or eax, ecx
	mov esi, dword [dword_512E64]
	or eax, ebx
	mov edi, dword [dword_512E6C]
	or eax, esi
	mov ebp, dword [dword_512E74]
	or eax, edi
	mov edx, dword [dword_512E7C]
	or eax, ebp
	mov ecx, dword [dword_512E38]
	or eax, edx
	mov ebx, dword [dword_512E40]
	or eax, ecx
	mov esi, dword [dword_512E48]
	or eax, ebx
	mov edi, dword [dword_512E50]
	or eax, esi
	mov ebp, dword [dword_512E58]
	or eax, edi
	mov edx, dword [dword_512E60]
	or eax, ebp
	mov ecx, dword [dword_512E68]
	or eax, edx
	mov ebx, dword [dword_512E70]
	or eax, ecx
	mov esi, dword [dword_512E78]
	or eax, ebx
	mov edi, dword [dword_512E80]
	or eax, esi
	or eax, edi
	call sub_404D40
	test al, 3
	jnz loc_408B33
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_408B33:
	call sub_4090C0
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_408A30 endp

sub_408B40: ;SUBROUTINE
	push edx
	mov eax, aEnglish_0 ; "english"
	mov edx, dword [dword_513464]
	call strcmp_
	test eax, eax
	jnz loc_408B5D
	xor ah, ah
	mov byte [byte_512DFB], ah

loc_408B5D:
	mov eax, aGerman_0 ; "german"
	mov edx, dword [dword_513464]
	call strcmp_
	test eax, eax
	jnz loc_408B78
	mov byte [byte_512DFB], 1

loc_408B78:
	mov eax, aFrench_0 ; "french"
	mov edx, dword [dword_513464]
	call strcmp_
	test eax, eax
	jnz loc_408B93
	mov byte [byte_512DFB], 2

loc_408B93:
	mov eax, aSpanish_0 ; "spanish"
	mov edx, dword [dword_513464]
	call strcmp_
	test eax, eax
	jnz loc_408BAE
	mov byte [byte_512DFB], 3

loc_408BAE:
	mov eax, aItalian_0 ; "italian"
	mov edx, dword [dword_513464]
	call strcmp_
	test eax, eax
	jnz loc_408BC9
	mov byte [byte_512DFB], 4

loc_408BC9:
	mov eax, aSwedish_0 ; "swedish"
	mov edx, dword [dword_513464]
	call strcmp_
	test eax, eax
	jz loc_408BDF
	pop edx
	ret

loc_408BDF:
	mov byte [byte_512DFB], 5
	pop edx
	ret
;sub_408B40 endp

sub_408BF0: ;SUBROUTINE
	push ebp
	sub esp, 0FCh
	push edi
	push esi
	push edx
	push ecx
	push ebx
	mov edx, aCNfs2seFront_0 ; "c:\\nfs2se\\frontend\\common\\Front.c"
	mov ecx, 1C2h
	mov esi, (dword_512D9E+2)
	mov al, byte [dword_4D5A30]
	xor ebx, ebx
	mov byte [byte_512DFE], al
	mov dword [dword_4DB1D8], edx
	mov al, byte [dword_4D5A2C]
	mov dword [dword_4DB1DC], ecx
	mov byte [byte_512DFD], al
	mov al, byte [dword_4D5A28]
	mov edx, 2ACh
	mov byte [byte_512DFC], al
	mov eax, aFrontend ; "frontend"
	mov ecx, 2ACh
	call sub_484498
	mov edi, eax
	mov ebp, eax
	push edi
	mov eax, ecx
	shr ecx, 2
	rep movsd
	mov cl, al
	and cl, 3
	rep movsb
	pop edi
	mov ebx, dword [dword_5134C8]
	push ebx
	push aSconfig_dat ; "%sconfig.dat"
	lea eax, [esp+1Ch]
	push eax
	call sprintf_
	add esp, 0Ch
	mov eax, ebp
	mov edx, ebp
	call sub_484D94
	mov ebx, eax
	lea eax, [esp+14h]
	call sub_4875B0
	mov eax, ebp
	call sub_4848FC
	pop ebx
	pop ecx
	pop edx
	pop esi
	pop edi
	add esp, 0FCh
	pop ebp
	ret
;sub_408BF0 endp

sub_408CC0: ;SUBROUTINE
	push ecx
	push esi
	push edi
	sub esp, 50h
	xor eax, eax
	mov al, byte [byte_512DFB]
	call sub_41B730
	mov eax, 2A1h
	mov edi, esp
	call sub_41B710
	mov esi, eax
	push edi

loc_408CE1:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_408CF9
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_408CE1

loc_408CF9:
	pop edi
	mov edi, esp
	sub ecx, ecx
	dec ecx
	xor eax, eax
	repne scasb
	not ecx
	dec ecx
	cmp ecx, 8
	jbe loc_408D9D
	push edx
	push ebx
	mov ebx, 8
	lea edx, [esp+8]
	mov eax, dword_512F4C
	call strncpy_
	mov ebx, 8
	lea edx, [esp+8]
	mov eax, byte_512F55
	call strncpy_
	pop ebx
	pop edx

loc_408D39:
	mov esi, dword_4C81BC
	mov edi, dword_512F4C
	push edi
	sub ecx, ecx
	dec ecx
	mov al, 0
	repne scasb
	dec edi

loc_408D4C:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_408D64
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_408D4C

loc_408D64:
	pop edi
	mov esi, dword_4C81C0
	mov edi, byte_512F55
	push edi
	sub ecx, ecx
	dec ecx
	mov al, 0
	repne scasb
	dec edi

loc_408D78:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_408D90
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_408D78

loc_408D90:
	pop edi
	call sub_41B620
	add esp, 50h
	pop edi
	pop esi
	pop ecx
	ret

loc_408D9D:
	mov esi, esp
	mov edi, dword_512F4C
	push edi

loc_408DA5:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_408DBD
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_408DA5

loc_408DBD:
	pop edi
	mov esi, esp
	mov edi, byte_512F55
	push edi

loc_408DC6:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_408DDE
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_408DC6

loc_408DDE:
	pop edi
	jmp loc_408D39
;sub_408CC0 endp

sub_408DF0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	mov bl, 1
	xor edx, edx
	xor ah, ah
	mov word [dword_512D9E+2], dx
	mov byte [byte_512DA8], ah
	mov byte [byte_512DBC], ah
	mov byte [byte_512DBD], ah
	mov byte [byte_512DAF], bl
	mov byte [byte_512DA9], ah
	mov byte [byte_512DAA], ah
	mov byte [byte_512DAB], bl
	mov byte [byte_512DAC], ah
	mov byte [byte_512DAD], ah
	mov byte [byte_512DAE], bl
	mov byte [byte_512DBA], ah
	mov byte [byte_512DBB], ah
	mov byte [byte_512DB0], ah
	xor edx, edx
	xor eax, eax
	mov dword [dword_512DA4], edx
	call sub_41AE70
	mov dword [dword_512DB4], eax
	mov byte [byte_512DC0], bl
	mov byte [byte_512DDB], bl
	xor dh, dh
	mov eax, 1
	mov byte [byte_512DB8], dh
	mov byte [byte_512DB9], dh
	mov byte [byte_512DBF], dh
	mov byte [byte_512DD1], dh
	mov byte [byte_512DBE], dh
	mov byte [byte_512DD0], dh
	mov byte [byte_512DEB], dh
	call sub_409070
	mov eax, 2
	call sub_409070
	xor edx, edx
	xor eax, eax

loc_408EB4:
	inc eax
	mov bl, byte byte_4D407C[edx]
	mov byte byte_512DDB[eax], bl
	add edx, 2
	mov byte byte_512DC0[eax], bl
	cmp eax, 0Fh
	jl loc_408EB4
	mov ch, 1
	mov bh, 0Ch
	mov byte [byte_512DD6], ch
	mov byte [byte_512DD8], ch
	mov ah, ch
	mov byte [byte_512DD9], ch
	mov byte [byte_512DF2], ch
	mov byte [byte_512DF3], ch
	mov byte [byte_512DF4], ch
	mov cl, 2
	mov byte [byte_512DF5], bh
	mov byte [byte_512DF6], cl
	mov byte [byte_512DF8], ch
	xor ah, ch
	mov byte [byte_512DF9], ch
	mov byte [byte_512DF7], ah
	call sub_408B40
	mov dl, byte [byte_512DFB]
	test dl, dl
	jz loc_409057
	mov byte [byte_512DFA], ch

loc_408F34:
	mov bh, 80h
	mov al, 8
	mov dl, 1
	xor ecx, ecx
	mov byte [byte_512DFD], bh
	mov byte [byte_512DFE], bh
	mov byte [byte_512F42], al
	mov byte [byte_512F3E], dl
	mov byte [byte_512F3F], dl
	mov byte [byte_512DFC], bh
	mov dl, 64h
	xor ah, ah
	mov ebx, 0Ch
	mov byte [byte_512F43], ah
	mov byte [byte_512F40], ah
	mov byte [byte_512F41], ah
	mov byte [byte_512DFF], ah
	mov byte [byte_512E00], ah
	mov al, 2
	mov byte [dword_512ED4], dl
	mov byte [byte_512ECD], al
	mov byte [byte_512ED3], ah

loc_408F99:
	mov edx, ebx
	imul eax, ecx, 0Ch

loc_408F9E:
	add eax, 2
	xor edi, edi
	mov word dword_512ED4[eax], di
	mov word dword_512EEC[eax], 68h
	mov word dword_512F04[eax], 98h
	mov word dword_512F1C[eax], 0FFh
	cmp eax, edx
	jnz loc_408F9E
	inc ecx
	add ebx, 0Ch
	cmp ecx, 2
	jl loc_408F99
	mov esi, dword_4C81B8
	xor dh, dh
	mov edi, byte_512F5E
	mov byte [byte_512ECE], dh
	mov byte [byte_512ECF], dh
	mov byte [byte_512ED0], dh
	mov byte [byte_512ED1], dh
	mov byte [byte_512ED2], dh
	call sub_4090C0
	mov al, 3
	mov byte [byte_512F45], dh
	mov byte [byte_512F44], al
	call sub_408CC0
	push edi

loc_409014:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_40902C
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_409014

loc_40902C:
	pop edi
	mov esi, dword_4C81B8
	mov edi, word_512F86
	push edi

loc_409038:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_409050
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_409038

loc_409050:
	pop edi
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_409057:
	mov byte [byte_512DFA], dl
	jmp loc_408F34
;sub_408DF0 endp

sub_409070: ;SUBROUTINE
	push edx
	cmp eax, 1
	jnz loc_40909C
	push ecx
	mov cl, 1
	mov byte [byte_512DD2], cl
	xor ch, ch
	mov byte [byte_512DD3], ch
	mov byte [byte_512DD4], ch
	mov byte [byte_512DD5], cl
	mov byte [byte_512DD7], cl
	pop ecx
	pop edx
	ret

loc_40909C:
	xor dl, dl
	mov ah, 1
	mov byte [byte_512DEE], dl
	mov byte [byte_512DEF], dl
	mov byte [byte_512DF0], ah
	mov byte [byte_512DF1], ah
	mov byte [byte_512DEC], ah
	pop edx
	ret
;sub_409070 endp

sub_4090C0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	sub esp, 8
	mov bl, 5Ah
	mov ah, 51h
	mov dl, 57h
	mov bh, 41h
	mov [esp+4], dl
	mov dh, byte [byte_512DFB]
	mov [esp], ah
	cmp dh, 1
	jnz loc_4090E2
	mov bl, 59h

loc_4090E2:
	cmp byte [byte_512DFB], 2
	jnz loc_4090FA
	mov bh, 51h
	mov al, 5Ah
	mov ch, 41h
	mov bl, 57h
	mov [esp+4], al
	mov [esp], ch

loc_4090FA:
	mov edx, 4B00004Bh
	mov eax, 4
	call sub_404D50
	mov edx, 4D00004Dh
	mov dword [dword_512E0C], eax
	mov eax, 4
	call sub_404D50
	mov edx, 48000048h
	mov dword [dword_512E10], eax
	mov eax, 4
	call sub_404D50
	mov edx, 50000050h
	mov dword [dword_512E14], eax
	mov eax, 4
	call sub_404D50
	mov edx, 420030h
	mov dword [dword_512E18], eax
	mov eax, 4
	call sub_404D50
	mov edx, 43002Eh
	mov dword [dword_512E1C], eax
	mov eax, 4
	call sub_404D50
	mov edx, 200039h
	mov dword [dword_512E20], eax
	mov eax, 4
	call sub_404D50
	mov edx, 480023h
	mov dword [dword_512E24], eax
	mov eax, 4
	call sub_404D50
	mov dword [dword_512E28], eax
	xor eax, eax
	mov al, bh
	shl eax, 10h
	lea ecx, [eax+1Eh]
	mov eax, 4
	mov edx, ecx
	call sub_404D50
	mov dword [dword_512E2C], eax
	and ebx, 0FFh
	shl ebx, 10h
	add ebx, 2Ch
	mov eax, 4
	mov edx, ebx
	call sub_404D50
	mov dword [dword_512E30], eax
	mov edx, 4B00004Bh
	mov eax, 4
	call sub_404D50
	mov edx, 4D00004Dh
	mov dword [dword_512E34], eax
	mov eax, 4
	call sub_404D50
	mov edx, 48000048h
	mov dword [dword_512E3C], eax
	mov eax, 4
	call sub_404D50
	mov edx, 50000050h
	mov dword [dword_512E44], eax
	mov eax, 4
	call sub_404D50
	mov edx, 51000051h
	mov dword [dword_512E4C], eax
	mov eax, 4
	call sub_404D50
	mov edx, 49000049h
	mov dword [dword_512E54], eax
	mov eax, 4
	call sub_404D50
	mov edx, 47000047h
	mov dword [dword_512E5C], eax
	mov eax, 4
	call sub_404D50
	mov edx, 4F00004Fh
	mov dword [dword_512E64], eax
	mov eax, 4
	call sub_404D50
	mov edx, 52000052h
	mov dword [dword_512E6C], eax
	mov eax, 4
	call sub_404D50
	mov edx, 53000053h
	mov dword [dword_512E74], eax
	mov eax, 4
	call sub_404D50
	mov edx, 53001Fh
	mov dword [dword_512E7C], eax
	mov eax, 4
	call sub_404D50
	mov dword [dword_512E38], eax
	mov edx, 460021h
	mov eax, 4
	call sub_404D50
	mov edx, 450012h
	mov dword [dword_512E40], eax
	mov eax, 4
	call sub_404D50
	mov edx, 440020h
	mov dword [dword_512E48], eax
	mov eax, 4
	call sub_404D50
	mov dword [dword_512E50], eax
	mov edx, ebx
	mov eax, 4
	call sub_404D50
	mov edx, 520013h
	mov dword [dword_512E58], eax
	mov eax, 4
	call sub_404D50
	mov dword [dword_512E60], eax
	xor eax, eax
	mov al, [esp+4]
	shl eax, 10h
	lea edx, [eax+11h]
	mov eax, 4
	call sub_404D50
	mov edx, 540014h
	mov dword [dword_512E68], eax
	mov eax, 4
	call sub_404D50
	xor edx, edx
	mov dl, [esp]
	mov dword [dword_512E70], eax
	shl edx, 10h
	mov eax, 4
	add edx, 10h
	call sub_404D50
	mov dword [dword_512E78], eax
	mov edx, ecx
	mov eax, 4
	call sub_404D50
	mov dword [dword_512E80], eax
	add esp, 8
	pop edx
	pop ecx
	pop ebx
	ret
;sub_4090C0 endp

off_409370: dd loc_409513
	dd loc_409650 ; jump table for switch statement
	dd loc_4096FD
	dd loc_409646
	dd loc_409773
	dd loc_40981B
	dd loc_409891

sub_40938C: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 944h
	mov ebp, eax
	mov ah, byte [byte_512DAA]
	xor edx, edx
	xor ecx, ecx
	mov [esp+93Ch], edx
	mov [esp+934h], ecx
	mov edx, 1
	mov [esp+938h], ecx
	mov [esp+940h], edx
	cmp ah, 1
	jnz loc_4095ED
	cmp dword [dword_4D76B8], 0
	jz loc_4095ED
	and byte [byte_4D3910], 0FEh

loc_4093E2:
	call sub_486F28
	mov eax, aReplay_rpy ; "replay.rpy"
	call sub_488570
	test eax, eax
	jz loc_409617
	and byte [byte_4D394C], 0FEh

loc_409400:
	mov eax, ebp
	mov edi, [esp+93Ch]
	call sub_410E80
	test edi, edi
	jnz loc_4095D9

loc_409416:
	cmp dword [dword_512214], 2
	jnz loc_40942A
	mov dword [esp+93Ch], 0FFFFFFFDh

loc_40942A:
	call sub_4833C7
	mov ebx, [esp+938h]
	xor edx, edx
	add ebx, eax
	mov eax, ebp
	mov [esp+938h], ebx
	call sub_40BBE0
	test eax, eax
	jz loc_409623

loc_409450:
	call sub_40EB20
	call sub_428A20
	mov edx, 400h
	mov eax, [ebp+4]
	xor ecx, ecx
	xor ebx, ebx
	call sub_405B30
	mov eax, dword [dword_4D2314+2]
	sar eax, 10h
	mov edx, 1000h
	mov eax, dword dword_4D231C[eax*4]
	xor ecx, ecx
	xor ebx, ebx
	mov eax, [eax+20h]
	call sub_405B60
	mov eax, ebp
	call sub_40FA90
	call sub_405C70

loc_40949C:
	mov eax, ebp
	call sub_423CA0
	mov [esp+940h], eax

loc_4094AA:
	call sub_405960
	mov ecx, eax
	test ax, ax
	jz loc_4095BE ; jumptable 0040950C default case
	mov eax, [esp+938h]
	cmp eax, [esp+934h]
	jle loc_4095BE ; jumptable 0040950C default case
	add eax, 0Fh
	mov [esp+934h], eax
	mov dword [esp+940h], 1
	cmp cx, 0Dh
	jnz loc_409891 ; jumptable 0040950C case 6
	mov edx, 7Fh
	xor eax, eax
	call sub_4423F0
	mov ax, [ebp+0Ah]
	cmp ax, 6 ; switch 7 cases
	ja loc_4095BE ; jumptable 0040950C default case
	and eax, 0FFFFh
	jmp off_409370[eax*4] ; switch jump

loc_409513:
	mov eax, 2FCh ; jumptable 0040950C case 0
	lea edi, [esp+8CCh]
	mov ecx, 2
	mov ebx, 8
	call sub_41B710
	mov esi, eax
	mov edx, 2E5h
	push edi

loc_409536:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_40954E
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_409536

loc_40954E:
	pop edi
	lea eax, [esp+8CCh]
	call sub_402460
	test eax, eax
	jz loc_4095BE ; jumptable 0040950C default case
	lea eax, [esp+8CCh]
	push eax
	mov edx, dword [dword_5134C0]
	push edx
	push aSS_tou ; "%s%s.tou"
	lea eax, [esp+90Ch]
	push eax
	call sprintf_
	add esp, 10h
	lea eax, [esp+900h]
	call sub_488570
	test eax, eax
	jz loc_4095B2
	push 2F9h
	push 1
	call sub_401AE0
	add esp, 8
	test eax, eax
	jz loc_4095BE ; jumptable 0040950C default case
	lea eax, [esp+900h]
	call sub_4879AE

loc_4095B2:
	lea eax, [esp+900h]
	call sub_409D90

loc_4095BE:
	cmp dword [dword_512214], 2 ; jumptable 0040950C default case
	jz loc_4098A7
	cmp dword [esp+93Ch], 0
	jz loc_409416

loc_4095D9:
	mov eax, [esp+93Ch]
	add esp, 944h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4095ED:
	mov dl, byte [byte_4D3910]
	or dl, 1
	mov bx, [ebp+0Ah]
	mov byte [byte_4D3910], dl
	test bx, bx
	jnz loc_4093E2
	mov ecx, 1
	mov [ebp+0Ah], cx
	jmp loc_4093E2

loc_409617:
	or byte [byte_4D394C], 1
	jmp loc_409400

loc_409623:
	mov esi, [esp+940h]
	test si, si
	jnz loc_409450
	call sub_423B90
	test si, si
	jz loc_40949C
	jmp loc_4094AA

loc_409646:
	call sub_4098D0 ; jumptable 0040950C case 3
	jmp loc_4095BE ; jumptable 0040950C default case

loc_409650:
	mov al, byte [byte_512DAA] ; jumptable 0040950C case 1
	mov edx, 1
	cmp al, 1
	jnz loc_40968F
	cmp dword [dword_4D76B8], 0
	jz loc_40968F
	push 2EDh
	push edx
	call sub_401AE0
	add esp, 8
	mov ebx, [esp+93Ch]
	mov edx, eax
	test ebx, ebx
	jz loc_40968F
	xor esi, esi
	call sub_41A350
	mov dword [dword_4D76B8], esi

loc_40968F:
	test edx, edx
	jz loc_4095BE ; jumptable 0040950C default case
	mov edx, esp
	mov eax, a_tou ; "*.tou"
	xor ebx, ebx
	call sub_4099A0
	xor edx, edx
	call sub_401090
	cmp eax, 0FFFFFFFFh
	jz loc_4095BE ; jumptable 0040950C default case
	lea edx, [eax+eax*8]
	mov eax, esp
	add eax, edx
	push eax
	mov edi, dword [dword_5134C0]
	push edi
	push aSS_tou ; "%s%s.tou"
	lea eax, [esp+90Ch]
	push eax
	call sprintf_
	add esp, 10h
	lea eax, [esp+900h]
	call sub_409BF0
	test eax, eax
	jz loc_4095BE ; jumptable 0040950C default case
	mov dword [esp+93Ch], 0FFFFFFFBh
	jmp loc_4095BE ; jumptable 0040950C default case

loc_4096FD:
	mov edx, esp ; jumptable 0040950C case 2
	mov eax, a_tou ; "*.tou"
	xor ebx, ebx
	call sub_4099A0
	xor edx, edx
	call sub_401090
	mov edx, eax
	cmp eax, 0FFFFFFFFh
	jz loc_4095BE ; jumptable 0040950C default case
	push 2EFh
	push 1
	call sub_401AE0
	add esp, 8
	test eax, eax
	jz loc_4095BE ; jumptable 0040950C default case
	mov eax, esp
	lea edx, [edx+edx*8]
	add eax, edx
	push eax
	mov edx, dword [dword_5134C0]
	push edx
	push aSS_tou ; "%s%s.tou"
	lea eax, [esp+90Ch]
	push eax
	call sprintf_
	add esp, 10h
	lea eax, [esp+900h]
	call sub_4879AE
	mov eax, 2F0h
	call sub_402CD0
	jmp loc_4095BE ; jumptable 0040950C default case

loc_409773:
	mov eax, aReplay_rpy ; jumptable 0040950C case 4
	call sub_488570
	test eax, eax
	jz loc_4097EB
	mov eax, 2E9h
	mov edx, esp
	call sub_41B710
	mov ebx, eax
	mov eax, a_rpy ; "*.rpy"

loc_409794:
	call sub_4099A0
	xor edx, edx
	call sub_401090
	mov edx, eax
	cmp edx, 0FFFFFFFFh
	jz loc_4095BE ; jumptable 0040950C default case
	test edx, edx
	jnz loc_4097F6
	mov eax, aReplay_rpy ; "replay.rpy"
	call sub_488570
	test eax, eax
	jz loc_4097F6
	xor cl, cl
	mov [esp+900h], cl

loc_4097C6:
	mov edx, 1
	lea eax, [esp+900h]
	xor ch, ch
	mov word [word_4D21A4], dx
	call sub_409B30
	mov byte [byte_512DA9], ch
	jmp loc_4095BE ; jumptable 0040950C default case

loc_4097EB:
	mov edx, esp
	mov eax, a_rpy ; "*.rpy"
	xor ebx, ebx
	jmp loc_409794

loc_4097F6:
	mov eax, esp
	lea edx, [edx+edx*8]
	add eax, edx
	push eax
	mov eax, dword [dword_5134C0]
	push eax
	push aSS_rpy ; "%s%s.rpy"
	lea eax, [esp+90Ch]
	push eax
	call sprintf_
	add esp, 10h
	jmp loc_4097C6

loc_40981B:
	mov edx, esp ; jumptable 0040950C case 5
	mov eax, a_rpy ; "*.rpy"
	xor ebx, ebx
	call sub_4099A0
	xor edx, edx
	call sub_401090
	mov edx, eax
	cmp eax, 0FFFFFFFFh
	jz loc_4095BE ; jumptable 0040950C default case
	push 2F5h
	push 1
	call sub_401AE0
	add esp, 8
	test eax, eax
	jz loc_4095BE ; jumptable 0040950C default case
	mov eax, esp
	lea edx, [edx+edx*8]
	add eax, edx
	push eax
	mov edi, dword [dword_5134C0]
	push edi
	push aSS_rpy ; "%s%s.rpy"
	lea eax, [esp+90Ch]
	push eax
	call sprintf_
	add esp, 10h
	lea eax, [esp+900h]
	call sub_4879AE
	mov eax, 2F6h
	call sub_402CD0
	jmp loc_4095BE ; jumptable 0040950C default case

loc_409891:
	movsx edx, cx ; jumptable 0040950C case 6
	mov eax, ebp
	call sub_410414
	mov [esp+93Ch], eax
	jmp loc_4095BE ; jumptable 0040950C default case

loc_4098A7:
	mov dword [esp+93Ch], 0FFFFFFFDh
	mov eax, [esp+93Ch]
	add esp, 944h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_40938C endp

sub_4098D0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	sub esp, 10Ch
	mov eax, 2FCh
	lea edi, [esp+100h]
	mov ecx, 2
	mov ebx, 8
	call sub_41B710
	mov esi, eax
	mov edx, 2E6h
	push edi

loc_4098FE:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_409916
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_4098FE

loc_409916:
	pop edi
	lea eax, [esp+100h]
	call sub_402460
	test eax, eax
	jnz loc_409933

loc_409927:
	add esp, 10Ch
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_409933:
	lea eax, [esp+100h]
	push eax
	mov edx, dword [dword_5134C0]
	push edx
	push aSS_rpy ; "%s%s.rpy"
	lea eax, [esp+0Ch]
	push eax
	call sprintf_
	add esp, 10h
	mov eax, esp
	call sub_488570
	test eax, eax
	jz loc_409985
	mov edx, 7Fh
	xor eax, eax
	call sub_4423F0
	push 2F9h
	push 1
	call sub_401AE0
	add esp, 8
	test eax, eax
	jz loc_409927
	mov eax, esp
	call sub_4879AE

loc_409985:
	mov eax, esp
	call sub_409B90
	add esp, 10Ch
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_4098D0 endp

sub_4099A0: ;SUBROUTINE
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 104h
	mov esi, eax
	mov ebp, edx
	mov [esp+100h], ebx
	mov edi, edx
	lea ecx, [edx+8CAh]

loc_4099BD:
	mov byte [edi], 0
	add edi, 9
	cmp edi, ecx
	jnz loc_4099BD
	mov edx, [esp+100h]
	xor ebx, ebx
	test edx, edx
	jz loc_4099D9
	mov ebx, 1

loc_4099D9:
	mov eax, esp
	call sub_45AD10
	mov eax, dword [dword_5134C0]
	call sub_488396
	mov eax, esi
	call sub_48846C
	mov ecx, eax
	test eax, eax
	jz loc_409AAA
	mov dl, 2Eh
	mov esi, eax

loc_4099FF:
	mov al, [esi]
	cmp al, dl
	jz loc_409A17
	cmp al, 0
	jz loc_409A15
	inc esi
	mov al, [esi]
	cmp al, dl
	jz loc_409A17
	inc esi
	cmp al, 0
	jnz loc_4099FF

loc_409A15:
	sub esi, esi

loc_409A17:
	mov byte [esi], 0
	lea esi, 0[ebx*8]
	add esi, ebx
	lea edi, [esi+ebp]
	mov esi, ecx
	inc ebx
	push edi

loc_409A2A:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_409A42
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_409A2A

loc_409A42:
	pop edi
	cmp ebx, 0FAh
	jge loc_409AAA
	lea ecx, 0[ebx*8]
	add ecx, ebx
	mov dl, 2Eh
	add ecx, ebp

loc_409A58:
	call sub_4883C0
	mov edi, eax
	test eax, eax
	jz loc_409AAA
	mov esi, edi

loc_409A65:
	mov al, [esi]
	cmp al, dl
	jz loc_409A7D
	cmp al, 0
	jz loc_409A7B
	inc esi
	mov al, [esi]
	cmp al, dl
	jz loc_409A7D
	inc esi
	cmp al, 0
	jnz loc_409A65

loc_409A7B:
	sub esi, esi

loc_409A7D:
	mov byte [esi], 0
	mov esi, edi
	mov edi, ecx
	inc ebx
	push edi

loc_409A86:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_409A9E
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_409A86

loc_409A9E:
	pop edi
	add ecx, 9
	cmp ebx, 0FAh
	jl loc_409A58

loc_409AAA:
	mov eax, esp
	mov ecx, [esp+100h]
	call sub_488396
	xor ebx, ebx
	test ecx, ecx
	jnz loc_409AE4

loc_409ABE:
	lea ecx, 0[ebx*4]
	lea edi, 0[ebx*8]
	add edi, ebx
	add edi, ebp

loc_409AD0:
	cmp byte [edi], 0
	jz loc_409AEB
	inc ebx
	mov dword dword_4E5528[ecx], edi
	add ecx, 4
	add edi, 9
	jmp loc_409AD0

loc_409AE4:
	mov ebx, 1
	jmp loc_409ABE

loc_409AEB:
	xor ebx, ebx
	mov esi, [esp+100h]
	mov dword dword_4E5528[ecx], ebx
	test esi, esi
	jnz loc_409B0E
	mov eax, dword_4E5528
	add esp, 104h
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret

loc_409B0E:
	mov dword [dword_4E5528], esi
	mov eax, dword_4E5528
	add esp, 104h
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret
;sub_4099A0 endp

sub_409B30: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	cmp byte [eax], 0
	jnz loc_409B46

loc_409B38:
	mov dword [dword_512214], 2
	pop edx
	pop ecx
	pop ebx
	ret

loc_409B46:
	xor edx, edx
	call sub_486F40
	mov ecx, eax
	test eax, eax
	jz loc_409B7F
	mov eax, aReplay_rpy ; "replay.rpy"
	call sub_4879AE
	mov eax, ecx
	mov edx, ecx
	call sub_484D94
	mov ebx, eax
	mov eax, aReplay_rpy ; "replay.rpy"
	call sub_4875B0
	mov edx, eax
	mov eax, ecx
	call sub_4848FC
	test edx, edx
	jnz loc_409B38

loc_409B7F:
	mov eax, 2F4h
	call sub_402CD0
	pop edx
	pop ecx
	pop ebx
	ret
;sub_409B30 endp

sub_409B90: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	mov esi, eax
	mov eax, aReplay_rpy ; "replay.rpy"
	xor edx, edx
	call sub_486F40
	mov ecx, eax
	test eax, eax
	jz loc_409BD4
	call sub_484D94
	mov ebx, eax
	mov edx, ecx
	mov eax, esi
	call sub_4875B0
	mov esi, eax
	mov eax, ecx
	call sub_4848FC
	test esi, esi
	jz loc_409BD4
	mov eax, 2F2h
	call sub_402CD0
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_409BD4:
	mov eax, 2F3h
	call sub_402CD0
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_409B90 endp

sub_409BF0: ;SUBROUTINE
	push ebx
	push edx
	push ebp
	sub esp, 20h
	xor edx, edx
	call sub_486F40
	xor ebx, ebx
	mov ebp, eax
	test eax, eax
	jz loc_409D23
	cmp dword [dword_4D76B8], 0
	jz loc_409CD2

loc_409C16:
	push edi
	push esi
	push ecx
	mov ecx, dword [dword_4D76B8]
	test ecx, ecx
	jz loc_409D06
	mov edi, ecx
	mov esi, ebp
	mov ecx, 2C8h
	push edi
	mov eax, ecx
	shr ecx, 2
	rep movsd
	mov cl, al
	and cl, 3
	rep movsb
	pop edi
	mov eax, dword [dword_4D76B8]
	movsx eax, word [eax]
	cmp eax, 2C8h
	jnz loc_409CDC
	mov eax, 180h
	call sub_402CD0
	mov edx, dword [dword_4D76B8]
	mov eax, (dword_512D9E+2)
	add edx, 4
	xor ecx, ecx
	call sub_409D40

loc_409C72:
	mov edx, dword [dword_4D76B8]
	movsx eax, cx
	mov dx, [edx+eax*2+2B0h]
	inc ecx
	mov [esp+eax*2+1Ch], dx
	cmp cx, 8
	jl loc_409C72
	lea ebx, [esp+0Ch]
	lea edx, [esp+1Ch]
	mov eax, 8
	call sub_41B470
	xor ecx, ecx

loc_409CA3:
	movsx eax, cx
	mov eax, [esp+eax*2+0Ah]
	sar eax, 10h
	mov byte byte_512AD0[eax], cl
	inc ecx
	cmp cx, 8
	jl loc_409CA3
	mov ebx, 1
	mov eax, ebp
	call sub_4848FC
	pop ecx
	pop esi
	pop edi
	mov eax, ebx
	add esp, 20h
	pop ebp
	pop edx
	pop ebx
	ret

loc_409CD2:
	call sub_41A370
	jmp loc_409C16

loc_409CDC:
	call sub_41A350
	xor esi, esi
	mov eax, 2F4h
	mov dword [dword_4D76B8], esi
	call sub_402CD0
	mov eax, ebp
	call sub_4848FC
	pop ecx
	pop esi
	pop edi
	mov eax, ebx
	add esp, 20h
	pop ebp
	pop edx
	pop ebx
	ret

loc_409D06:
	mov eax, 2F4h
	call sub_402CD0
	mov eax, ebp
	call sub_4848FC
	pop ecx
	pop esi
	pop edi
	mov eax, ebx
	add esp, 20h
	pop ebp
	pop edx
	pop ebx
	ret

loc_409D23:
	mov eax, 2F4h
	call sub_402CD0
	mov eax, ebx
	add esp, 20h
	pop ebp
	pop edx
	pop ebx
	ret
;sub_409BF0 endp

sub_409D40: ;SUBROUTINE
	push ebx
	push ecx
	mov bl, [edx+9]
	mov byte [eax+0Ah], 1
	mov [eax+9], bl
	mov bl, [edx+0Bh]
	mov [eax+0Bh], bl
	mov bl, [edx+10h]
	mov [eax+10h], bl
	mov bl, [edx+5Ah]
	mov [eax+5Ah], bl
	mov bl, [edx+1Fh]
	mov [eax+1Fh], bl
	mov bl, [edx+20h]
	xor ecx, ecx
	mov [eax+20h], bl
	mov cl, [edx+1Fh]
	add ecx, edx
	xor edx, edx
	mov dl, [eax+1Fh]
	add edx, eax
	mov al, [ecx+21h]
	mov [edx+21h], al
	pop ecx
	pop ebx
	ret
;sub_409D40 endp

sub_409D90: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	mov ebp, eax
	mov edx, dword [dword_4D76B8]
	test edx, edx
	jnz loc_409DA9
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_409DA9:
	mov ecx, 2ACh
	mov esi, (dword_512D9E+2)
	lea edi, [edx+4]
	push edi
	mov eax, ecx
	shr ecx, 2
	rep movsd
	mov cl, al
	and cl, 3
	rep movsb
	pop edi
	mov edx, dword [dword_4D76B8]
	mov ebx, 2C8h
	mov eax, ebp
	mov word [edx], 2C8h
	call sub_4875B0
	test eax, eax
	jz loc_409DF2
	mov eax, 2F1h
	call sub_402CD0
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_409DF2:
	mov eax, 2F3h
	call sub_402CD0
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_409D90 endp

off_409E10: dd aTrk6
	dd aTrk5 ; "trk5"
	dd aTrk8 ; "trk8"
	dd aTrk4 ; "trk4"
	dd aTrk1 ; "trk1"
	dd aTrk3 ; "trk3"
	dd aTrk2 ; "trk2"
	dd aTrk7 ; "trk7"
off_409E30: dd aCar1
	dd aCar9 ; "car9"
	dd aCarc ; "carc"
	dd aCar7 ; "car7"
	dd aCar8 ; "car8"
	dd aCara ; "cara"
	dd aCar4 ; "car4"
	dd aCar6_1 ; "car6"
	dd aCar3 ; "car3"
	dd aCarb ; "carb"
	dd aCar5 ; "car5"
	dd aCar2 ; "car2"
	dd aCarf ; "carf"
	dd aCare ; "care"
	dd aCard ; "card"
	dd 0
off_409E70: dd aCar1
	dd aCar9 ; "car9"
	dd aCarc ; "carc"
	dd aCar7 ; "car7"
	dd aCar8 ; "car8"
	dd aCara ; "cara"
	dd aCar4 ; "car4"
	dd aCar6_1 ; "car6"
	dd aCar3 ; "car3"
	dd aCarb ; "carb"
	dd aCar5 ; "car5"
	dd aCar2 ; "car2"
	dd aClsa ; "clsa"
	dd aClsb ; "clsb"
	dd aClsc ; "clsc"
	dd 0
off_409EB0: dd aCome
	dd aComg ; "comg"
	dd aComf ; "comf"
	dd aComs ; "coms"
	dd aComi ; "comi"
	dd aComw ; "comw"
dword_409EC8: dd 60h, 61h, 63h, 67h, 64h, 66h, 69h, 6Bh, 62h, 65h, 68h
	dd 6Ah
dword_409EF8: times 2 dd 7Ch
	dd 7Eh, 7Ch, 7Dh, 7Eh, 7Dh, 7Ch, 7Eh, 7Dh
	dd 7Eh, 7Dh
off_409F28: dd aGren_0
	dd aRedd_0 ; "redd"
	dd aYell_0 ; "yell"
	dd aBlue ; "blue"
off_409F38: dd aSin
	dd aTwo ; "two"
	dd aMod ; "mod"
	dd aLnk ; "lnk"
	dd aNet ; "net"
	dd aOva ; "ova"
	dd aOva ; "ova"
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd aRac ; "rac"
	dd aTrn ; "trn"
	dd aNok ; "nok"
	dd aSlt ; "slt"
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd aCir ; "cir"
	dd aOut ; "out"
	dd aLrs ; "Lrs"
	dd aNor ; "nor"
	dd aPac ; "pac"
	dd aMed ; "med"
	dd aHim ; "him"
	dd aMon ; "mon"
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd dword_4C8478
	dd aMac ; "mac"
	dd aF50 ; "F50"
	dd a355 ; "355"
	dd aFgt ; "fgt"
	dd aInd ; "ind"
	dd aMus ; "mus"
	dd aJag ; "jag"
	dd aLgt ; "lgt"
	dd aLv8 ; "lv8"
	dd aNas ; "nas"
	dd aCal ; "Cal"
	dd aIsd ; "isd"
	dd aBom ; "bom"
	dd aTom ; "tom"
	dd aFzr ; "fzr"
	dd aTko ; "tko"
	dd aA_0 ; "A"
	dd aB_0 ; "B"
	dd aC_1 ; "C"
	times 3 dd 0
off_40A098: dd aEngl_1
	dd aGerm_0 ; "germ"
	dd aFren_0 ; "fren"
	dd aSpan_0 ; "span"
	dd aItly_0 ; "itly"
	dd aSwed_0 ; "swed"

sub_40A0B0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 34h
	mov edx, eax
	mov ecx, 6
	mov edi, esp
	xor ebx, ebx
	mov esi, off_40A098
	mov [esp+18h], ebx
	rep movsd
	call sub_4762E0
	mov ecx, 40CCh
	mov eax, edx
	mov dword [dword_4D2310], ebx
	call sub_410E80
	mov ebx, 64h
	mov edx, 3000h
	mov eax, dword [dword_4D4D24]
	mov [esp+1Ch], ecx
	call sub_4825A8
	mov eax, 0FF000000h
	mov ecx, 32h
	call sub_48266C
	call sub_482740
	mov eax, aKnwd ; "knwd"
	call sub_405B30
	mov ecx, 1Eh
	mov ebx, 12Ch
	mov edx, 3000h
	mov eax, aChy2 ; "chy2"
	call sub_405B30
	call sub_4824BC
	xor eax, eax
	mov dword [dword_4EB584], eax
	mov eax, dword [dword_4D4D24]
	xor edx, edx
	xor ecx, ecx
	mov eax, [eax+20h]
	xor ebx, ebx
	call sub_428250
	mov eax, dword [dword_4D4D24]
	mov edx, 400h
	call sub_4825A8
	mov eax, aBac1 ; "Bac1"
	call sub_405B30
	xor eax, eax
	mov edx, 400h
	mov al, byte [byte_512DFB]
	xor ecx, ecx
	xor ebx, ebx
	mov eax, [esp+eax*4]
	call sub_405B30
	call sub_4824BC
	xor edx, edx
	mov eax, dword [dword_4D4D24]
	mov dword [dword_4EB588], edx
	mov eax, [eax+20h]
	mov edx, 1
	mov esi, 0FFFFFFFFh
	call sub_428250
	mov eax, 13h
	mov edx, dword [dword_4D5A28]
	mov [esp+20h], esi
	call sub_476750
	xor edx, edx

loc_40A1BF:
	call sub_405960
	test eax, eax
	jnz loc_40A1D1
	call sub_424240
	test eax, eax
	jz loc_40A1DA

loc_40A1D1:
	mov eax, edx
	call sub_403550
	jmp loc_40A1BF

loc_40A1DA:
	mov dword [esp+2Ch], 1C2h

loc_40A1E2:
	mov eax, [esp+1Ch]
	mov ebx, [esp+2Ch]
	neg eax
	cmp eax, ebx
	jge loc_40A42B
	mov eax, 50h
	call sub_486550
	test eax, eax
	jz loc_40A209
	lea edx, [ebx-0Ah]
	mov [esp+2Ch], edx

loc_40A209:
	mov eax, 48h
	call sub_486550
	test eax, eax
	jnz loc_40A3BD

loc_40A21B:
	mov eax, 5
	call sub_4833E7
	push 2
	xor ebx, ebx
	call sub_497680
	call sub_49769C
	push 0FFFFFFFFh
	mov ecx, 20h
	mov eax, 1
	xor edx, edx
	call sub_427B30
	push 1C2h
	mov eax, dword [dword_4DAB7C]
	push eax
	push 64h
	mov edi, 1
	mov esi, [esp+38h]
	push 0
	mov dword [dword_4D20A0], edi
	mov edi, 35Eh
	call sub_497714

loc_40A271:
	mov eax, dword [dword_4DAB7C]
	sar eax, 1
	mov [esp+24h], eax
	mov eax, edi
	call sub_41B6D0
	cmp eax, 4
	jnb loc_40A3E1
	cmp eax, 2
	jnz loc_40A29A
	test ebp, ebp
	jz loc_40A298
	sub esi, 1Ah

loc_40A298:
	xor ebp, ebp

loc_40A29A:
	cmp esi, 4Ah
	jle loc_40A310
	cmp esi, 1DCh
	jge loc_40A310
	mov eax, edi
	call sub_41B6D0
	cmp eax, 4
	jnz loc_40A2E3
	mov eax, edi
	call sub_41B6D0
	cwde
	push eax
	mov eax, edi
	call sub_41B690
	cwde
	push eax
	mov eax, [esp+2Ch]
	mov ecx, 12h
	add eax, 0Ah
	movsx ebx, si
	movsx edx, ax
	mov eax, asc_4C869C ; ":"
	call sub_4054E0

loc_40A2E3:
	mov eax, edi
	call sub_41B6D0
	cwde
	mov edx, [esp+22h]
	push eax
	mov eax, edi
	mov ecx, 12h
	call sub_41B690
	cwde
	movsx ebx, si
	push eax
	mov eax, edi
	sar edx, 10h
	call sub_41B710
	call sub_4054E0

loc_40A310:
	cmp edi, 5DAh
	jnz loc_40A331
	cmp esi, 6Eh
	jg loc_40A331
	mov eax, [esp+1Ch]
	mov edx, eax
	mov [esp+2Ch], eax
	neg edx
	mov [esp+28h], esi
	mov [esp+2Ch], edx

loc_40A331:
	cmp edi, 5D0h
	jnz loc_40A358
	cmp esi, 0FFFFFF9Ch
	jle loc_40A358
	cmp esi, 1C2h
	jge loc_40A358
	push 0FFFFFFFFh
	mov ecx, 20h
	mov ebx, esi
	xor edx, edx
	xor eax, eax
	call sub_427B30

loc_40A358:
	inc edi
	add esi, 1Ah
	cmp edi, 5DCh
	jle loc_40A271
	mov ecx, dword [dword_4DAB80]
	push ecx
	mov ebx, dword [dword_4DAB7C]
	push ebx
	push 0
	push 0
	call sub_497714
	call sub_4976B8
	call sub_4833F3
	call sub_405960
	cmp eax, 0Dh
	jnz loc_40A410

loc_40A39B:
	mov eax, [esp+1Ch]
	mov esi, 1
	mov edi, eax
	mov [esp+2Ch], eax
	neg edi
	mov [esp+18h], esi
	mov [esp+2Ch], edi
	dec dword [esp+2Ch]
	jmp loc_40A1E2

loc_40A3BD:
	mov ecx, [esp+2Ch]
	add ecx, 7
	mov [esp+2Ch], ecx
	cmp ecx, 1C2h
	jle loc_40A21B
	mov dword [esp+2Ch], 1C2h
	jmp loc_40A21B

loc_40A3E1:
	mov edx, [esp+24h]
	sub edx, 14h
	cmp eax, 4
	ja loc_40A3FE
	mov ebp, 1
	add esi, 0Dh
	mov [esp+24h], edx
	jmp loc_40A29A

loc_40A3FE:
	cmp eax, 5
	jnz loc_40A29A
	mov [esp+24h], edx
	jmp loc_40A29A

loc_40A410:
	cmp eax, 1Bh
	jz loc_40A39B
	call sub_424240
	test eax, eax
	jnz loc_40A39B
	dec dword [esp+2Ch]
	jmp loc_40A1E2

loc_40A42B:
	xor esi, esi
	mov edi, [esp+18h]
	mov dword [dword_4D20A0], esi
	test edi, edi
	jz loc_40A469

loc_40A43B:
	call sub_4762E0
	mov eax, 12h
	mov edx, dword [dword_4D5A28]
	mov esi, 1
	call sub_476750
	mov eax, [esp+20h]
	mov dword [dword_4D2310], esi
	add esp, 34h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_40A469:
	mov ebp, 7Fh
	mov eax, 6
	mov ebx, dword [dword_4D5A30]
	mov edx, ebp
	mov dword [dword_4D5A30], ebp
	call sub_4423F0
	mov eax, 64h
	call sub_483410
	mov edx, ebp
	mov eax, 4
	mov [esp+24h], esi
	call sub_4423F0
	mov dword [dword_4D5A30], ebx
	mov ebp, 12h

loc_40A4AB:
	mov eax, 5
	call sub_4833E7
	push 2
	mov esi, [esp+2Ch]
	xor ebx, ebx
	call sub_497680
	call sub_49769C
	push 0FFFFFFFFh
	mov ecx, 20h
	mov eax, 1
	xor edx, edx
	mov edi, 5DAh
	call sub_427B30
	mov eax, [esp+24h]
	mov edx, 1
	add eax, 140h
	mov dword [dword_4D20A0], edx
	mov [esp+30h], ax

loc_40A4FA:
	mov eax, edi
	mov edx, [esp+2Eh]
	call sub_41B6D0
	cwde
	movsx ebx, si
	push eax
	mov eax, edi
	mov ecx, ebp
	call sub_41B690
	cwde
	sar edx, 10h
	push eax
	mov eax, edi
	add esi, 1Ah
	call sub_41B710
	inc edi
	call sub_4054E0
	cmp edi, 5DCh
	jle loc_40A4FA
	call sub_4976B8
	call sub_4833F3
	mov eax, [esp+24h]
	mov ecx, [esp+24h]
	add eax, 2
	add ecx, eax
	mov [esp+24h], ecx
	cmp ecx, 258h
	jl loc_40A4AB
	jmp loc_40A43B
;sub_40A0B0 endp

sub_40A570: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 70h
	mov esi, eax
	xor eax, eax
	xor edx, edx
	mov al, byte [byte_512F3F]
	mov [esp+4], edx
	mov [esp+2Ch], eax
	mov eax, 0FFFFFFFFh
	mov [esp+58h], edx
	call sub_48883C
	test al, 0Ch
	jnz loc_40A5B5
	mov ah, byte [byte_4D32E4]
	mov dl, 1
	or ah, 1
	mov byte [byte_512F41], dl
	mov byte [byte_4D32E4], ah

loc_40A5B5:
	mov eax, esi
	call sub_410E80
	xor eax, eax
	mov al, byte [byte_512DFF]
	mov [esp+20h], eax
	xor eax, eax
	mov al, byte [byte_512F41]
	mov edx, dword [dword_4D5A30]
	mov [esp], eax
	lea eax, 0[edx*8]
	add eax, edx
	shl eax, 2
	sub eax, edx
	lea edx, 0[eax*4]
	mov ecx, 7Fh
	mov eax, edx
	sar edx, 1Fh
	idiv ecx
	mov byte [byte_512DFE], al
	xor eax, eax
	mov al, byte [byte_512DFE]
	mov edx, dword [dword_4D5A2C]
	mov [esp+18h], eax
	lea eax, 0[edx*8]
	add eax, edx
	shl eax, 2
	sub eax, edx
	lea edx, 0[eax*4]
	mov eax, edx
	sar edx, 1Fh
	idiv ecx
	mov byte [byte_512DFD], al
	xor eax, eax
	mov al, byte [byte_512DFD]
	mov edx, dword [dword_4D5A28]
	mov [esp+14h], eax
	lea eax, 0[edx*8]
	add eax, edx
	shl eax, 2
	sub eax, edx
	lea edx, 0[eax*4]
	mov eax, edx
	sar edx, 1Fh
	idiv ecx
	mov byte [byte_512DFC], al
	xor eax, eax
	mov al, byte [byte_512DFC]
	mov [esp+1Ch], eax
	xor eax, eax
	mov al, byte [byte_512F40]
	mov dx, [esi+0Ah]
	mov [esp+5Ch], eax
	test dx, dx
	jle loc_40AEC6
	cmp dx, 3
	jge loc_40AEC6
	mov eax, dword [dword_4D5A2C]

loc_40A693:
	call sub_489800
	mov edx, aLaul ; "laul"
	mov eax, dword [dword_4D40B8]
	call sub_482EB4
	mov eax, [eax+0Ch]
	shl eax, 14h
	sar eax, 14h
	sub eax, 17h
	mov edx, aRaul ; "raul"
	mov [esp+50h], eax
	mov eax, dword [dword_4D40B8]
	call sub_482EB4
	mov edx, eax
	mov eax, [eax+0Ch]
	shl eax, 14h
	sar eax, 14h
	sub eax, 17h
	mov ecx, [edx+0Ch]
	mov [esp+54h], eax
	call sub_486F28
	mov eax, [edx+4]
	xor ebx, ebx
	sar eax, 10h
	mov [esp+34h], ebx
	sub eax, 2
	shl ecx, 4
	mov [esp+4Ch], eax
	mov eax, 1
	sar ecx, 14h
	mov [esp+6Ch], eax
	lea eax, [ecx+3Ch]
	mov ebp, [edx+2]
	mov [esp+10h], eax
	lea eax, [ecx+21h]
	sar ebp, 10h
	add ecx, 6
	mov [esp+8], eax
	mov [esp+0Ch], ecx

loc_40A71D:
	xor eax, eax
	call sub_403550
	cmp byte [byte_512F3F], 0
	jz loc_40AED0
	mov bh, byte [byte_4D32C8]
	xor cl, cl
	or bh, 1
	mov byte [byte_512F40], cl
	mov byte [byte_4D32C8], bh

loc_40A748:
	xor eax, eax
	mov edx, [esp+5Ch]
	mov al, byte [byte_512F40]
	cmp eax, edx
	jz loc_40A790
	test al, al
	jbe loc_40AEDC
	cmp al, 11h
	jnb loc_40AEDC
	mov eax, 2
	call sub_4766D0
	mov ecx, eax
	call sub_476280
	mov edx, dword [dword_4D5A28]
	mov eax, ecx
	call sub_476350

loc_40A785:
	xor eax, eax
	mov al, byte [byte_512F40]
	mov [esp+5Ch], eax

loc_40A790:
	mov edx, [esp+58h]
	call sub_4833C7
	add edx, eax
	mov [esp+58h], edx
	mov eax, esi
	xor edx, edx
	call sub_40BBE0
	test eax, eax
	jz loc_40A7B4
	mov dword [esp+6Ch], 1

loc_40A7B4:
	mov eax, [esi+8]
	sar eax, 10h
	mov [esp+28h], edi
	mov [esp+24h], eax
	mov ah, byte [byte_512ECC]
	xor edi, edi
	test ah, ah
	jnz loc_40A812
	mov ecx, [esp+4Ch]
	mov edx, [esp+0Ch]
	mov eax, [esp+50h]
	mov ebx, ebp
	call sub_423DC0
	test eax, eax
	jz loc_40A7F0
	mov edi, 1
	mov word [esi+0Ah], 0

loc_40A7F0:
	mov ecx, [esp+4Ch]
	mov edx, [esp+8]
	mov eax, [esp+50h]
	mov ebx, ebp
	call sub_423DC0
	test eax, eax
	jz loc_40A812
	mov edi, 1
	mov word [esi+0Ah], 1

loc_40A812:
	mov ecx, [esp+4Ch]
	mov edx, [esp+10h]
	mov eax, [esp+50h]
	mov ebx, ebp
	call sub_423DC0
	test eax, eax
	jz loc_40A834
	mov edi, 1
	mov word [esi+0Ah], 2

loc_40A834:
	cmp byte [byte_512ECC], 0
	jnz loc_40A881
	mov ecx, [esp+4Ch]
	mov edx, [esp+0Ch]
	mov eax, [esp+54h]
	mov ebx, ebp
	call sub_423DC0
	test eax, eax
	jz loc_40A85F
	mov edi, 2
	mov word [esi+0Ah], 0

loc_40A85F:
	mov ecx, [esp+4Ch]
	mov edx, [esp+8]
	mov eax, [esp+54h]
	mov ebx, ebp
	call sub_423DC0
	test eax, eax
	jz loc_40A881
	mov edi, 2
	mov word [esi+0Ah], 1

loc_40A881:
	mov ecx, [esp+4Ch]
	mov edx, [esp+10h]
	mov eax, [esp+54h]
	mov ebx, ebp
	call sub_423DC0
	test eax, eax
	jz loc_40AF0B
	mov edi, 2
	mov word [esi+0Ah], 2

loc_40A8A7:
	mov eax, [esi+8]
	mov ecx, [esp+24h]
	sar eax, 10h
	cmp eax, ecx
	jz loc_40AF24

loc_40A8B9:
	mov edx, 2Dh
	mov eax, 1
	call sub_4423F0

loc_40A8C8:
	call sub_40EB20
	call sub_428A20
	mov edx, 400h
	mov eax, [esi+4]
	xor ecx, ecx
	xor ebx, ebx
	call sub_405B30
	mov eax, dword [dword_4D2314+2]
	sar eax, 10h
	mov edx, 1000h
	mov eax, dword dword_4D231C[eax*4]
	xor ecx, ecx
	xor ebx, ebx
	mov eax, [eax+20h]
	call sub_405B60
	mov eax, 8Ch
	mov ecx, 100h
	mov [esp+38h], eax
	mov [esp+44h], ecx
	mov [esp+30h], ecx
	mov [esp+40h], ecx
	mov cx, [esi+0Ah]
	mov [esp+3Ch], eax
	test cx, cx
	jnz loc_40A933
	mov eax, 100h
	mov [esp+40h], eax

loc_40A933:
	cmp word [esi+0Ah], 1
	jnz loc_40A947
	mov ebx, 100h
	mov [esp+30h], ebx
	mov [esp+3Ch], ebx

loc_40A947:
	cmp word [esi+0Ah], 2
	jnz loc_40A95B
	mov ecx, 100h
	mov [esp+44h], ecx
	mov [esp+38h], ecx

loc_40A95B:
	add ah, 20h
	mov ecx, 6
	cwde
	mov ebx, 0FFFFFFE9h
	mov [esp+48h], eax
	mov edx, eax
	mov eax, aAudi ; "audi"
	call sub_405B30
	mov eax, [esp+3Ch]
	add ah, 20h
	mov ecx, 21h
	cwde
	mov ebx, 0FFFFFFE9h
	mov [esp+64h], eax
	mov edx, eax
	mov eax, aAudi ; "audi"
	call sub_405B30
	mov eax, [esp+38h]
	add ah, 20h
	mov ecx, 3Ch
	cwde
	mov ebx, 0FFFFFFE9h
	mov [esp+60h], eax
	mov edx, eax
	mov eax, aAudi ; "audi"
	call sub_405B30
	mov eax, 188h
	mov ecx, dword [dword_4DAB80]
	mov ebx, dword [dword_4DAB7C]
	xor edx, edx
	call sub_482E00
	mov ecx, 6
	xor ebx, ebx
	mov edx, [esp+48h]
	mov bl, byte [byte_512DFC]
	mov eax, aAbar ; "abar"
	sub ebx, 0A3h
	call sub_405B30
	mov ecx, 21h
	xor ebx, ebx
	mov edx, [esp+64h]
	mov bl, byte [byte_512DFD]
	mov eax, aAbar ; "abar"
	sub ebx, 0A3h
	call sub_405B30
	mov ecx, 3Ch
	xor ebx, ebx
	mov edx, [esp+60h]
	mov bl, byte [byte_512DFE]
	mov eax, aAbar ; "abar"
	sub ebx, 0A3h
	call sub_405B30
	mov ecx, dword [dword_4DAB80]
	mov ebx, dword [dword_4DAB7C]
	xor edx, edx
	xor eax, eax
	call sub_482E00
	mov eax, [esp+40h]
	mov ecx, 6
	add ah, 20h
	mov ebx, 0FFFFFFE9h
	movsx edx, ax
	mov eax, aLaud ; "laud"
	call sub_405B30
	mov ecx, 6
	mov ebx, 0FFFFFFE9h
	mov edx, [esp+48h]
	mov eax, aRaud ; "raud"
	call sub_405B30
	mov eax, [esp+30h]
	mov ecx, 21h
	add ah, 20h
	mov ebx, 0FFFFFFE9h
	movsx edx, ax
	mov eax, aLaud ; "laud"
	call sub_405B30
	mov ecx, 21h
	mov ebx, 0FFFFFFE9h
	mov edx, [esp+64h]
	mov eax, aRaud ; "raud"
	call sub_405B30
	mov eax, [esp+44h]
	mov ecx, 3Ch
	add ah, 20h
	mov ebx, 0FFFFFFE9h
	movsx edx, ax
	mov eax, aLaud ; "laud"
	call sub_405B30
	mov ecx, 3Ch
	mov ebx, 0FFFFFFE9h
	mov edx, [esp+60h]
	mov eax, aRaud ; "raud"
	call sub_405B30
	cmp edi, 1
	jnz loc_40AF75
	mov bx, [esi+0Ah]
	test bx, bx
	jnz loc_40AF3F
	mov ecx, 6
	mov ebx, 0FFFFFFE9h
	mov edx, [esp+48h]

loc_40AB13:
	mov eax, aLaul ; "laul"

loc_40AB18:
	call sub_405B30

loc_40AB1D:
	mov eax, esi
	call sub_40FA90
	call sub_405C70

loc_40AB2E:
	call sub_423B90
	mov eax, esi
	call sub_423CA0
	mov [esp+6Ch], eax
	call sub_405960
	mov dx, [esi+0Ah]
	mov [esp+68h], ax
	test dx, dx
	jle loc_40AFDF
	cmp dx, 3
	jge loc_40AFDF
	xor edx, edx
	mov dl, byte [byte_512DFD]
	imul edx, 7Fh
	mov ecx, 8Ch
	mov eax, edx
	sar edx, 1Fh
	idiv ecx
	mov dword [dword_4D5A2C], eax
	cmp eax, 7Fh
	jle loc_40AB8A
	mov dword [dword_4D5A2C], 7Fh

loc_40AB8A:
	mov eax, 32h
	mov edx, dword [dword_4D5A2C]

loc_40AB95:
	call sub_4864A0
	mov cx, [esi+0Ah]
	cmp cx, 1
	jnz loc_40B01A

loc_40ABA8:
	cmp byte [byte_4D24D8], 0
	jnz loc_40B024
	cmp dword [dword_4D96B0], 0
	jz loc_40B05B
	push 40h
	mov ecx, 7Fh
	mov edx, 7
	mov eax, dword [dword_50B410]
	xor ebx, ebx

loc_40ABD5:
	call sub_442280
	mov dword [dword_4E5910], eax
	mov byte [byte_4D24D8], 1

loc_40ABE6:
	xor edx, edx
	mov dl, byte [byte_512DFE]
	imul edx, 7Fh
	mov ecx, 8Ch
	mov eax, edx
	sar edx, 1Fh
	idiv ecx
	mov dword [dword_4D5A30], eax
	cmp eax, 7Fh
	jle loc_40AC11
	mov dword [dword_4D5A30], 7Fh

loc_40AC11:
	mov ecx, [esp+68h]
	test cx, cx
	jz loc_40AD4F
	mov eax, [esp+58h]
	cmp eax, [esp+4]
	jle loc_40AD4F
	add eax, 0Fh
	mov [esp+4], eax
	mov eax, 1
	mov dx, [esi+0Ah]
	mov [esp+6Ch], eax
	cmp dx, 3
	jge loc_40B0B6
	cmp cx, 0Dh
	jnz loc_40B0A0

loc_40AC54:
	mov edx, [esp+68h]
	cmp dx, 4B00h
	jnz loc_40B0CD

loc_40AC63:
	mov ax, [esi+0Ah]
	cmp ax, 1
	jnb loc_40B11C
	test ax, ax
	jnz loc_40ACA5
	xor eax, eax
	mov al, byte [byte_512DFC]
	sub eax, 8
	test eax, eax
	jle loc_40B164

loc_40AC88:
	xor edx, edx
	mov dl, al
	imul edx, 7Fh
	mov ecx, 8Ch
	mov byte [byte_512DFC], al

loc_40AC99:
	mov eax, edx
	sar edx, 1Fh
	idiv ecx
	call sub_489800

loc_40ACA5:
	cmp byte [byte_512F3F], 0
	jz loc_40ACCA
	cmp dword [esp+2Ch], 0
	jnz loc_40ACCA
	call sub_476BB0
	test eax, eax
	jz loc_40B201
	mov dword [esp+2Ch], 1

loc_40ACCA:
	xor edx, edx
	mov dl, byte [byte_512DFD]
	imul edx, 7Fh
	mov ecx, 8Ch
	mov eax, edx
	sar edx, 1Fh
	idiv ecx
	xor edx, edx
	mov dl, byte [byte_512DFC]
	imul edx, 7Fh
	mov dword [dword_4D5A2C], eax
	mov eax, edx
	sar edx, 1Fh
	idiv ecx
	xor edx, edx
	mov dl, byte [byte_512DFE]
	imul edx, 7Fh
	mov dword [dword_4D5A28], eax
	mov eax, edx
	sar edx, 1Fh
	idiv ecx
	mov ecx, dword [dword_4D5A2C]
	mov dword [dword_4D5A30], eax
	cmp ecx, 7Fh
	jle loc_40AD29
	mov dword [dword_4D5A2C], 7Fh

loc_40AD29:
	cmp dword [dword_4D5A28], 7Fh
	jle loc_40AD3C
	mov dword [dword_4D5A28], 7Fh

loc_40AD3C:
	cmp dword [dword_4D5A30], 7Fh
	jle loc_40AD4F
	mov dword [dword_4D5A30], 7Fh

loc_40AD4F:
	mov eax, [esp+34h]
	test eax, eax
	jz loc_40A71D
	cmp eax, 0FFFFFFFEh
	jnz loc_40AD7B
	mov al, [esp+18h]
	mov byte [byte_512DFE], al
	mov al, [esp+14h]
	mov byte [byte_512DFD], al
	mov al, [esp+1Ch]
	mov byte [byte_512DFC], al

loc_40AD7B:
	xor edx, edx
	mov dl, byte [byte_512DFD]
	mov eax, edx
	shl eax, 7
	sub eax, edx
	mov edx, eax
	mov ecx, 8Ch
	sar edx, 1Fh
	idiv ecx
	xor edx, edx
	mov dl, byte [byte_512DFC]
	mov dword [dword_4D5A2C], eax
	mov eax, edx
	shl eax, 7
	sub eax, edx
	mov edx, eax
	sar edx, 1Fh
	idiv ecx
	xor edx, edx
	mov dl, byte [byte_512DFE]
	mov dword [dword_4D5A28], eax
	mov eax, edx
	shl eax, 7
	sub eax, edx
	mov edx, eax
	sar edx, 1Fh
	idiv ecx
	mov ecx, dword [dword_4D5A2C]
	mov dword [dword_4D5A30], eax
	mov dword [dword_4D5A34], eax
	cmp ecx, 7Fh
	jle loc_40ADEB
	mov dword [dword_4D5A2C], 7Fh

loc_40ADEB:
	cmp dword [dword_4D5A28], 7Fh
	jle loc_40ADFE
	mov dword [dword_4D5A28], 7Fh

loc_40ADFE:
	cmp dword [dword_4D5A30], 7Fh
	jle loc_40AE11
	mov dword [dword_4D5A30], 7Fh

loc_40AE11:
	cmp byte [byte_4D24D8], 0
	jz loc_40AE2C
	mov eax, dword [dword_4E5910]
	xor dh, dh
	call sub_489840
	mov byte [byte_4D24D8], dh

loc_40AE2C:
	mov eax, 32h
	mov edx, dword [dword_4D5A28]
	call sub_4864A0
	mov bl, byte [byte_512DFF]
	cmp bl, 1
	jnz loc_40B218
	xor ebx, ebx
	mov dword [dword_4D96B0], ebx
	mov dword [dword_4D5A44], ebx

loc_40AE59:
	cmp byte [byte_512F3E], 0
	jz loc_40B238
	xor eax, eax

loc_40AE68:
	call sub_488898
	mov eax, dword [dword_4D5A28]
	mov edi, [esp+34h]
	call sub_489800
	cmp edi, 0FFFFFFFEh
	jz loc_40AEA5
	xor eax, eax
	mov ebp, [esp+20h]
	mov al, byte [byte_512DFF]
	cmp eax, ebp
	jnz loc_40B242
	xor eax, ebp
	mov edx, [esp]
	mov al, byte [byte_512F41]
	cmp eax, edx
	jnz loc_40B242

loc_40AEA5:
	mov ch, byte [byte_512F40]
	test ch, ch
	jbe loc_40AEB8
	cmp ch, 0Fh
	jb loc_40B292

loc_40AEB8:
	mov eax, [esp+34h]
	add esp, 70h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_40AEC6:
	mov eax, dword [dword_4D5A28]
	jmp loc_40A693

loc_40AED0:
	and byte [byte_4D32C8], 0FEh
	jmp loc_40A748

loc_40AEDC:
	mov ecx, [esp+5Ch]
	test ecx, ecx
	jle loc_40A785
	cmp ecx, 11h
	jge loc_40A785
	call sub_476280
	mov eax, 12h
	mov edx, dword [dword_4D5A28]
	call sub_476750
	jmp loc_40A785

loc_40AF0B:
	test edi, edi
	jnz loc_40A8A7
	cmp word [esp+6Ch], 0
	jnz loc_40A8C8
	jmp loc_40AB2E

loc_40AF24:
	cmp edi, [esp+28h]
	jnz loc_40A8B9
	cmp word [esp+6Ch], 0
	jnz loc_40A8C8
	jmp loc_40AB2E

loc_40AF3F:
	cmp bx, 1
	jz loc_40AF62
	cmp bx, 2
	jnz loc_40AB1D
	mov ecx, 3Ch
	mov ebx, 0FFFFFFE9h
	mov edx, [esp+60h]
	jmp loc_40AB13

loc_40AF62:
	mov ecx, 21h
	mov ebx, 0FFFFFFE9h
	mov edx, [esp+64h]
	jmp loc_40AB13

loc_40AF75:
	cmp edi, 2
	jnz loc_40AB1D
	mov cx, [esi+0Ah]
	test cx, cx
	jz loc_40AFAF
	cmp cx, 1
	jz loc_40AFC7
	cmp cx, 2
	jnz loc_40AB1D
	mov ecx, 3Ch
	mov ebx, 0FFFFFFE9h
	mov edx, [esp+60h]
	mov eax, aRaul ; "raul"
	jmp loc_40AB18

loc_40AFAF:
	mov ecx, 6
	mov ebx, 0FFFFFFE9h
	mov edx, [esp+48h]
	mov eax, aRaul ; "raul"
	jmp loc_40AB18

loc_40AFC7:
	mov ecx, 21h
	mov ebx, 0FFFFFFE9h
	mov edx, [esp+64h]
	mov eax, aRaul ; "raul"
	jmp loc_40AB18

loc_40AFDF:
	xor edx, edx
	mov dl, byte [byte_512DFC]
	imul edx, 7Fh
	mov ecx, 8Ch
	mov eax, edx
	sar edx, 1Fh
	idiv ecx
	mov dword [dword_4D5A28], eax
	cmp eax, 7Fh
	jle loc_40B00A
	mov dword [dword_4D5A28], 7Fh

loc_40B00A:
	mov eax, 32h
	mov edx, dword [dword_4D5A28]
	jmp loc_40AB95

loc_40B01A:
	cmp cx, 2
	jz loc_40ABA8

loc_40B024:
	mov dx, [esi+0Ah]
	cmp dx, 1
	jnz loc_40B076

loc_40B02E:
	cmp byte [byte_4D24D8], 0
	jnz loc_40B07E

loc_40B037:
	cmp byte [byte_4D24D8], 0
	jz loc_40ABE6
	mov eax, dword [dword_4E5910]
	xor cl, cl
	call sub_489840
	mov byte [byte_4D24D8], cl
	jmp loc_40ABE6

loc_40B05B:
	push 40h
	mov ecx, 7Fh
	mov ebx, 40h
	mov edx, 7
	mov eax, dword [dword_50B410]
	jmp loc_40ABD5

loc_40B076:
	cmp dx, 2
	jz loc_40B02E
	jmp loc_40B037

loc_40B07E:
	mov eax, dword [dword_4D5A30]
	mov edx, eax
	sar edx, 1Fh
	sub eax, edx
	sar eax, 1
	mov ecx, dword [dword_4E5910]
	mov edx, eax
	mov eax, ecx
	call sub_48999C
	jmp loc_40ABE6

loc_40B0A0:
	cmp cx, 4B00h
	jz loc_40AC54
	cmp cx, 4D00h
	jz loc_40AC54

loc_40B0B6:
	mov edx, [esp+66h]
	mov eax, esi
	sar edx, 10h
	call sub_410414
	mov [esp+34h], eax
	jmp loc_40ACA5

loc_40B0CD:
	cmp dx, 0Dh
	jnz loc_40B0DC
	cmp edi, 1
	jz loc_40AC63

loc_40B0DC:
	mov ecx, [esp+68h]
	cmp cx, 4D00h
	jnz loc_40B17B

loc_40B0EB:
	mov ax, [esi+0Ah]
	cmp ax, 1
	jnb loc_40B193
	test ax, ax
	jnz loc_40ACA5
	xor eax, eax
	mov al, byte [byte_512DFC]
	add eax, 8
	cmp eax, 8Bh
	jge loc_40B1E1
	jmp loc_40AC88

loc_40B11C:
	ja loc_40B142
	xor eax, eax
	mov al, byte [byte_512DFD]
	sub eax, 8
	test eax, eax
	jle loc_40B16B

loc_40B12C:
	xor edx, edx
	mov dl, al
	imul edx, 7Fh
	mov ecx, 8Ch
	mov byte [byte_512DFD], al
	jmp loc_40AC99

loc_40B142:
	cmp ax, 2
	jnz loc_40ACA5
	xor eax, eax
	mov al, byte [byte_512DFE]
	sub eax, 8
	test eax, eax
	jle loc_40B16F
	mov byte [byte_512DFE], al
	jmp loc_40ACA5

loc_40B164:
	xor eax, eax
	jmp loc_40AC88

loc_40B16B:
	xor eax, eax
	jmp loc_40B12C

loc_40B16F:
	xor eax, eax
	mov byte [byte_512DFE], al
	jmp loc_40ACA5

loc_40B17B:
	cmp cx, 0Dh
	jnz loc_40ACA5
	cmp edi, 2
	jz loc_40B0EB
	jmp loc_40ACA5

loc_40B193:
	ja loc_40B1BC
	xor eax, eax
	mov al, byte [byte_512DFD]
	add eax, 8
	cmp eax, 8Bh
	jge loc_40B1EB

loc_40B1A6:
	xor edx, edx
	mov dl, al
	imul edx, 7Fh
	mov ecx, 8Ch
	mov byte [byte_512DFD], al
	jmp loc_40AC99

loc_40B1BC:
	cmp ax, 2
	jnz loc_40ACA5
	xor eax, eax
	mov al, byte [byte_512DFE]
	add eax, 8
	cmp eax, 8Bh
	jge loc_40B1F2
	mov byte [byte_512DFE], al
	jmp loc_40ACA5

loc_40B1E1:
	mov eax, 8Bh
	jmp loc_40AC88

loc_40B1EB:
	mov eax, 8Bh
	jmp loc_40B1A6

loc_40B1F2:
	mov eax, 8Bh
	mov byte [byte_512DFE], al
	jmp loc_40ACA5

loc_40B201:
	mov eax, 30Ch
	call sub_402CD0
	xor ah, ah
	mov byte [byte_512F3F], ah
	jmp loc_40ACCA

loc_40B218:
	test bl, bl
	jnz loc_40AE59
	xor ecx, ecx
	mov edx, 1
	mov dword [dword_4D96B0], ecx
	mov dword [dword_4D5A44], edx
	jmp loc_40AE59

loc_40B238:
	mov eax, 0FFFFFFCEh
	jmp loc_40AE68

loc_40B242:
	call sub_4762E0
	call sub_4761E0
	mov eax, 306h
	call sub_402CD0
	call sub_476CA0
	xor edx, edx
	xor eax, eax
	mov dl, byte [byte_512DFF]
	mov al, byte [byte_512F41]
	call sub_476CC0
	call sub_445A60
	mov eax, 12h
	mov edx, dword [dword_4D5A28]
	call sub_476750
	mov eax, [esp+34h]
	add esp, 70h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_40B292:
	call sub_4762E0
	mov eax, 12h
	mov edx, dword [dword_4D5A28]
	call sub_476750
	mov eax, [esp+34h]
	add esp, 70h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_40A570 endp

sub_40B2C0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 34h
	mov esi, eax
	xor ecx, ecx
	xor edx, edx
	mov cl, byte [dword_512ED4]
	mov [esp+24h], edx
	mov [esp+0Ch], edx
	mov [esp+2Ch], edx
	call sub_479240
	xor eax, eax
	mov [esp+18h], edx
	mov al, byte [dword_512ED4]
	lea edx, 0[ecx*8]
	call sub_4792C0
	add edx, ecx
	call sub_479340
	shl edx, 2
	mov eax, esi
	sub edx, ecx
	call sub_410E80
	shl edx, 2
	mov ecx, 64h
	mov eax, edx
	sar edx, 1Fh
	idiv ecx
	mov edx, aLaul ; "laul"
	mov [esp+30h], eax
	mov eax, dword [dword_4D40B8]
	call sub_482EB4
	mov eax, [eax+0Ch]
	shl eax, 14h
	sar eax, 14h
	sub eax, 17h
	mov edx, aRaul ; "raul"
	mov [esp+4], eax
	mov eax, dword [dword_4D40B8]
	call sub_482EB4
	mov edx, [eax+0Ch]
	mov edi, 1
	shl edx, 14h
	mov ecx, [eax+2]
	sar edx, 14h
	sar ecx, 10h
	sub edx, 17h
	mov [esp+8], ecx
	mov [esp], edx
	mov edx, [eax+0Ch]
	mov eax, [eax+4]
	shl edx, 4
	sar eax, 10h
	sar edx, 14h
	mov [esp+1Ch], eax
	add edx, 21h
	call sub_486F28
	mov [esp+20h], edx

loc_40B38E:
	xor eax, eax
	mov edx, [esp+2Ch]
	call sub_403550
	call sub_4833C7
	add edx, eax
	mov [esp+2Ch], edx
	mov eax, esi
	xor edx, edx
	call sub_40BBE0
	test eax, eax
	jz loc_40B3B6
	mov edi, 1

loc_40B3B6:
	mov ecx, [esp+1Ch]
	mov ebx, [esp+8]
	mov eax, [esi+8]
	mov edx, [esp+20h]
	sar eax, 10h
	xor ebp, ebp
	mov [esp+10h], eax
	mov eax, [esp+4]
	mov [esp+14h], ebp
	call sub_423DC0
	test eax, eax
	jz loc_40B3EA
	mov ebp, 1
	mov word [esi+0Ah], 0

loc_40B3EA:
	mov ecx, [esp+1Ch]
	mov ebx, [esp+8]
	mov edx, [esp+20h]
	mov eax, [esp]
	call sub_423DC0
	test eax, eax
	jz loc_40B40D
	mov ebp, 2
	mov word [esi+0Ah], 0

loc_40B40D:
	mov eax, [esi+8]
	mov ebx, [esp+10h]
	sar eax, 10h
	cmp eax, ebx
	jz loc_40B61A

loc_40B41F:
	mov edx, 2Dh
	mov eax, 1
	call sub_4423F0

loc_40B42E:
	call sub_40EB20
	call sub_428A20
	mov edx, 400h
	mov eax, [esi+4]
	xor ecx, ecx
	xor ebx, ebx
	call sub_405B30
	mov eax, dword [dword_4D2314+2]
	sar eax, 10h
	mov edx, 1000h
	mov eax, dword dword_4D231C[eax*4]
	xor ecx, ecx
	xor ebx, ebx
	mov eax, [eax+20h]
	call sub_405B60
	mov dword [esp+28h], 100h
	mov dx, [esi+0Ah]
	mov eax, 8Ch
	test dx, dx
	jnz loc_40B488
	mov eax, 100h
	mov [esp+28h], eax

loc_40B488:
	mov ecx, 21h
	add ah, 20h
	mov ebx, 0FFFFFFE9h
	movsx edi, ax
	mov eax, aAudi ; "audi"
	mov edx, edi
	call sub_405B30
	mov eax, 188h
	mov ecx, dword [dword_4DAB80]
	mov ebx, dword [dword_4DAB7C]
	xor edx, edx
	call sub_482E00
	mov ebx, [esp+30h]
	mov ecx, 21h
	mov eax, aAbar ; "abar"
	mov edx, edi
	sub ebx, 0A3h
	call sub_405B30
	mov ecx, dword [dword_4DAB80]
	mov ebx, dword [dword_4DAB7C]
	xor edx, edx
	xor eax, eax
	call sub_482E00
	mov eax, [esp+28h]
	mov ecx, 21h
	add ah, 20h
	mov ebx, 0FFFFFFE9h
	movsx edx, ax
	mov eax, aLaud ; "laud"
	call sub_405B30
	mov ecx, 21h
	mov ebx, 0FFFFFFE9h
	mov eax, aRaud ; "raud"
	mov edx, edi
	call sub_405B30
	cmp word [esi+0Ah], 0
	jnz loc_40B546
	cmp ebp, 1
	jnz loc_40B632
	mov ecx, 21h
	mov ebx, 0FFFFFFE9h
	mov eax, aLaul ; "laul"

loc_40B53F:
	mov edx, edi
	call sub_405B30

loc_40B546:
	mov eax, esi
	call sub_40FA90
	call sub_405C70

loc_40B557:
	call sub_423B90
	mov eax, esi
	call sub_423CA0
	mov edi, eax
	call sub_405960
	mov edx, eax
	test ax, ax
	jz loc_40B5AF
	mov ecx, [esp+2Ch]
	cmp ecx, [esp+0Ch]
	jle loc_40B5AF
	add ecx, 0Fh
	mov edi, 1
	mov [esp+0Ch], ecx
	cmp ax, 4B00h
	jnz loc_40B64F

loc_40B591:
	cmp word [esi+0Ah], 0
	jnz loc_40B65E
	mov eax, [esp+30h]
	sub eax, 0Eh
	test eax, eax
	jle loc_40B67F

loc_40B5AB:
	mov [esp+30h], eax

loc_40B5AF:
	imul edx, [esp+30h], 64h
	mov ecx, 8Ch
	mov eax, edx
	sar edx, 1Fh
	idiv ecx
	mov ecx, eax
	cmp eax, 64h
	jle loc_40B5CC
	mov eax, 64h

loc_40B5CC:
	mov edx, [esp+18h]
	mov ecx, eax
	cmp eax, edx
	jz loc_40B5DF
	mov [esp+18h], eax
	call sub_479310

loc_40B5DF:
	mov ebx, [esp+24h]
	test ebx, ebx
	jz loc_40B38E
	cmp ebx, 0FFFFFFFEh
	jz loc_40B5F6
	mov byte [dword_512ED4], cl

loc_40B5F6:
	xor eax, eax
	mov al, byte [dword_512ED4]
	call sub_4792C0
	call sub_4792D0
	call sub_479220
	mov eax, [esp+24h]
	add esp, 34h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_40B61A:
	cmp ebp, [esp+14h]
	jnz loc_40B41F
	test di, di
	jnz loc_40B42E
	jmp loc_40B557

loc_40B632:
	cmp ebp, 2
	jnz loc_40B546
	mov ecx, 21h
	mov ebx, 0FFFFFFE9h
	mov eax, aRaul ; "raul"
	jmp loc_40B53F

loc_40B64F:
	cmp ax, 0Dh
	jnz loc_40B65E
	cmp ebp, 1
	jz loc_40B591

loc_40B65E:
	cmp dx, 4D00h
	jnz loc_40B686

loc_40B665:
	cmp word [esi+0Ah], 0
	jnz loc_40B691
	mov eax, [esp+30h]
	add eax, 0Eh
	cmp eax, 8Ch
	jge loc_40B6A4
	jmp loc_40B5AB

loc_40B67F:
	xor eax, eax
	jmp loc_40B5AB

loc_40B686:
	cmp dx, 0Dh
	jnz loc_40B691
	cmp ebp, 2
	jz loc_40B665

loc_40B691:
	movsx edx, dx
	mov eax, esi
	call sub_410414
	mov [esp+24h], eax
	jmp loc_40B5AF

loc_40B6A4:
	mov eax, 8Ch
	jmp loc_40B5AB
;sub_40B2C0 endp

off_40B6B0: dd loc_40B70C
	dd loc_40BB23 ; jump table for switch statement
	dd loc_40BB23
	dd loc_40BB23
	dd loc_40BB23

sub_40B6C4: ;SUBROUTINE
	push esi
	push edi
	sub esp, 1A8h
	mov [esp+194h], eax
	mov [esp+1A0h], edx
	mov ecx, 58h
	mov edi, esp
	mov esi, off_409F38
	xor edx, edx
	mov ax, word [word_4D3ECE]
	mov dword [dword_4D2314], edx
	rep movsd
	cmp ax, 4 ; switch 5 cases
	ja loc_40BB35 ; jumptable 0040B705 default case
	and eax, 0FFFFh
	jmp off_40B6B0[eax*4] ; switch jump

loc_40B70C:
	xor ebx, ebx ; jumptable 0040B705 case 0
	mov word [word_4D24C0], bx

loc_40B715:
	xor eax, eax
	mov al, byte [byte_512DA9]
	mov [esp+188h], ax
	xor eax, eax
	mov al, byte [byte_512DAA]
	mov [esp+18Ah], ax
	cmp al, 2
	jnz loc_40BB43
	xor ecx, ecx
	mov [esp+18Ch], cx

loc_40B745:
	xor eax, eax
	mov al, byte [byte_512DBF]
	mov [esp+18Eh], ax
	xor eax, eax
	mov al, byte [byte_512DDA]
	mov dl, byte [byte_512DAA]
	mov [esp+190h], ax
	cmp dl, 2
	jnz loc_40BB57
	mov word [esp+192h], 0Fh

loc_40B77C:
	cmp word [esp+194h], 0
	jz loc_40BACC
	mov eax, dword [dword_5637F4]
	mov ecx, 1F2h
	add eax, 14h
	xor ebx, ebx
	mov dword [dword_4D24CC], eax
	mov eax, [esp+1A0h]
	mov [esp+1A4h], bx
	sub eax, 3E8h
	mov [esp+19Ch], ecx
	mov [esp+198h], eax

loc_40B7C2:
	cmp byte [byte_512DA9], 1
	jnz loc_40BBA8

loc_40B7CF:
	mov edi, [esp+1A4h]
	cmp di, 3
	jge loc_40BBBC
	mov eax, edi

loc_40B7E2:
	cwde
	imul eax, 58h
	mov edx, [esp+1A2h]
	sar edx, 10h
	mov edx, [esp+edx*2+186h]
	sar edx, 10h
	shl edx, 2
	add eax, edx
	mov ecx, [esp+eax]
	push ecx
	push aS5 ; "%s5"
	lea eax, [esp+168h]
	push eax
	call sprintf_
	mov bh, byte [byte_512DFB]
	add esp, 0Ch
	cmp bh, 2
	jnz loc_40B989
	mov edx, aA5 ; "A5"
	lea eax, [esp+160h]
	call strcmp_
	test eax, eax
	jnz loc_40B862
	mov esi, aFre1 ; "fre1"
	lea edi, [esp+160h]
	push edi

loc_40B849:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_40B861
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_40B849

loc_40B861:
	pop edi

loc_40B862:
	mov edx, aAd2 ; "Ad"
	lea eax, [esp+160h]
	call strcmp_
	test eax, eax
	jnz loc_40B89D
	mov esi, aFred ; "fred"
	lea edi, [esp+160h]
	push edi

loc_40B884:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_40B89C
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_40B884

loc_40B89C:
	pop edi

loc_40B89D:
	mov edx, aB5 ; "B5"
	lea eax, [esp+160h]
	call strcmp_
	test eax, eax
	jnz loc_40B8D8
	mov esi, aFre2 ; "fre2"
	lea edi, [esp+160h]
	push edi

loc_40B8BF:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_40B8D7
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_40B8BF

loc_40B8D7:
	pop edi

loc_40B8D8:
	mov edx, aBd ; "Bd"
	lea eax, [esp+160h]
	call strcmp_
	test eax, eax
	jnz loc_40B913
	mov esi, aFree ; "free"
	lea edi, [esp+160h]
	push edi

loc_40B8FA:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_40B912
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_40B8FA

loc_40B912:
	pop edi

loc_40B913:
	mov edx, aC5 ; "C5"
	lea eax, [esp+160h]
	call strcmp_
	test eax, eax
	jnz loc_40B94E
	mov esi, aFre3 ; "fre3"
	lea edi, [esp+160h]
	push edi

loc_40B935:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_40B94D
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_40B935

loc_40B94D:
	pop edi

loc_40B94E:
	mov edx, aCd ; "Cd"
	lea eax, [esp+160h]
	call strcmp_
	test eax, eax
	jnz loc_40B989
	mov esi, aFref ; "fref"
	lea edi, [esp+160h]
	push edi

loc_40B970:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_40B988
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_40B970

loc_40B988:
	pop edi

loc_40B989:
	lea edi, [esp+160h]
	sub ecx, ecx
	dec ecx
	xor eax, eax
	repne scasb
	not ecx
	dec ecx
	cmp ecx, 2
	jnz loc_40B9CD
	mov esi, asc_4C8648 ; " "
	lea edi, [esp+160h]
	push edi
	sub ecx, ecx
	dec ecx
	mov al, 0
	repne scasb
	dec edi

loc_40B9B4:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_40B9CC
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_40B9B4

loc_40B9CC:
	pop edi

loc_40B9CD:
	lea edx, [esp+160h]
	mov eax, dword [dword_4D40B8]
	call sub_482EB4
	mov edx, eax
	mov eax, [esp+1A0h]
	cmp ax, 7D0h
	jge loc_40BA0D
	cmp ax, 3E8h
	jle loc_40BBC6
	imul eax, [esp+1A4h], 53h
	mov ebx, [esp+198h]
	sub ebx, eax
	mov eax, ebx

loc_40BA0A:
	test ax, ax

loc_40BA0D:
	mov eax, [edx+0Ch]
	shl eax, 14h
	sar eax, 14h
	mov edi, [esp+1A4h]
	add eax, 19h
	cmp di, 2
	jge loc_40BA2B
	add eax, 3

loc_40BA2B:
	mov edx, [edx+0Ch]
	mov esi, [esp+1A2h]
	shl edx, 4
	sar esi, 10h
	sar edx, 14h
	mov ebx, dword dword_4D24A4[esi*4]
	movsx ecx, ax
	add edx, ebx
	mov eax, esi
	movsx edx, dx
	mov ebx, dword [dword_4D24C6]
	push edx
	sar ebx, 10h
	lea edx, [esp+164h]
	call sub_4281B0

loc_40BA65:
	mov edx, [esp+1A4h]
	mov eax, [esp+19Ch]
	inc edx
	sub eax, 53h
	mov [esp+1A4h], dx
	mov [esp+19Ch], eax
	cmp dx, 6
	jge loc_40BACC
	cmp dx, 5
	jnz loc_40B7C2
	cmp byte [byte_512DF6], 0
	jnz loc_40B7C2
	cmp byte [byte_512DAA], 0
	jnz loc_40B7C2
	push 0
	mov eax, [esp+1A6h]
	lea edx, [esp+164h]
	xor ecx, ecx
	xor ebx, ebx
	sar eax, 10h
	call sub_4281B0

loc_40BACC:
	mov eax, [esp+188h]
	mov word [word_4E5934], ax
	mov eax, [esp+18Ah]
	mov word [word_4E5936], ax
	mov eax, [esp+18Ch]
	mov word [word_4E5938], ax
	mov eax, [esp+18Eh]
	mov word [word_4E593A], ax
	mov eax, [esp+190h]
	mov word [word_4E593C], ax
	mov eax, [esp+192h]
	mov word [word_4E593E], ax
	add esp, 1A8h
	pop edi
	pop esi
	ret

loc_40BB23:
	mov ax, word [word_4D3ECE] ; jumptable 0040B705 cases 1-4
	inc eax
	mov word [word_4D24C0], ax
	jmp loc_40B715

loc_40BB35:
	mov word [word_4D24C0], 0FFFFh ; jumptable 0040B705 default case
	jmp loc_40B715

loc_40BB43:
	xor eax, eax
	mov al, byte [byte_512DB0]
	mov [esp+18Ch], ax
	jmp loc_40B745

loc_40BB57:
	cmp dl, 1
	jnz loc_40BB7D
	xor eax, eax
	mov al, byte [byte_512DB0]
	mov ax, word word_4D21B4[eax*2]
	add eax, 10h
	mov [esp+192h], ax
	jmp loc_40B77C

loc_40BB7D:
	xor eax, eax
	mov al, byte [byte_512DF5]
	mov [esp+192h], ax
	cmp ax, 0Bh
	jle loc_40B77C
	mov edi, eax
	add edi, 4
	mov [esp+192h], di
	jmp loc_40B77C

loc_40BBA8:
	cmp word [esp+1A4h], 4
	jnz loc_40B7CF
	jmp loc_40BA65

loc_40BBBC:
	mov eax, 3
	jmp loc_40B7E2

loc_40BBC6:
	sub eax, [esp+19Ch]
	jmp loc_40BA0A
;sub_40B6C4 endp

sub_40BBE0: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 20h
	mov ebp, eax
	mov [esp+1Ch], edx
	mov edi, esp
	mov esi, off_409F28
	movsd
	movsd
	movsd
	movsd
	test dx, dx
	jz loc_40BD1C

loc_40BC02:
	cmp word [esp+1Ch], 0
	jnz loc_40BC20
	mov ebx, dword [dword_4D2440]
	test ebx, ebx
	jz loc_40BC20
	cmp ebx, dword [dword_5637F4]
	jge loc_40BD11

loc_40BC20:
	mov edx, dword [dword_4D2444]
	inc edx
	mov ecx, 140h
	mov eax, edx
	sar edx, 1Fh
	idiv ecx
	xor eax, eax
	mov dword [dword_4D2444], edx
	call sub_403550
	mov eax, dword [dword_5637F4]
	add eax, 14h
	mov ecx, [esp+1Ch]
	mov dword [dword_4D2440], eax
	test cx, cx
	jz loc_40BD85

loc_40BC5A:
	xor ebx, ebx
	xor edi, edi

loc_40BC5E:
	movsx ecx, bx
	add ecx, ecx
	mov si, word word_4D2452[ecx]
	cmp di, si
	jge loc_40BDC2
	mov dx, word word_4D2448[ecx]
	add edx, esi
	mov word word_4D2448[ecx], dx
	cmp dx, 6Eh
	jl loc_40BDA0
	cmp bx, 3
	jnz loc_40BDA0

loc_40BC97:
	movsx eax, bx
	mov word word_4D2452[eax*2], di

loc_40BCA2:
	inc ebx
	cmp bx, 4
	jl loc_40BC5E
	mov eax, dword [dword_4D2314+2]
	mov edx, 1
	sar eax, 10h
	sub edx, eax
	xor ecx, ecx
	mov eax, dword dword_4D231C[edx*4]
	xor ebx, ebx
	call sub_4825A8
	mov edx, 400h
	mov eax, aSide ; "side"
	call sub_405B30
	call sub_404D60
	test eax, eax
	jnz loc_40BF1C

loc_40BCE4:
	xor esi, esi

loc_40BCE6:
	call sub_404D60
	test eax, eax
	jz loc_40BF2D
	cmp word [esp+1Ch], 0
	jnz loc_40BF2D

loc_40BCFF:
	mov eax, dword [dword_5637F4]
	add eax, 14h
	mov dword [dword_4D2440], eax
	call sub_4824BC

loc_40BD11:
	xor eax, eax
	add esp, 20h
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_40BD1C:
	lea ebx, [esp+14h]
	lea edx, [esp+10h]
	lea eax, [esp+18h]
	call sub_422060
	mov eax, [esp+10h]
	cmp eax, dword [dword_4E592C]
	jz loc_40BD77

loc_40BD39:
	mov eax, [esp+10h]
	mov dword [dword_4E592C], eax
	mov eax, [esp+14h]
	mov dword [dword_4E5930], eax
	mov eax, dword [dword_5637F4]
	add eax, 14h
	mov dword [dword_4D2440], eax

loc_40BD58:
	call sub_404D60
	test eax, eax
	jz loc_40BC02
	mov eax, dword [dword_5637F4]
	add eax, 14h
	mov dword [dword_4D2440], eax
	jmp loc_40BC02

loc_40BD77:
	mov eax, [esp+14h]
	cmp eax, dword [dword_4E5930]
	jnz loc_40BD39
	jmp loc_40BD58

loc_40BD85:
	cmp byte [byte_512ECD], 2
	jnb loc_40BC5A
	mov eax, 1
	add esp, 20h
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_40BDA0:
	movsx eax, bx
	cmp word word_4D2448[eax*2], 0B4h
	jl loc_40BCA2
	cmp bx, 3
	jnz loc_40BC97
	jmp loc_40BCA2

loc_40BDC2:
	jle loc_40BDF6
	mov dx, word word_4D2448[ecx]
	add edx, esi
	mov word word_4D2448[ecx], dx
	cmp dx, 28h
	jg loc_40BCA2
	mov eax, 28h
	mov word word_4D2452[ecx], di
	mov word word_4D2448[ecx], ax
	jmp loc_40BCA2

loc_40BDF6:
	cmp bx, 3
	jnz loc_40BE6F
	cmp word word_4D2448[ecx], 28h
	jle loc_40BE35
	mov esi, 0FFFFFFFDh
	mov dx, word word_4D246A[ecx]
	mov word word_4D2452[ecx], si
	call sub_488074
	xor dh, dh
	xor ah, ah
	and dl, 0FEh
	and al, 1
	add eax, edx
	mov word word_4D246A[ecx], ax
	jmp loc_40BCA2

loc_40BE35:
	mov ax, word word_4D246A[ecx]
	xor ah, ah
	and al, 0FEh
	movsx edx, ax
	add edx, 2
	mov esi, 6
	mov eax, edx
	sar edx, 1Fh
	idiv esi
	mov word word_4D2452[ecx], bx
	call sub_488074
	and eax, 1
	add edx, eax
	mov word word_4D246A[ecx], dx
	jmp loc_40BCA2

loc_40BE6F:
	call sub_488074
	xor ah, ah
	and al, 1
	mov dx, word word_4D2448[ecx]
	mov word word_4D246A[ecx], ax
	cmp dx, 28h
	jle loc_40BEAB
	mov esi, 0Ah
	xor edx, edx
	call sub_488074
	div esi
	neg edx
	lea eax, [edx-0Ah]
	mov word word_4D2452[ecx], ax
	jmp loc_40BCA2

loc_40BEAB:
	mov esi, 5
	xor edx, edx
	call sub_488074
	div esi
	test edx, edx
	jnz loc_40BCA2
	mov esi, 0Ah
	call sub_488074
	div esi
	add edx, esi
	mov esi, 18h
	mov word word_4D2452[ecx], dx
	xor edx, edx
	call sub_488074
	div esi
	sub edx, 0Ch
	mov word word_4D245A[ecx], dx
	xor edx, edx
	call sub_488074
	div esi
	sub edx, 0Ch
	mov word word_4D2462[ecx], dx
	cmp bx, 2
	jnz loc_40BCA2
	mov esi, edx
	sub esi, 1Eh
	mov word word_4D2462[ecx], si
	jmp loc_40BCA2

loc_40BF1C:
	cmp word [esp+1Ch], 0
	jz loc_40BCFF
	jmp loc_40BCE4

loc_40BF2D:
	movsx ecx, si
	add ecx, ecx
	mov di, word word_4D2448[ecx]
	test di, di
	jz loc_40BF73
	mov edx, edi
	mov eax, dword byte_4D2460[ecx]
	mov ebx, dword byte_4D2458[ecx]
	sar eax, 10h
	mov edi, dword byte_4D2468[ecx]
	sar ebx, 10h
	sar edi, 10h
	add dh, 20h
	add ecx, edi
	movsx edx, dx
	mov edi, dword off_4D2474[ecx*4]
	mov ecx, eax
	mov eax, edi
	call sub_405B30

loc_40BF73:
	inc esi
	cmp si, 4
	jl loc_40BCE6
	mov eax, dword [dword_4D2444]
	mov edx, eax
	mov ecx, 50h
	sar edx, 1Fh
	idiv ecx
	xor ebx, ebx
	mov edx, 2800h
	mov eax, [esp+eax*4]
	xor ecx, ecx
	call sub_405B30
	call sub_404D60
	test eax, eax
	jz loc_40BFB5
	cmp word [esp+1Ch], 0
	jz loc_40BCFF

loc_40BFB5:
	mov eax, dword [dword_4D2444]
	mov edx, eax
	mov ecx, 50h
	sar edx, 1Fh
	idiv ecx
	mov eax, edx
	shl eax, 4
	add eax, edx
	mov edx, eax
	shl eax, 4
	sub eax, edx
	mov edx, eax
	sar edx, 1Fh
	idiv ecx
	add ah, 1Ch
	movsx edi, ax
	mov eax, dword [dword_4D2444]
	mov edx, eax
	sar edx, 1Fh
	idiv ecx
	lea edx, [eax+1]
	mov ecx, 4
	mov eax, edx
	sar edx, 1Fh
	idiv ecx
	xor ebx, ebx
	mov eax, [esp+edx*4]
	xor ecx, ecx
	mov edx, edi
	call sub_405B30
	call sub_404D60
	test eax, eax
	jz loc_40C01F
	cmp word [esp+1Ch], 0
	jz loc_40BCFF

loc_40C01F:
	mov edx, 2800h
	mov eax, aLogo_0 ; "logo"
	xor ecx, ecx
	xor ebx, ebx
	call sub_405B30
	call sub_404D60
	test eax, eax
	jz loc_40C047
	cmp word [esp+1Ch], 0
	jz loc_40BCFF

loc_40C047:
	cmp ebp, off_4D3EC4
	jz loc_40C054
	call sub_40C110

loc_40C054:
	call sub_4824BC
	mov eax, 1
	sub ax, word [word_4D2318]
	mov esi, 1
	mov word [word_4D2318], ax
	mov eax, dword [dword_4D4D24]
	mov word [word_4D231A], si
	call sub_4825A8
	mov eax, dword [dword_4D2314+2]
	sar eax, 10h
	mov edx, 2800h
	mov eax, dword dword_4D231C[eax*4]
	xor ebx, ebx
	xor ecx, ecx
	mov eax, [eax+20h]
	call sub_405B60
	call sub_404D60
	test eax, eax
	jz loc_40C0B6
	cmp word [esp+1Ch], 0
	jz loc_40BCFF

loc_40C0B6:
	mov eax, dword [dword_4D4D24]
	mov edx, 1
	xor edi, edi
	mov eax, [eax+20h]
	mov dword [dword_4EB588], edi
	call sub_428250
	call sub_404D60
	test eax, eax
	jz loc_40C0E5
	cmp word [esp+1Ch], 0
	jz loc_40BCFF

loc_40C0E5:
	mov eax, dword [dword_4D2314+2]
	sar eax, 10h
	mov eax, dword dword_4D231C[eax*4]
	xor edx, edx
	mov eax, [eax+20h]
	call sub_428250
	mov eax, 1
	add esp, 20h
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_40BBE0 endp

sub_40C110: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	mov eax, dword [byte_4D3ECC]
	sar eax, 10h
	mov edx, dword off_4D3ED0[eax*4]
	mov eax, [edx]
	sar eax, 10h
	call sub_41B650
	movsx ebx, ax
	mov eax, [edx]
	sar eax, 10h
	mov ecx, 1
	call sub_41B670
	mov esi, [edx]
	cwde
	sar esi, 10h
	mov edx, eax
	mov eax, esi
	call sub_405580
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_40C110 endp

sub_40C160: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 20h
	mov esi, eax
	mov ebx, 0FFFFFFFFh
	xor edx, edx
	xor edi, edi
	xor ecx, ecx
	mov [esp], edx
	mov dword [dword_4D2310], ecx
	mov dword [dword_4D2420], ebx
	call sub_410E80
	call sub_40EB20
	mov ebx, 270Fh
	mov eax, 6
	xor edx, edx
	mov word [dword_4E5928], bx
	call sub_4056A0
	mov ebp, dword [dword_4D243C]
	mov [esp+1Ch], dx
	cmp ebp, off_4D3348
	jz loc_40C274
	cmp ebp, off_4D2C80
	jz loc_40C274
	cmp ebp, off_4D2B34
	jz loc_40C274
	cmp ebp, off_4D2BF4
	jz loc_40C274
	cmp ebp, off_4D39A8
	jz loc_40C274
	cmp ebp, off_4D37C8
	jz loc_40C274
	cmp ebp, off_4D38D8
	jz loc_40C274
	mov eax, dword [dword_4D2314+2]
	sar eax, 10h
	mov eax, dword dword_4D231C[eax*4]
	call sub_4825A8
	call sub_40C110
	call sub_4824BC
	mov eax, dword [dword_4D2314+2]
	sar eax, 10h
	mov eax, dword dword_4D231C[eax*4]
	xor edx, edx
	mov eax, [eax+20h]
	call sub_428250
	cmp dword [dword_4D243C], dword_4D2870
	jnz loc_40C25E
	mov edx, aBlk6 ; "blk6"
	mov eax, dword [dword_4D40B8]
	call sub_482EB4
	mov edx, 1
	call sub_428250

loc_40C25E:
	mov ecx, 1
	mov edx, 8Ch
	mov eax, 0E6h
	xor ebx, ebx
	call sub_427280

loc_40C274:
	mov ecx, dword [dword_4D243C]
	cmp ecx, off_4D2B34
	jnz loc_40C75D

loc_40C286:
	mov edx, aBlk6 ; "blk6"
	mov eax, dword [dword_4D40B8]
	call sub_482EB4
	mov edx, 1
	call sub_428250

loc_40C29F:
	cmp dword [dword_4D243C], off_4D2C80
	jnz loc_40C2DD
	mov eax, dword [dword_4D2314+2]
	sar eax, 10h
	mov eax, dword dword_4D231C[eax*4]
	xor edx, edx
	mov eax, [eax+20h]
	call sub_428250
	mov edx, aBlk6 ; "blk6"
	mov eax, dword [dword_4D40B8]
	call sub_482EB4
	mov edx, 1
	call sub_428250

loc_40C2DD:
	mov cx, word [word_4D3ECE]
	test cx, cx
	jle loc_40C77B
	cmp cx, 5
	jge loc_40C77B
	cmp cx, 4
	jz loc_40C76E

loc_40C301:
	mov word [esp+1Ch], 1
	mov eax, esi
	call sub_427ED0
	cmp word [word_4D3ECE], 4
	jnz loc_40C7FB
	cmp byte [byte_512DF6], 0
	jnz loc_40C7FB

loc_40C32A:
	mov ecx, 0FFFFFF10h
	mov ebx, 2
	mov [esp+10h], cx
	mov [esp+0Ch], ebx
	mov ebp, 20h

loc_40C342:
	push 2
	mov ebx, [esp+10h]
	call sub_497680
	test bx, bx
	jz loc_40C375
	mov ecx, ebx
	dec ecx
	xor ebx, ebx
	mov [esp+0Ch], ecx
	call sub_49769C
	push 0FF8C8C8Ch
	mov eax, 1
	mov ecx, ebp
	xor edx, edx
	call sub_427B30

loc_40C375:
	mov eax, [esp+0Eh]
	mov edx, 13Ch
	sar eax, 10h
	mov ecx, ebp
	add eax, 0D3h
	xor ebx, ebx
	call sub_4279E0
	push 0FFFFFFFFh
	xor edx, edx
	xor eax, eax
	call sub_427B30
	mov eax, dword [byte_4D3ECC]
	mov edx, edi
	sar eax, 10h
	call sub_4276F0
	call sub_4976B8
	mov eax, [esp+10h]
	add eax, 0Ch
	mov [esp+10h], ax
	test ax, ax
	jle loc_40C342

loc_40C3CC:
	mov ebx, 1
	mov edx, 400h
	mov eax, dword [dword_4D4D24]
	xor ecx, ecx
	mov word [dword_4E5924+2], bx
	call sub_4825A8
	mov eax, aBlk4 ; "blk4"
	xor ebx, ebx
	call sub_405B30
	mov ebx, 13Ch
	mov edx, 0D3h
	mov eax, esi
	call sub_40CD70
	mov eax, dword [dword_4D2314+2]
	sar eax, 10h
	xor ecx, ecx
	mov eax, dword dword_4D231C[eax*4]
	mov edx, 2800h
	xor ebx, ebx
	mov eax, [eax+20h]
	call sub_405B60
	call sub_4824BC
	xor eax, eax
	mov dword [dword_4EB588], eax
	mov eax, dword [dword_4D4D24]
	mov edx, 1
	mov eax, [eax+20h]
	call sub_428250
	call sub_486F28
	xor eax, eax
	xor ebp, ebp
	mov al, byte [byte_512DD1]
	mov ebx, 2
	mov [esp+18h], ax
	xor eax, eax
	mov edx, 1
	mov al, byte [byte_512DF6]
	mov dword [dword_4D2310], edx
	mov [esp+8], ax

loc_40C473:
	xor eax, eax
	call sub_403550
	call sub_4833C7
	mov ecx, dword [dword_4D2314]
	add edi, eax
	test ecx, ecx
	jnz loc_40C494
	mov eax, esi
	xor edx, edx
	call sub_40BBE0

loc_40C494:
	test bx, bx
	jz loc_40C64C
	call sub_40EB20
	cmp dword [dword_4D209C], 0
	jz loc_40C4C6
	xor edx, edx
	mov dword [dword_4D209C], edx
	cmp esi, off_4D3050
	jnz loc_40C80F

loc_40C4BF:
	mov eax, esi
	call sub_410E80

loc_40C4C6:
	xor eax, eax
	mov al, byte [byte_512DB0]
	call sub_40D0C0
	test eax, eax
	jz loc_40C820
	mov eax, dword [off_4D2A40]
	or byte [eax+8], 1

loc_40C4E3:
	cmp byte [byte_512DAF], 1
	jz loc_40C82E
	mov eax, dword [off_4D2A3C]
	or byte [eax+8], 1

loc_40C4F9:
	cmp esi, off_4D3050
	jnz loc_40C83C
	cmp byte [byte_512DBF], 0Bh
	jbe loc_40C83C

loc_40C512:
	or byte [byte_4D2FB8], 1
	or byte [byte_4D2FE0], 1

loc_40C520:
	xor eax, eax
	mov edx, [esp+16h]
	mov al, byte [byte_512DD1]
	sar edx, 10h
	cmp eax, edx
	jz loc_40C54A
	xor eax, eax
	mov al, byte [byte_512DD1]
	mov [esp+18h], ax
	mov eax, esi
	mov ebx, 2
	call sub_427ED0

loc_40C54A:
	cmp esi, off_4D2A20
	jnz loc_40C88F
	xor edx, edx
	mov eax, dword [dword_4E5924+2]
	mov dl, byte [byte_512DB0]
	sar eax, 10h
	cmp eax, edx
	jz loc_40C88F

loc_40C56E:
	cmp byte [byte_512DD1], 0
	jnz loc_40C8F8

loc_40C57B:
	mov edx, [esp+1Ah]
	mov eax, esi
	sar edx, 10h
	call sub_40D1B0

loc_40C589:
	mov ebx, 2

loc_40C58E:
	cmp dword [dword_4D40B4], 0
	jz loc_40C5A4
	xor ebx, ebx
	mov dword [dword_4D40B4], ebx
	mov ebx, 2

loc_40C5A4:
	xor eax, eax
	mov edx, [esp+6]
	mov al, byte [byte_512DF6]
	sar edx, 10h
	cmp edx, eax
	jz loc_40C923
	xor eax, eax
	mov al, byte [byte_512DF6]
	mov [esp+8], ax

loc_40C5C6:
	mov eax, dword [dword_4D4D24]
	mov edx, 400h
	call sub_4825A8
	xor ecx, ecx
	xor ebx, ebx
	mov eax, aBlk4 ; "blk4"
	call sub_405B30
	mov ebx, 13Ch
	mov edx, 0D3h
	mov eax, esi
	call sub_40CD70
	mov eax, dword [dword_4D2314+2]
	sar eax, 10h
	xor ecx, ecx
	mov eax, dword dword_4D231C[eax*4]
	mov edx, 2800h
	xor ebx, ebx
	mov eax, [eax+20h]
	call sub_405B60
	mov eax, esi
	call sub_40CAB0
	call sub_4824BC
	xor eax, eax
	mov dword [dword_4EB588], eax
	mov eax, dword [dword_4D4D24]
	mov edx, 1
	mov eax, [eax+20h]
	call sub_428250

loc_40C639:
	mov edx, 7D0h
	mov eax, 1
	mov ecx, esi
	xor ebx, ebx
	call sub_40B6C4

loc_40C64C:
	push 2
	call sub_497680
	call sub_49769C
	xor ebx, ebx
	push 0FFFFFFFFh
	mov ecx, 20h
	mov eax, 1
	xor edx, edx
	call sub_427B30
	mov edx, 1
	mov eax, esi
	mov dword [dword_4D20A0], edx
	call sub_40FA90
	mov eax, esi
	xor ecx, ecx
	call sub_40CB00
	mov eax, dword [byte_4D3ECC]
	mov edx, edi
	sar eax, 10h
	mov dword [dword_4D20A0], ecx
	call sub_4276F0
	mov dword [dword_4D2314], eax
	mov eax, dword [dword_4D4C7C]
	mov edx, dword [dword_4D4C80]
	sub eax, 7
	call sub_4267C0
	call sub_4976B8
	mov eax, esi
	call sub_423CA0
	mov ebx, eax
	call sub_405960
	test ax, ax
	jz loc_40C6F2
	cmp edi, [esp]
	jle loc_40C6F2
	lea edx, [edi+0Fh]
	mov [esp], edx
	movsx edx, ax
	mov eax, esi
	mov ebx, 1
	call sub_410414
	mov ebp, eax

loc_40C6F2:
	cmp ebp, 0FFFFFFFFh
	jnz loc_40C932

loc_40C6FB:
	cmp esi, off_4D2A20
	jnz loc_40C93B
	cmp byte [byte_512DAA], 1
	jnz loc_40C93B
	cmp dword [dword_4D76B8], 0
	jz loc_40C93B
	xor eax, eax
	mov al, byte [byte_512DB0]
	call sub_40D0C0
	test eax, eax
	jz loc_40C93B
	xor edx, edx
	mov eax, 4D00h
	mov dl, byte [byte_512DB0]
	call sub_40DEA0
	xor eax, eax
	mov al, byte [byte_512DB0]
	cmp eax, edx
	jz loc_40C93B
	xor ebp, ebp
	jmp loc_40C473

loc_40C75D:
	cmp ecx, off_4D2BF4
	jz loc_40C286
	jmp loc_40C29F

loc_40C76E:
	cmp byte [byte_512DF6], 0
	jnz loc_40C301

loc_40C77B:
	cmp word [dword_4E5924+2], 0
	jnz loc_40C3CC
	mov word [esp+14h], 3E9h
	xor ebp, ebp

loc_40C792:
	mov edx, [esp+12h]
	mov eax, 1
	mov ecx, esi
	mov ebx, ebp
	sar edx, 10h
	call sub_40B6C4
	call sub_428A20
	mov edx, 400h
	mov ecx, ebp
	mov ebx, ebp
	mov eax, [esi+4]
	call sub_405B30
	mov eax, dword [dword_4D2314+2]
	sar eax, 10h
	mov edx, 1000h
	mov eax, dword dword_4D231C[eax*4]
	mov ecx, ebp
	mov ebx, ebp
	mov eax, [eax+20h]
	call sub_405B60
	call sub_405C70
	mov eax, [esp+14h]
	add eax, 32h
	mov [esp+14h], ax
	cmp ax, 640h
	jle loc_40C792
	jmp loc_40C3CC

loc_40C7FB:
	mov edx, 7Fh
	mov eax, 4
	call sub_4423F0
	jmp loc_40C32A

loc_40C80F:
	cmp esi, off_4D3100
	jz loc_40C4BF
	jmp loc_40C4C6

loc_40C820:
	mov eax, dword [off_4D2A40]
	and byte [eax+8], 0FEh
	jmp loc_40C4E3

loc_40C82E:
	mov eax, dword [off_4D2A3C]
	and byte [eax+8], 0FEh
	jmp loc_40C4F9

loc_40C83C:
	cmp esi, off_4D3100
	jnz loc_40C851
	cmp byte [byte_512DDA], 0Bh
	ja loc_40C512

loc_40C851:
	cmp esi, off_4D3204
	jnz loc_40C866
	cmp byte [byte_512DF5], 0Bh
	ja loc_40C512

loc_40C866:
	mov ah, byte [byte_4D2FB8]
	and ah, 0FEh
	mov dl, byte [byte_512ECC]
	mov byte [byte_4D2FB8], ah
	test dl, dl
	jnz loc_40C520
	and byte [byte_4D2FE0], 0FEh
	jmp loc_40C520

loc_40C88F:
	cmp esi, off_4D3050
	jnz loc_40C8AF
	xor edx, edx
	mov eax, dword [dword_4E5924+2]
	mov dl, byte [byte_512DBF]
	sar eax, 10h
	cmp eax, edx
	jnz loc_40C56E

loc_40C8AF:
	cmp esi, off_4D3100
	jnz loc_40C8CF
	xor eax, eax
	mov edx, dword [dword_4E5924+2]
	mov al, byte [byte_512DDA]
	sar edx, 10h
	cmp edx, eax
	jnz loc_40C56E

loc_40C8CF:
	cmp esi, off_4D3204
	jnz loc_40C58E
	xor eax, eax
	mov edx, dword [dword_4E5924+2]
	mov al, byte [byte_512DF5]
	sar edx, 10h
	cmp edx, eax
	jnz loc_40C56E
	jmp loc_40C58E

loc_40C8F8:
	cmp word [dword_4E5928], 0Bh
	jg loc_40C57B
	cmp esi, off_4D2A20
	jz loc_40C57B
	cmp esi, off_4D3204
	jz loc_40C57B
	jmp loc_40C589

loc_40C923:
	cmp bx, 2
	jz loc_40C5C6
	jmp loc_40C639

loc_40C932:
	cmp ebp, 0FFFFFFFBh
	jz loc_40C6FB

loc_40C93B:
	test ebp, ebp
	jz loc_40C473
	xor ebx, ebx
	mov ax, word [word_4D3ECE]
	mov dword [dword_4D2310], ebx
	test ax, ax
	jle loc_40CA3D
	cmp ax, 5
	jge loc_40CA3D
	cmp esi, off_4D3204
	jz loc_40CA30

loc_40C970:
	mov edx, 7Fh
	mov eax, 5
	call sub_4423F0
	mov eax, dword [dword_4D2314+2]
	sar eax, 10h
	mov eax, dword dword_4D231C[eax*4]
	xor edx, edx
	mov eax, [eax+20h]
	call sub_428250
	mov edx, aBlk4 ; "blk4"
	mov eax, dword [dword_4D40B8]
	call sub_482EB4
	mov edx, 1
	xor esi, esi
	call sub_428250

loc_40C9B3:
	movsx eax, si
	mov [esp+4], eax
	cmp eax, 0FFFFFEE8h
	jl loc_40CA75
	push 2
	call sub_497680
	call sub_49769C
	xor ebx, ebx
	push 0FF8C8C8Ch
	mov ecx, 20h
	mov eax, 1
	xor edx, edx
	call sub_427B30
	mov eax, dword [byte_4D3ECC]
	mov edx, edi
	sar eax, 10h
	mov ecx, 20h
	call sub_4276F0
	mov eax, [esp+4]
	mov edx, 13Ch
	add eax, 0D3h
	xor ebx, ebx
	call sub_4279E0
	push 0FFFFFFFFh
	xor edx, edx
	xor eax, eax
	sub esi, 0Fh
	call sub_427B30
	call sub_4976B8
	jmp loc_40C9B3

loc_40CA30:
	cmp byte [byte_512DF6], 0
	jnz loc_40C970

loc_40CA3D:
	mov ecx, 1
	mov edx, 0E6h
	mov eax, 8Ch
	xor ebx, ebx
	call sub_427320

loc_40CA53:
	cmp ebp, 0FFFFFFFFh
	jnz loc_40CA98

loc_40CA58:
	mov edx, 1
	mov dword [dword_4D243C], ebp
	mov eax, ebp
	mov dword [dword_4D2310], edx
	add esp, 20h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_40CA75:
	cmp ebp, dword_4D2870
	jnz loc_40CA53
	mov eax, dword [dword_4D2314+2]
	sar eax, 10h
	mov eax, dword dword_4D231C[eax*4]
	xor edx, edx
	mov eax, [eax+20h]
	call sub_428250
	jmp loc_40CA53

loc_40CA98:
	xor ebx, ebx
	mov word [dword_4E5924+2], bx
	jmp loc_40CA58
;sub_40C160 endp

sub_40CAB0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	mov ecx, eax
	cmp eax, off_4D3050
	jz loc_40CAC8
	cmp ecx, off_4D3100
	jz loc_40CAE8
	pop edx
	pop ecx
	pop ebx
	ret

loc_40CAC8:
	mov ebx, 88h
	mov edx, 16Dh
	mov eax, dword_4D2F80
	call sub_410090
	cmp ecx, off_4D3100
	jz loc_40CAE8
	pop edx
	pop ecx
	pop ebx
	ret

loc_40CAE8:
	mov ebx, 88h
	mov edx, 16Dh
	mov eax, dword_4D2B68
	call sub_410090
	pop edx
	pop ecx
	pop ebx
	ret
;sub_40CAB0 endp

sub_40CB00: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 60h
	mov ebp, eax
	mov ecx, 0Ch
	mov edi, esp
	mov esi, dword_409EC8
	rep movsd
	mov ecx, 0Ch
	lea edi, [esp+30h]
	mov esi, dword_409EF8
	mov ah, byte [byte_512DD1]
	rep movsd
	test ah, ah
	jz loc_40CBF4
	cmp ebp, off_4D3050
	jnz loc_40CD20

loc_40CB42:
	cmp word [dword_4E5928], 0Bh
	jg loc_40CBF4
	mov eax, 58h
	call sub_41B650
	movsx ebx, ax
	mov eax, 58h
	mov ecx, 1
	call sub_41B670
	movsx edx, ax
	mov eax, 58h
	call sub_405580
	mov eax, 59h
	call sub_41B650
	movsx ebx, ax
	mov eax, 59h
	mov ecx, 1
	call sub_41B670
	movsx edx, ax
	mov eax, 59h
	call sub_405580
	mov eax, 5Ah
	call sub_41B650
	movsx ebx, ax
	mov eax, 5Ah
	mov ecx, 1
	call sub_41B670
	movsx edx, ax
	mov eax, 5Ah
	call sub_405580
	mov eax, 5Bh
	call sub_41B650
	movsx ebx, ax
	mov eax, 5Bh
	mov ecx, 1
	call sub_41B670
	movsx edx, ax
	mov eax, 5Bh
	call sub_405580

loc_40CBF4:
	cmp ebp, off_4D3204
	jnz loc_40CCC6
	mov dl, byte [byte_512DF5]
	cmp dl, 0Ch
	jb loc_40CCC6
	cmp dl, 0Eh
	ja loc_40CCC6
	xor eax, eax
	mov al, dl
	shl eax, 2
	push 0
	lea esi, [eax-30h]
	push 1
	mov eax, 58h
	mov ecx, 12h
	call sub_41B650
	movsx ebx, ax
	mov eax, [esp+esi*4+8]
	mov edx, 0AAh
	call sub_41B710
	call sub_4054E0
	push 0
	push 1
	mov eax, 59h
	mov ecx, 12h
	call sub_41B650
	movsx ebx, ax
	mov eax, [esp+esi*4+0Ch]
	mov edx, 0AAh
	call sub_41B710
	call sub_4054E0
	push 0
	push 1
	mov eax, 5Ah
	mov ecx, 12h
	call sub_41B650
	movsx ebx, ax
	mov eax, [esp+esi*4+10h]
	mov edx, 0AAh
	call sub_41B710
	call sub_4054E0
	push 0
	push 1
	mov eax, 5Bh
	mov ecx, 12h
	call sub_41B650
	movsx ebx, ax
	mov eax, [esp+esi*4+14h]
	mov edx, 0AAh
	call sub_41B710
	call sub_4054E0

loc_40CCC6:
	mov edx, 0FFFFFFFFh
	cmp ebp, off_4D3204
	jnz loc_40CCDB
	xor edx, edx
	mov dl, byte [byte_512DF5]

loc_40CCDB:
	cmp ebp, off_4D3050
	jnz loc_40CCF4
	cmp byte [byte_512DD1], 0
	jnz loc_40CCF4
	xor edx, edx
	mov dl, byte [byte_512DBF]

loc_40CCF4:
	cmp ebp, off_4D3100
	jnz loc_40CD0D
	cmp byte [byte_512DD1], 0
	jnz loc_40CD0D
	xor edx, edx
	mov dl, byte [byte_512DDA]

loc_40CD0D:
	cmp edx, 0FFFFFFFFh
	jz loc_40CD17
	cmp edx, 0Ch
	jl loc_40CD31

loc_40CD17:
	add esp, 60h
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_40CD20:
	cmp ebp, off_4D3100
	jz loc_40CB42
	jmp loc_40CBF4

loc_40CD31:
	push 0
	push 1
	mov eax, 58h
	mov ecx, 12h
	call sub_41B650
	movsx ebx, ax
	mov eax, [esp+edx*4+38h]
	mov edx, 0AAh
	call sub_41B710
	call sub_4054E0
	add esp, 60h
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_40CB00 endp

sub_40CD70: ;SUBROUTINE
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 0C0h
	mov [esp+0B8h], eax
	mov [esp+0BCh], edx
	mov ebp, ebx
	mov ecx, 8
	lea edi, [esp+80h]
	mov esi, off_409E10
	rep movsd
	mov ecx, 10h
	lea edi, [esp+40h]
	mov esi, off_409E30
	rep movsd
	mov ecx, 10h
	mov edi, esp
	mov esi, off_409E70
	rep movsd
	mov ecx, 6
	lea edi, [esp+0A0h]
	mov esi, off_409EB0
	rep movsd
	cmp eax, off_4D2A20
	jz loc_40CF46
	cmp eax, off_4D3050
	jz loc_40CDEB
	cmp eax, off_4D3100
	jnz loc_40D026

loc_40CDEB:
	mov eax, 0FF000000h
	mov ecx, 80h
	mov ebx, 118h
	call sub_48266C
	mov edx, ebp
	push eax
	mov eax, [esp+0C0h]
	mov edi, [esp+0BCh]
	call sub_488620
	cmp edi, off_4D3050
	jnz loc_40CFF0
	xor eax, eax
	mov al, byte [byte_512DBF]

loc_40CE28:
	mov word [dword_4E5928], ax
	cmp byte [byte_512DD1], 0
	jz loc_40CFFC
	cmp word [dword_4E5928], 0Bh
	jg loc_40CFFC
	mov ebx, [esp+0BCh]
	mov edx, 3000h
	mov eax, aGrph ; "grph"
	mov ecx, ebp
	call sub_405B30
	mov eax, dword [dword_4E5924+2]
	sar eax, 10h
	mov esi, 0Ch
	sub esi, dword dword_4D236C[eax*4]
	lea eax, 0[esi*8]
	add eax, esi
	mov esi, [esp+0BCh]
	add esi, 1Ah
	lea ecx, [ebp+0Bh]
	mov ebx, esi
	mov edx, 3000h
	sub ebx, eax
	mov eax, aGrpg ; "grpg"
	call sub_405B30
	mov eax, dword [dword_4E5924+2]
	sar eax, 10h
	mov ecx, 0Ch
	sub ecx, dword dword_4D2330[eax*4]
	lea edx, [ebp+29h]
	lea eax, 0[ecx*8]
	mov ebx, esi
	add eax, ecx
	mov ecx, edx
	sub ebx, eax
	mov edx, 3000h
	mov eax, aGrpb ; "grpb"
	call sub_405B30
	mov eax, dword [dword_4E5924+2]
	sar eax, 10h
	mov ecx, 0Ch
	sub ecx, dword dword_4D23E4[eax*4]
	lea edx, [ebp+47h]
	lea eax, 0[ecx*8]
	mov ebx, esi
	add eax, ecx
	mov ecx, edx
	sub ebx, eax
	mov edx, 3000h
	mov eax, aGrpr ; "grpr"
	call sub_405B30
	mov eax, dword [dword_4E5924+2]
	lea ecx, [ebp+65h]
	sar eax, 10h
	mov ebx, 0Ch
	sub ebx, dword dword_4D23A8[eax*4]
	lea eax, 0[ebx*8]
	add eax, ebx
	mov ebx, esi
	mov edx, 3000h
	sub ebx, eax
	mov eax, aGrpy ; "grpy"
	call sub_405B30

loc_40CF3B:
	add esp, 0C0h
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret

loc_40CF46:
	mov eax, 0FF000000h
	mov ecx, 80h
	mov ebx, 118h
	call sub_48266C
	push eax
	mov edx, ebp
	mov eax, [esp+0C0h]
	call sub_488620
	xor eax, eax
	mov al, byte [byte_512DB0]
	mov word [dword_4E5928], ax
	xor eax, eax
	mov ebx, [esp+0BCh]
	mov al, byte [byte_512DB0]
	mov edx, 3000h
	mov ecx, ebp
	mov eax, [esp+eax*4+80h]
	call sub_405B30
	xor eax, eax
	mov al, byte [byte_512DB0]
	call sub_40D0C0
	test eax, eax
	jz loc_40CF3B
	mov esi, [esp+0BCh]
	mov edx, 3000h
	mov eax, aTrnm ; "trnm"
	add esi, 0B5h
	lea ecx, [ebp+2Dh]
	mov ebx, esi
	call sub_405B30
	xor eax, eax
	mov edx, 3000h
	mov al, byte [byte_512DFB]
	lea ecx, [ebp+0Ah]
	mov ebx, esi
	mov eax, [esp+eax*4+0A0h]
	call sub_405B30
	add esp, 0C0h
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret

loc_40CFF0:
	xor eax, eax
	mov al, byte [byte_512DDA]
	jmp loc_40CE28

loc_40CFFC:
	mov ebx, [esp+0BCh]
	mov eax, dword [dword_4E5924+2]
	mov edx, 3000h
	sar eax, 10h
	mov ecx, ebp
	mov eax, [esp+eax*4+40h]
	call sub_405B30
	add esp, 0C0h
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret

loc_40D026:
	cmp eax, off_4D3204
	jnz loc_40CF3B
	cmp byte [byte_512DF6], 0
	jz loc_40CF3B
	mov eax, 0FF000000h
	mov ecx, 80h
	mov ebx, 118h
	call sub_48266C
	push eax
	mov edx, ebp
	mov eax, [esp+0C0h]
	call sub_488620
	xor eax, eax
	mov al, byte [byte_512DF5]
	mov word [dword_4E5928], ax
	xor eax, eax
	mov ebx, [esp+0BCh]
	mov al, byte [byte_512DF5]
	mov edx, 3000h
	mov ecx, ebp
	mov eax, [esp+eax*4]
	call sub_405B30
	add esp, 0C0h
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret
;sub_40CD70 endp

off_40D0A0: dd loc_40D0E1
	dd loc_40D102 ; jump table for switch statement
	dd loc_40D147
	dd loc_40D119
	dd loc_40D130
	dd loc_40D15E
	dd loc_40D175
	dd loc_40D18C

sub_40D0C0: ;SUBROUTINE
	push ecx
	push edx
	mov ecx, dword [dword_4D76B8]
	cmp byte [byte_512DAA], 1
	jnz loc_40D0F5
	test ecx, ecx
	jz loc_40D0F5
	cmp eax, 7 ; switch 8 cases
	ja loc_40D0EA ; jumptable 0040D0DA default case
	jmp off_40D0A0[eax*4] ; switch jump

loc_40D0E1:
	mov edx, [ecx+2C4h] ; jumptable 0040D0DA case 0
	and edx, 1

loc_40D0EA:
	mov eax, edx ; jumptable 0040D0DA default case
	mov dword [dword_4D76B8], ecx
	pop edx
	pop ecx
	ret

loc_40D0F5:
	xor edx, edx
	mov eax, edx
	mov dword [dword_4D76B8], ecx
	pop edx
	pop ecx
	ret

loc_40D102:
	mov edx, [ecx+2C4h] ; jumptable 0040D0DA case 1
	shl edx, 1Eh
	shr edx, 1Fh
	mov eax, edx
	mov dword [dword_4D76B8], ecx
	pop edx
	pop ecx
	ret

loc_40D119:
	mov edx, [ecx+2C4h] ; jumptable 0040D0DA case 3
	shl edx, 1Dh
	shr edx, 1Fh
	mov eax, edx
	mov dword [dword_4D76B8], ecx
	pop edx
	pop ecx
	ret

loc_40D130:
	mov edx, [ecx+2C4h] ; jumptable 0040D0DA case 4
	shl edx, 1Ch
	shr edx, 1Fh
	mov eax, edx
	mov dword [dword_4D76B8], ecx
	pop edx
	pop ecx
	ret

loc_40D147:
	mov edx, [ecx+2C4h] ; jumptable 0040D0DA case 2
	shl edx, 1Bh
	shr edx, 1Fh
	mov eax, edx
	mov dword [dword_4D76B8], ecx
	pop edx
	pop ecx
	ret

loc_40D15E:
	mov edx, [ecx+2C4h] ; jumptable 0040D0DA case 5
	shl edx, 1Ah
	shr edx, 1Fh
	mov eax, edx
	mov dword [dword_4D76B8], ecx
	pop edx
	pop ecx
	ret

loc_40D175:
	mov edx, [ecx+2C4h] ; jumptable 0040D0DA case 6
	shl edx, 19h
	shr edx, 1Fh
	mov eax, edx
	mov dword [dword_4D76B8], ecx
	pop edx
	pop ecx
	ret

loc_40D18C:
	mov edx, [ecx+2C4h] ; jumptable 0040D0DA case 7
	shl edx, 18h
	shr edx, 1Fh
	mov eax, edx
	mov dword [dword_4D76B8], ecx
	pop edx
	pop ecx
	ret
;sub_40D0C0 endp

sub_40D1B0: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 8
	mov esi, eax
	xor ebp, ebp
	cmp eax, off_4D3204
	jnz loc_40D1D0
	cmp byte [byte_512DF6], 0
	jz loc_40D2DE

loc_40D1D0:
	mov eax, dword [dword_4E5924+2]
	sar eax, 10h
	mov [esp], eax
	cmp esi, off_4D3050
	jnz loc_40D1EE
	xor eax, eax
	mov al, byte [byte_512DBF]
	mov [esp+4], eax

loc_40D1EE:
	cmp esi, off_4D3100
	jnz loc_40D201
	xor eax, eax
	mov al, byte [byte_512DDA]
	mov [esp+4], eax

loc_40D201:
	mov edx, 7D0h
	mov eax, 1
	mov ecx, esi
	xor ebx, ebx
	call sub_40B6C4
	mov eax, esi
	call sub_427ED0
	cmp esi, off_4D3050
	jnz loc_40D22B
	mov al, [esp]
	mov byte [byte_512DBF], al

loc_40D22B:
	cmp esi, off_4D3100
	jz loc_40D382

loc_40D237:
	mov edx, 7Fh
	mov eax, 4
	mov edi, 0FFFFFFE3h
	call sub_4423F0

loc_40D24B:
	push 2
	call sub_497680
	mov eax, ebp
	inc ebp
	cmp eax, 2
	jge loc_40D38F
	call sub_49769C
	push 0FFFFFFFFh
	mov ecx, 20h
	mov eax, 1
	xor ebx, ebx
	xor edx, edx
	call sub_427B30
	mov ebx, 1
	mov eax, esi
	xor edx, edx
	mov dword [dword_4D20A0], ebx
	call sub_40FA90
	mov eax, esi
	call sub_40CB00
	xor eax, eax
	mov dword [dword_4D20A0], eax
	mov eax, dword [byte_4D3ECC]
	xor edx, edx
	sar eax, 10h
	call sub_4276F0
	mov dword [dword_4D2314], eax
	mov eax, dword [dword_4D4C7C]
	mov edx, dword [dword_4D4C80]
	sub eax, 7
	call sub_4267C0

loc_40D2C3:
	add edi, 0Ch
	call sub_4976B8
	cmp edi, 0DFh
	jnz loc_40D24B

loc_40D2DE:
	xor eax, eax
	mov edx, 400h
	call sub_403550
	xor ecx, ecx
	mov eax, dword [dword_4D4D24]
	xor ebx, ebx
	call sub_4825A8
	mov eax, aBlk4 ; "blk4"
	call sub_405B30
	mov ebx, 13Ch
	mov edx, 0D3h
	mov eax, esi
	call sub_40CD70
	mov eax, dword [dword_4D2314+2]
	sar eax, 10h
	xor ecx, ecx
	mov eax, dword dword_4D231C[eax*4]
	mov edx, 2800h
	xor ebx, ebx
	mov eax, [eax+20h]
	call sub_405B60
	call sub_4824BC
	xor edx, edx
	mov eax, dword [dword_4D4D24]
	mov dword [dword_4EB588], edx
	mov eax, [eax+20h]
	mov edx, 1
	call sub_428250
	cmp esi, off_4D3050
	jnz loc_40D363
	mov al, [esp+4]
	mov byte [byte_512DBF], al

loc_40D363:
	cmp esi, off_4D3100
	jnz loc_40D374
	mov al, [esp+4]
	mov byte [byte_512DDA], al

loc_40D374:
	call sub_486F28
	add esp, 8
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_40D382:
	mov al, [esp]
	mov byte [byte_512DDA], al
	jmp loc_40D237

loc_40D38F:
	mov edx, 13Ch
	mov eax, edi
	mov ecx, 20h
	call sub_4279E0
	xor ebx, ebx
	push 0FFFFFFFFh
	xor edx, edx
	xor eax, eax
	call sub_427B30
	mov edx, 1
	mov eax, esi
	mov dword [dword_4D20A0], edx
	xor edx, edx
	xor ecx, ecx
	call sub_40CB00
	mov dword [dword_4D20A0], ecx
	jmp loc_40D2C3
;sub_40D1B0 endp

sub_40D3D0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 128h
	mov esi, eax
	mov ah, byte [byte_512ECC]
	xor edx, edx
	xor ebp, ebp
	mov [esp+11Ch], edx
	mov [esp+120h], edx
	test ah, ah
	jz loc_40D401
	mov byte [byte_512DA9], 4

loc_40D401:
	mov eax, 8
	xor ebx, ebx
	lea edx, [esp+100h]
	mov dword [dword_4E5914], ebx
	mov dword [dword_4D2310], ebx
	call sub_4056A0
	mov eax, 4D00h
	lea ebx, [esp+108h]
	call sub_40DEA0
	call sub_40EB20
	lea eax, [esp+110h]
	call sub_422060
	xor edx, edx
	mov eax, dword [dword_4D231C]
	mov word [word_4D231A], dx
	test eax, eax
	jnz loc_40D46B
	mov eax, 157h
	mov edx, dword [dword_4DAB80]
	xor ebx, ebx
	call sub_482474
	mov dword [dword_4D231C], eax

loc_40D46B:
	cmp dword [dword_4D2320], 0
	jnz loc_40D48B
	mov eax, 157h
	mov edx, dword [dword_4DAB80]
	xor ebx, ebx
	call sub_482474
	mov dword [dword_4D2320], eax

loc_40D48B:
	cmp dword [dword_4D2324], 0
	jnz loc_40D4AB
	mov eax, 280h
	mov edx, dword [dword_4DAB80]
	xor ebx, ebx
	call sub_482474
	mov dword [dword_4D2324], eax

loc_40D4AB:
	mov eax, esi
	call sub_410E80
	cmp dword [dword_4D21AC], 0
	jnz loc_40D4D6
	mov eax, 12h
	mov edx, dword [dword_4D5A28]
	mov edi, 1
	call sub_476750
	mov dword [dword_4D21AC], edi

loc_40D4D6:
	mov edx, aSide ; "side"
	mov eax, dword [dword_4D40B8]
	call sub_482EB4
	xor ebx, ebx
	mov eax, [eax+2]
	mov edx, dword [dword_4DAB80]
	sar eax, 10h
	call sub_482474
	mov edx, 1
	mov [esp+118h], eax
	mov [esp+114h], eax
	mov eax, esi
	call sub_40BBE0
	mov eax, [esp+118h]
	call sub_4825A8
	mov eax, dword [dword_4D2314+2]
	sar eax, 10h
	xor ecx, ecx
	mov eax, dword dword_4D231C[eax*4]
	xor ebx, ebx
	mov edx, 400h
	mov eax, [eax+20h]
	xor edi, edi
	call sub_405B60
	mov ebx, 1
	mov cx, word [word_4D232C]
	mov [esp+124h], ebx
	test cx, cx
	jz loc_40D63E
	xor eax, eax
	mov word [word_4D232C], ax
	call sub_428A20
	mov eax, 0FF000000h
	call sub_48266C
	call sub_482740
	call sub_405C70
	call sub_428A20
	mov eax, 0FF000000h
	mov edx, aBlk6 ; "blk6"
	call sub_48266C
	call sub_482740
	mov eax, dword [dword_4D40B8]
	call sub_482EB4
	mov edx, 1
	call sub_428250
	mov eax, [esp+118h]
	mov ebx, 1
	xor edx, edx
	mov eax, [eax+20h]
	xor ecx, ecx
	call sub_428250
	xor eax, eax
	mov edx, 0E6h
	call sub_427450
	xor eax, eax
	call sub_427320
	call sub_486F28
	cmp byte [byte_512F3F], 0
	jz loc_40D63E
	call sub_476BB0
	test eax, eax
	jnz loc_40D63E
	mov eax, dword [dword_4D4D24]
	mov edx, 400h
	call sub_4825A8
	xor ecx, ecx
	xor ebx, ebx
	mov eax, [esi+4]
	call sub_405B30
	mov eax, dword [dword_4D2314+2]
	sar eax, 10h
	mov edx, 2800h
	mov eax, dword dword_4D231C[eax*4]
	xor ecx, ecx
	xor ebx, ebx
	mov eax, [eax+20h]
	call sub_405B60
	call sub_4824BC
	mov eax, 30Ch
	xor bl, bl
	call sub_402CD0
	mov byte [byte_512F3F], bl

loc_40D63E:
	mov eax, dword [dword_4D4D24]
	mov edx, 400h
	call sub_4825A8
	xor ecx, ecx
	xor ebx, ebx
	mov eax, [esi+4]
	call sub_405B30
	mov eax, dword [dword_4D2314+2]
	sar eax, 10h
	mov edx, 2800h
	mov eax, dword dword_4D231C[eax*4]
	xor ecx, ecx
	xor ebx, ebx
	mov eax, [eax+20h]
	call sub_405B60
	call sub_4824BC
	xor eax, eax
	mov dword [dword_4EB588], eax
	mov eax, dword [dword_4D4D24]
	mov edx, 1
	mov eax, [eax+20h]
	call sub_428250
	xor edx, edx
	mov ecx, 1
	mov dword [dword_4D2420], edx
	call sub_4833C7
	mov dword [dword_4D2310], ecx
	test edi, edi
	jnz loc_40D9F2

loc_40D6B7:
	xor eax, eax
	call sub_403550
	call sub_4833C7
	mov ebx, dword [dword_4E5914]
	lea edx, [esp+104h]
	add ebx, eax
	lea eax, [esp+110h]
	mov dword [dword_4E5914], ebx
	lea ebx, [esp+10Ch]
	call sub_422060
	mov eax, [esp+104h]
	cmp eax, [esp+100h]
	jz loc_40DAAA

loc_40D6FF:
	mov ebp, dword [dword_4E5914]
	call sub_4833C7

loc_40D70A:
	cmp word [esp+124h], 0
	jnz loc_40D722
	cmp dword [dword_4D2314], 0
	jz loc_40DAC3

loc_40D722:
	cmp byte [byte_512ECC], 0
	jnz loc_40DAD8
	mov eax, dword [dword_4E5914]
	sub eax, ebp
	cmp eax, 0C80h
	jle loc_40DAD8
	call sub_4056B0
	call sub_4762E0
	call sub_476250
	mov eax, dword [dword_4D2328]
	push eax
	push aDemoav ; "demoav"
	push aSD_dct ; "%s%d.dct"
	lea eax, [esp+0Ch]
	xor ebp, ebp
	push eax
	mov dword [dword_4D2310], ebp
	call sprintf_
	add esp, 10h
	mov eax, esp
	call sub_4242F0
	mov edx, dword [dword_4D2328]
	inc edx
	mov dword [dword_4D2328], edx
	cmp edx, 3
	jl loc_40D794
	mov dword [dword_4D2328], ebp

loc_40D794:
	call sub_4769D0
	mov eax, 12h
	mov edx, dword [dword_4D5A28]
	call sub_476750
	call sub_4057C0
	xor ebp, ebp
	xor ecx, ecx
	xor ebx, ebx
	mov eax, esi
	mov edx, 1
	call sub_410E80
	call sub_408450
	call sub_486F28
	mov dword [dword_4E5914], ebp
	call sub_4833C7
	mov eax, dword [dword_4D4D24]
	mov dword [dword_4D2310], edx
	call sub_4825A8
	mov edx, 400h
	mov eax, [esi+4]
	call sub_405B30
	mov eax, dword [dword_4D2314+2]
	sar eax, 10h
	mov edx, 2800h
	mov eax, dword dword_4D231C[eax*4]
	xor ecx, ecx
	xor ebx, ebx
	mov eax, [eax+20h]
	call sub_405B60
	call sub_4824BC
	mov eax, dword [dword_4D4D24]
	mov edx, 1
	mov eax, [eax+20h]
	mov dword [dword_4EB588], ebp
	call sub_428250

loc_40D82F:
	call sub_40EB20
	lea ebx, [esp+108h]
	lea edx, [esp+100h]
	lea eax, [esp+110h]
	call sub_422060
	mov ecx, esi
	mov ebx, 1
	mov edx, 7D0h
	mov eax, ebx
	call sub_40B6C4

loc_40D861:
	push 2
	call sub_497680
	call sub_49769C
	xor ebx, ebx
	push 0FFFFFFFFh
	mov ecx, 20h
	mov eax, 1
	xor edx, edx
	call sub_427B30
	mov eax, esi
	call sub_40DC40
	mov eax, dword [dword_4D4C7C]
	mov edx, dword [dword_4D4C80]
	sub eax, 7
	call sub_4267C0
	call sub_4976B8
	push 0
	call sub_4976C8
	cmp word [word_51345C], 0
	jz loc_40D8D3
	call sub_401080
	mov eax, 300h
	call sub_402CD0
	xor eax, eax
	mov word [word_51345C], ax

loc_40D8D3:
	cmp word [word_51345A], 0
	jz loc_40D8FF
	mov ebx, aCNfs2seFront_2 ; "c:\\nfs2se\\frontend\\common\\Mainmenu.c"
	mov eax, 283h
	push aBugUserDidNotG ; "BUG: User did not go back to netmenu_ne"...
	mov dword [dword_4DB1D8], ebx
	mov dword [dword_4DB1DC], eax
	call sub_4840F0
	add esp, 4

loc_40D8FF:
	mov eax, esi
	call sub_423CA0
	mov [esp+124h], eax
	call sub_405960
	mov edx, eax
	mov ebx, eax
	call sub_4833C7
	mov ecx, dword [dword_4E5914]
	add ecx, eax
	mov dword [dword_4E5914], ecx
	test dx, dx
	jz loc_40DAEC
	cmp ecx, [esp+11Ch]
	jle loc_40DAEC

loc_40D93F:
	mov eax, dword [dword_4E5914]
	mov ecx, 1
	add eax, 0Fh
	movsx edx, bx
	mov [esp+11Ch], eax
	mov eax, esi
	mov [esp+124h], ecx
	call sub_410414
	mov edi, eax
	cmp bx, 4B00h
	jnz loc_40DB04

loc_40D971:
	mov edx, [esi+8]
	movsx eax, bx
	sar edx, 10h
	call sub_40DC90

loc_40D97F:
	cmp edi, 0FFFFFFFEh
	jnz loc_40DB14

loc_40D988:
	mov eax, 10h
	call sub_486550
	test eax, eax
	jnz loc_40D9C5
	cmp byte [byte_512DAA], 1
	jnz loc_40DB22
	cmp dword [dword_4D76B8], 0
	jz loc_40DB22
	push 2EDh

loc_40D9B5:
	push 1
	call sub_401AE0
	add esp, 8
	test eax, eax
	jnz loc_40D9C5
	xor edi, edi

loc_40D9C5:
	call sub_4833C7
	mov ebp, dword [dword_4E5914]
	add ebp, eax
	mov word [dword_4E5928+2], bx
	mov dword [dword_4E5914], ebp

loc_40D9DF:
	cmp dword [esp+120h], 0
	jz loc_40DB2C
	mov edi, 0FFFFFFFDh

loc_40D9F2:
	mov eax, 1
	mov ebx, [esp+114h]
	xor ecx, ecx
	mov word [dword_4E5924+2], ax
	mov dword [dword_4D2310], ecx
	test ebx, ebx
	jz loc_40DA17
	mov eax, ebx
	call sub_4848FC

loc_40DA17:
	cmp edi, 0FFFFFFFDh
	jnz loc_40DB57
	mov ch, byte [byte_512DA9]
	test ch, ch
	jz loc_40DB57
	cmp ch, 1
	jz loc_40DB57
	xor edi, edi

loc_40DA39:
	mov edx, 1
	mov eax, esi
	call sub_40BBE0

loc_40DA45:
	cmp edi, 0FFFFFFFDh
	jnz loc_40DA60
	cmp byte [byte_512DAA], 2
	jnz loc_40DA60
	xor dh, dh
	mov byte [byte_512DB0], dh
	call sub_41A450

loc_40DA60:
	cmp edi, 0FFFFFFFDh
	jnz loc_40DC26
	cmp dword [dword_4D96B0], 0
	jz loc_40DC0B
	push 40h
	mov ecx, 7Fh
	mov edx, 6
	mov eax, dword [dword_50B410]
	xor ebx, ebx

loc_40DA89:
	call sub_442280
	mov edx, eax
	xor ebx, ebx

loc_40DA92:
	mov eax, edx
	call sub_486040
	test eax, eax
	jnz loc_40DC26
	mov eax, ebx
	call sub_483EB0
	jmp loc_40DA92

loc_40DAAA:
	mov eax, [esp+10Ch]
	cmp eax, [esp+108h]
	jnz loc_40D6FF
	jmp loc_40D70A

loc_40DAC3:
	mov eax, esi
	xor edx, edx
	call sub_40BBE0
	mov [esp+124h], eax
	jmp loc_40D722

loc_40DAD8:
	cmp word [esp+124h], 0
	jnz loc_40D82F
	jmp loc_40D861

loc_40DAEC:
	mov eax, dword [dword_4E5928]
	movsx edx, bx
	sar eax, 10h
	cmp eax, edx
	jnz loc_40D93F
	jmp loc_40D9DF

loc_40DB04:
	cmp bx, 4D00h
	jz loc_40D971
	jmp loc_40D97F

loc_40DB14:
	cmp edi, 0FFFFFFFFh
	jz loc_40D988
	jmp loc_40D9C5

loc_40DB22:
	push 309h
	jmp loc_40D9B5

loc_40DB2C:
	cmp edi, 0FFFFFFFBh
	jnz loc_40DB4A
	mov edx, 1
	mov word [esi+0Ah], 4
	xor edi, edi
	mov [esp+120h], edx
	jmp loc_40D6B7

loc_40DB4A:
	test edi, edi
	jz loc_40D6B7
	jmp loc_40D9F2

loc_40DB57:
	cmp edi, 0FFFFFFFDh
	jnz loc_40DBF6

loc_40DB60:
	mov eax, dword [dword_4D2314+2]
	sar eax, 10h
	mov eax, dword dword_4D231C[eax*4]
	mov ecx, 1
	xor edx, edx
	mov eax, [eax+20h]
	mov ebx, ecx
	call sub_428250
	mov eax, 0E6h
	xor edx, edx
	call sub_427280
	xor eax, eax
	call sub_4273B0

loc_40DB93:
	cmp edi, 0FFFFFFFFh
	jnz loc_40DC01

loc_40DB98:
	cmp byte [byte_512ECC], 0
	jnz loc_40DA45
	mov esi, dword [dword_4D231C]
	test esi, esi
	jz loc_40DBBE
	mov eax, esi
	xor ebp, ebp
	call sub_4848FC
	mov dword [dword_4D231C], ebp

loc_40DBBE:
	mov eax, dword [dword_4D2320]
	test eax, eax
	jz loc_40DBD4
	xor edx, edx
	call sub_4848FC
	mov dword [dword_4D2320], edx

loc_40DBD4:
	mov ecx, dword [dword_4D2324]
	test ecx, ecx
	jz loc_40DA45
	mov eax, ecx
	xor ebx, ebx
	call sub_4848FC
	mov dword [dword_4D2324], ebx
	jmp loc_40DA45

loc_40DBF6:
	cmp edi, 0FFFFFFFEh
	jz loc_40DB60
	jmp loc_40DB93

loc_40DC01:
	cmp edi, 0FFFFFFFDh
	jz loc_40DB98
	jmp loc_40DA39

loc_40DC0B:
	push 40h
	mov ecx, 7Fh
	mov ebx, 40h
	mov edx, 6
	mov eax, dword [dword_50B410]
	jmp loc_40DA89

loc_40DC26:
	mov eax, 6
	call sub_4056A0
	mov eax, edi
	add esp, 128h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_40D3D0 endp

sub_40DC40: ;SUBROUTINE
	push ebx
	push edx
	mov edx, eax
	mov dword [dword_4D20A0], 1
	call sub_40FA90
	mov eax, [edx+8]
	sar eax, 10h
	xor ebx, ebx
	call sub_40DDD0
	mov eax, dword [byte_4D3ECC]
	mov edx, dword [dword_4E5914]
	sar eax, 10h
	mov dword [dword_4D20A0], ebx
	call sub_4276F0
	mov dword [dword_4D2314], eax
	pop edx
	pop ebx
	ret
;sub_40DC40 endp

sub_40DC90: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	mov ebx, eax
	mov ecx, edx
	test edx, edx
	jnz loc_40DCAE
	cmp eax, 4B00h
	jnz loc_40DCE7
	mov eax, dword [off_4D2424]
	call sub_40DD20

loc_40DCAC:
	mov esi, eax

loc_40DCAE:
	test ecx, ecx
	jz loc_40DCF3

loc_40DCB2:
	inc ecx
	cmp ecx, 6
	jge loc_40DCD4
	lea eax, 0[ecx*4]
	cmp ebx, 4B00h
	jnz loc_40DCF9
	mov edx, ecx
	mov eax, dword off_4D2424[eax]
	call sub_40DD20

loc_40DCD4:
	mov eax, ebx
	call sub_40DEA0

loc_40DCDB:
	xor edx, edx
	mov dword [dword_4E5914], edx
	pop esi
	pop ecx
	pop ebx
	ret

loc_40DCE7:
	mov eax, dword [off_4D2424]
	call sub_40DD80
	jmp loc_40DCAC

loc_40DCF3:
	test esi, esi
	jnz loc_40DCB2
	jmp loc_40DCDB

loc_40DCF9:
	mov edx, ecx
	mov eax, dword off_4D2424[eax]
	call sub_40DD80
	mov eax, ebx
	call sub_40DEA0
	xor edx, edx
	mov dword [dword_4E5914], edx
	pop esi
	pop ecx
	pop ebx
	ret
;sub_40DC90 endp

sub_40DD20: ;SUBROUTINE
	push ebx
	push ecx
	mov ecx, eax
	call sub_410E10
	xor ebx, ebx
	test eax, eax
	jz loc_40DD69
	cmp edx, 1
	jnz loc_40DD55

loc_40DD34:
	mov eax, [ecx+0Ch]
	mov dl, [eax]
	test dl, dl
	jnz loc_40DD63

loc_40DD3D:
	mov eax, [ecx+0Ch]
	xor ebx, ebx
	mov edx, [ecx+10h]
	mov bl, [eax]
	cmp word [edx+ebx*2+2], 0
	jz loc_40DD6E
	inc bl
	mov [eax], bl
	jmp loc_40DD3D

loc_40DD55:
	mov edx, 7Fh
	xor eax, eax
	call sub_4423F0
	jmp loc_40DD34

loc_40DD63:
	mov dh, dl
	dec dh
	mov [eax], dh

loc_40DD69:
	mov eax, ebx
	pop ecx
	pop ebx
	ret

loc_40DD6E:
	mov ebx, 1
	mov eax, ebx
	pop ecx
	pop ebx
	ret
;sub_40DD20 endp

sub_40DD80: ;SUBROUTINE
	push ebx
	push ecx
	mov ecx, eax
	call sub_410E10
	xor ebx, ebx
	test eax, eax
	jz loc_40DDAA
	cmp edx, 1
	jnz loc_40DDAF

loc_40DD94:
	mov eax, [ecx+0Ch]
	inc byte [eax]
	mov eax, [ecx+0Ch]
	xor edx, edx
	mov dl, [eax]
	mov ecx, [ecx+10h]
	cmp word [ecx+edx*2], 0
	jz loc_40DDBD

loc_40DDAA:
	mov eax, ebx
	pop ecx
	pop ebx
	ret

loc_40DDAF:
	mov edx, 7Fh
	xor eax, eax
	call sub_4423F0
	jmp loc_40DD94

loc_40DDBD:
	mov ebx, 1
	mov byte [eax], 0
	mov eax, ebx
	pop ecx
	pop ebx
	ret
;sub_40DD80 endp

sub_40DDD0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	mov esi, eax
	lea esi, [eax+1]
	cmp esi, 1
	jz loc_40DDE8
	cmp esi, 2
	jz loc_40DE5A
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_40DDE8:
	mov eax, dword [off_4D2424]
	push 4
	mov edx, [eax+0Ch]
	push 3
	mov dl, [edx]
	and edx, 0FFh
	mov eax, [eax+10h]
	mov ecx, 0Dh
	mov ebx, 49h
	movsx eax, word [eax+edx*2]
	mov edx, 23Ah
	call sub_41B710
	call sub_4054E0
	mov eax, dword [off_4D2428]
	push 4
	mov edx, [eax+0Ch]
	push 4
	mov dl, [edx]
	and edx, 0FFh
	mov eax, [eax+10h]
	mov ecx, 0Dh
	mov ebx, 49h
	movsx eax, word [eax+edx*2]
	mov edx, 230h
	call sub_41B710
	call sub_4054E0
	cmp esi, 2
	jz loc_40DE5A
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_40DE5A:
	mov eax, dword off_4D2424[esi*4]
	push 4
	mov edx, [eax+0Ch]
	push 5
	mov dl, [edx]
	and edx, 0FFh
	mov eax, [eax+10h]
	mov ecx, 0Dh
	mov ebx, 0B5h
	movsx eax, word [eax+edx*2]
	mov edx, 23Eh
	call sub_41B710
	call sub_4054E0
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_40DDD0 endp

sub_40DEA0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	xor edx, edx
	mov dl, byte [byte_512DB0]
	cmp eax, 4B00h
	jnz loc_40DEEE
	mov ch, 6

loc_40DEB4:
	xor eax, eax
	mov al, byte [byte_512DB0]
	call sub_40D0C0
	test eax, eax
	jz loc_40DEDF
	mov cl, byte [byte_512DB0]
	test cl, cl
	jnz loc_40DEE3
	mov byte [byte_512DB0], ch

loc_40DED4:
	xor eax, eax
	mov al, byte [byte_512DB0]
	cmp eax, edx
	jnz loc_40DEB4

loc_40DEDF:
	pop edx
	pop ecx
	pop ebx
	ret

loc_40DEE3:
	mov al, cl
	dec al
	mov byte [byte_512DB0], al
	jmp loc_40DED4

loc_40DEEE:
	xor eax, eax
	mov al, byte [byte_512DB0]
	call sub_40D0C0
	test eax, eax
	jz loc_40DEDF
	mov ah, byte [byte_512DB0]
	inc ah
	mov byte [byte_512DB0], ah
	cmp ah, 7
	jnb loc_40DF1E
	xor eax, eax
	mov al, byte [byte_512DB0]
	cmp eax, edx
	jz loc_40DEDF
	jmp loc_40DEEE

loc_40DF1E:
	xor bh, bh
	mov byte [byte_512DB0], bh
	xor eax, eax
	mov al, byte [byte_512DB0]
	cmp eax, edx
	jz loc_40DEDF
	jmp loc_40DEEE
;sub_40DEA0 endp

sub_40DF40: ;SUBROUTINE
	push ecx
	push esi
	push edi
	mov eax, dword [dword_4D7708]
	call sub_489F48
	cmp word [word_51345A], 0
	jz loc_40DF5B

loc_40DF57:
	pop edi
	pop esi
	pop ecx
	ret

loc_40DF5B:
	mov eax, dword [dword_513408+2]
	sar eax, 10h
	call sub_463DC0
	cwde
	mov ecx, [edx+4]
	cmp eax, ecx
	jz loc_40DFC2
	mov edi, ecx
	mov esi, edx
	shl edi, 5
	mov ecx, 20h
	add edi, dword_4E5940
	push edi
	mov eax, ecx
	shr ecx, 2
	rep movsd
	mov cl, al
	and cl, 3
	rep movsb
	pop edi
	mov ecx, 1
	mov eax, dword [dword_4D7708]
	mov word [dword_513428], cx
	call sub_489F60
	cmp word [word_513458], 0
	jz loc_40DF57
	mov ebx, 20h
	xor eax, eax
	call sub_464070
	pop edi
	pop esi
	pop ecx
	ret

loc_40DFC2:
	mov eax, dword [dword_4D7708]
	call sub_489F60
	pop edi
	pop esi
	pop ecx
	ret
;sub_40DF40 endp

sub_40DFD0: ;SUBROUTINE
	mov eax, dword [dword_4D24E0]
	call sub_489F48
	cmp word [word_51345A], 0
	jz loc_40DFE5
	ret

loc_40DFE5:
	push edi
	push esi
	push ecx
	mov ecx, 0Ch
	mov edi, byte_4E5A60
	mov esi, edx
	push edi
	mov eax, ecx
	shr ecx, 2
	rep movsd
	mov cl, al
	and cl, 3
	rep movsb
	pop edi
	mov ecx, 1
	mov ah, byte [byte_4E5A61]
	mov word [word_513426], cx
	cmp ah, 1
	jz loc_40E02E
	cmp dword [dword_4D76B8], 0
	jz loc_40E02E
	mov dword [dword_4D24E4], 1

loc_40E02E:
	mov eax, dword [dword_4D24E0]
	call sub_489F60
	pop ecx
	pop esi
	pop edi
	ret
;sub_40DFD0 endp

sub_40E040: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	mov ebp, esp
	sub esp, 20h
	mov eax, dword [dword_513408+2]
	sar eax, 10h
	xor edx, edx
	call sub_463DC0
	mov [ebp-14h], ax
	mov ah, byte [byte_51345F]
	mov [ebp-0Ch], edx
	test ah, ah
	jnz loc_40E157
	mov eax, 2

loc_40E074:
	xor ebx, ebx
	mov [ebp-4], ax
	mov [ebp-8], bx
	mov [ebp-18h], ebx

loc_40E081:
	mov edx, [ebp-6]
	mov eax, [ebp-0Ah]
	sar edx, 10h
	sar eax, 10h
	cmp eax, edx
	jge loc_40E294
	mov edx, [ebp-16h]
	sar edx, 10h
	cmp eax, edx
	jnz loc_40E161
	mov word [ebp-10h], 4

loc_40E0A9:
	cmp word [ebp-4], 2
	jle loc_40E16C
	imul esi, [ebp-8], 3Bh

loc_40E0B8:
	add esi, 2
	mov eax, [ebp-0Ah]
	sar eax, 10h
	lea ecx, [eax+eax]
	mov dx, word (dword_51340C+2)[ecx]
	mov edi, eax
	movsx edx, dx
	shl edi, 5
	cmp edx, 0FFFFFFFFh
	jnz loc_40E174
	cmp eax, dword dword_4E5944[edi]
	jnz loc_40E10D
	mov eax, dword [dword_4D7708]
	call sub_489F48
	mov eax, dword dword_51340C[ecx]
	sar eax, 10h
	cmp eax, edx
	jnz loc_40E103
	xor eax, edx
	mov dword dword_4E5944[edi], eax

loc_40E103:
	mov eax, dword [dword_4D7708]
	call sub_489F60

loc_40E10D:
	mov eax, esi
	mov edx, 10Eh
	inc eax
	xor ecx, ecx
	movsx ebx, ax
	mov eax, 98h
	call sub_405580
	mov ebx, 0F6h
	mov edx, 3000h
	movsx ecx, si
	mov eax, aDark ; "dark"

loc_40E136:
	add ecx, 8
	call sub_405B30

loc_40E13E:
	mov esi, [ebp-8]
	mov ecx, [ebp-18h]
	inc esi
	add ecx, 0ECh
	mov [ebp-8], si
	mov [ebp-18h], ecx
	jmp loc_40E081

loc_40E157:
	mov eax, 8
	jmp loc_40E074

loc_40E161:
	mov word [ebp-10h], 2
	jmp loc_40E0A9

loc_40E16C:
	mov esi, [ebp-18h]
	jmp loc_40E0B8

loc_40E174:
	cmp eax, dword dword_4E5944[edi]
	jz loc_40E1B7
	mov ebx, 0F6h
	mov edx, 3000h
	movsx edi, si
	mov eax, aWait ; "wait"
	lea ecx, [edi+8]
	call sub_405B30
	mov eax, [ebp-12h]
	sar eax, 10h
	push eax
	mov ecx, 12h
	mov edx, 10Eh
	push 3
	mov ebx, edi
	mov eax, a___ ; "..."
	call sub_4054E0
	jmp loc_40E13E

loc_40E1B7:
	mov eax, dword [dword_4D7708]
	call sub_489F48
	mov eax, [ebp-12h]
	sar eax, 10h
	mov ecx, 12h
	mov [ebp-20h], eax
	push eax
	movsx eax, si
	mov edx, 10Eh
	mov [ebp-1Ch], eax
	mov eax, dword_4E5940
	push 3
	add eax, edi
	mov ebx, [ebp-1Ch]
	add eax, 9
	call sub_4054E0
	mov eax, [ebp-20h]
	mov ecx, 12h
	push eax
	xor eax, eax
	mov ebx, [ebp-1Ch]
	mov al, byte byte_4E5952[edi]
	push 3
	add eax, 60h
	mov edx, 1A4h
	call sub_41B710
	call sub_4054E0
	mov edx, [ebp-20h]
	mov ecx, 12h
	push edx
	mov ebx, [ebp-1Ch]
	mov al, byte byte_4E5953[edi]
	push 3
	mov edx, 235h
	test al, al
	jnz loc_40E279
	mov eax, 1

loc_40E239:
	add eax, 5Eh
	call sub_41B710
	call sub_4054E0
	mov eax, dword [dword_4D7708]
	call sub_489F60
	mov eax, [ebp-0Ah]
	sar eax, 10h
	shl eax, 5
	cmp byte byte_4E5948[eax], 0
	jz loc_40E27D
	mov ebx, 0F6h
	mov edx, 3000h
	movsx ecx, si
	mov eax, aRedy ; "redy"
	jmp loc_40E136

loc_40E279:
	xor eax, eax
	jmp loc_40E239

loc_40E27D:
	mov ebx, 0F6h
	mov edx, 3000h
	movsx ecx, si
	mov eax, aWait ; "wait"
	jmp loc_40E136

loc_40E294:
	xor edx, edx
	mov si, word [dword_513408+2]
	mov dword [dword_4D24DC], edx
	cmp si, 2
	jl loc_40E2CB
	xor edx, edx
	xor ecx, ecx

loc_40E2AD:
	mov ebx, dword [dword_513408]
	movsx eax, dx
	sar ebx, 10h
	cmp eax, ebx
	jge loc_40E317
	call sub_463DC0
	cwde
	cmp eax, 0FFFFFFFFh
	jnz loc_40E308

loc_40E2C8:
	inc edx
	jmp loc_40E2AD

loc_40E2CB:
	mov edx, 2800h
	mov eax, aRedd ; "redd"

loc_40E2D5:
	xor ecx, ecx

loc_40E2D7:
	xor ebx, ebx

loc_40E2D9:
	call sub_405B30
	mov edx, 2800h
	mov eax, aLogo ; "logo"
	xor ecx, ecx
	xor ebx, ebx
	call sub_405B30
	xor eax, eax
	call sub_4211E0
	cmp word [ebp-0Ch], 0
	jnz loc_40E35D
	mov esp, ebp
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_40E308:
	shl eax, 5
	cmp byte byte_4E5948[eax], 0
	jz loc_40E2C8
	inc ecx
	jmp loc_40E2C8

loc_40E317:
	test ecx, ecx
	jz loc_40E32B
	cmp ecx, ebx
	jge loc_40E337
	mov edx, 2800h
	mov eax, aYell ; "yell"
	jmp loc_40E2D5

loc_40E32B:
	mov edx, 2800h
	mov eax, aRedd ; "redd"
	jmp loc_40E2D7

loc_40E337:
	mov edx, 1
	mov edi, 1
	mov eax, aGren ; "gren"
	xor ecx, ecx
	xor ebx, ebx
	mov dword [dword_4D24DC], edx
	mov edx, 2800h
	mov [ebp-0Ch], edi
	jmp loc_40E2D9

loc_40E35D:
	mov eax, 305h
	call sub_402E10
	mov esp, ebp
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_40E040 endp

sub_40E370: ;SUBROUTINE
	push ebx
	push edx
	push esi
	xor eax, eax

loc_40E375:
	add eax, 20h
	xor dl, dl
	mov byte dword_4E5928[eax], dl
	xor edx, edx
	mov dword dword_4E5924[eax], edx
	cmp eax, 100h
	jnz loc_40E375
	call sub_420FC0
	cmp byte [byte_512DAA], 2
	jz loc_40E3CF

loc_40E39D:
	mov bh, byte [byte_512F42]
	cmp bh, 0Eh
	jbe loc_40E3DE
	xor dl, dl
	mov byte [byte_512DF6], dl

loc_40E3B0:
	cmp dword [dword_4D24E4], 0
	jz loc_40E3CB
	xor ebx, ebx
	mov esi, dword [dword_4D76B8]
	mov dword [dword_4D24E4], ebx
	test esi, esi
	jnz loc_40E40B

loc_40E3CB:
	pop esi
	pop edx
	pop ebx
	ret

loc_40E3CF:
	xor bl, bl
	mov byte [byte_512DB0], bl
	call sub_41A450
	jmp loc_40E39D

loc_40E3DE:
	cmp bh, 0Ch
	jb loc_40E3F8
	cmp bh, 0Eh
	ja loc_40E3F8
	mov ah, 2
	mov byte [byte_512DF5], bh
	mov byte [byte_512DF6], ah
	jmp loc_40E3B0

loc_40E3F8:
	mov al, byte [byte_512F42]
	mov byte [byte_512DF5], al
	mov byte [byte_512DF6], 2
	jmp loc_40E3B0

loc_40E40B:
	call sub_41A350
	pop esi
	pop edx
	pop ebx
	ret
;sub_40E370 endp

sub_40E420: ;SUBROUTINE
	push ebx
	push edx
	push edi
	push ebp
	cmp word [dword_513408+2], 2
	jl loc_40E519
	cmp word [word_513458], 0
	jz loc_40E50B
	xor ebx, ebx

loc_40E442:
	mov eax, dword [dword_513408]
	sar eax, 10h
	cmp ebx, eax
	jl loc_40E4E1
	mov dword [dword_4DA1B8], 1
	call sub_47DCF0
	test eax, eax
	jz loc_40E501

loc_40E469:
	cmp word [word_513458], 0
	jnz loc_40E520

loc_40E477:
	call sub_40E6B0
	xor edx, edx

loc_40E47E:
	add edx, 2
	xor edi, edi
	mov word word_513446[edx], di
	cmp edx, 10h
	jnz loc_40E47E
	push esi
	push ecx
	mov edx, 1
	mov eax, 1400h
	mov ebp, byte_512E84
	call sub_463930
	mov edx, 1
	mov eax, 0A00h
	xor ebx, ebx
	call sub_463930
	xor edx, edx

loc_40E4B8:
	mov eax, dword [dword_513408]
	sar eax, 10h
	cmp ebx, eax
	jge loc_40E611
	movsx eax, bx
	call sub_463DC0
	movsx ecx, ax
	cmp ecx, 0FFFFFFFFh
	jnz loc_40E537
	add ebp, 9
	inc ebx
	add edx, 2
	jmp loc_40E4B8

loc_40E4E1:
	movsx eax, bx
	call sub_463DC0
	cwde
	cmp eax, 0FFFFFFFFh
	jz loc_40E519
	shl eax, 5
	cmp byte byte_4E5948[eax], 0
	jz loc_40E519
	inc ebx
	jmp loc_40E442

loc_40E501:
	mov dword [dword_4DA1B8], eax
	pop ebp
	pop edi
	pop edx
	pop ebx
	ret

loc_40E50B:
	cmp word [dword_513428+2], 1
	jz loc_40E469

loc_40E519:
	xor eax, eax
	pop ebp
	pop edi
	pop edx
	pop ebx
	ret

loc_40E520:
	call sub_47E360
	xor ebx, ebx
	call sub_40E620
	mov dword [dword_4DA1B8], ebx
	jmp loc_40E477

loc_40E537:
	mov esi, dword_4E5940
	shl ecx, 5
	add esi, ecx
	mov edi, ebp
	add esi, 9
	push edi

loc_40E547:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_40E55F
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_40E547

loc_40E55F:
	pop edi
	xor eax, eax
	mov al, byte byte_4E5952[ecx]
	mov word (dword_512F98+2)[edx], ax
	xor eax, eax
	mov al, byte byte_4E5953[ecx]
	mov word (dword_512FA8+2)[edx], ax
	xor eax, eax
	mov al, byte byte_4E5954[ecx]
	mov word (dword_512FB8+2)[edx], ax
	xor eax, eax
	mov al, byte byte_4E595A[ecx]
	mov word (dword_512FC8+2)[edx], ax
	xor eax, eax
	mov al, byte byte_4E5958[ecx]
	mov word (dword_512FD8+2)[edx], ax
	xor eax, eax
	mov al, byte byte_4E5959[ecx]
	mov word (dword_512FE8+2)[edx], ax
	xor eax, eax
	mov al, byte byte_4E595C[ecx]
	mov word (dword_512FF8+2)[edx], ax
	xor eax, eax
	mov al, byte byte_4E595B[ecx]
	mov word (dword_513008+2)[edx], ax
	xor eax, eax
	mov al, byte byte_4E5955[ecx]
	mov word (dword_513018+2)[edx], ax
	xor eax, eax
	mov al, byte byte_4E5956[ecx]
	mov word (dword_513028+2)[edx], ax
	xor eax, eax
	mov al, byte byte_4E5957[ecx]
	mov word word_51303A[edx], ax
	add ebp, 9
	inc ebx
	add edx, 2
	jmp loc_40E4B8

loc_40E611:
	mov eax, 1
	pop ecx
	pop esi
	pop ebp
	pop edi
	pop edx
	pop ebx
	ret
;sub_40E420 endp

sub_40E620: ;SUBROUTINE
	push ebx
	push edx
	mov byte [byte_4E5A60], 1
	mov al, byte [byte_512DAA]
	mov byte [byte_4E5A61], al
	mov al, byte [byte_512DAB]
	mov byte [byte_4E5A62], al
	mov al, byte [byte_512DB0]
	mov byte [byte_4E5A63], al
	mov al, byte [byte_512F43]
	mov byte [byte_4E5A64], al
	mov al, byte [byte_512DB8]
	mov byte [byte_4E5A65], al
	mov al, byte [byte_512DB9]
	mov byte [byte_4E5A66], al
	mov al, byte [byte_512F42]
	mov byte [byte_4E5A67], al
	mov al, byte [byte_512DF8]
	mov byte [byte_4E5A68], al
	mov al, byte [byte_512DBB]
	mov ebx, 0Ch
	mov byte [byte_4E5A69], al
	mov ax, word [dword_512D9E+2]
	mov edx, byte_4E5A60
	mov word [word_4E5A6A], ax
	xor eax, eax
	call sub_464070
	pop edx
	pop ebx
	ret
;sub_40E620 endp

sub_40E6B0: ;SUBROUTINE
	mov byte [byte_4E5A40], 2
	mov eax, dword [dword_513408+2]
	sar eax, 10h
	call sub_463DC0
	cwde
	mov dword [dword_4E5A44], eax
	cmp eax, 0FFFFFFFFh
	jnz loc_40E6D0
	ret

loc_40E6D0:
	push edi
	push esi
	push edx
	push ecx
	push ebx
	mov esi, dword_512F4C
	mov al, byte [byte_512F45]
	mov edi, byte_4E5A49
	mov byte [byte_4E5A48], al
	push edi

loc_40E6EA:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_40E702
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_40E6EA

loc_40E702:
	pop edi
	mov al, byte [byte_512DBF]
	mov byte [byte_4E5A52], al
	mov al, byte [byte_512DC0]
	mov byte [byte_4E5A53], al
	xor eax, eax
	mov al, byte [byte_512DBF]
	mov al, byte byte_512DC1[eax]
	mov byte [byte_4E5A54], al
	mov al, byte [byte_512DD6]
	mov byte [byte_4E5A55], al
	mov al, byte [byte_512DD8]
	mov ecx, 20h
	mov byte [byte_4E5A56], al
	mov al, byte [byte_512DD9]
	mov ebx, 20h
	mov byte [byte_4E5A57], al
	mov al, byte [byte_512DD3]
	mov edx, byte_4E5A40
	mov byte [byte_4E5A58], al
	mov al, byte [byte_512DD4]
	mov esi, byte_4E5A40
	mov byte [byte_4E5A59], al
	mov al, byte [byte_512DD2]
	mov edi, dword [dword_4E5A44]
	mov byte [byte_4E5A5A], al
	mov al, byte [byte_512DD7]
	shl edi, 5
	mov byte [byte_4E5A5B], al
	mov al, byte [byte_512DD5]
	add edi, dword_4E5940
	mov byte [byte_4E5A5C], al
	push edi
	mov eax, ecx
	shr ecx, 2
	rep movsd
	mov cl, al
	and cl, 3
	rep movsb
	pop edi
	xor eax, eax
	call sub_464070
	pop ebx
	pop ecx
	pop edx
	pop esi
	pop edi
	ret
;sub_40E6B0 endp

sub_40E7C0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	mov ebx, eax
	call sub_47E610
	mov esi, eax
	mov ebp, eax
	mov eax, dword [dword_513408+2]
	sar eax, 10h
	call sub_463DC0
	movsx edi, ax
	xor ecx, ecx
	cmp edi, 0FFFFFFFFh
	jnz loc_40E883

loc_40E7EC:
	cmp word [word_513458], 0
	jz loc_40E811
	mov al, byte [byte_4E5A61]
	cmp al, byte [byte_512DAA]
	jz loc_40E909

loc_40E807:
	call sub_40E620
	mov ecx, 1

loc_40E811:
	cmp word [word_513434], 0
	jz loc_40E829
	xor edi, edi
	mov ecx, 1
	mov word [word_513434], di

loc_40E829:
	mov eax, ebx
	xor edx, edx
	call sub_420FD0
	or ecx, eax
	cmp word [dword_513428], 0
	jz loc_40E860
	mov eax, dword [dword_4D7708]
	mov ecx, 1
	call sub_489F48
	xor edx, edx
	mov eax, dword [dword_4D7708]
	mov word [dword_513428], dx
	call sub_489F60

loc_40E860:
	mov bx, word [word_513458]
	test bx, bx
	jnz loc_40E87A
	cmp word [word_513426], 0
	jnz loc_40E9BD

loc_40E87A:
	mov eax, ecx
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_40E883:
	mov al, byte [byte_4E5A52]
	cmp al, byte [byte_512DBF]
	jnz loc_40E8FA
	mov dl, byte [byte_512DC0]
	cmp dl, byte [byte_4E5A53]
	jnz loc_40E8FA
	mov dh, byte [byte_512F45]
	cmp dh, byte [byte_4E5A48]
	jnz loc_40E8FA
	mov edx, dword_512F4C
	mov eax, byte_4E5A49
	call strcmp_
	test eax, eax
	jnz loc_40E8FA
	test esi, esi
	jnz loc_40E8FA
	mov esi, edi
	shl esi, 5
	mov al, byte byte_4E5952[esi]
	cmp al, byte [byte_512DBF]
	jnz loc_40E8FA
	mov dl, byte [byte_512DC0]
	cmp dl, byte byte_4E5953[esi]
	jnz loc_40E8FA
	mov dh, byte [byte_512F45]
	cmp dh, byte byte_4E5948[esi]
	jz loc_40E7EC

loc_40E8FA:
	call sub_40E6B0
	mov ecx, 1
	jmp loc_40E7EC

loc_40E909:
	mov dl, byte [byte_512DAB]
	cmp dl, byte [byte_4E5A62]
	jnz loc_40E807
	mov dh, byte [byte_512DB0]
	cmp dh, byte [byte_4E5A63]
	jnz loc_40E807
	mov al, byte [byte_4E5A64]
	cmp al, byte [byte_512F43]
	jnz loc_40E807
	mov dl, byte [byte_512DB8]
	cmp dl, byte [byte_4E5A65]
	jnz loc_40E807
	mov dh, byte [byte_512DB9]
	cmp dh, byte [byte_4E5A66]
	jnz loc_40E807
	mov al, byte [byte_4E5A67]
	cmp al, byte [byte_512F42]
	jnz loc_40E807
	mov dl, byte [byte_512DF8]
	cmp dl, byte [byte_4E5A68]
	jnz loc_40E807
	mov dh, byte [byte_512DBB]
	cmp dh, byte [byte_4E5A69]
	jnz loc_40E807
	mov eax, dword [dword_512D9E]
	mov esi, dword [byte_4E5A68]
	sar eax, 10h
	sar esi, 10h
	cmp esi, eax
	jnz loc_40E807
	test ebp, ebp
	jnz loc_40E807
	jmp loc_40E811

loc_40E9BD:
	mov eax, dword [dword_4D24E0]
	call sub_489F48
	mov eax, dword [dword_4D24E0]
	mov word [word_513426], bx
	call sub_489F60
	mov al, byte [byte_4E5A61]
	mov byte [byte_512DAA], al
	mov al, byte [byte_4E5A62]
	mov byte [byte_512DAB], al
	mov al, byte [byte_4E5A63]
	mov byte [byte_512DB0], al
	mov al, byte [byte_4E5A64]
	mov byte [byte_512F43], al
	mov al, byte [byte_4E5A65]
	mov byte [byte_512DB8], al
	mov al, byte [byte_4E5A66]
	mov byte [byte_512DB9], al
	mov al, byte [byte_4E5A67]
	mov byte [byte_512F42], al
	mov al, byte [byte_4E5A68]
	mov byte [byte_512DF8], al
	mov al, byte [byte_4E5A69]
	mov byte [byte_512DBB], al
	mov ax, word [word_4E5A6A]
	mov edx, dword [dword_4D24E4]
	mov word [dword_512D9E+2], ax
	test edx, edx
	jz loc_40EA5F
	xor ecx, ecx
	mov ebx, dword [dword_4D76B8]
	mov dword [dword_4D24E4], ecx
	test ebx, ebx
	jz loc_40EA5F
	call sub_41A350

loc_40EA5F:
	mov ecx, 1
	mov eax, ecx
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_40E7C0 endp

sub_40EA70: ;SUBROUTINE
	push edx
	mov eax, dword [dword_4D24E0]
	call sub_489F74
	xor edx, edx
	mov eax, dword [dword_4D7708]
	mov dword [dword_4D24E0], edx
	call sub_489F74
	mov eax, dword [dword_4D770C]
	mov dword [dword_4D7708], edx
	call sub_489F74
	mov eax, byte_4E5A40
	mov dword [dword_4D770C], edx
	mov edx, 20h
	call sub_48A01C
	pop edx
	ret
;sub_40EA70 endp

sub_40EAC0: ;SUBROUTINE
	push edx
	xor edx, edx
	mov dword [dword_4D24E4], edx
	call sub_489EF8
	mov edx, 100h
	mov dword [dword_4D24E0], eax
	call sub_489EF8
	mov dword [dword_4D7708], eax
	call sub_489EF8
	mov dword [dword_4D770C], eax
	mov eax, dword_4E5940
	call sub_48A01C
	pop edx
	ret
;sub_40EAC0 endp

dword_40EB00: dd 4, 8, 2, 0

sub_40EB20: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 0Ch
	mov edi, esp
	mov esi, dword_40EB00
	movsd
	movsd
	movsd
	call sub_403B20
	cmp byte [byte_512DBE], 0
	jnz loc_40EFCA
	mov edx, dword_4D3014
	mov ecx, dword_4D3028
	mov ebx, dword_4D303C
	mov eax, dword_4D30EC
	xor esi, esi
	mov dword [off_4D3124], edx
	mov dword [off_4D3074], edx
	mov dword [off_4D3078], ecx
	mov dword [off_4D307C], ebx
	mov dword [off_4D3080], esi
	mov dword [off_4D3128], ecx
	xor dl, dl
	mov dword [off_4D312C], eax
	mov byte [byte_512DEB], dl
	xor dh, dh
	mov dword [off_4D3130], esi
	mov byte [byte_512DD0], dh

loc_40EB9A:
	cmp byte [byte_512DBE], 0
	jz loc_40F02A
	mov bh, byte [byte_512DAA]
	cmp bh, 2
	jz loc_40F02A
	cmp bh, 1
	jz loc_40F02A
	mov dl, byte [byte_4D30B8]
	mov ah, byte [byte_4D2F9C]
	and dl, 0FEh
	and ah, 0FEh
	mov byte [byte_4D30B8], dl
	mov byte [byte_4D2F9C], ah

loc_40EBDD:
	mov dh, byte [byte_512DAA]
	cmp dh, 1
	jnz loc_40F067
	mov eax, dword [dword_4E5FDC]
	call sub_40F370
	cmp dh, byte [byte_512DAB]
	jnz loc_40EC2C
	mov edi, dword [dword_4E5FDC]
	mov byte [byte_512DAC], dh
	cmp edi, 4B00h
	jnz loc_40F04A
	cmp word [word_4D279A], 2
	jnz loc_40F04A
	xor dl, dl
	mov byte [byte_512DAB], dl

loc_40EC2C:
	cmp byte [byte_512DAC], 0
	jz loc_40EC59
	cmp word [word_4D279A], 2
	jnz loc_40EC59
	mov ebp, dword [dword_4E5FDC]
	cmp ebp, 4B00h
	jnz loc_40F056

loc_40EC51:
	xor bl, bl
	mov byte [byte_512DAC], bl

loc_40EC59:
	mov al, byte [byte_4D3780]
	mov bh, byte [byte_512DA9]
	and al, 0FEh
	cmp bh, 1
	jnz loc_40F0A0
	cmp byte [byte_512DD6], 0
	jz loc_40F089

loc_40EC7C:
	or byte [byte_4D3780], 1

loc_40EC83:
	mov bl, byte [byte_512DA9]
	cmp bl, 2
	jnz loc_40F0B7

loc_40EC92:
	mov word [word_4D3E8A], 6

loc_40EC9B:
	cmp byte [byte_512ECC], 0
	jz loc_40ECFB
	mov al, byte [byte_4D3A38]
	mov dl, byte [byte_4D3248]
	mov bl, byte [byte_4D3A54]
	or al, 1
	or dl, 1
	or bl, 1
	mov byte [byte_4D3A38], al
	mov byte [byte_4D3248], dl
	mov byte [byte_4D3A54], bl
	mov ah, byte [byte_4D3234]
	mov dh, byte [byte_4D328C]
	mov bh, byte [byte_4D3E7C]
	or ah, 1
	or dh, 1
	or bh, 1
	mov byte [byte_4D3234], ah
	mov byte [byte_4D328C], dh
	mov byte [byte_4D3E7C], bh

loc_40ECFB:
	xor eax, eax
	mov al, byte [byte_512DBF]
	cmp byte byte_4D407D[eax*2], 0
	jnz loc_40F0D7
	or byte [byte_4D2F88], 1

loc_40ED17:
	xor eax, eax
	mov al, byte [byte_512DDA]
	cmp byte byte_4D407D[eax*2], 0
	jnz loc_40F0E3
	or byte [byte_4D30A4], 1

loc_40ED33:
	cmp byte [byte_512DA9], 1
	jnz loc_40F0EF
	and byte [byte_4D3E68], 0FEh

loc_40ED47:
	mov al, byte [byte_512DA9]
	cmp al, 1
	jnz loc_40ED5F
	cmp al, byte [byte_512DF6]
	jnz loc_40ED5F
	mov byte [byte_512DF6], 2

loc_40ED5F:
	mov dh, byte [byte_512DA9]
	test dh, dh
	jnz loc_40F0FB
	mov eax, dword [off_4D27A8]
	mov byte [byte_512DAE], dh
	or byte [eax+8], 1

loc_40ED7C:
	cmp byte [byte_512ECC], 0
	jnz loc_40EDBC
	cmp byte [byte_512DAA], 2
	jnz loc_40F11B
	mov eax, dword [off_4D2A2C]
	or byte [eax+8], 1
	mov al, byte [byte_4D3E40]
	or al, 1
	mov di, word [word_4D2A2A]
	mov byte [byte_4D3E40], al
	test di, di
	jnz loc_40EDBC
	mov word [word_4D2A2A], 2

loc_40EDBC:
	cmp word [word_4D320E], 1
	jnz loc_40F13D
	cmp byte [byte_512DF6], 0
	jnz loc_40EDDA
	mov byte [byte_512DF5], 0Fh

loc_40EDDA:
	cmp byte [byte_512DF6], 1
	jnz loc_40EDF4
	cmp byte [byte_512DF5], 0Bh
	jbe loc_40EDF4
	xor bh, bh
	mov byte [byte_512DF5], bh

loc_40EDF4:
	cmp byte [byte_512DF6], 2
	jnz loc_40F13D
	cmp byte [byte_512DF5], 0Fh
	jnz loc_40F13D
	xor dl, dl
	mov byte [byte_512DF5], dl

loc_40EE16:
	cmp byte [byte_512DF7], 0
	jz loc_40F19B
	xor cl, cl
	mov byte [byte_512DF7], cl
	mov byte [byte_512DF6], 1

loc_40EE32:
	and byte [byte_4D31D0], 0FEh

loc_40EE39:
	cmp byte [byte_512DB0], 0
	jnz loc_40F1B4

loc_40EE46:
	test byte [byte_4D3198], 1
	jnz loc_40EE61
	mov al, byte [byte_512DF8]
	xor bh, bh
	mov byte [byte_512DF9], al
	mov byte [byte_512DF8], bh

loc_40EE61:
	or byte [byte_4D3198], 1

loc_40EE68:
	cmp byte [byte_512DAA], 0
	jnz loc_40F228
	mov al, byte [byte_512DBD]
	cmp al, 2
	jnb loc_40F1E2
	cmp al, 1
	jnz loc_40F214
	mov ecx, word_4D2EF6
	mov dword [off_4D3098], ecx
	mov dword [off_4D2F60], ecx

loc_40EE9B:
	test byte [byte_512DBC], 1
	jz loc_40F26B
	mov edi, dword_4D2978
	mov ch, byte [byte_512DAA]
	mov dword [off_4D299C], edi
	cmp ch, 1
	jnz loc_40EEDA
	mov ebp, dword_4D2968
	mov al, byte [byte_512DB0]
	mov dword [off_4D299C], ebp
	cmp al, 7
	jnz loc_40EEDA
	xor ah, ah
	mov byte [byte_512DB0], ah

loc_40EEDA:
	mov dword [off_4D3F18], dword_4D2978

loc_40EEE4:
	mov dl, byte [byte_512DAB]
	cmp dl, 2
	jnz loc_40F292

loc_40EEF3:
	mov eax, dword [off_4D306C]
	or byte [eax+8], 1
	mov eax, dword [off_4D311C]
	or byte [eax+8], 1

loc_40EF05:
	cmp byte [byte_512ECC], 0
	jnz loc_40EF24
	cmp byte [byte_512DAF], 1
	jz loc_40F2CA
	mov eax, dword [off_4D2A3C]
	or byte [eax+8], 1

loc_40EF24:
	cmp byte [byte_512ECC], 0
	jnz loc_40EF50
	mov al, byte [byte_512DAA]
	cmp al, 1
	jnb loc_40F2D8
	test al, al
	jnz loc_40EF50
	mov eax, dword [off_4D3EE0]
	and byte [eax+8], 0FEh
	mov eax, dword [off_4D2A30]
	and byte [eax+8], 0FEh

loc_40EF50:
	mov al, byte [byte_512DAA]
	cmp al, 1
	jnz loc_40F310
	cmp dword [dword_4D76B8], 0
	jz loc_40F310
	or byte [byte_4D2714], al

loc_40EF70:
	cmp dword [dword_512F48], 0
	jnz loc_40F31C

loc_40EF7D:
	mov eax, dword [off_4D260C]
	or byte [eax+8], 1
	cmp dword [dword_512F48], 0
	jnz loc_40F334
	mov eax, dword [off_4D2610]
	or byte [eax+8], 1

loc_40EF9C:
	mov al, byte [byte_512DFF]
	cmp al, 1
	jz loc_40F342
	test al, al
	jz loc_40F355

loc_40EFB1:
	xor eax, eax
	mov al, byte [byte_512DB9]
	mov al, [esp+eax*4]
	mov byte [byte_512DB8], al
	add esp, 0Ch
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_40EFCA:
	mov ebx, dword_4D2FEC
	mov esi, dword_4D3000
	mov edi, dword_4D303C
	mov eax, dword_4D30B0
	mov ecx, dword_4D2F94
	xor ebp, ebp
	mov dword [off_4D3078], ebx
	mov dword [off_4D307C], esi
	mov dword [off_4D3080], edi
	mov dword [dword_4D3084], ebp
	mov dword [off_4D3124], eax
	mov dword [off_4D3128], ebx
	mov dword [off_4D312C], esi
	mov dword [dword_4D3134], ebp
	mov ebx, dword_4D30EC
	mov dword [off_4D3074], ecx
	mov dword [off_4D3130], ebx
	jmp loc_40EB9A

loc_40F02A:
	mov al, byte [byte_4D30B8]
	mov ch, byte [byte_4D2F9C]
	or al, 1
	or ch, 1
	mov byte [byte_4D30B8], al
	mov byte [byte_4D2F9C], ch
	jmp loc_40EBDD

loc_40F04A:
	mov byte [byte_512DAB], 2
	jmp loc_40EC2C

loc_40F056:
	cmp ebp, 4D00h
	jz loc_40EC51
	jmp loc_40EC59

loc_40F067:
	cmp byte [byte_512DAC], 0
	jz loc_40EC59
	mov cl, 1
	xor bh, bh
	mov byte [byte_512DAB], cl
	mov byte [byte_512DAC], bh
	jmp loc_40EC59

loc_40F089:
	cmp byte [byte_512DF2], 0
	jnz loc_40EC7C
	mov byte [byte_4D3780], al
	jmp loc_40EC83

loc_40F0A0:
	cmp byte [byte_512DD6], 0
	jnz loc_40EC7C
	mov byte [byte_4D3780], al
	jmp loc_40EC83

loc_40F0B7:
	cmp bl, 3
	jz loc_40EC92
	cmp bl, 4
	jz loc_40EC92
	mov word [word_4D3E8A], 5
	jmp loc_40EC9B

loc_40F0D7:
	and byte [byte_4D2F88], 0FEh
	jmp loc_40ED17

loc_40F0E3:
	and byte [byte_4D30A4], 0FEh
	jmp loc_40ED33

loc_40F0EF:
	or byte [byte_4D3E68], 1
	jmp loc_40ED47

loc_40F0FB:
	mov eax, dword [off_4D27A8]
	test byte [eax+8], 1
	jz loc_40F10D
	mov byte [byte_512DAE], 1

loc_40F10D:
	mov eax, dword [off_4D27A8]
	and byte [eax+8], 0FEh
	jmp loc_40ED7C

loc_40F11B:
	mov eax, dword [off_4D2A2C]
	mov cl, byte [byte_4D3E40]
	mov bh, [eax+8]
	and cl, 0FEh
	and bh, 0FEh
	mov byte [byte_4D3E40], cl
	mov [eax+8], bh
	jmp loc_40EDBC

loc_40F13D:
	mov al, byte [byte_512DF5]
	cmp al, 0Fh
	jnz loc_40F16A
	mov cl, byte [byte_512DF6]
	cmp cl, 1
	jnz loc_40F157
	mov byte [byte_512DF7], cl

loc_40F157:
	xor al, al
	mov byte [byte_512DF6], al
	or byte [byte_4D31D0], 1
	jmp loc_40EE39

loc_40F16A:
	cmp al, 0Bh
	jbe loc_40EE16
	mov dl, byte [byte_512DF6]
	cmp dl, 1
	jz loc_40F189
	mov byte [byte_512DF6], 2
	jmp loc_40EE32

loc_40F189:
	mov byte [byte_512DF7], dl
	mov byte [byte_512DF6], 2
	jmp loc_40EE32

loc_40F19B:
	cmp byte [byte_512DF6], 0
	jnz loc_40EE32
	mov byte [byte_512DF6], 2
	jmp loc_40EE32

loc_40F1B4:
	cmp byte [byte_512DF6], 2
	jz loc_40EE46
	mov al, byte [byte_4D3198]
	and al, 1
	cmp al, 1
	jnz loc_40F1D6
	mov al, byte [byte_512DF9]
	mov byte [byte_512DF8], al

loc_40F1D6:
	and byte [byte_4D3198], 0FEh
	jmp loc_40EE68

loc_40F1E2:
	ja loc_40F1FA
	mov edi, word_4D2F12
	mov dword [off_4D3098], edi
	mov dword [off_4D2F60], edi
	jmp loc_40EE9B

loc_40F1FA:
	cmp al, 3
	jnz loc_40F214
	mov ebx, dword_4D2F30
	mov dword [off_4D3098], ebx
	mov dword [off_4D2F60], ebx
	jmp loc_40EE9B

loc_40F214:
	mov eax, dword_4D2EDC
	mov dword [off_4D3098], eax
	mov dword [off_4D2F60], eax
	jmp loc_40EE9B

loc_40F228:
	mov edx, dword_4D2EDC
	mov al, byte [byte_512DBF]
	mov dword [off_4D2F60], edx
	cmp al, 0Bh
	jbe loc_40F244
	xor ah, ah
	mov byte [byte_512DBF], ah

loc_40F244:
	mov ecx, dword_4D2EDC
	mov dl, byte [byte_512DDA]
	mov dword [off_4D3098], ecx
	cmp dl, 0Bh
	jbe loc_40EE9B
	xor dh, dh
	mov byte [byte_512DDA], dh
	jmp loc_40EE9B

loc_40F26B:
	mov esi, dword_4D2968
	mov bh, byte [byte_512DB0]
	mov dword [off_4D299C], esi
	cmp bh, 7
	jnz loc_40EEE4
	xor cl, cl
	mov byte [byte_512DB0], cl
	jmp loc_40EEE4

loc_40F292:
	cmp dl, 1
	jz loc_40EEF3
	mov bl, byte [byte_512DAA]
	cmp bl, 2
	jz loc_40EEF3
	cmp bl, 1
	jz loc_40EEF3
	mov eax, dword [off_4D306C]
	and byte [eax+8], 0FEh
	mov eax, dword [off_4D311C]
	and byte [eax+8], 0FEh
	jmp loc_40EF05

loc_40F2CA:
	mov eax, dword [off_4D2A3C]
	and byte [eax+8], 0FEh
	jmp loc_40EF24

loc_40F2D8:
	ja loc_40F2F1
	mov eax, dword [off_4D3EE0]
	or byte [eax+8], 1
	mov eax, dword [off_4D2A30]
	or byte [eax+8], 1
	jmp loc_40EF50

loc_40F2F1:
	cmp al, 2
	jnz loc_40EF50
	mov eax, dword [off_4D3EE0]
	or byte [eax+8], 1
	mov eax, dword [off_4D2A30]
	or byte [eax+8], 1
	jmp loc_40EF50

loc_40F310:
	and byte [byte_4D2714], 0FEh
	jmp loc_40EF70

loc_40F31C:
	xor eax, eax
	mov al, byte [byte_512F5E]
	test eax, eax
	jz loc_40EF7D
	mov eax, dword [off_4D260C]
	and byte [eax+8], 0FEh

loc_40F334:
	mov eax, dword [off_4D2610]
	and byte [eax+8], 0FEh
	jmp loc_40EF9C

loc_40F342:
	xor ebp, ebp
	mov dword [dword_4D96B0], ebp
	mov dword [dword_4D5A44], ebp
	jmp loc_40EFB1

loc_40F355:
	xor edi, edi
	mov esi, 1
	mov dword [dword_4D96B0], edi
	mov dword [dword_4D5A44], esi
	jmp loc_40EFB1
;sub_40EB20 endp

sub_40F370: ;SUBROUTINE
	push ecx
	push edx
	cmp eax, 4B00h
	jnz loc_40F464
	cmp byte [byte_51345E], 0
	jnz loc_40F3F5
	mov ecx, 0Ch

loc_40F38B:
	xor eax, eax
	mov al, byte [byte_512DBF]
	call sub_407B20
	test eax, eax
	jnz loc_40F3B5
	xor edx, edx
	mov dl, byte [byte_512DBF]
	add edx, 0Bh
	mov eax, edx
	sar edx, 1Fh
	idiv ecx
	mov byte [byte_512DBF], dl
	jmp loc_40F38B

loc_40F3B5:
	cmp byte [byte_512DA9], 1
	jnz loc_40F53B
	mov ecx, 0Ch

loc_40F3C7:
	xor eax, eax
	mov al, byte [byte_512DDA]
	call sub_407B20
	test eax, eax
	jnz loc_40F53B
	xor edx, edx
	mov dl, byte [byte_512DDA]
	add edx, 0Bh
	mov eax, edx
	sar edx, 1Fh
	idiv ecx
	mov byte [byte_512DDA], dl
	jmp loc_40F3C7

loc_40F3F5:
	cmp byte [byte_512DAA], 1
	jnz loc_40F431
	mov ecx, 0Ch

loc_40F403:
	xor eax, eax
	mov al, byte [byte_512DBF]
	call sub_407B20
	test eax, eax
	jnz loc_40F53B
	xor edx, edx
	mov dl, byte [byte_512DBF]
	add edx, 0Bh
	mov eax, edx
	sar edx, 1Fh
	idiv ecx
	mov byte [byte_512DBF], dl
	jmp loc_40F403

loc_40F431:
	mov ecx, 0Ch

loc_40F436:
	xor eax, eax
	mov al, byte [byte_512DBF]
	call sub_407AF0
	test eax, eax
	jnz loc_40F53B
	xor edx, edx
	mov dl, byte [byte_512DBF]
	add edx, 0Bh
	mov eax, edx
	sar edx, 1Fh
	idiv ecx
	mov byte [byte_512DBF], dl
	jmp loc_40F436

loc_40F464:
	cmp byte [byte_51345E], 0
	jnz loc_40F4D8
	mov ecx, 0Ch

loc_40F472:
	xor eax, eax
	mov al, byte [byte_512DBF]
	call sub_407B20
	test eax, eax
	jnz loc_40F49A
	xor edx, edx
	mov dl, byte [byte_512DBF]
	inc edx
	mov eax, edx
	sar edx, 1Fh
	idiv ecx
	mov byte [byte_512DBF], dl
	jmp loc_40F472

loc_40F49A:
	cmp byte [byte_512DA9], 1
	jnz loc_40F53B
	mov ecx, 0Ch

loc_40F4AC:
	xor eax, eax
	mov al, byte [byte_512DDA]
	call sub_407B20
	test eax, eax
	jnz loc_40F53B
	xor edx, edx
	mov dl, byte [byte_512DDA]
	inc edx
	mov eax, edx
	sar edx, 1Fh
	idiv ecx
	mov byte [byte_512DDA], dl
	jmp loc_40F4AC

loc_40F4D8:
	cmp byte [byte_512DAA], 1
	jnz loc_40F50E
	mov ecx, 0Ch

loc_40F4E6:
	xor eax, eax
	mov al, byte [byte_512DBF]
	call sub_407B20
	test eax, eax
	jnz loc_40F53B
	xor edx, edx
	mov dl, byte [byte_512DBF]
	inc edx
	mov eax, edx
	sar edx, 1Fh
	idiv ecx
	mov byte [byte_512DBF], dl
	jmp loc_40F4E6

loc_40F50E:
	mov ecx, 0Ch

loc_40F513:
	xor eax, eax
	mov al, byte [byte_512DBF]
	call sub_407AF0
	test eax, eax
	jnz loc_40F53B
	xor edx, edx
	mov dl, byte [byte_512DBF]
	inc edx
	mov eax, edx
	sar edx, 1Fh
	idiv ecx
	mov byte [byte_512DBF], dl
	jmp loc_40F513

loc_40F53B:
	pop edx
	pop ecx
	ret
;sub_40F370 endp

sub_40F540: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	cmp word [eax+0Ah], 64h
	jz loc_40F5B4
	mov esi, [eax+8]
	sar esi, 10h
	mov edx, [eax+esi*4+0Ch]
	test byte [edx+8], 1
	jz loc_40F5B4
	mov bl, 2
	xor edi, edi

loc_40F564:
	mov edx, [eax+8]
	sar edx, 10h
	mov edx, [eax+edx*4+0Ch]
	test byte [edx+8], 1
	jz loc_40F5B4
	inc word [eax+0Ah]
	mov edx, [eax+8]
	sar edx, 10h
	mov ecx, [eax+edx*4+0Ch]
	cmp edi, ecx
	jz loc_40F5AA

loc_40F586:
	mov edx, [eax+8]
	sar edx, 10h
	mov ecx, [eax+edx*4+0Ch]
	cmp bl, [ecx]
	jz loc_40F5B0
	inc word [eax+0Ah]
	mov edx, [eax+8]
	sar edx, 10h
	cmp edi, [eax+edx*4+0Ch]
	jnz loc_40F586
	mov [eax+0Ah], di
	jmp loc_40F586

loc_40F5AA:
	mov [eax+0Ah], cx
	jmp loc_40F586

loc_40F5B0:
	cmp esi, edx
	jnz loc_40F564

loc_40F5B4:
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_40F540 endp

sub_40F5C0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 34h
	mov ebx, eax
	mov ecx, 1
	mov esi, 0FFFFFFFFh
	mov edi, 1
	xor ah, ah
	mov [esp+2Ch], ecx
	mov byte [byte_4E5FC8], ah
	mov [esp+28h], si
	mov [esp+30h], edi
	mov esi, (dword_512D9E+2)
	xor eax, eax
	xor ecx, ecx
	mov al, byte [byte_512DFB]
	mov dword [dword_4D40B8], ecx
	call sub_41B730
	call sub_4057C0
	mov ecx, 0ABh
	mov word [word_4D232C], di
	mov edi, dword_4E5D1C
	rep movsd
	mov ecx, 0ABh
	mov edi, dword_4E5A70
	mov esi, (dword_512D9E+2)
	rep movsd
	cmp ebx, off_4D3EC4
	jz loc_40F8AB

loc_40F63D:
	mov ebp, off_4D3EC4

loc_40F642:
	cmp word [esp+30h], 0
	jz loc_40FA4A
	cmp word [esp+2Ch], 0
	jz loc_40F674
	mov eax, [esp+28h]
	test ax, ax
	jnz loc_40F8DE
	mov ecx, 0ABh
	mov edi, dword_4E5D1C

loc_40F66D:
	mov esi, (dword_512D9E+2)
	rep movsd

loc_40F674:
	mov edx, [ebx+6]
	sar edx, 10h
	mov eax, ebx
	call dword off_4D40C0[edx*4]
	mov edx, eax
	cmp eax, 0FFFFFFFBh
	jnz loc_40F6C3
	cmp ebx, off_4D3EC4
	jz loc_40F6C3
	mov ebx, 0FFFFFFFFh
	mov eax, dword [off_4D3EC8+2]
	mov ecx, 4
	sar eax, 10h
	mov [esp+28h], bx
	lea edx, 0[eax*4]
	mov word [word_4D3ECE], cx
	mov eax, ebp
	mov ebx, ebp
	call dword off_4D40C0[edx]
	mov edx, eax

loc_40F6C3:
	cmp edx, 0FFFFFFFDh
	jnz loc_40F6CE
	xor esi, esi
	mov [esp+30h], esi

loc_40F6CE:
	cmp edx, 0FFFFFFFEh
	jnz loc_40F6F1
	mov edi, [esp+28h]
	test di, di
	jnz loc_40F8F7
	mov ecx, 0ABh
	mov edi, (dword_512D9E+2)
	mov esi, dword_4E5D1C

loc_40F6EF:
	rep movsd

loc_40F6F1:
	cmp byte [byte_512ECC], 0
	jz loc_40F741
	cmp ebx, off_4D3EC4
	jnz loc_40F741
	cmp edx, 0FFFFFFFDh
	jnz loc_40F741
	mov eax, dword_4E5A6C
	mov [esp], ebp
	xor edx, edx
	call sub_47EF30
	mov [esp+28h], dx
	mov dword [dword_4D40BC], eax
	test eax, eax
	jnz loc_40F915
	call sub_401080
	mov eax, 2FEh
	call sub_402CD0
	xor edx, edx

loc_40F739:
	mov dword [esp+30h], 1

loc_40F741:
	cmp edx, off_4D349C
	jnz loc_40F757
	cmp byte [byte_512DA9], 1
	jnz loc_40F757
	mov edx, off_4D35E8

loc_40F757:
	cmp ebx, off_4D3CFC
	jnz loc_40F78A
	cmp edx, off_4D3C50
	jnz loc_40F78A
	mov ch, byte [byte_512DAA]
	cmp ch, 1
	jnz loc_40F92C
	mov eax, dword [dword_4D76B8]
	cmp word [eax+2C0h], 6
	jle loc_40F78A
	mov edx, off_4D3BE4

loc_40F78A:
	cmp ebx, off_4D3C50
	jnz loc_40F7A0
	cmp edx, off_4D3BE4
	jnz loc_40F7A0
	xor eax, eax
	mov [esp+30h], eax

loc_40F7A0:
	cmp ebx, off_4D3BE4
	jnz loc_40F7B6
	cmp edx, off_4D3B74
	jnz loc_40F7B6
	xor ecx, ecx
	mov [esp+30h], ecx

loc_40F7B6:
	cmp edx, off_4D3C50
	jnz loc_40F7CD
	cmp byte [byte_512DAA], 1
	jz loc_40F7CD
	xor esi, esi
	mov [esp+30h], esi

loc_40F7CD:
	cmp ebx, off_4D3B74
	jnz loc_40F7E3
	cmp edx, off_4D3B08
	jnz loc_40F7E3
	xor edi, edi
	mov [esp+30h], edi

loc_40F7E3:
	cmp ebx, off_4D3B08
	jnz loc_40F7FA
	cmp byte [byte_512DAA], 2
	jz loc_40F7FA
	xor eax, eax
	mov [esp+30h], eax

loc_40F7FA:
	cmp edx, off_4D3B74
	jnz loc_40F811
	cmp byte [byte_512DAA], 2
	jz loc_40F811
	xor ecx, ecx
	mov [esp+30h], ecx

loc_40F811:
	cmp ebx, off_4D3EC4
	jnz loc_40F9E6
	test edx, edx
	jnz loc_40F9E6
	mov ah, byte [byte_512DA9]
	test ah, ah
	jz loc_40F9E6
	cmp ah, 1
	jz loc_40F9E6
	cmp ah, 3
	jnz loc_40F959
	mov edx, off_4D2548

loc_40F84A:
	test edx, edx
	jz loc_40F9E6
	call sub_402C40
	test eax, eax
	jnz loc_40F9E6
	xor ch, ch
	xor edx, edx
	mov byte [byte_512DA9], ch

loc_40F869:
	mov edi, 1
	mov [esp+2Ch], edi
	test edx, edx
	jz loc_40F642
	cmp edx, 0FFFFFFFFh
	jnz loc_40FA18

loc_40F883:
	mov eax, [esp+26h]
	sar eax, 10h
	cmp eax, 0FFFFFFFFh
	jz loc_40FA4A
	mov edi, [esp+28h]
	mov ebx, [esp+eax*4]
	xor esi, esi
	dec edi
	mov [esp+2Ch], esi
	mov [esp+28h], di
	jmp loc_40F642

loc_40F8AB:
	mov cl, byte [byte_512DA9]
	cmp cl, 2
	jnz loc_40F8CF

loc_40F8B6:
	inc word [esp+28h]
	mov eax, [esp+26h]
	sar eax, 10h
	mov [esp+eax*4], ebx
	mov ebx, dword_4D403C
	jmp loc_40F63D

loc_40F8CF:
	cmp cl, 3
	jz loc_40F8B6
	cmp cl, 4
	jz loc_40F8B6
	jmp loc_40F63D

loc_40F8DE:
	cmp ax, 1
	jl loc_40F674
	mov ecx, 0ABh
	mov edi, dword_4E5A70
	jmp loc_40F66D

loc_40F8F7:
	cmp di, 1
	jl loc_40F6F1
	mov ecx, 0ABh
	mov edi, (dword_512D9E+2)
	mov esi, dword_4E5A70
	jmp loc_40F6EF

loc_40F915:
	mov dl, 4
	call sub_402C40
	mov byte [byte_512DA9], dl
	mov edx, off_4D26A0
	jmp loc_40F739

loc_40F92C:
	cmp ch, 2
	jnz loc_40F94E
	cmp byte [byte_512DB0], 7
	jb loc_40F944
	mov edx, off_4D3B08
	jmp loc_40F78A

loc_40F944:
	mov edx, off_4D3B74
	jmp loc_40F78A

loc_40F94E:
	xor esi, esi
	mov [esp+30h], esi
	jmp loc_40F78A

loc_40F959:
	cmp ah, 2
	jnz loc_40F9A2
	xor eax, eax ;Sprawdzanie modemu, brak modemu
	mov dword [dword_512F48], eax
	call sub_401080
	mov eax, 2FDh
	xor dh, dh
	call sub_402CD0
	mov byte [byte_512DA9], dh
	xor edx, edx
	jmp loc_40F869

loc_40F9A2:
	cmp ah, 4
	jnz loc_40F84A
	mov eax, dword_4E5A6C
	call sub_47EF30
	mov dword [dword_4D40BC], eax
	test eax, eax
	jnz loc_40F9DC
	call sub_401080
	mov eax, 2FEh
	xor dl, dl
	call sub_402CD0
	mov byte [byte_512DA9], dl
	xor edx, edx
	jmp loc_40F869

loc_40F9DC:
	mov edx, off_4D26A0
	jmp loc_40F84A

loc_40F9E6:
	cmp edx, 0FFFFFFFCh
	jnz loc_40F869
	cmp dword [dword_4D76BC], 0
	jz loc_40F9FD
	call sub_41A2A0

loc_40F9FD:
	xor ecx, ecx
	xor esi, esi
	mov dword [dword_4D76BC], ecx
	xor cl, cl
	mov [esp+30h], esi
	mov byte [byte_512DAA], cl
	jmp loc_40F869

loc_40FA18:
	cmp edx, 0FFFFFFFEh
	jz loc_40F883
	add [esp+28h], di
	mov eax, [esp+26h]
	sar eax, 10h
	mov ecx, [esp+30h]
	mov [esp+eax*4], ebx
	mov ebx, edx
	test cx, cx
	jz loc_40F642
	mov word [edx+0Ah], 0
	jmp loc_40F642

loc_40FA4A:
	mov ebx, dword [dword_4D40B8]
	test ebx, ebx
	jz loc_40FA5B
	mov eax, ebx
	call sub_4848FC

loc_40FA5B:
	call sub_4056B0
	call sub_41B620
	cmp edx, 0FFFFFFFDh
	jnz loc_40FA79
	mov eax, 1
	add esp, 34h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_40FA79:
	xor eax, eax
	add esp, 34h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_40F5C0 endp

sub_40FA90: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 74h
	mov [esp+5Ch], eax
	xor edx, edx
	mov [esp+6Ch], dx

loc_40FAA4:
	mov eax, [esp+6Ah]
	sar eax, 10h
	mov edx, [esp+5Ch]
	lea ebp, 0[eax*4]
	add ebp, edx
	mov ecx, [ebp+0Ch]
	test ecx, ecx
	jz loc_41007C
	mov edx, [edx+8]
	sar edx, 10h
	mov ebp, ecx
	cmp eax, edx
	jnz loc_40FC31
	mov eax, 1

loc_40FAD8:
	mov [esp+68h], ax
	mov eax, [ebp+0]
	sar eax, 10h
	call sub_41B6F0
	cmp eax, 12h
	jl loc_40FC38
	mov eax, 13h
	mov esi, 0Ch
	mov [esp+64h], ax
	mov [esp+60h], esi

loc_40FB04:
	mov dl, [ebp+0]
	cmp dl, 1
	jnb loc_40FC50
	test dl, dl
	jnz loc_40FC1D

loc_40FB18:
	mov eax, [ebp+0]
	sar eax, 10h
	mov edi, esp
	call sub_41B710
	mov esi, eax
	push edi

loc_40FB28:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_40FB40
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_40FB28

loc_40FB40:
	pop edi
	test byte [ebp+8], 1
	jz loc_40FCB6
	mov word [esp+68h], 2
	mov esi, 6

loc_40FB57:
	mov eax, [ebp+0]
	sar eax, 10h
	call sub_41B670
	mov [esp+54h], eax
	mov eax, [esp+54h]
	mov ecx, [esp+66h]
	mov [esp+70h], ax
	mov eax, [ebp+0]
	sar ecx, 10h
	sar eax, 10h
	mov edx, [esp+52h]
	call sub_41B650
	mov edi, eax
	cwde
	sar edx, 10h
	mov [esp+50h], eax
	mov eax, [ebp+0]
	mov ebx, [esp+50h]
	sar eax, 10h
	call sub_405580
	test byte [ebp+8], 4
	jz loc_40FBDE
	movsx eax, si
	push eax
	mov eax, [ebp+0]
	sar eax, 10h
	call sub_41B690
	cwde
	push eax
	mov eax, [ebp+0]
	sar eax, 10h
	mov edx, [esp+68h]
	call sub_41B6F0
	movsx ecx, ax
	mov eax, [esp+5Ch]
	add eax, edx
	mov ebx, [esp+58h]
	movsx edx, ax
	mov eax, asc_4C8780 ; ":"
	call sub_4054E0

loc_40FBDE:
	test byte [ebp+8], 2
	jz loc_40FC1D
	movsx eax, si
	push eax
	mov eax, [ebp+0]
	sar eax, 10h
	call sub_41B690
	cwde
	push eax
	mov eax, [ebp+0]
	sar eax, 10h
	mov esi, [esp+68h]
	call sub_41B6F0
	movsx ecx, ax
	mov eax, [esp+78h]
	add eax, esi
	movsx ebx, di
	movsx edx, ax
	mov eax, a____1 ; "..."
	call sub_4054E0

loc_40FC1D:
	cmp byte [ebp+0], 2
	jz loc_40FD08

loc_40FC27:
	inc word [esp+6Ch]
	jmp loc_40FAA4

loc_40FC31:
	xor eax, eax
	jmp loc_40FAD8

loc_40FC38:
	mov ecx, 0Dh
	mov ebx, 8
	mov [esp+64h], cx
	mov [esp+60h], ebx
	jmp loc_40FB04

loc_40FC50:
	ja loc_40FC9D
	mov ebx, [esp+5Ch]
	mov edx, ebp
	cmp ebx, off_4D3CFC
	jnz loc_40FCE2
	call sub_41A210

loc_40FC69:
	test byte [edx+2], 1
	jnz loc_40FC1D
	cmp word [esp+68h], 0
	jz loc_40FCE6
	movsx ecx, ax
	lea eax, [edx+8]
	xor ebx, ebx
	mov edx, 2C00h
	call sub_405B30
	cmp byte [ebp+0], 2
	jz loc_40FD08
	inc word [esp+6Ch]
	jmp loc_40FAA4

loc_40FC9D:
	cmp dl, 2
	jz loc_40FB18
	cmp byte [ebp+0], 2
	jz loc_40FD08
	inc word [esp+6Ch]
	jmp loc_40FAA4

loc_40FCB6:
	cmp word [esp+68h], 0
	jz loc_40FCD0
	mov eax, [ebp+0]
	sar eax, 10h
	call sub_41B6B0
	mov esi, eax
	jmp loc_40FB57

loc_40FCD0:
	mov eax, [ebp+0]
	sar eax, 10h
	call sub_41B6D0
	mov esi, eax
	jmp loc_40FB57

loc_40FCE2:
	xor eax, eax
	jmp loc_40FC69

loc_40FCE6:
	movsx ecx, ax
	lea eax, [edx+4]
	xor ebx, ebx
	mov edx, 2C00h
	call sub_405B30
	cmp byte [ebp+0], 2
	jz loc_40FD08
	inc word [esp+6Ch]
	jmp loc_40FAA4

loc_40FD08:
	mov ah, [ebp+9]
	mov esi, ebp
	cmp ah, 3
	jnz loc_40FD6D
	cmp dword [ebp+0Ch], 0
	jz loc_40FD6D
	mov eax, [ebp+0]
	sar eax, 10h
	call sub_41B690
	cmp eax, 2
	jle loc_40FE63
	mov edx, 3

loc_40FD31:
	cmp word [esp+68h], 0
	jz loc_40FE6A
	mov eax, 4

loc_40FD42:
	cwde
	push eax
	movsx eax, dx
	push eax
	mov eax, [esi]
	sar eax, 10h
	mov edx, [esp+6Ch]
	call sub_41B6F0
	movsx ecx, ax
	mov eax, [esp+78h]
	add eax, edx
	movsx ebx, di
	movsx edx, ax
	mov eax, [esi+0Ch]
	call sub_4054E0

loc_40FD6D:
	cmp byte [esi+9], 18h
	jnz loc_40FDFF
	fld dword [dword_4D4D20]
	fadd dword [flt_4C8790]
	fmul dword [flt_4C878C]
	call __CHP
	fistp dword [esp+58h]
	mov eax, [esp+58h]
	inc eax
	push eax
	push aD_2 ; "%d"
	lea eax, [esp+8]
	push eax
	call sprintf_
	mov eax, [esi]
	add esp, 0Ch
	sar eax, 10h
	call sub_41B690
	cmp eax, 2
	jle loc_40FE74
	mov eax, 3

loc_40FDC2:
	cmp word [esp+68h], 0
	jz loc_40FE7B
	mov edx, 4

loc_40FDD3:
	movsx edx, dx
	push edx
	cwde
	push eax
	mov eax, [esi]
	sar eax, 10h
	mov edx, [esp+6Ch]
	call sub_41B6F0
	movsx ecx, ax
	mov eax, [esp+78h]
	add eax, edx
	movsx ebx, di
	movsx edx, ax
	lea eax, [esp+8]
	call sub_4054E0

loc_40FDFF:
	mov dh, [esi+9]
	cmp dh, 2
	jnz loc_40FE90
	mov eax, [esi]
	sar eax, 10h
	call sub_41B690
	cmp eax, 2
	jle loc_40FE85
	mov eax, 3

loc_40FE1F:
	cmp word [esp+68h], 0
	jz loc_40FE89
	mov edx, 4

loc_40FE2C:
	movsx edx, dx
	push edx
	cwde
	push eax
	mov eax, [esi]
	sar eax, 10h
	mov esi, [esp+6Ch]
	call sub_41B6F0
	movsx ecx, ax
	mov eax, [esp+78h]
	add eax, esi
	movsx ebx, di
	movsx edx, ax
	mov eax, dword [dword_512F48]
	call sub_4054E0
	inc word [esp+6Ch]
	jmp loc_40FAA4

loc_40FE63:
	xor edx, edx
	jmp loc_40FD31

loc_40FE6A:
	mov eax, 3
	jmp loc_40FD42

loc_40FE74:
	xor eax, eax
	jmp loc_40FDC2

loc_40FE7B:
	mov edx, 3
	jmp loc_40FDD3

loc_40FE85:
	xor eax, eax
	jmp loc_40FE1F

loc_40FE89:
	mov edx, 3
	jmp loc_40FE2C

loc_40FE90:
	cmp dh, 0Ch
	jz loc_40FF2B
	cmp dh, 0Dh
	jz loc_40FF2B
	cmp dh, 10h
	jz loc_40FF56
	mov edx, [esi+10h]
	cmp word [edx], 0
	jz loc_410002
	mov al, [esi+9]
	cmp al, 16h
	jnb loc_40FF7A

loc_40FEC3:
	mov eax, [esi+0Ch]
	mov al, [eax]
	and eax, 0FFh
	mov edx, [esi+10h]

loc_40FED0:
	mov dx, [edx+eax*2]

loc_40FED4:
	mov eax, [esp+68h]
	cmp ax, 1
	jnz loc_40FFE5
	movsx eax, dx
	call sub_41B6B0

loc_40FEEA:
	cwde
	movsx ebp, dx
	push eax
	mov eax, ebp
	call sub_41B690
	cwde
	push eax
	mov eax, [esi]
	sar eax, 10h
	mov esi, [esp+6Ch]
	call sub_41B6F0
	movsx ecx, ax
	mov eax, [esp+78h]
	add eax, esi
	movsx edx, ax
	mov eax, ebp
	movsx ebx, di
	call sub_41B710
	call sub_4054E0
	inc word [esp+6Ch]
	jmp loc_40FAA4

loc_40FF2B:
	mov ecx, [esp+66h]
	mov eax, [esp+6Eh]
	mov edx, [esp+62h]
	movsx ebx, di
	sar eax, 10h
	sar edx, 10h
	sar ecx, 10h
	add edx, eax
	mov eax, esi
	call sub_404740
	inc word [esp+6Ch]
	jmp loc_40FAA4

loc_40FF56:
	mov edx, [esp+6Eh]
	mov eax, [esp+62h]
	sar edx, 10h
	sar eax, 10h
	movsx ebx, di
	add edx, eax
	mov eax, esi
	call sub_410090
	inc word [esp+6Ch]
	jmp loc_40FAA4

loc_40FF7A:
	ja loc_40FF98
	mov al, byte [byte_512DAA]
	cmp al, 1
	jnb loc_40FFB3

loc_40FF85:
	mov eax, [esi+0Ch]
	xor edx, edx
	mov dl, [eax]
	mov eax, [esi+10h]
	mov dx, [eax+edx*2]
	jmp loc_40FED4

loc_40FF98:
	cmp al, 17h
	jnz loc_40FEC3
	cmp byte [byte_512DF6], 2
	jnz loc_40FFCD

loc_40FFA9:
	mov edx, 0DBh
	jmp loc_40FED4

loc_40FFB3:
	ja loc_40FFBF
	mov edx, 48h
	jmp loc_40FED4

loc_40FFBF:
	cmp al, 2
	jnz loc_40FF85
	mov edx, 4Ah
	jmp loc_40FED4

loc_40FFCD:
	cmp byte [byte_512DB0], 0
	jz loc_40FFA9
	mov eax, [esi+0Ch]
	mov al, [eax]
	and eax, 0FFh
	jmp loc_40FED0

loc_40FFE5:
	cmp ax, 2
	jnz loc_40FFF5
	mov eax, 6
	jmp loc_40FEEA

loc_40FFF5:
	movsx eax, dx
	call sub_41B6D0
	jmp loc_40FEEA

loc_410002:
	cmp byte [esi+9], 5
	jnz loc_40FC27
	cmp dword [dword_4D40BC], 0
	jz loc_40FC27
	mov eax, [esi]
	sar eax, 10h
	call sub_41B690
	cmp eax, 2
	jle loc_410071
	mov eax, 3

loc_41002D:
	cmp word [esp+68h], 0
	jz loc_410075
	mov edx, 4

loc_41003A:
	movsx edx, dx
	push edx
	cwde
	push eax
	mov eax, [esi]
	sar eax, 10h
	mov esi, [esp+6Ch]
	call sub_41B6F0
	movsx ecx, ax
	mov eax, [esp+78h]
	add eax, esi
	movsx ebx, di
	movsx edx, ax
	mov eax, dword [dword_4D40BC]
	call sub_4054E0
	inc word [esp+6Ch]
	jmp loc_40FAA4

loc_410071:
	xor eax, eax
	jmp loc_41002D

loc_410075:
	mov edx, 3
	jmp loc_41003A

loc_41007C:
	add esp, 74h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_40FA90 endp

sub_410090: ;SUBROUTINE
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 38h
	mov edi, edx
	mov esi, ebx
	cmp dword [eax+0Ch], 1
	jnz loc_4101A8
	xor eax, eax
	mov al, byte [byte_512DBF]
	mov al, byte byte_512DC1[eax]

loc_4100B2:
	and eax, 0FFh
	lea edx, [esp+2Ch]
	lea ecx, [esp+18h]
	push edx
	lea ebx, [esp+20h]
	lea edx, [esp+24h]
	call sub_458670
	lea eax, [esp+28h]
	lea ecx, [esp+30h]
	push eax
	lea eax, [esp+28h]
	mov ebx, [esp+1Ch]
	push eax
	mov edx, [esp+24h]
	mov eax, [esp+28h]
	call sub_457FA8
	mov ebx, 0D2h
	mov eax, [esp+30h]
	xor ecx, ecx
	mov edx, [esp+2Ch]
	mov [esp+0Ch], ecx
	mov [esp+10h], ebx
	mov [esp+14h], ecx
	mov [esp], eax
	mov eax, [esp+24h]
	lea ecx, [esp+34h]
	mov [esp+4], eax
	mov eax, [esp+28h]
	mov ebx, esp
	mov [esp+8], eax
	lea eax, [esp+0Ch]
	call sub_4584E0
	xor eax, eax
	mov al, [esp+34h]
	mov [esp+30h], eax
	xor eax, eax
	mov al, [esp+35h]
	mov [esp+24h], eax
	xor eax, eax
	mov edx, [esp+30h]
	mov al, [esp+36h]
	shl edx, 10h
	mov [esp+28h], eax
	mov eax, [esp+24h]
	or edx, 0FF000000h
	shl eax, 8
	mov ebp, [esp+28h]
	or eax, edx
	mov ecx, 15h
	or ebp, eax
	mov eax, 0FF000000h
	mov ebx, 54h
	call sub_48266C
	push eax
	lea edx, [esi+6]
	lea eax, [edi+2]
	call sub_488620
	mov ecx, 15h
	mov eax, ebp
	mov ebx, 54h
	call sub_48266C
	push eax
	lea edx, [esi+5]
	lea eax, [edi+1]
	call sub_488620
	add esp, 38h
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret

loc_4101A8:
	xor eax, eax
	mov al, byte [byte_512DDA]
	mov al, byte byte_512DDC[eax]
	jmp loc_4100B2
;sub_410090 endp

sub_4101C0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 8
	mov esi, eax
	mov eax, dword [dword_4D4D20]
	mov ebx, 1
	mov [esp+4], eax
	mov ah, byte [byte_4D3468]
	xor ebp, ebp
	and ah, 0FEh
	xor edi, edi
	mov byte [byte_4D3468], ah
	mov eax, esi
	mov [esp], ebp
	call sub_410E80

loc_4101F6:
	call sub_4833C7
	add edi, eax
	xor edx, edx
	mov eax, esi
	call sub_40BBE0
	test eax, eax
	jz loc_410302

loc_41020E:
	call sub_40EB20
	call sub_428A20
	mov edx, 400h
	mov eax, [esi+4]
	xor ecx, ecx
	xor ebx, ebx
	call sub_405B30
	mov eax, dword [dword_4D2314+2]
	sar eax, 10h
	mov edx, 1000h
	mov eax, dword dword_4D231C[eax*4]
	xor ecx, ecx
	xor ebx, ebx
	mov eax, [eax+20h]
	call sub_405B60
	mov eax, esi
	call sub_40FA90
	cmp esi, off_4D36A8
	jnz loc_41025D
	call sub_410330

loc_41025D:
	cmp esi, off_4D349C
	jnz loc_41030D

loc_410269:
	push 4
	push 5
	mov eax, 135h
	mov ecx, 12h
	call sub_41B650
	movsx ebx, ax
	mov eax, 137h
	mov edx, 199h
	call sub_41B710
	call sub_4054E0

loc_410293:
	call sub_405C70

loc_41029D:
	call sub_423B90
	mov eax, esi
	call sub_423CA0
	fld dword [dword_4D4D20]
	mov ebx, eax
	fcomp dword [esp+4]
	fnstsw ax
	sahf
	jz loc_4102C8
	mov eax, dword [dword_4D4D20]
	mov ebx, 1
	mov [esp+4], eax

loc_4102C8:
	call sub_405960
	test ax, ax
	jz loc_4102EE
	cmp edi, [esp]
	jle loc_4102EE
	lea edx, [edi+0Fh]
	mov [esp], edx
	movsx edx, ax
	mov eax, esi
	mov ebx, 1
	call sub_410414
	mov ebp, eax

loc_4102EE:
	test ebp, ebp
	jz loc_4101F6
	mov eax, ebp
	add esp, 8
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_410302:
	test bx, bx
	jnz loc_41020E
	jmp loc_41029D

loc_41030D:
	cmp esi, off_4D35E8
	jz loc_410269
	jmp loc_410293
;sub_4101C0 endp

off_410320: dd loc_410348
	dd loc_410362 ; jump table for switch statement
	dd loc_41037C
	dd loc_410396

sub_410330: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	mov al, byte [byte_512E00]
	cmp al, 3
	ja loc_41035E
	and eax, 0FFh ; switch 4 cases
	jmp off_410320[eax*4] ; switch jump

loc_410348:
	mov ecx, 118h ; jumptable 00410341 case 0
	mov edx, 3000h
	mov eax, aSful ; "sful"
	mov ebx, ecx
	call sub_405B30

loc_41035E:
	pop edx
	pop ecx
	pop ebx
	ret

loc_410362:
	mov ecx, 118h ; jumptable 00410341 case 1
	mov edx, 3000h
	mov eax, aSthr ; "sthr"
	mov ebx, ecx
	call sub_405B30
	pop edx
	pop ecx
	pop ebx
	ret

loc_41037C:
	mov ecx, 118h ; jumptable 00410341 case 2
	mov edx, 3000h
	mov eax, aShlf ; "shlf"
	mov ebx, ecx
	call sub_405B30
	pop edx
	pop ecx
	pop ebx
	ret

loc_410396:
	mov ecx, 118h ; jumptable 00410341 case 3
	mov edx, 3000h
	mov eax, aSqrt ; "sqrt"
	mov ebx, ecx
	call sub_405B30
	pop edx
	pop ecx
	pop ebx
	ret
;sub_410330 endp

off_4103B0: dd loc_41053C
	dd loc_41053C ; jump table for switch statement
	dd 0
	dd loc_410A94
	dd loc_410ADC
	dd loc_410AF9
	dd loc_41053C
	dd loc_410B55
	dd loc_410B29
	dd loc_410C4E
	dd loc_410C4E
	dd loc_410912
	dd loc_4108ED
	dd loc_4108ED
	dd loc_4108D3
	dd loc_41053C
	dd loc_4107EF
	dd loc_41053C
	dd loc_41053C
	dd loc_410954
	dd loc_41098F
	dd loc_4109A2
	dd loc_41053C
	dd loc_41053C
	dd loc_4107DA

sub_410414: ;SUBROUTINE
	push ebx
	push esi
	push edi
	push ebp
	sub esp, 9Ch
	mov esi, eax
	mov edi, edx
	movsx eax, dx
	xor ebx, ebx
	mov dword [dword_4E5FDC], eax
	cmp dx, 1Bh
	jz loc_41054A
	cmp word [esi+0Ah], 64h
	jnz loc_410458
	cmp di, 0Dh
	jz loc_41055A
	mov ax, word [dword_4E8B08]
	mov [esi+0Ah], ax
	mov eax, esi
	call sub_423E10

loc_410458:
	push ecx
	mov eax, [esi+8]
	sar eax, 10h
	mov eax, [esi+eax*4+0Ch]
	cmp byte [eax], 2
	jnz loc_41053C ; jumptable 00410535 cases 0,1,6,15,17,18,22,23
	mov edx, [eax+0Ch]
	mov ecx, eax
	cmp edx, byte_512ED1
	jnz loc_410485
	cmp di, 3C00h
	jnz loc_410485
	mov edi, 4D00h

loc_410485:
	cmp dword [ecx+0Ch], byte_512ED0
	jnz loc_41049A
	cmp di, 3D00h
	jnz loc_41049A
	mov edi, 4D00h

loc_41049A:
	cmp dword [ecx+0Ch], byte_512ED2
	jnz loc_410567
	cmp di, 3E00h
	jnz loc_410567
	mov edi, 4D00h

loc_4104B7:
	mov eax, [ecx+10h]
	cmp word [eax], 0
	jz loc_4104CC

loc_4104C0:
	mov edx, 7Fh
	xor eax, eax

loc_4104C7:
	call sub_4423F0

loc_4104CC:
	cmp di, 4800h
	jnb loc_4105CC
	cmp di, 0Dh
	jb loc_41053C ; jumptable 00410535 cases 0,1,6,15,17,18,22,23
	ja loc_410743

loc_4104E3:
	mov al, [ecx+8]
	test al, 8
	jz loc_410760
	mov edx, 7Fh
	mov eax, 1
	call sub_4423F0
	mov dx, [esi+0Ah]
	inc edx
	mov eax, esi
	mov [esi+0Ah], dx

loc_410508:
	call sub_423E10

loc_41050D:
	cmp di, 0Dh
	jnz loc_410529
	mov eax, [ecx+4]
	test eax, eax
	jz loc_410529
	test byte [ecx+8], 10h
	jz loc_4107D3
	mov ebx, 0FFFFFFFEh

loc_410529:
	mov al, [ecx+9]
	cmp al, 18h
	ja loc_41053C ; jumptable 00410535 cases 0,1,6,15,17,18,22,23
	and eax, 0FFh ; switch 25 cases
	jmp off_4103B0[eax*4] ; switch jump

loc_41053C:
	mov eax, ebx ; jumptable 00410535 cases 0,1,6,15,17,18,22,23
	pop ecx
	add esp, 9Ch
	pop ebp
	pop edi
	pop esi
	pop ebx
	ret

loc_41054A:
	mov eax, 0FFFFFFFEh
	add esp, 9Ch
	pop ebp
	pop edi
	pop esi
	pop ebx
	ret

loc_41055A:
	xor eax, eax
	add esp, 9Ch
	pop ebp
	pop edi
	pop esi
	pop ebx
	ret

loc_410567:
	cmp di, 1Bh
	jnb loc_41059A
	cmp di, 0Dh
	jnz loc_4104CC
	cmp byte [ecx+9], 12h
	jz loc_4104CC
	cmp dword [ecx+4], 0
	jz loc_4104C0
	mov edx, 7Fh
	mov eax, 2
	jmp loc_4104C7

loc_41059A:
	jbe loc_4105BD
	cmp di, 4B00h
	jb loc_4104CC
	jbe loc_4104B7
	cmp di, 4D00h
	jz loc_4104B7
	jmp loc_4104CC

loc_4105BD:
	mov edx, 7Fh
	mov eax, 3
	jmp loc_4104C7

loc_4105CC:
	ja loc_4105F8
	mov edi, [esi+8]
	sar edi, 10h

loc_4105D4:
	mov ax, [esi+0Ah]
	test ax, ax
	jnz loc_410DC4

loc_4105E1:
	mov eax, [esi+8]
	sar eax, 10h
	cmp dword [esi+eax*4+10h], 0
	jz loc_410DCB
	inc word [esi+0Ah]
	jmp loc_4105E1

loc_4105F8:
	cmp di, 4D00h
	jnb loc_4106D8
	cmp di, 4B00h
	jnz loc_41053C ; jumptable 00410535 cases 0,1,6,15,17,18,22,23
	mov al, [ecx+8]
	test al, 8
	jz loc_410CCD
	inc word [esi+0Ah]
	mov eax, esi
	mov edx, 7Fh

loc_410624:
	call sub_423E10
	mov eax, 1
	call sub_4423F0

loc_410633:
	cmp byte [ecx+9], 18h
	jnz loc_410643
	mov eax, 1
	call sub_428910

loc_410643:
	cmp byte [ecx+9], 10h
	jnz loc_4106A5
	mov edx, 7Fh
	xor eax, eax
	call sub_4423F0
	mov eax, dword [dword_4D40B4]
	inc eax
	mov edx, [ecx+0Ch]
	mov dword [dword_4D40B4], eax
	cmp edx, 1
	jnz loc_410D82
	xor eax, eax
	mov al, byte [byte_512DBF]
	mov dl, byte byte_512DC1[eax]
	dec dl
	mov byte byte_512DC1[eax], dl
	movzx edi, byte [byte_512DBF]
	lea esi, [edi+edi]
	mov dh, byte byte_4D407C[esi]
	cmp dl, dh
	jnb loc_4106A5
	mov al, dh
	add al, byte byte_4D407D[esi]
	dec al
	mov byte byte_512DC1[edi], al

loc_4106A5:
	cmp byte [ecx+9], 5
	jnz loc_41053C ; jumptable 00410535 cases 0,1,6,15,17,18,22,23
	mov edx, 7Fh
	xor eax, eax
	call sub_4423F0
	mov eax, dword_4E5A6C
	call sub_47EF30
	mov dword [dword_4D40BC], eax
	mov eax, ebx
	pop ecx
	add esp, 9Ch
	pop ebp
	pop edi
	pop esi
	pop ebx
	ret

loc_4106D8:
	jbe loc_4104E3
	cmp di, 5000h
	jnz loc_41053C ; jumptable 00410535 cases 0,1,6,15,17,18,22,23
	mov edi, [esi+8]
	sar edi, 10h

loc_4106EF:
	inc word [esi+0Ah]
	mov eax, [esi+8]
	sar eax, 10h
	cmp dword [esi+eax*4+0Ch], 0
	jnz loc_410706
	mov word [esi+0Ah], 0

loc_410706:
	mov edx, [esi+8]
	sar edx, 10h
	mov eax, [esi+edx*4+0Ch]
	cmp byte [eax], 2
	jnz loc_4106EF
	test byte [eax+8], 1
	jnz loc_4106EF
	cmp edx, edi
	jz loc_41072E
	mov edx, 7Fh
	mov eax, 1
	call sub_4423F0

loc_41072E:
	mov eax, esi
	call sub_423E10
	mov eax, ebx
	pop ecx
	add esp, 9Ch
	pop ebp
	pop edi
	pop esi
	pop ebx
	ret

loc_410743:
	cmp di, 1Bh
	jnz loc_41053C ; jumptable 00410535 cases 0,1,6,15,17,18,22,23
	mov ebx, 0FFFFFFFEh
	mov eax, ebx
	pop ecx
	add esp, 9Ch
	pop ebp
	pop edi
	pop esi
	pop ebx
	ret

loc_410760:
	test al, 10h
	jz loc_410792
	mov eax, [esi+8]
	sar eax, 10h
	mov eax, [esi+eax*4+8]
	test byte [eax+8], 1
	jnz loc_41050D
	mov edx, 7Fh
	mov eax, 1
	call sub_4423F0
	dec word [esi+0Ah]
	mov eax, esi
	jmp loc_410508

loc_410792:
	mov eax, [ecx+10h]
	cmp word [eax], 0
	jz loc_41050D
	mov eax, ecx
	call sub_410E10
	test eax, eax
	jz loc_41050D
	mov eax, [ecx+0Ch]
	inc byte [eax]
	mov eax, [ecx+0Ch]
	xor edx, edx
	mov dl, [eax]
	mov ebp, [ecx+10h]
	add edx, edx
	add edx, ebp
	cmp word [edx], 0
	jnz loc_41050D
	mov byte [eax], 0
	jmp loc_41050D

loc_4107D3:
	mov ebx, eax
	jmp loc_410529

loc_4107DA:
	xor eax, eax ; jumptable 00410535 case 24
	call sub_428910
	mov eax, ebx
	pop ecx
	add esp, 9Ch
	pop ebp
	pop edi
	pop esi
	pop ebx
	ret

loc_4107EF:
	cmp di, 4D00h ; jumptable 00410535 case 16
	jnz loc_410802
	mov edx, 7Fh
	xor eax, eax
	call sub_4423F0

loc_410802:
	mov edx, dword [dword_4D40B4]
	inc edx
	mov esi, [ecx+0Ch]
	mov dword [dword_4D40B4], edx
	cmp esi, 1
	jnz loc_410875
	xor eax, eax
	mov al, byte [byte_512DBF]
	xor ecx, ecx
	mov cl, byte byte_4D407D[eax*2]
	mov dl, byte byte_4D407C[eax*2]
	and edx, 0FFh
	add edx, ecx
	mov ch, byte byte_512DC1[eax]
	inc ch
	mov byte byte_512DC1[eax], ch
	mov al, ch
	and eax, 0FFh
	cmp eax, edx
	jl loc_41053C ; jumptable 00410535 cases 0,1,6,15,17,18,22,23
	xor eax, eax
	mov al, byte [byte_512DBF]
	mov dl, byte byte_4D407C[eax*2]
	mov byte byte_512DC1[eax], dl
	mov eax, ebx
	pop ecx
	add esp, 9Ch
	pop ebp
	pop edi
	pop esi
	pop ebx
	ret

loc_410875:
	xor eax, eax
	mov al, byte [byte_512DDA]
	xor ecx, ecx
	mov cl, byte byte_4D407D[eax*2]
	mov dl, byte byte_4D407C[eax*2]
	and edx, 0FFh
	add edx, ecx
	mov cl, byte byte_512DDC[eax]
	inc cl
	mov byte byte_512DDC[eax], cl
	mov al, cl
	and eax, 0FFh
	cmp eax, edx
	jl loc_41053C ; jumptable 00410535 cases 0,1,6,15,17,18,22,23
	xor eax, eax
	mov al, byte [byte_512DDA]
	mov dl, byte byte_4D407C[eax*2]
	mov byte byte_512DDC[eax], dl
	mov eax, ebx
	pop ecx
	add esp, 9Ch
	pop ebp
	pop edi
	pop esi
	pop ebx
	ret

loc_4108D3:
	xor eax, eax ; jumptable 00410535 case 14
	mov al, byte [byte_512DFB]
	call sub_41B730
	mov eax, ebx
	pop ecx
	add esp, 9Ch
	pop ebp
	pop edi
	pop esi
	pop ebx
	ret

loc_4108ED:
	cmp di, 0Dh ; jumptable 00410535 cases 12,13
	jnz loc_41053C ; jumptable 00410535 cases 0,1,6,15,17,18,22,23

loc_4108F7:
	mov edx, ecx
	mov eax, esi
	call sub_403FC0
	test eax, eax
	jnz loc_4108F7
	mov eax, ebx
	pop ecx
	add esp, 9Ch
	pop ebp
	pop edi
	pop esi
	pop ebx
	ret

loc_410912:
	cmp di, 0Dh ; jumptable 00410535 case 11
	jnz loc_41053C ; jumptable 00410535 cases 0,1,6,15,17,18,22,23
	cmp esi, off_4D2B34
	jnz loc_41093C
	mov eax, 1
	call sub_409070
	mov eax, ebx
	pop ecx
	add esp, 9Ch
	pop ebp
	pop edi
	pop esi
	pop ebx
	ret

loc_410954:
	cmp di, 0Dh
	jnz loc_41053C
	push 134h
	push 1
	call sub_401AE0
	add esp, 8
	test eax, eax
	jz loc_41053C
	call sub_4090C0
	and byte [byte_4D3468], 0FEh
	mov eax, ebx
	pop ecx
	add esp, 9Ch
	pop ebp
	pop edi
	pop esi
	pop ebx
	ret

loc_41093C:
	mov eax, 2
	call sub_409070
	mov eax, ebx
	pop ecx
	add esp, 9Ch
	pop ebp
	pop edi
	pop esi
	pop ebx
	ret

loc_41098F:
	call sub_408610 ; jumptable 00410535 case 20
	mov eax, ebx
	pop ecx
	add esp, 9Ch
	pop ebp
	pop edi
	pop esi
	pop ebx
	ret

loc_4109A2:
	cmp byte [byte_512ED3], 0 ; jumptable 00410535 case 21
	jnz loc_41053C ; jumptable 00410535 cases 0,1,6,15,17,18,22,23
	call sub_4793B0
	mov byte [byte_512ED3], al
	test al, al
	jnz loc_410A49
	xor edx, edx

loc_4109C3:
	call sub_405910
	test eax, eax
	jz loc_4109D5
	mov eax, edx
	call sub_483EB0
	jmp loc_4109C3

loc_4109D5:
	mov eax, 14Ah
	call sub_41B710
	mov [esp+98h], eax
	mov eax, 301h
	lea edx, [esp+98h]
	call sub_41B710
	mov [esp+9Ch], eax
	mov eax, 2
	call sub_402E80
	call sub_405C70
	mov eax, 180h
	call sub_4833E7
	xor edx, edx

loc_410A1E:
	call sub_405910
	test eax, eax
	jnz loc_410A39
	call sub_483401
	test eax, eax
	jnz loc_410A39
	mov eax, edx
	call sub_483EB0
	jmp loc_410A1E

loc_410A39:
	xor ebx, ebx
	mov eax, ebx
	pop ecx
	add esp, 9Ch
	pop ebp
	pop edi
	pop esi
	pop ebx
	ret

loc_410A49:
	mov eax, 14Ah
	call sub_41B710
	mov [esp+98h], eax
	mov eax, 302h
	lea edx, [esp+98h]
	call sub_41B710
	mov [esp+9Ch], eax
	mov eax, 2
	call sub_402E80
	call sub_405C70
	mov eax, ebx
	pop ecx
	add esp, 9Ch
	pop ebp
	pop edi
	pop esi
	pop ebx
	ret

loc_410A94:
	cmp di, 0Dh ; jumptable 00410535 case 3
	jnz loc_41053C ; jumptable 00410535 cases 0,1,6,15,17,18,22,23
	call sub_423750
	mov eax, ebx
	pop ecx
	add esp, 9Ch
	pop ebp
	pop edi
	pop esi
	pop ebx
	ret

loc_410ADC:
	cmp di, 0Dh ; jumptable 00410535 case 4
	jnz loc_41053C ; jumptable 00410535 cases 0,1,6,15,17,18,22,23
	call sub_423690
	mov eax, ebx
	pop ecx
	add esp, 9Ch
	pop ebp
	pop edi
	pop esi
	pop ebx
	ret

loc_410AF9:
	cmp di, 4D00h ; jumptable 00410535 case 5
	jnz loc_410B0C
	mov edx, 7Fh
	xor eax, eax
	call sub_4423F0

loc_410B0C:
	mov eax, dword_4E5A6C
	call sub_47EF30
	mov dword [dword_4D40BC], eax
	mov eax, ebx
	pop ecx
	add esp, 9Ch
	pop ebp
	pop edi
	pop esi
	pop ebx
	ret

loc_410B29:
	cmp di, 0Dh ; jumptable 00410535 case 8
	jnz loc_41053C ; jumptable 00410535 cases 0,1,6,15,17,18,22,23
	mov eax, dword_512F4C
	call sub_47EAE0
	test eax, eax
	jnz loc_41053C ; jumptable 00410535 cases 0,1,6,15,17,18,22,23
	xor ebx, ebx
	mov eax, ebx
	pop ecx
	add esp, 9Ch
	pop ebp
	pop edi
	pop esi
	pop ebx
	ret

loc_410B55:
	cmp di, 0Dh ; jumptable 00410535 case 7
	jnz loc_41053C ; jumptable 00410535 cases 0,1,6,15,17,18,22,23
	cmp dword [dword_4E5A6C], 0
	jz loc_410C29
	mov edx, dword_512F4C
	mov eax, 180h
	call sub_47ED30
	mov dx, [eax]
	mov edi, eax
	test dx, dx
	jz loc_410C0F
	xor esi, esi
	xor eax, eax
	xor edx, edx

loc_410B8F:
	movsx ecx, word [edi]
	cmp edx, ecx
	jge loc_410BA7
	add esi, 4
	mov ecx, [edi+4]
	inc edx
	add ecx, eax
	add eax, 40h
	mov [esp+esi], ecx
	jmp loc_410B8F

loc_410BA7:
	lea eax, [esp+4]
	xor esi, esi
	xor edx, edx
	mov [esp+ecx*4+4], esi
	call sub_401090
	cmp eax, 0FFFFFFFFh
	jnz loc_410BCD
	xor ebx, ebx
	mov eax, ebx
	pop ecx
	add esp, 9Ch
	pop ebp
	pop edi
	pop esi
	pop ebx
	ret

loc_410BCD:
	mov edx, [edi+4]
	shl eax, 6
	lea edi, [esp+84h]
	lea esi, [edx+eax+2Ch]
	movsd
	movsd
	movsd
	movsd
	movsd

loc_410BE3:
	test ebx, ebx
	jz loc_41053C ; jumptable 00410535 cases 0,1,6,15,17,18,22,23
	lea eax, [esp+84h]
	call sub_47E8B0
	test eax, eax
	jnz loc_41053C ; jumptable 00410535 cases 0,1,6,15,17,18,22,23
	xor ebx, ebx
	mov eax, ebx
	pop ecx
	add esp, 9Ch
	pop ebp
	pop edi
	pop esi
	pop ebx
	ret

loc_410C0F:
	mov eax, 35h
	call sub_402CD0
	xor ebx, ebx
	mov eax, ebx
	pop ecx
	add esp, 9Ch
	pop ebp
	pop edi
	pop esi
	pop ebx
	ret

loc_410C29:
	mov edx, dword_512F4C
	lea eax, [esp+84h]
	call sub_47E7B0
	test eax, eax
	jnz loc_410BE3
	xor ebx, ebx
	mov eax, ebx
	pop ecx
	add esp, 9Ch
	pop ebp
	pop edi
	pop esi
	pop ebx
	ret

loc_410C4E:
	cmp di, 0Dh ; jumptable 00410535 cases 9,10
	jnz loc_41053C ; jumptable 00410535 cases 0,1,6,15,17,18,22,23
	xor eax, eax
	mov esi, byte_512F5E
	mov al, byte [byte_512F44]
	lea edi, [esp+58h]
	mov [esp+54h], eax
	push edi

loc_410C6D:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_410C85
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_410C6D

loc_410C85:
	pop edi
	mov eax, dword [dword_512F48]
	mov [esp+80h], eax
	cmp byte [ecx+9], 0Ah
	jnz loc_410CC2
	mov word [word_513458], 1

loc_410CA1:
	lea eax, [esp+54h]
	call sub_4719B0
	test eax, eax
	jnz loc_41053C ; jumptable 00410535 cases 0,1,6,15,17,18,22,23
	xor ebx, ebx
	mov eax, ebx
	pop ecx
	add esp, 9Ch
	pop ebp
	pop edi
	pop esi
	pop ebx
	ret

loc_410CC2:
	xor ecx, ecx
	mov word [word_513458], cx
	jmp loc_410CA1

loc_410CCD:
	test al, 10h
	jz loc_410CFA
	mov eax, [esi+8]
	sar eax, 10h
	mov eax, [esi+eax*4+8]
	test byte [eax+8], 1
	jnz loc_410633
	mov di, [esi+0Ah]
	mov edx, 7Fh
	dec edi
	mov eax, esi
	mov [esi+0Ah], di
	jmp loc_410624

loc_410CFA:
	mov eax, [ecx+10h]
	cmp word [eax], 0
	jz loc_410633
	mov eax, ecx
	call sub_410E10
	test eax, eax
	jz loc_410D5A
	mov eax, [ecx+0Ch]
	mov dh, [eax]
	test dh, dh
	jnz loc_410D54

loc_410D21:
	mov eax, [ecx+0Ch]
	xor edx, edx
	mov esi, [ecx+10h]
	mov dl, [eax]
	cmp word [esi+edx*2+2], 0
	jz loc_410D5A
	inc dl
	mov [eax], dl
	jmp loc_410D21

loc_410D54:
	mov dl, dh
	dec dl
	mov [eax], dl

loc_410D5A:
	mov dh, byte [byte_512DA9]
	cmp dh, 1
	jnz loc_410633
	cmp dh, byte [byte_512DF6]
	jnz loc_410633
	xor ah, ah
	mov byte [byte_512DF6], ah
	jmp loc_410633

loc_410D82:
	xor eax, eax
	mov al, byte [byte_512DDA]
	mov dl, byte byte_512DDC[eax]
	dec dl
	mov byte byte_512DDC[eax], dl
	movzx edi, byte [byte_512DDA]
	lea esi, [edi+edi]
	mov dh, byte byte_4D407C[esi]
	cmp dl, dh
	jnb loc_4106A5
	mov al, dh
	add al, byte byte_4D407D[esi]
	dec al
	mov byte byte_512DDC[edi], al
	jmp loc_4106A5

loc_410DC4:
	mov edx, eax
	dec edx
	mov [esi+0Ah], dx

loc_410DCB:
	mov edx, [esi+8]
	sar edx, 10h
	mov eax, [esi+edx*4+0Ch]
	cmp byte [eax], 2
	jnz loc_4105D4
	test byte [eax+8], 1
	jnz loc_4105D4
	cmp edx, edi
	jz loc_410DFB
	mov edx, 7Fh
	mov eax, 1
	call sub_4423F0

loc_410DFB:
	mov eax, esi
	call sub_423E10
	mov eax, ebx
	pop ecx
	add esp, 9Ch
	pop ebp
	pop edi
	pop esi
	pop ebx
	ret
;sub_410414 endp

sub_410E10: ;SUBROUTINE
	push ebx
	push edx
	mov bl, byte [byte_512DAA]
	mov edx, 1
	cmp bl, 1
	jnz loc_410E3E
	cmp dword [dword_4D76B8], 0
	jz loc_410E3E
	mov ebx, [eax+0Ch]
	cmp ebx, byte_512DAA
	jz loc_410E43
	cmp ebx, byte_512DA9
	jz loc_410E43

loc_410E3E:
	mov eax, edx
	pop edx
	pop ebx
	ret

loc_410E43:
	push 2EDh
	push 1
	call sub_401AE0
	add esp, 8
	mov edx, eax
	test eax, eax
	jz loc_410E3E
	push edi
	push ecx
	call sub_41A350
	xor edi, edi
	xor bh, bh
	xor cl, cl
	mov dword [dword_4D76B8], edi
	mov byte [byte_4E5D26], bh
	mov byte [byte_4E5A7A], cl
	pop ecx
	pop edi
	mov eax, edx
	pop edx
	pop ebx
	ret
;sub_410E10 endp

sub_410E80: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 100h
	mov ecx, eax
	call sub_423C40
	mov eax, ecx
	call sub_40F540

loc_410E9A:
	call sub_405910
	test eax, eax
	jnz loc_410E9A
	mov edx, [ecx]
	test edx, edx
	jnz loc_410EC2

loc_410EA9:
	mov eax, ecx
	call sub_423EA0
	call sub_4833C7
	add esp, 100h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_410EC2:
	mov eax, edx
	mov edx, byte_4E5FC8
	call strcmp_
	test eax, eax
	jz loc_410EA9
	mov edi, byte_4E5FC8
	mov esi, [ecx]
	push edi

loc_410EDA:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_410EF2
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_410EDA

loc_410EF2:
	pop edi
	mov ebx, dword [dword_4D40B8]
	test ebx, ebx
	jnz loc_411009

loc_410F01:
	xor eax, eax
	mov edi, [ecx]
	mov al, byte [byte_512DFB]
	push edi
	mov ebp, dword off_4D409C[eax*4]
	push ebp
	mov eax, dword [dword_5134B4]
	push eax
	push aSSS_qfs ; "%s%s%s.qfs"
	lea eax, [esp+10h]
	push eax
	call sprintf_
	add esp, 14h
	xor edx, edx
	mov eax, esp
	call sub_488058
	mov dword [dword_4D40B8], eax
	test eax, eax
	jnz loc_410F67
	mov edx, [ecx]
	push edx
	mov ebx, dword [dword_5134B4]
	push ebx
	push aSS_qfs ; "%s%s.qfs"
	lea eax, [esp+0Ch]
	push eax
	call sprintf_
	add esp, 10h
	xor edx, edx
	mov eax, esp
	call sub_488058
	mov dword [dword_4D40B8], eax

loc_410F67:
	cmp dword [dword_4D40B8], 0
	jnz loc_410F9A
	mov edi, [ecx]
	push edi
	mov ebp, dword [dword_5134B4]
	push ebp
	push aSS_fsh ; "%s%s.fsh"
	lea eax, [esp+0Ch]
	push eax
	call sprintf_
	add esp, 10h
	xor edx, edx
	mov eax, esp
	call sub_488058
	mov dword [dword_4D40B8], eax

loc_410F9A:
	cmp dword [dword_4D40B8], 0
	jnz loc_410FCD
	mov edx, [ecx]
	push edx
	mov ebx, dword [dword_5134D0]
	push ebx
	push aSS_qfs ; "%s%s.qfs"
	lea eax, [esp+0Ch]
	push eax
	call sprintf_
	add esp, 10h
	xor edx, edx
	mov eax, esp
	call sub_488058
	mov dword [dword_4D40B8], eax

loc_410FCD:
	cmp dword [dword_4D40B8], 0
	jnz loc_410EA9
	mov edi, [ecx]
	push edi
	mov ebp, dword [dword_5134D4]
	push ebp
	push aSS_qfs ; "%s%s.qfs"
	lea eax, [esp+0Ch]
	push eax
	call sprintf_
	add esp, 10h
	xor edx, edx
	mov eax, esp
	call sub_488058
	mov dword [dword_4D40B8], eax
	jmp loc_410EA9

loc_411009:
	mov eax, ebx
	xor esi, esi
	call sub_4848FC
	mov dword [dword_4D40B8], esi
	jmp loc_410F01
;sub_410E80 endp

dword_411020: dd 4, 8, 2, 0

sub_411030: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 10h
	mov ecx, eax
	call sub_4118D0
	mov esi, 1
	mov ax, word [word_51345A]
	xor edx, edx
	xor ebp, ebp
	xor edi, edi
	mov ebx, esi
	mov [esp+0Ch], dx
	mov [esp+4], ebp
	mov [esp], ebp
	test ax, ax
	jnz loc_41119E
	cmp byte [byte_51345F], 1
	jz loc_4111B4
	mov dword [ecx], aModem ; "modem"

loc_41107B:
	mov eax, ecx
	call sub_410E80
	test bx, bx
	jz loc_411094

loc_411087:
	call sub_405910
	mov ebx, eax
	test ax, ax
	jnz loc_411087
	nop

loc_411094:
	cmp byte [byte_512DA9], 4
	jz loc_4111BF

loc_4110A1:
	test ebp, ebp
	jnz loc_41118D
	call sub_4833C7
	movsx edx, bx
	add edi, eax
	mov eax, ecx
	call sub_411370
	mov eax, ecx
	call sub_40F540
	test si, si
	jz loc_4110CD
	mov eax, ecx
	call sub_411820

loc_4110CD:
	call sub_423B90
	mov dx, word [word_513458]
	xor esi, esi
	test dx, dx
	jnz loc_4111F1
	cmp dword [dword_4D24DC], 0
	jz loc_4111E3

loc_4110F1:
	xor ebx, ebx

loc_4110F3:
	xor eax, eax
	mov [esp+0Ch], bx
	mov [esp+4], eax
	xor ebx, ebx

loc_411100:
	cmp byte [byte_512DA9], 4
	jnz loc_411143
	cmp dword [dword_4D76B8], 0
	jz loc_41112B
	cmp word [word_513458], 0
	jz loc_41112B
	cmp word [dword_513408+2], 2
	jge loc_41112B
	call sub_41A350

loc_41112B:
	cmp dword [esp], 0
	jz loc_411143
	mov edx, dword [dword_4D76B8]
	test edx, edx
	jnz loc_411143
	call sub_47E3D0
	mov [esp], edx

loc_411143:
	movsx eax, bx
	call sub_40E7C0
	test eax, eax
	jz loc_411322
	mov esi, 1

loc_411158:
	cmp word [word_51345A], 0
	jz loc_4110A1
	cmp word [word_51345C], 0
	jz loc_411188
	call sub_401080
	mov eax, 300h
	xor ebx, ebx
	call sub_402CD0
	mov word [word_51345C], bx

loc_411188:
	mov ebp, 0FFFFFFFFh

loc_41118D:
	call sub_411860
	mov eax, ebp
	add esp, 10h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_41119E:
	call sub_411860
	mov ebp, 0FFFFFFFEh
	mov eax, ebp
	add esp, 10h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4111B4:
	mov dword [ecx], aNetwork ; "network"
	jmp loc_41107B

loc_4111BF:
	cmp dword [dword_4D76B8], 0
	jnz loc_4111D2
	call sub_47E3D0
	jmp loc_4110A1

loc_4111D2:
	mov dword [esp], 1
	call sub_4117E0
	jmp loc_4110A1

loc_4111E3:
	cmp word [dword_513428+2], 1
	jz loc_4110F1

loc_4111F1:
	mov eax, ecx
	call sub_423CA0
	mov esi, eax
	call sub_405910
	mov ebx, eax
	test ax, ax
	jz loc_4110F3
	cwde
	mov [esp+8], eax
	mov eax, [esp+0Ah]
	mov edx, [esp+8]
	sar eax, 10h
	cmp eax, edx
	jz loc_411299

loc_41121E:
	cmp bx, 1Bh
	jnz loc_4112A8

loc_411228:
	movsx esi, bx
	mov eax, ecx
	mov edx, esi
	call sub_410414
	mov edx, eax
	mov ebp, eax
	mov eax, esi
	call sub_40F370
	cmp edx, 0FFFFFFFFh
	jnz loc_4112E0

loc_411248:
	cmp byte [byte_512F45], 0
	jz loc_4112EE
	xor al, al
	xor ebp, ebp
	mov byte [byte_512F45], al

loc_41125E:
	mov esi, 1

loc_411263:
	mov eax, [esp+0Ah]
	movsx edx, bx
	sar eax, 10h
	cmp edx, eax
	jz loc_41131A
	lea eax, [edi+0Fh]

loc_411278:
	mov [esp+4], eax
	xor eax, eax
	mov al, byte [byte_512DB9]
	mov al, byte dword_411020[eax*4]
	mov [esp+0Ch], bx
	mov byte [byte_512DB8], al
	jmp loc_411100

loc_411299:
	cmp edi, [esp+4]
	jg loc_41121E
	jmp loc_4110F3

loc_4112A8:
	cmp bx, 0Dh
	jz loc_411228
	cmp bx, 4800h
	jz loc_411228
	cmp bx, 5000h
	jz loc_411228
	cmp bx, 4B00h
	jz loc_411228
	cmp bx, 4D00h
	jz loc_411228
	jmp loc_411263

loc_4112E0:
	cmp edx, 0FFFFFFFEh
	jz loc_411248
	jmp loc_41125E

loc_4112EE:
	push 2FFh
	mov edx, 1
	push edx
	mov dword [dword_4DA1B8], edx
	call sub_401AE0
	add esp, 8
	test eax, eax
	jnz loc_41130D
	xor ebp, ebp

loc_41130D:
	xor esi, esi
	mov dword [dword_4DA1B8], esi
	jmp loc_41125E

loc_41131A:
	lea eax, [edi+5]
	jmp loc_411278

loc_411322:
	call sub_40E420
	test eax, eax
	jz loc_411158
	mov eax, ecx
	call sub_411820
	call sub_40E370
	cmp byte [byte_512DA9], 4
	jnz loc_411352
	cmp dword [dword_4D76B8], 0
	jz loc_411352
	call sub_4116F0

loc_411352:
	mov ebp, 0FFFFFFFDh
	mov eax, ebp
	add esp, 10h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_411030 endp

sub_411370: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	mov esi, eax
	mov edi, edx
	cmp byte [byte_512F45], 0
	jnz loc_4114ED
	mov eax, esi
	xor edx, edx

loc_411389:
	cmp word [word_513458], 0
	jz loc_41152D

loc_411397:
	mov ecx, [eax+0Ch]
	and byte [ecx+8], 0FEh

loc_41139E:
	inc edx
	add eax, 4
	cmp edx, 0Ah
	jle loc_411389
	cmp word [word_513458], 0
	jz loc_4114A5
	test byte [byte_512DBC], 1
	jz loc_411542
	mov dword [off_4D3F18], dword_4D2978

loc_4113CC:
	cmp byte [byte_512DAA], 1
	jnz loc_411566
	mov ebx, dword_4D2968
	mov dl, byte [byte_512DB0]
	mov dword [off_4D3F18], ebx
	cmp dl, 7
	jnz loc_411566
	xor bl, bl
	mov byte [byte_512DB0], bl

loc_4113FB:
	mov eax, [esi+24h]
	mov bh, [eax+8]
	mov cl, 1
	or bh, 1
	mov byte [byte_512DF8], cl
	mov [eax+8], bh

loc_41140F:
	mov ch, byte [byte_512DAA]
	test ch, ch
	jz loc_4115A5
	cmp ch, 2
	jnz loc_411578
	mov eax, [esi+14h]
	or byte [eax+8], 1
	xor dh, dh
	mov byte [byte_512DB9], ch
	mov byte [byte_512DB0], dh

loc_41143B:
	mov bh, byte [byte_512F42]
	cmp bh, 0Fh
	jnz loc_411597

loc_41144A:
	mov al, byte [byte_512F43]
	add al, 0Ch
	mov byte [byte_512F42], al

loc_411456:
	mov eax, [esi+18h]
	or byte [eax+8], 1
	mov eax, [esi+20h]
	or byte [eax+8], 1
	mov eax, [esi+24h]
	mov dh, [eax+8]
	mov bl, 1
	or dh, 1
	mov byte [byte_512DF8], bl
	mov [eax+8], dh

loc_411478:
	mov bh, byte [byte_512DAA]
	cmp bh, 1
	jnz loc_411492
	cmp dword [dword_4D76B8], 0
	jz loc_411492
	mov eax, [esi+10h]
	or [eax+8], bh

loc_411492:
	xor eax, eax
	mov al, byte [byte_512DB9]
	mov al, byte dword_411020[eax*4]
	mov byte [byte_512DB8], al

loc_4114A5:
	xor eax, eax
	mov al, byte [byte_512DBF]
	cmp byte byte_4D407D[eax*2], 0
	jnz loc_4115E1
	or byte [byte_4D4000], 1

loc_4114C1:
	xor eax, eax
	xor edx, edx
	mov al, byte [byte_512F42]
	mov dl, byte [byte_512F43]
	lea ecx, [eax-0Ch]
	cmp ecx, edx
	jz loc_4114ED
	cmp byte [byte_512DAA], 2
	jnz loc_4115ED
	mov al, dl

loc_4114E6:
	add al, 0Ch
	mov byte [byte_512F42], al

loc_4114ED:
	cmp byte [byte_512DBF], 0Bh
	jbe loc_4114FE
	xor dh, dh
	mov byte [byte_512DBF], dh

loc_4114FE:
	mov dword [off_4D3FE0], dword_4D2EDC
	mov eax, edi
	call sub_40F370
	cmp byte [byte_512F45], 0
	jz loc_411528
	mov eax, [esi+34h]
	test byte [eax+8], 1
	jz loc_4116BB
	lea eax, [eax+0]

loc_411528:
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_41152D:
	cmp edx, 6
	jg loc_411397
	mov ecx, [eax+0Ch]
	or byte [ecx+8], 1
	jmp loc_41139E

loc_411542:
	cmp byte [byte_512DB0], 7
	jnz loc_4113CC
	xor al, al
	mov edx, dword_4D2968
	mov byte [byte_512DB0], al
	mov dword [off_4D3F18], edx
	jmp loc_4113CC

loc_411566:
	cmp byte [byte_512DB0], 0
	jz loc_4113FB
	jmp loc_41140F

loc_411578:
	mov eax, [esi+1Ch]
	or byte [eax+8], 1
	xor al, al
	mov byte [byte_512DB9], al
	mov eax, edi
	call sub_40DEA0
	call sub_407B60
	jmp loc_41143B

loc_411597:
	cmp bh, 0Ch
	jb loc_41144A
	jmp loc_411456

loc_4115A5:
	cmp byte [byte_512F42], 0Fh
	jz loc_4115C1
	mov eax, [esi+24h]
	or byte [eax+8], 1
	mov byte [byte_512DF8], 1
	jmp loc_411478

loc_4115C1:
	cmp byte [byte_512DF8], 1
	jz loc_411478
	mov eax, [esi+20h]
	or byte [eax+8], 1
	mov byte [byte_512F42], 0Fh
	jmp loc_411478

loc_4115E1:
	and byte [byte_4D4000], 0FEh
	jmp loc_4114C1

loc_4115ED:
	cmp word [esi+0Ah], 5
	jz loc_411613
	cmp al, 0Fh
	jz loc_4114ED
	call sub_407B80
	cmp eax, edx
	jz loc_4114ED
	mov al, byte [byte_512F43]
	jmp loc_4114E6

loc_411613:
	cmp edi, 4B00h
	jnz loc_41166D
	mov ecx, 10h

loc_411620:
	cmp byte [byte_512F42], 0Fh
	jz loc_4114ED
	xor eax, eax
	xor edx, edx
	mov al, byte [byte_512F42]
	mov dl, byte [byte_512F43]
	call sub_407B80
	cmp eax, edx
	jz loc_4114ED
	mov ah, byte [byte_512F42]
	xor edx, edx
	dec ah
	mov dl, ah
	add edx, 10h
	mov byte [byte_512F42], ah
	mov eax, edx
	sar edx, 1Fh
	idiv ecx
	mov byte [byte_512F42], dl
	jmp loc_411620

loc_41166D:
	mov cl, byte [byte_512F42]
	cmp cl, 0Fh
	jz loc_4114ED
	xor eax, eax
	xor edx, edx
	mov al, cl
	mov dl, byte [byte_512F43]
	call sub_407B80
	cmp eax, edx
	jz loc_4114ED
	mov ch, byte [byte_512F42]
	xor edx, edx
	inc ch
	mov dl, ch
	mov byte [byte_512F42], ch
	mov ecx, 10h
	mov eax, edx
	sar edx, 1Fh
	idiv ecx
	mov byte [byte_512F42], dl
	jmp loc_41166D

loc_4116BB:
	mov eax, esi
	mov word [esi+0Ah], 0Bh
	call sub_423E10
	mov eax, esi
	lea ecx, [esi+2Ch]

loc_4116CD:
	mov edx, [eax+0Ch]
	mov bl, [edx+8]
	or bl, 1
	add eax, 4
	mov [edx+8], bl
	cmp eax, ecx
	jnz loc_4116CD
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_411370 endp

sub_4116F0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	mov edi, dword [dword_4D76B8]
	cmp word [word_513458], 0
	jz loc_4117C6
	mov ebp, 2

loc_41170F:
	mov ebx, dword (dword_4E5FDC+2)[ebp]
	mov eax, dword dword_51340C[ebp]
	sar ebx, 10h
	sar eax, 10h
	cmp eax, ebx
	jz loc_4117BA
	cmp eax, 0FFFFFFFFh
	jnz loc_4117BA
	mov eax, 2

loc_411737:
	mov edx, dword (dword_4E5FDC+2)[eax]
	sar edx, 10h
	cmp edx, ebx
	jle loc_41174B
	dec dword dword_4E5FE0[eax]

loc_41174B:
	add eax, 2
	cmp eax, 10h
	jnz loc_411737
	mov eax, ebx
	cmp ebx, 7
	jge loc_4117A0
	lea ecx, [ebx+ebx]

loc_41175D:
	mov dh, byte byte_512AD0[eax]
	mov dl, byte byte_512AD1[eax]
	mov byte byte_512AD0[eax], dl
	add ecx, 2
	mov byte byte_512AD1[eax], dh
	mov edx, edi
	mov si, [ecx+edx+2B0h]
	mov bx, [ecx+edx+2AEh]
	mov [ecx+edx+2AEh], si
	inc eax
	mov [ecx+edx+2B0h], bx
	cmp eax, 7
	jl loc_41175D

loc_4117A0:
	mov ecx, dword [dword_512268]
	mov edx, dword [dword_512264]
	inc ecx
	dec edx
	mov dword [dword_512268], ecx
	mov dword [dword_512264], edx

loc_4117BA:
	add ebp, 2
	cmp ebp, 10h
	jnz loc_41170F

loc_4117C6:
	mov dword [dword_4D76B8], edi
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_4116F0 endp

sub_4117E0: ;SUBROUTINE
	cmp word [word_513458], 0
	jnz loc_4117EB
	ret

loc_4117EB:
	push edi
	push esi
	push ecx
	mov ecx, 10h
	mov esi, (dword_51340C+2)
	mov edi, dword_4E5FE0
	push edi
	mov eax, ecx
	shr ecx, 2
	rep movsd
	mov cl, al
	and cl, 3
	rep movsb
	pop edi
	pop ecx
	pop esi
	pop edi
	ret
;sub_4117E0 endp

sub_411820: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	mov esi, eax
	call sub_428A20
	mov edx, 400h
	mov eax, [esi+4]
	xor ecx, ecx
	xor ebx, ebx
	call sub_405B30
	call sub_40E040
	mov eax, esi
	call sub_40FA90
	call sub_405C70
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_411820 endp

sub_411860: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	mov edx, 2D0h
	mov ebx, 2C4h
	mov ecx, 2B0h
	mov esi, 281h
	mov word [word_4D3BBE], dx
	mov word [word_4D3C2A], bx
	mov word [word_4D3CAA], cx
	mov edx, dword [dword_4D76B8]
	mov word [word_4D3D52], si
	test edx, edx
	jz loc_4118A3
	call sub_41A350

loc_4118A3:
	call sub_463E40
	cmp byte [byte_512DB0], 7
	jz loc_4118B6
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4118B6:
	xor dl, dl
	mov byte [byte_512DB0], dl
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_411860 endp

sub_4118D0: ;SUBROUTINE
	push ecx
	push edx
	push esi
	mov esi, eax
	push edi
	push ebx
	mov edx, 1
	mov ecx, dword [dword_4D21AC]
	mov dword [dword_4D2310], edx
	test ecx, ecx
	jz loc_41195B

loc_4118EC:
	mov edx, 2D1h
	mov ebx, 2C5h
	xor edi, edi
	mov ecx, 2B1h
	mov dword [dword_4D24DC], edi
	mov word [word_4D3BBE], dx
	mov word [word_4D3C2A], bx
	mov edi, 282h
	mov word [word_4D3CAA], cx
	mov word [word_4D3D52], di
	call sub_403B20
	xor ah, ah
	xor edx, edx
	mov byte [byte_512F45], ah
	mov eax, esi
	pop ebx
	pop edi

loc_411937:
	cmp word [word_513458], 0
	jz loc_41197B

loc_411941:
	mov ecx, [eax+0Ch]
	and byte [ecx+8], 0FEh

loc_411948:
	inc edx
	add eax, 4
	cmp edx, 0Ah
	jle loc_411937
	mov word [esi+0Ah], 7
	pop esi
	pop edx
	pop ecx
	ret

loc_41195B:
	mov eax, 12h
	mov edx, dword [dword_4D5A28]
	mov ebx, 1
	call sub_476750
	mov dword [dword_4D21AC], ebx
	jmp loc_4118EC

loc_41197B:
	cmp edx, 6
	jg loc_411941
	mov ecx, [eax+0Ch]
	or byte [ecx+8], 1
	jmp loc_411948
;sub_4118D0 endp

off_411990: dd aHismac
	dd aHisfer ; "hisfer"
	dd aHisfer ; "hisfer"
	dd aHisfrd ; "hisfrd"
	dd aHisfrd ; "hisfrd"
	dd aHisfrd ; "hisfrd"
	dd aHisjag ; "hisjag"
	dd aHisltus ; "hisltus"
	dd aHisltus ; "hisltus"
	dd aHisita ; "hisita"
	dd aHisita ; "hisita"
	dd aHisisd ; "hisisd"
off_4119C0: dd aMac_1
	dd aFerr ; "ferr"
	dd aF355 ; "f355"
	dd aGt90 ; "gt90"
	dd aIndigo ; "indigo"
	dd aMus_0 ; "mus"
	dd aJag_0 ; "jag"
	dd aGt1 ; "gt1"
	dd aLotus ; "lotus"
	dd aNazca ; "nazca"
	dd aItal ; "ital"
	dd aIsdera ; "isdera"
off_4119F0: dd aSldmac
	dd aSldfer ; "sldfer"
	dd aSld355f ; "sld355f"
	dd aSldfrd ; "sldfrd"
	dd aSldind ; "sldInd"
	dd aSldmus ; "sldmus"
	dd aSldjag ; "sldjag"
	dd aSldgt1 ; "sldgt1"
	dd aSldv8 ; "sldv8"
	dd aSldnaz ; "sldnaz"
	dd aSldita ; "sldita"
	dd aSldisd ; "sldisd"
dword_411A20: dd 189h, 190h, 1CFh, 197h, 1C1h, 1C8h, 19Eh, 1A5h, 1ACh
	dd 1D6h, 1B3h, 1BAh
dword_411A50: dd 240h, 245h, 272h, 24Ah, 268h, 26Dh, 24Fh, 254h, 259h
	dd 277h, 25Eh, 263h
dword_411A80: dd 1E5h, 1ECh, 22Bh, 1F3h, 21Dh, 224h, 1FAh, 201h, 208h
	dd 232h, 20Fh, 216h
off_411AB0: dd aMclarav
	dd aF50av ; "f50av"
	dd aF355av ; "f355av"
	dd aGt90av ; "gt90av"
	dd aIndigav ; "indigav"
	dd aMustav ; "mustav"
	dd aJagav ; "jagav"
	dd aGt1av ; "gt1av"
	dd aEspritav ; "espritav"
	dd aNazcaav ; "nazcaav"
	dd aCalaav ; "calaav"
	dd aIsderav ; "isderav"
dword_411AE0: dd 4C000Dh, 0C004Ch, 0C000Ch, 36000Bh, 0E0036h, 47000Eh
dword_411AF8: dd 3220313h, 3160322h, 3160316h, 31C0319h, 31F031Ch, 325031Fh
dword_411B10: dd 3230314h, 3170323h, 3170317h, 31D031Ah, 320031Dh, 3260320h
dword_411B28: dd 3240315h, 3180324h, 3180318h, 31E031Bh, 321031Eh, 3270321h
dword_411B40: dd 10000h, 20001h, 20002h, 40003h, 60004h, 70006h
dword_411B58: dd 32Eh, 6, 339h, 6, 339h, 6, 328h, 6, 328h, 6, 328h, 6
	dd 345h, 4, 334h, 5, 334h, 5, 33Fh, 6, 33Fh, 6, 349h, 4
	times 6 dd 0

sub_411BD0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 218h
	mov [esp+1F8h], eax
	mov ecx, 6
	lea edi, [esp+1A8h]
	mov esi, dword_411AF8
	rep movsd
	mov ecx, 6
	lea edi, [esp+1D8h]
	mov esi, dword_411B10
	rep movsd
	mov ecx, 6
	lea edi, [esp+190h]
	mov esi, dword_411B28
	rep movsd
	xor edx, edx
	lea edi, [esp+1C0h]
	xor ecx, ecx
	mov esi, dword_411B40
	mov [esp+1F0h], ecx
	mov [esp+204h], ecx
	mov [esp+1F4h], ecx
	mov ecx, 6
	mov [esp+208h], edx
	rep movsd
	mov edx, 1
	mov ecx, 1Eh
	mov edi, esp
	mov esi, dword_411B58
	mov bx, word [word_4D3ECE]
	mov [esp+214h], edx
	rep movsd
	cmp bx, 3
	jz loc_411E5F
	xor eax, eax
	mov al, byte [byte_512DBF]

loc_411C81:
	mov [esp+1FCh], eax
	mov edx, [esp+1FCh]
	mov eax, [esp+1F8h]
	call sub_413180
	mov eax, [esp+1F8h]
	mov edi, [esp+208h]
	call sub_410E80
	test edi, edi
	jnz loc_412064

loc_411CB6:
	call sub_4833C7
	mov edx, [esp+204h]
	mov ecx, [esp+1F4h]
	xor ebx, ebx
	add edx, eax
	add ecx, eax
	call sub_428A20
	mov eax, aBack_0 ; "back"
	mov [esp+204h], edx
	mov [esp+1F4h], ecx
	mov edx, 400h
	xor ecx, ecx
	call sub_405B30
	xor eax, eax
	mov edx, 400h
	mov al, byte [byte_512DFB]
	xor ecx, ecx
	xor ebx, ebx
	mov eax, dword off_4D4134[eax*4]
	mov esi, [esp+1FCh]
	call sub_405B30
	mov eax, [esp+1F8h]
	mov ecx, 12h
	call sub_40FA90
	push 2
	mov ebx, 0C8h
	mov eax, [esp+esi*2+1AAh]
	push 3
	sar eax, 10h
	mov edx, 0ECh
	call sub_41B710
	call sub_4054E0
	push 2
	mov ecx, 12h
	mov ebx, 15Eh
	mov eax, [esp+esi*2+1DAh]
	push 3
	sar eax, 10h
	mov edx, 29h
	call sub_41B710
	call sub_4054E0
	push 2
	mov ecx, 12h
	mov ebx, 15Eh
	mov eax, [esp+esi*2+192h]
	push 3
	sar eax, 10h
	mov edx, 0ECh
	call sub_41B710
	call sub_4054E0
	lea edx, 0[esi*8]
	mov eax, [esp+edx]
	xor ebx, ebx
	call sub_41B650
	mov [esp+210h], ebx
	mov [esp+200h], edx
	mov esi, [esp+edx+4]
	mov [esp+20Ch], eax
	test esi, esi
	jle loc_411F1E

loc_411DC9:
	mov ebp, [esp+200h]
	mov edx, [esp+210h]
	mov ebp, [esp+ebp]
	xor ah, ah
	add ebp, edx
	mov [esp+118h], ah
	mov eax, ebp
	lea edi, [esp+0C8h]
	call sub_41B710
	mov esi, eax
	push edi

loc_411DF6:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_411E0E
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_411DF6

loc_411E0E:
	pop edi
	mov eax, ebp
	call sub_41B670
	mov esi, eax

loc_411E18:
	lea eax, [esp+0C8h]
	call sub_482424
	mov edx, dword [dword_4DAB7C]
	add eax, esi
	sub edx, 5
	cmp eax, edx
	jle loc_411E6B
	lea edx, [esp+78h]
	lea eax, [esp+0C8h]
	call sub_412290
	lea edx, [esp+78h]
	lea eax, [esp+118h]
	call sub_412240
	cmp byte [esp+0C8h], 0
	jz loc_411E6B
	jmp loc_411E18

loc_411E5F:
	xor eax, eax
	mov al, byte [byte_512DDA]
	jmp loc_411C81

loc_411E6B:
	cmp byte [esp+0C8h], 0
	jz loc_411EB2
	mov eax, ebp
	call sub_41B6D0
	cwde
	push eax
	mov eax, ebp
	mov ebx, [esp+20Eh]
	call sub_41B690
	cwde
	movsx edx, si
	push eax
	mov eax, ebp
	sar ebx, 10h
	call sub_41B6F0
	movsx ecx, ax
	lea eax, [esp+0D0h]
	call sub_4054E0
	add dword [esp+20Ch], 1Ah

loc_411EB2:
	cmp byte [esp+118h], 0
	jz loc_411EFC
	mov eax, ebp
	call sub_41B6D0
	cwde
	mov ebx, [esp+20Ah]
	push eax
	mov eax, ebp
	add esi, 31h
	call sub_41B690
	cwde
	sar ebx, 10h
	push eax
	mov eax, ebp
	movsx edx, si
	call sub_41B6F0
	movsx ecx, ax
	lea eax, [esp+120h]
	call sub_4054E0
	add dword [esp+20Ch], 1Ah

loc_411EFC:
	mov edi, [esp+210h]
	mov edx, [esp+200h]
	inc edi
	mov ebp, [esp+edx+4]
	mov [esp+210h], edi
	cmp edi, ebp
	jl loc_411DC9

loc_411F1E:
	call sub_405C70
	mov eax, [esp+1F8h]
	call sub_423CA0
	cmp dword [esp+1F4h], 0A0h
	jle loc_411F88
	cmp word [esp+214h], 1
	jnz loc_411F88
	mov eax, [esp+1FCh]
	mov eax, [esp+eax*2+1BEh]
	sar eax, 10h
	push eax
	push aHD0 ; "h%d0"
	lea eax, [esp+170h]
	push eax
	call sprintf_
	add esp, 0Ch
	lea eax, [esp+168h]
	xor edi, edi
	call sub_403480
	call sub_486F28
	mov [esp+214h], edi

loc_411F88:
	call sub_405960
	mov edx, eax
	test ax, ax
	jz loc_412056
	mov ecx, [esp+204h]
	cmp ecx, [esp+1F0h]
	jle loc_412056
	add ecx, 0Fh
	mov [esp+1F0h], ecx
	cmp ax, 4B00h
	jnz loc_4120FB
	mov eax, [esp+1F8h]
	cmp word [eax+0Ah], 0
	jnz loc_4120FB
	mov edx, 7Fh
	xor eax, eax
	mov ebx, [esp+1FCh]
	call sub_4423F0
	cmp ebx, 8
	jnz loc_4120A3
	mov dword [esp+1FCh], 7

loc_411FF9:
	mov esi, [esp+1FCh]
	dec esi
	mov [esp+1FCh], esi
	test esi, esi
	jl loc_4120E6

loc_412010:
	mov ebp, 1
	mov edx, [esp+1FCh]
	xor eax, eax
	mov dword [dword_4D1FFC], ebp
	call sub_403550
	mov eax, [esp+1F8h]
	call sub_413180
	mov eax, [esp+1F8h]
	mov edi, 1
	call sub_410E80
	xor eax, eax
	mov [esp+214h], edi
	mov [esp+1F4h], eax

loc_412056:
	cmp dword [esp+208h], 0
	jz loc_411CB6

loc_412064:
	mov dword [dword_4D1FFC], 1
	xor eax, eax
	call sub_403550
	cmp word [word_4D3ECE], 3
	jnz loc_412216
	mov al, [esp+1FCh]
	mov byte [byte_512DDA], al
	mov eax, [esp+208h]
	add esp, 218h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4120A3:
	cmp ebx, 5
	jnz loc_4120B8
	mov dword [esp+1FCh], 3
	jmp loc_411FF9

loc_4120B8:
	cmp ebx, 2
	jnz loc_4120CD
	mov dword [esp+1FCh], 1
	jmp loc_411FF9

loc_4120CD:
	cmp ebx, 0Ah
	jnz loc_411FF9
	mov dword [esp+1FCh], 9
	jmp loc_411FF9

loc_4120E6:
	mov eax, dword [dword_4E5FF8]
	sar eax, 10h
	dec eax
	mov [esp+1FCh], eax
	jmp loc_412010

loc_4120FB:
	cmp dx, 0Dh
	jnz loc_4121AD

loc_412105:
	mov eax, [esp+1F8h]
	cmp word [eax+0Ah], 0
	jnz loc_4121B8
	mov edx, 7Fh
	xor eax, eax
	mov esi, [esp+1FCh]
	call sub_4423F0
	cmp esi, 7
	jnz loc_4121D3
	mov dword [esp+1FCh], 8

loc_41213E:
	mov edi, [esp+1FCh]
	mov eax, dword [dword_4E5FF8]
	inc edi
	sar eax, 10h
	mov [esp+1FCh], edi
	cmp eax, edi
	jnz loc_412162
	xor eax, edi
	mov [esp+1FCh], eax

loc_412162:
	mov edx, 1
	mov esi, 1
	xor eax, eax
	xor ecx, ecx
	mov dword [dword_4D1FFC], edx
	call sub_403550
	mov edx, [esp+1FCh]
	mov eax, [esp+1F8h]
	mov [esp+214h], esi
	call sub_413180
	mov eax, [esp+1F8h]
	mov [esp+1F4h], ecx
	call sub_410E80
	jmp loc_412056

loc_4121AD:
	cmp dx, 4D00h
	jz loc_412105

loc_4121B8:
	mov eax, [esp+1F8h]
	movsx edx, dx
	call sub_410414
	mov [esp+208h], eax
	jmp loc_412056

loc_4121D3:
	cmp esi, 3
	jnz loc_4121E8
	mov dword [esp+1FCh], 5
	jmp loc_41213E

loc_4121E8:
	cmp esi, 1
	jnz loc_4121FD
	mov dword [esp+1FCh], 2
	jmp loc_41213E

loc_4121FD:
	cmp esi, 9
	jnz loc_41213E
	mov dword [esp+1FCh], 0Ah
	jmp loc_41213E

loc_412216:
	mov al, [esp+1FCh]
	mov byte [byte_512DBF], al
	mov eax, [esp+208h]
	add esp, 218h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_411BD0 endp

sub_412240: ;SUBROUTINE
	push esi
	push edi
	sub esp, 50h
	mov edi, eax
	mov esi, edx
	cmp byte [edx], 0
	jz loc_41226D
	cmp byte [edi], 0
	jnz loc_412273

loc_412253:
	push edi

loc_412254:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_41226C
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_412254

loc_41226C:
	pop edi

loc_41226D:
	add esp, 50h
	pop edi
	pop esi
	ret

loc_412273:
	push edi
	push esi
	push aSS ; "%s %s"
	lea esi, [esp+0Ch]
	push esi
	call sprintf_
	add esp, 10h
	mov esi, esp
	jmp loc_412253
;sub_412240 endp

sub_412290: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	mov ebp, eax
	mov ebx, edx
	mov edi, eax
	sub ecx, ecx
	dec ecx
	xor eax, eax
	repne scasb
	not ecx
	dec ecx
	mov ah, [ebp+0]
	mov esi, ecx
	test ah, ah
	jz loc_4122EF
	cmp byte [edx], 0
	jz loc_4122EF
	mov eax, ecx
	add ecx, ebp
	mov byte [ebx], 0
	mov edx, ecx
	cmp byte [ecx], 20h
	jz loc_4122CF

loc_4122C1:
	test eax, eax
	jl loc_4122CF
	mov cl, [edx-1]
	dec edx
	dec eax
	cmp cl, 20h
	jnz loc_4122C1

loc_4122CF:
	mov edi, eax
	lea ecx, [eax+ebp]
	mov edx, ebx
	cmp eax, esi
	jge loc_4122E8

loc_4122DA:
	inc edx
	mov bl, [ecx]
	inc ecx
	inc eax
	mov [edx-1], bl
	cmp eax, esi
	jl loc_4122DA
	mov eax, eax

loc_4122E8:
	mov byte [edx], 0
	mov byte [edi+ebp], 0

loc_4122EF:
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_412290 endp

sub_412300: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 0Ch
	mov edi, eax
	mov ecx, 1
	mov eax, 1
	xor esi, esi
	xor ebp, ebp
	mov dword [dword_4D1FFC], eax
	xor eax, eax
	mov [esp], esi
	call sub_403550
	mov dx, word [word_4D3ECE]
	mov [esp+4], esi
	cmp dx, 3
	jz loc_412473
	xor eax, eax
	mov al, byte [byte_512DBF]

loc_412344:
	mov [esp+8], eax
	mov edx, [esp+8]
	mov ebx, esi
	mov eax, edi
	call sub_413100
	mov eax, edi
	mov edx, [esp]
	call sub_410E80
	test edx, edx
	jnz loc_412444

loc_412367:
	call sub_4833C7
	add ebp, eax
	test cx, cx
	jz loc_412397
	call sub_428A20
	mov edx, 400h
	mov eax, aBack_0 ; "back"
	xor ecx, ecx
	xor ebx, ebx
	call sub_405B30
	mov eax, edi
	call sub_40FA90
	call sub_405C70

loc_412397:
	xor eax, eax
	call sub_403550
	call sub_423B90
	mov eax, edi
	call sub_423CA0
	mov ecx, eax
	call sub_405960
	mov edx, eax
	test ax, ax
	jz loc_41243A
	cmp ebp, [esp+4]
	jle loc_41243A
	lea ebx, [ebp+0Fh]
	mov ecx, 1
	mov [esp+4], ebx
	cmp ax, 4D00h
	jnz loc_41247F

loc_4123DC:
	cmp word [edi+0Ah], 1
	jnz loc_412489
	mov edx, 7Fh
	xor eax, eax
	call sub_4423F0
	mov edx, [esp+8]
	mov ebx, dword [dword_4E5FF8]
	inc edx
	sar ebx, 10h
	mov eax, edx
	sar edx, 1Fh
	idiv ebx
	mov [esp+8], edx
	cmp edx, 3

loc_41240F:
	jnz loc_412418
	cmp esi, 7
	jl loc_412418
	xor esi, esi

loc_412418:
	cmp dword [esp+8], 5
	jnz loc_412426
	cmp esi, 7
	jl loc_412426

loc_412424:
	xor esi, esi

loc_412426:
	mov edx, [esp+8]
	mov ebx, esi
	mov eax, edi
	call sub_413100
	mov eax, edi
	call sub_412580

loc_41243A:
	cmp dword [esp], 0
	jz loc_412367

loc_412444:
	cmp word [word_4D3ECE], 3
	jnz loc_41256F
	mov al, [esp+8]
	mov byte [byte_512DDA], al

loc_41245B:
	mov esi, 1
	mov eax, [esp]
	mov dword [dword_4D4154], esi
	add esp, 0Ch
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_412473:
	xor eax, eax
	mov al, byte [byte_512DDA]
	jmp loc_412344

loc_41247F:
	cmp ax, 0Dh
	jz loc_4123DC

loc_412489:
	cmp dx, 4B00h
	jnz loc_4124C9
	cmp word [edi+0Ah], 1
	jnz loc_4124C9
	mov edx, 7Fh
	xor eax, eax
	call sub_4423F0
	mov eax, [esp+8]
	dec eax
	mov [esp+8], eax
	test eax, eax
	jl loc_4124BA

loc_4124B0:
	cmp dword [esp+8], 3
	jmp loc_41240F

loc_4124BA:
	mov eax, dword [dword_4E5FF8]
	sar eax, 10h
	dec eax
	mov [esp+8], eax
	jmp loc_4124B0

loc_4124C9:
	cmp dx, 4D00h
	jnz loc_412512

loc_4124D0:
	cmp word [edi+0Ah], 0
	jnz loc_412518
	mov edx, 7Fh
	xor eax, eax
	inc esi
	call sub_4423F0
	cmp esi, 8
	jnz loc_4124EB
	xor esi, esi

loc_4124EB:
	cmp dword [esp+8], 3
	jnz loc_4124F9
	cmp esi, 7
	jnz loc_4124F9
	xor esi, esi

loc_4124F9:
	cmp dword [esp+8], 5
	jnz loc_412426
	cmp esi, 7
	jnz loc_412426
	jmp loc_412424

loc_412512:
	cmp dx, 0Dh
	jz loc_4124D0

loc_412518:
	cmp dx, 4B00h
	jnz loc_41255D
	cmp word [edi+0Ah], 0
	jnz loc_41255D
	mov edx, 7Fh
	xor eax, eax
	dec esi
	call sub_4423F0
	test esi, esi
	jge loc_412426
	mov esi, [esp+8]
	cmp esi, 3
	jnz loc_41254E

loc_412544:
	mov esi, 6
	jmp loc_412426

loc_41254E:
	cmp esi, 5
	jz loc_412544
	mov esi, 7
	jmp loc_412426

loc_41255D:
	movsx edx, dx
	mov eax, edi
	call sub_410414
	mov [esp], eax
	jmp loc_41243A

loc_41256F:
	mov al, [esp+8]
	mov byte [byte_512DBF], al
	jmp loc_41245B
;sub_412300 endp

sub_412580: ;SUBROUTINE
	push ecx
	push edx
	push ebp
	sub esp, 100h
	mov ecx, eax
	mov edx, [eax]
	test edx, edx
	jnz loc_4125A0

loc_412591:
	call sub_4833C7
	add esp, 100h
	pop ebp
	pop edx
	pop ecx
	ret

loc_4125A0:
	mov eax, edx
	mov edx, byte_4E5FC8
	call strcmp_
	test eax, eax
	jz loc_412591
	push edi
	push esi
	push ebx
	mov edi, byte_4E5FC8
	mov esi, [ecx]
	push edi

loc_4125BB:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_4125D3
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_4125BB

loc_4125D3:
	pop edi
	mov ebx, dword [dword_4D40B8]
	test ebx, ebx
	jz loc_4125ED
	mov eax, ebx
	xor esi, esi
	call sub_4848FC
	mov dword [dword_4D40B8], esi

loc_4125ED:
	mov edi, [ecx]
	push edi
	mov ebp, dword [dword_5134D0]
	push ebp
	push aSS_qfs_0 ; "%s%s.qfs"
	lea eax, [esp+18h]
	push eax
	call sprintf_
	add esp, 10h
	xor edx, edx
	lea eax, [esp+0Ch]
	call sub_488058
	mov dword [dword_4D40B8], eax
	mov eax, 1Eh
	call sub_4833E7
	call sub_4833F3
	pop ebx
	pop esi
	pop edi
	call sub_4833C7
	add esp, 100h
	pop ebp
	pop edx
	pop ecx
	ret
;sub_412580 endp

sub_412640: ;SUBROUTINE
	push ecx
	push esi
	push edi
	sub esp, 18h
	mov ecx, 6
	mov edi, esp
	mov esi, dword_411AE0
	rep movsd
	cmp ax, 0Ch
	jl loc_41265C
	xor eax, eax

loc_41265C:
	cwde
	mov ax, [esp+eax*2]
	add esp, 18h
	pop edi
	pop esi
	pop ecx
	ret
;sub_412640 endp

sub_412670: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 174h
	mov ebp, eax
	mov eax, dword [dword_5637F4]
	mov edx, 1
	lea edi, [esp+0FCh]
	mov esi, off_411AB0
	mov [esp+158h], eax
	xor ecx, ecx
	xor ebx, ebx
	mov [esp+15Ch], ecx
	mov [esp+164h], ecx
	mov [esp+160h], ecx
	mov [esp+16Ch], edx
	mov ecx, 0Ch
	mov [esp+170h], ebx
	mov edx, 1
	rep movsd
	mov [esp+154h], edx
	mov ecx, 0Ch
	mov si, word [word_4D3ECE]
	mov word [dword_4E5FF8+2], cx
	cmp si, 3
	jz loc_412A8D
	xor eax, eax
	mov al, byte [byte_512DBF]

loc_4126F9:
	mov [esp+168h], eax
	mov edx, [esp+168h]
	mov eax, ebp
	mov ebx, 1
	call sub_413160
	mov edx, [esp+168h]
	mov eax, 1
	xor edi, edi
	call sub_412E60
	mov eax, ebp
	mov dword [dword_4D2098], edi
	call sub_410E80
	mov eax, [esp+166h]
	push edi
	sar eax, 10h
	mov edx, aCar6 ; "car6"
	call sub_412640
	movsx ecx, ax
	xor eax, eax
	call sub_428140
	cmp dword [dword_4D4154], 0
	jz loc_412762
	mov [esp+160h], edi

loc_412762:
	xor ecx, ecx
	mov ebx, [esp+15Ch]
	mov dword [dword_4D4154], ecx
	test ebx, ebx
	jnz loc_412A1E

loc_412779:
	mov edi, [esp+160h]
	call sub_4833C7
	add edi, eax
	mov ecx, 1
	mov [esp+160h], edi
	mov esi, edi
	mov edi, [esp+170h]
	add edi, ecx
	mov eax, [esp+168h]
	mov [esp+170h], edi
	cmp eax, 0Bh
	jnz loc_412A99
	mov eax, [ebp+1Ch]
	or byte [eax+8], 1

loc_4127BC:
	cmp word [esp+170h], 23h
	jl loc_412AB2
	cmp word [esp+16Ch], 1
	jnz loc_412AB2
	mov edx, [esp+158h]
	add edx, 78h
	mov eax, dword [dword_5637F4]
	cmp eax, edx
	jle loc_412AB2
	cmp byte [byte_512DFB], 0
	jnz loc_412AA5
	cmp byte [byte_512DFA], 1
	jnz loc_412AA5
	mov edx, [esp+168h]
	cmp edx, 7
	jnz loc_412AA5
	lea eax, [edx+5]
	push eax

loc_41281F:
	push a02d0 ; "%02d0"
	lea eax, [esp+134h]
	push eax
	call sprintf_
	add esp, 0Ch
	lea eax, [esp+12Ch]
	call sub_403480
	xor ebx, ebx
	call sub_486F28
	mov [esp+16Ch], ebx

loc_41284E:
	cmp dword [dword_4D2094], 0
	jz loc_412B02

loc_41285B:
	call sub_428A20
	mov edx, 400h
	mov eax, aBack_0 ; "back"
	xor ecx, ecx
	xor ebx, ebx
	mov edi, [esp+154h]
	call sub_405B30
	cmp edi, 2
	jnb loc_412AC0
	cmp edi, 1
	jnz loc_41289B
	mov edx, 1000h
	mov eax, aGnrl ; "gnrl"

loc_412892:
	xor ecx, ecx
	xor ebx, ebx
	call sub_405B30

loc_41289B:
	mov eax, ebp
	call sub_40FA90
	mov eax, dword [dword_4D4D24]
	mov eax, [eax+20h]
	mov ebx, [esp+168h]
	call sub_426B70
	cmp ebx, 7
	jnz loc_412AE9

loc_4128BF:
	mov ebx, 0Ah
	mov eax, 12h
	mov edx, esi
	xor ecx, ecx

loc_4128CD:
	call sub_4274F0
	cmp dword [dword_4D2310], 0
	jz loc_4128EE
	mov eax, dword [dword_4D4C7C]
	mov edx, dword [dword_4D4C80]
	sub eax, 7
	call sub_4267C0

loc_4128EE:
	call sub_4976B8

loc_4128FA:
	mov eax, ebp
	call sub_423CA0
	call sub_405960
	mov edx, eax
	test ax, ax
	jz loc_412A10
	mov ecx, [esp+160h]
	cmp ecx, [esp+164h]
	jle loc_412A10
	add ecx, 0Fh
	mov [esp+164h], ecx
	cmp ax, 4B00h
	jnz loc_412B38
	cmp word [ebp+0Ah], 0
	jnz loc_412B38
	mov edx, 7Fh
	mov ebx, [esp+168h]
	xor eax, eax
	dec ebx
	call sub_4423F0
	mov [esp+168h], ebx
	test ebx, ebx
	jl loc_412B0C

loc_412967:
	mov edi, 1
	mov edx, [esp+168h]
	xor eax, eax
	mov dword [dword_4D1FFC], edi
	call sub_403550
	mov eax, ebp
	call sub_413160
	xor eax, eax
	mov edx, [esp+168h]
	call sub_403550
	mov eax, [esp+154h]
	call sub_412E60
	xor eax, eax
	call sub_403550
	mov eax, ebp
	mov ebx, edi
	call sub_410E80
	mov eax, [esp+166h]
	push 0
	sar eax, 10h
	mov edx, aCar6 ; "car6"
	call sub_412640
	movsx ecx, ax
	xor eax, eax
	call sub_428140
	xor eax, eax
	mov ecx, 1
	call sub_403550
	xor ebx, ebx
	xor edx, edx
	mov eax, [esp+168h]
	mov [esp+170h], ebx
	mov [esp+16Ch], ecx
	cmp eax, 7
	jnz loc_412B21

loc_4129FF:
	mov ebx, 0Ah
	mov eax, 12h
	xor ecx, ecx

loc_412A0B:
	call sub_4274F0

loc_412A10:
	cmp dword [esp+15Ch], 0
	jz loc_412779

loc_412A1E:
	cmp word [word_4D3ECE], 3
	jnz loc_412E3E
	mov al, [esp+168h]
	mov byte [byte_512DDA], al

loc_412A38:
	mov edi, 1
	xor eax, eax
	mov dword [dword_4D1FFC], edi
	call sub_403550
	xor eax, eax
	mov edx, [esp+168h]
	mov dword [dword_4D2098], eax
	cmp edx, 7
	jz loc_412A66
	cmp edx, 8
	jnz loc_412E4F

loc_412A66:
	mov ebx, 0Ah
	mov edx, eax
	xor ecx, ecx
	mov eax, 12h

loc_412A74:
	call sub_4274F0
	mov eax, [esp+15Ch]
	add esp, 174h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_412A8D:
	xor eax, eax
	mov al, byte [byte_512DDA]
	jmp loc_4126F9

loc_412A99:
	mov eax, [ebp+1Ch]
	and byte [eax+8], 0FEh
	jmp loc_4127BC

loc_412AA5:
	mov ecx, [esp+168h]
	push ecx
	jmp loc_41281F

loc_412AB2:
	test cx, cx
	jnz loc_41285B
	jmp loc_41284E

loc_412AC0:
	jbe loc_412ADA
	cmp edi, 3
	jnz loc_41289B
	mov edx, 1000h
	mov eax, aMech ; "mech"
	jmp loc_412892

loc_412ADA:
	mov edx, 1000h
	mov eax, aPerf ; "perf"
	jmp loc_412892

loc_412AE9:
	cmp ebx, 8
	jz loc_4128BF
	mov eax, 12h
	mov edx, esi
	xor ecx, ecx
	xor ebx, ebx
	jmp loc_4128CD

loc_412B02:
	call sub_423B90
	jmp loc_4128FA

loc_412B0C:
	mov eax, dword [dword_4E5FF8]
	sar eax, 10h
	dec eax
	mov [esp+168h], eax
	jmp loc_412967

loc_412B21:
	cmp eax, 8
	jz loc_4129FF

loc_412B2A:
	mov eax, 12h
	xor ecx, ecx
	xor ebx, ebx
	jmp loc_412A0B

loc_412B38:
	cmp ax, 4D00h
	jnz loc_412C1C

loc_412B42:
	cmp word [ebp+0Ah], 0
	jnz loc_412C26
	mov edx, 7Fh
	xor eax, eax
	mov ecx, [esp+168h]
	call sub_4423F0
	mov eax, dword [dword_4E5FF8]
	inc ecx
	sar eax, 10h
	mov [esp+168h], ecx
	cmp eax, ecx
	jnz loc_412B7D
	xor esi, esi
	mov [esp+168h], esi

loc_412B7D:
	mov edi, 1
	mov edx, [esp+168h]
	xor eax, eax
	mov dword [dword_4D1FFC], edi
	call sub_403550
	mov eax, ebp
	call sub_413160
	xor eax, eax
	mov edx, [esp+168h]
	call sub_403550
	mov eax, [esp+154h]
	call sub_412E60
	mov eax, ebp
	mov ebx, edi
	call sub_410E80
	mov eax, [esp+166h]
	push 0
	sar eax, 10h
	mov edx, aCar6 ; "car6"
	call sub_412640
	movsx ecx, ax
	xor eax, eax
	call sub_428140
	xor eax, eax
	mov edx, 1
	call sub_403550
	xor eax, eax
	mov [esp+16Ch], edx
	mov [esp+170h], eax
	mov eax, [esp+168h]
	xor edx, edx
	cmp eax, 7
	jz loc_4129FF
	cmp eax, 8
	jnz loc_412B2A
	jmp loc_4129FF

loc_412C1C:
	cmp ax, 0Dh
	jz loc_412B42

loc_412C26:
	cmp ax, 4D00h
	jnz loc_412C76

loc_412C2C:
	cmp word [ebp+0Ah], 1
	jnz loc_412C7C
	mov edx, 7Fh
	mov edi, [esp+154h]
	xor eax, eax
	inc edi
	call sub_4423F0
	mov [esp+154h], edi
	cmp edi, 3
	jle loc_412C5E
	mov dword [esp+154h], 1

loc_412C5E:
	mov edx, [esp+168h]
	mov eax, [esp+154h]
	call sub_412E60
	jmp loc_412A10

loc_412C76:
	cmp ax, 0Dh
	jz loc_412C2C

loc_412C7C:
	cmp ax, 4B00h
	jnz loc_412CCC
	cmp word [ebp+0Ah], 1
	jnz loc_412CCC
	mov edx, 7Fh
	mov ecx, [esp+154h]
	xor eax, eax
	dec ecx
	call sub_4423F0
	mov [esp+154h], ecx
	cmp ecx, 1
	jge loc_412CB4
	mov dword [esp+154h], 3

loc_412CB4:
	mov edx, [esp+168h]
	mov eax, [esp+154h]
	call sub_412E60
	jmp loc_412A10

loc_412CCC:
	cmp ax, 0Dh
	jnz loc_412E02
	cmp word [ebp+0Ah], 4
	jnz loc_412E02
	mov edx, 7Fh
	mov eax, 2
	mov ebx, 1
	call sub_4423F0
	xor eax, eax
	mov dword [dword_4D1FFC], ebx
	call sub_403550
	call sub_4056B0
	call sub_4762E0
	call sub_476250
	mov eax, [esp+168h]
	mov esi, [esp+eax*4+0FCh]
	push esi
	push aS_dct ; "%s.dct"
	lea eax, [esp+8]
	push eax
	call sprintf_
	add esp, 0Ch
	mov eax, esp
	xor edi, edi
	call sub_4242F0
	call sub_4769D0
	mov eax, 12h
	mov edx, dword [dword_4D5A28]
	xor esi, esi
	call sub_476750
	call sub_4057C0
	mov eax, ebp
	mov dword [dword_4D2098], edi
	call sub_410E80
	mov eax, [esp+166h]
	push edi
	sar eax, 10h
	mov edx, aCar6 ; "car6"
	call sub_412640
	movsx ecx, ax
	xor eax, eax
	mov [esp+174h], esi
	call sub_428140
	mov eax, [esp+168h]
	xor esi, esi
	cmp eax, 7
	jnz loc_412DF0

loc_412D98:
	mov ebx, 0Ah
	mov eax, 12h
	mov edx, esi
	xor ecx, ecx

loc_412DA6:
	call sub_4274F0
	mov edx, [esp+168h]
	mov eax, ebp
	call sub_413160
	mov edx, [esp+168h]
	mov eax, [esp+154h]
	mov edi, 1
	call sub_412E60
	mov eax, ebp
	mov [esp+16Ch], edi
	call sub_410E80
	mov eax, dword [dword_5637F4]
	mov [esp+158h], eax
	jmp loc_412A10

loc_412DF0:
	cmp eax, 8
	jz loc_412D98
	mov eax, 12h
	xor ecx, ecx
	xor ebx, ebx
	xor edx, edx
	jmp loc_412DA6

loc_412E02:
	cmp ax, 1Bh
	jnz loc_412E28
	mov edx, 7Fh
	mov eax, 3
	mov esi, 0FFFFFFFFh
	call sub_4423F0
	mov [esp+15Ch], esi
	jmp loc_412A1E

loc_412E28:
	movsx edx, ax
	mov eax, ebp
	call sub_410414
	mov [esp+15Ch], eax
	jmp loc_412A10

loc_412E3E:
	mov al, [esp+168h]
	mov byte [byte_512DBF], al
	jmp loc_412A38

loc_412E4F:
	mov eax, 12h
	xor ecx, ecx
	xor ebx, ebx
	xor edx, edx
	jmp loc_412A74
;sub_412670 endp

sub_412E60: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	sub esp, 90h
	mov ebx, eax
	mov ecx, 0Ch
	mov edi, esp
	mov esi, dword_411A20
	rep movsd
	mov ecx, 0Ch
	lea edi, [esp+30h]
	mov esi, dword_411A50
	rep movsd
	mov ecx, 0Ch
	lea edi, [esp+60h]
	mov esi, dword_411A80
	rep movsd
	cmp eax, 2
	jnb loc_412F2A
	cmp eax, 1
	jnz loc_412F06
	mov ecx, 181h
	mov esi, 182h
	mov edi, 183h
	mov eax, 184h
	mov word [word_4D2D4E], cx
	mov word [word_4D2D62], si
	mov word [word_4D2D76], di
	mov word [word_4D2D8A], ax
	mov ecx, 185h
	mov esi, 186h
	mov edi, 187h
	mov eax, 188h

loc_412EEB:
	mov word [word_4D2D9E], cx
	mov word [word_4D2DB2], si
	mov word [word_4D2DC6], di
	mov word [word_4D2DDA], ax

loc_412F06:
	lea eax, 0[edx*4]
	cmp ebx, 2
	jnb loc_412FC1
	cmp ebx, 1
	jz loc_41303B

loc_412F1F:
	add esp, 90h
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_412F2A:
	ja loc_412F74
	mov ecx, 239h
	mov esi, 23Ah
	mov edi, 23Bh
	mov eax, 23Ch
	mov word [word_4D2D4E], cx
	mov word [word_4D2D62], si
	mov word [word_4D2D76], di
	mov word [word_4D2D8A], ax
	mov ecx, 23Dh
	mov esi, 23Eh
	mov edi, 23Fh
	mov eax, 15Ah
	jmp loc_412EEB

loc_412F74:
	cmp eax, 3
	jnz loc_412F06
	mov ecx, 1DDh
	mov esi, 1DEh
	mov edi, 1DFh
	mov eax, 1E0h
	mov word [word_4D2D4E], cx
	mov word [word_4D2D62], si
	mov word [word_4D2D76], di
	mov word [word_4D2D8A], ax
	mov ecx, 1E1h
	mov esi, 1E2h
	mov edi, 1E3h
	mov eax, 1E4h
	jmp loc_412EEB

loc_412FC1:
	jbe loc_4130A0
	cmp ebx, 3
	jnz loc_412F1F
	mov dx, [esp+eax+60h]
	mov word [word_4D2DEE], dx
	inc edx
	mov word [word_4D2E02], dx
	mov dx, [esp+eax+60h]
	add edx, 2
	mov word [word_4D2E16], dx
	mov dx, [esp+eax+60h]
	add edx, 3
	mov word [word_4D2E2A], dx
	mov dx, [esp+eax+60h]
	add edx, 4
	mov word [word_4D2E3E], dx
	mov dx, [esp+eax+60h]
	mov ax, [esp+eax+60h]
	add edx, 5
	add eax, 6
	mov word [word_4D2E52], dx
	mov word [word_4D2E66], ax
	add esp, 90h
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_41303B:
	mov dx, [esp+eax]
	mov word [word_4D2DEE], dx
	inc edx
	mov word [word_4D2E02], dx
	mov dx, [esp+eax]
	add edx, 2
	mov word [word_4D2E16], dx
	mov dx, [esp+eax]
	add edx, 3
	mov word [word_4D2E2A], dx
	mov dx, [esp+eax]
	add edx, 4
	mov word [word_4D2E3E], dx
	mov dx, [esp+eax]
	mov ax, [esp+eax]
	add edx, 5
	add eax, 6
	mov word [word_4D2E52], dx
	mov word [word_4D2E66], ax
	add esp, 90h
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_4130A0:
	mov dx, [esp+eax+30h]
	mov word [word_4D2DEE], dx
	inc edx
	mov word [word_4D2E02], dx
	mov dx, [esp+eax+30h]
	add edx, 2
	mov word [word_4D2E16], dx
	mov dx, [esp+eax+30h]
	add edx, 3
	mov ax, [esp+eax+30h]
	mov word [word_4D2E2A], dx
	add eax, 4
	mov edx, 15Ah
	mov word [word_4D2E3E], ax
	mov word [word_4D2E52], dx
	mov word [word_4D2E66], dx
	add esp, 90h
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_412E60 endp

sub_413100: ;SUBROUTINE
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 30h
	mov ebp, eax
	mov ecx, 0Ch
	mov edi, esp
	mov esi, off_4119F0
	shl edx, 2
	rep movsd
	test ebx, ebx
	jnz loc_41312B
	mov edx, [esp+edx]
	mov [eax], edx
	add esp, 30h
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret

loc_41312B:
	inc ebx
	push ebx
	mov ecx, [esp+edx+4]
	push ecx
	push aSD ; "%s%d"
	push dword_4E5FF0
	call sprintf_
	add esp, 10h
	mov dword [ebp+0], dword_4E5FF0
	add esp, 30h
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret
;sub_413100 endp

sub_413160: ;SUBROUTINE
	push ecx
	push esi
	push edi
	sub esp, 30h
	mov ecx, 0Ch
	mov edi, esp
	mov esi, off_4119C0
	rep movsd
	mov edx, [esp+edx*4]
	mov [eax], edx
	add esp, 30h
	pop edi
	pop esi
	pop ecx
	ret
;sub_413160 endp

sub_413180: ;SUBROUTINE
	push ecx
	push esi
	push edi
	sub esp, 30h
	mov ecx, 0Ch
	mov edi, esp
	mov esi, off_411990
	rep movsd
	mov edx, [esp+edx*4]
	mov [eax], edx
	add esp, 30h
	pop edi
	pop esi
	pop ecx
	ret
;sub_413180 endp

dword_4131A0: dd 19001Eh, 100014h, 8000Ch, 4
off_4131B0: dd loc_4132F7
	dd loc_4133FB ; jump table for switch statement
	dd loc_41334A
	dd loc_41334A
	dd loc_41334A

sub_4131C4: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 28h
	mov ecx, dword [dword_4D76BC]
	mov esi, eax
	call sub_41A020
	mov edx, aCNfs2seFront_4 ; "c:\\nfs2se\\frontend\\common\\Statchk.c"
	mov ebx, 3DFh
	mov [esp+24h], ax
	mov dword [dword_4DB1D8], edx
	mov dword [dword_4DB1DC], ebx
	mov ebx, 20h
	movsx edx, ax
	mov eax, aDumitime ; "dumitime"
	shl edx, 2
	call sub_4844B0
	mov [esp], eax
	test eax, eax
	jz loc_41326F

loc_413211:
	mov eax, aCNfs2seFront_4 ; "c:\\nfs2se\\frontend\\common\\Statchk.c"
	mov edx, 3E6h
	mov ebx, 20h
	mov dword [dword_4DB1DC], edx
	mov edx, [esp+22h]
	mov dword [dword_4DB1D8], eax
	sar edx, 10h
	mov eax, aDumirank_0 ; "dumirank"
	add edx, edx
	call sub_4844B0
	mov edx, eax
	test eax, eax
	jz loc_413297

loc_413244:
	mov ecx, dword [dword_4D76BC]
	xor eax, eax

loc_41324C:
	mov edi, [esp+22h]
	movsx ebx, ax
	sar edi, 10h
	cmp ebx, edi
	jge loc_4132BC
	imul ebx, 684h
	mov ebx, [esi+ebx+278h]
	mov [edx+ebx*2-2], ax
	inc eax
	jmp loc_41324C

loc_41326F:
	mov edi, aCNfs2seFront_4 ; "c:\\nfs2se\\frontend\\common\\Statchk.c"
	mov ebp, 3E4h
	push aErrorAllocatin ; "Error allocating memory\n"
	mov dword [dword_4DB1D8], edi
	mov dword [dword_4DB1DC], ebp
	call sub_4840F0
	add esp, 4
	jmp loc_413211

loc_413297:
	mov ebx, aCNfs2seFront_4 ; "c:\\nfs2se\\frontend\\common\\Statchk.c"
	mov edi, 3EBh
	push aErrorAllocatin ; "Error allocating memory\n"
	mov dword [dword_4DB1D8], ebx
	mov dword [dword_4DB1DC], edi
	call sub_4840F0
	add esp, 4
	jmp loc_413244

loc_4132BC:
	mov eax, [esp+24h]

loc_4132C0:
	dec eax
	movsx ebx, ax
	add ebx, ebx
	lea ebp, [edx+ebx]
	movsx ebx, word [ebp+0]
	imul ebx, 684h
	mov ebx, [esi+ebx+21Ch]
	cmp dword [ebx], 24h
	jz loc_4132C0
	mov bl, byte [byte_512DA9]
	cmp bl, 4
	ja loc_4132F7 ; jumptable 004132F0 case 0
	and ebx, 0FFh ; switch 5 cases
	jmp off_4131B0[ebx*4] ; switch jump

loc_4132F7:
	movsx ebx, ax ; jumptable 004132F0 case 0
	movsx ebx, word [edx+ebx*2]
	imul edi, ebx, 684h
	test byte [edi+esi+1F4h], 4
	jnz loc_4134F3
	mov edi, 1
	mov ebx, edi
	mov [esp+14h], di

loc_41331E:
	mov ebp, [esp+12h]
	movsx edi, ax
	sar ebp, 10h
	movsx edi, word [edx+edi*2]
	cmp edi, ebp
	jle loc_413503

loc_413334:
	movsx edi, bx
	add edi, edi
	lea ebp, [ecx+edi]
	cmp word [ebp+0], 1
	jz loc_413521
	inc ebx
	jmp loc_41331E

loc_41334A:
	movsx ebx, ax ; jumptable 004132F0 cases 2-4
	movsx ebx, word [edx+ebx*2]
	imul edi, ebx, 684h
	test byte [edi+esi+1F4h], 4
	jnz loc_413391
	mov bx, word [dword_512264]
	mov [esp+20h], bx

loc_41336D:
	mov ebp, [esp+1Eh]
	movsx edi, ax
	sar ebp, 10h
	movsx edi, word [edx+edi*2]
	cmp edi, ebp
	jle loc_4133D9

loc_41337F:
	movsx edi, bx
	add edi, edi
	lea ebp, [ecx+edi]
	cmp word [ebp+0], 1
	jz loc_4133F0
	inc ebx
	jmp loc_41336D

loc_413391:
	mov edi, ecx
	mov word [edi+ebx*2], 0

loc_413399:
	cmp dword [dword_512208], 1
	jg loc_413563
	xor edi, edi
	xor eax, eax
	mov [esp+8], edi

loc_4133AE:
	mov edi, [esp+22h]
	movsx ebx, ax
	sar edi, 10h
	cmp ebx, edi
	jge loc_413536
	imul ebx, 684h
	mov edi, [esi+ebx+280h]
	cmp edi, 1
	jz loc_41352C
	inc eax
	jmp loc_4133AE

loc_4133D9:
	movsx edi, bx
	add edi, edi
	lea ebp, [ecx+edi]
	cmp word [ebp+0], 0
	jz loc_41337F

loc_4133E8:
	mov word [ebp+0], 0
	jmp loc_413399

loc_4133F0:
	inc word [esp+20h]
	inc ebx
	jmp loc_41336D

loc_4133FB:
	cmp dword [dword_512208], 0 ; jumptable 004132F0 case 1
	jz loc_41343F

loc_413404:
	xor ebx, ebx
	mov [esp+18h], bx

loc_41340B:
	movsx edi, ax
	movsx edi, word [edx+edi*2]
	mov [esp+4], edi
	mov edi, [esp+16h]
	mov ebp, [esp+4]
	sar edi, 10h
	cmp edi, ebp
	jge loc_4134C9

loc_413429:
	movsx edi, bx
	add edi, edi
	lea ebp, [ecx+edi]
	cmp word [ebp+0], 1
	jz loc_4134E8
	inc ebx
	jmp loc_41340B

loc_41343F:
	mov di, [ecx]
	mov ebx, ecx
	test di, di
	jnz loc_413404
	mov di, [ebp+0]
	cmp di, 1
	jnz loc_41346A
	mov ebx, 2

loc_413458:
	movsx edi, bx
	add edi, edi
	lea ebp, [ecx+edi]
	cmp word [ebp+0], 0
	jnz loc_4133E8
	inc ebx
	jmp loc_413458

loc_41346A:
	test di, di
	jz loc_41349E
	mov ebx, 1
	mov [esp+1Ch], bx

loc_413479:
	movsx edi, ax
	mov ebp, [esp+1Ah]
	movsx edi, word [edx+edi*2]
	sar ebp, 10h
	inc edi
	cmp edi, ebp
	jle loc_4134A7

loc_41348C:
	movsx edi, bx
	add edi, edi
	lea ebp, [ecx+edi]
	cmp word [ebp+0], 1
	jz loc_4134C1
	inc ebx
	jmp loc_413479

loc_41349E:
	mov [ecx+2], di
	jmp loc_413399

loc_4134A7:
	movsx edi, bx
	add edi, edi
	lea ebp, [ecx+edi]
	cmp word [ebp+0], 0
	jz loc_41348C
	mov word [ebp+0], 0
	jmp loc_413399

loc_4134C1:
	inc word [esp+1Ch]
	inc ebx
	jmp loc_413479

loc_4134C9:
	movsx ebp, bx
	add ebp, ebp
	add ebp, ecx
	mov di, [ebp+0]
	test di, di
	jz loc_413429
	mov word [ebp+0], 0
	jmp loc_413399

loc_4134E8:
	inc word [esp+18h]
	inc ebx
	jmp loc_41340B

loc_4134F3:
	lea edi, [ebx+ebx]
	mov ebx, ecx
	mov word [edi+ebx], 0
	jmp loc_413399

loc_413503:
	movsx edi, bx
	add edi, edi
	lea ebp, [ecx+edi]
	cmp word [ebp+0], 0
	jz loc_413334
	mov word [ebp+0], 0
	jmp loc_413399

loc_413521:
	inc word [esp+14h]
	inc ebx
	jmp loc_41331E

loc_41352C:
	mov [esp+8], edi
	inc eax
	jmp loc_4133AE

loc_413536:
	cmp dword [esp+8], 0
	jz loc_4135F2
	xor eax, eax

loc_413543:
	mov esi, [esp+22h]
	movsx ebx, ax
	sar esi, 10h
	cmp ebx, esi
	jge loc_4135F2
	lea esi, [ebx+ebx]
	mov ebx, ecx
	inc eax
	mov word [esi+ebx], 0
	jmp loc_413543

loc_413563:
	xor ebx, ebx
	mov [esp+10h], bx

loc_41356A:
	mov ebx, [esp+0Eh]
	mov ebp, dword [dword_512264]
	sar ebx, 10h
	cmp ebx, ebp
	jge loc_4135F2
	imul edi, ebx, 684h
	cmp dword [edi+esi+280h], 1
	jz loc_413596

loc_41358F:
	inc word [esp+10h]
	jmp loc_41356A

loc_413596:
	lea ebp, [ebx+ebx]
	add ebp, ecx
	mov edi, ecx
	mov ebx, dword [dword_512208]
	mov word [ebp+0], 0
	cmp ebx, 2
	jl loc_41358F
	movsx ebx, ax
	movsx ebx, word [edx+ebx*2]
	mov [esp+0Ch], ebx
	imul ebx, 684h
	add ebx, esi
	cmp dword [ebx+280h], 1
	jz loc_41358F
	test byte [ebx+1F4h], 4
	jz loc_41358F
	mov ebx, [ebx+21Ch]
	cmp dword [ebx], 24h
	jz loc_41358F
	mov ebx, [esp+0Ch]
	mov word [edi+ebx*2], 1
	inc word [esp+10h]
	jmp loc_41356A

loc_4135F2:
	mov dword [dword_4D76BC], ecx
	test edx, edx
	jz loc_413603
	mov eax, edx
	call sub_4848FC

loc_413603:
	mov eax, [esp]
	test eax, eax
	jnz loc_41361F

loc_41360A:
	mov eax, 1
	mov ecx, dword [dword_4D76BC]
	add esp, 28h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_41361F:
	call sub_4848FC
	jmp loc_41360A
;sub_4131C4 endp

off_413630: dd loc_4137F5
	dd loc_413887 ; jump table for switch statement
	dd loc_4138BA
	dd loc_413898
	dd loc_4138A9
	dd loc_4138CB
	dd loc_4138DC
	dd loc_4138ED

sub_413650: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 40h
	mov ebp, eax
	lea edi, [esp+30h]
	mov esi, dword_4131A0
	xor edx, edx
	movsd
	movsd
	movsd
	movsd
	call sub_41A020
	mov ecx, eax

loc_413671:
	movsx esi, cx
	movsx eax, dx
	cmp eax, esi
	jge loc_4136F4
	imul ebx, eax, 684h
	add ebx, ebp
	shl eax, 2
	mov esi, [ebx+234h]
	mov [esp+eax], esi
	test byte [ebx+1F4h], 4
	jnz loc_4136A7

loc_41369C:
	movsx eax, dx
	mov [esp+eax*2+20h], dx
	inc edx
	jmp loc_413671

loc_4136A7:
	cmp dword [ebx+280h], 2
	jz loc_41369C
	mov edi, [esp+eax]
	test edi, edi
	jl loc_4136CB
	lea ebx, [edi+1C200h]
	mov [esp+eax], ebx
	movsx eax, dx
	mov [esp+eax*2+20h], dx
	inc edx
	jmp loc_413671

loc_4136CB:
	jle loc_4136EE
	mov ebx, edi

loc_4136CF:
	movsx eax, dx
	imul esi, eax, 0E4Ch
	add ebx, 1C200h
	add ebx, esi
	mov [esp+eax*4], ebx
	movsx eax, dx
	mov [esp+eax*2+20h], dx
	inc edx
	jmp loc_413671

loc_4136EE:
	mov ebx, edi
	neg ebx
	jmp loc_4136CF

loc_4136F4:
	lea ebx, [esp+20h]
	mov edx, esp
	mov eax, esi
	call sub_41B2D0
	xor edx, edx

loc_413703:
	movsx esi, cx
	movsx eax, dx
	cmp eax, esi
	jl loc_41375A
	lea ebx, [esp+20h]
	mov edx, esp
	mov eax, esi
	call sub_41B2D0
	xor edx, edx

loc_41371C:
	movsx ebx, cx
	movsx eax, dx
	cmp eax, ebx
	jge loc_4137DF
	add eax, eax
	mov esi, [esp+eax+1Eh]
	sar esi, 10h
	imul ebx, esi, 684h
	add ebx, ebp
	add esi, esi
	test byte [ebx+1F4h], 4
	jz loc_4137C6
	cmp dword [ebx+280h], 2
	jz loc_4137C6
	inc edx
	jmp loc_41371C

loc_41375A:
	imul ebx, eax, 684h
	add ebx, ebp
	test byte [ebx+1F4h], 4
	jnz loc_41376E

loc_41376B:
	inc edx
	jmp loc_413703

loc_41376E:
	cmp dword [ebx+280h], 2
	jz loc_41376B
	shl eax, 2
	mov ebx, [esp+eax]
	test ebx, ebx
	jl loc_413799
	mov ebx, [esp+esi*2+1Ch]
	sar ebx, 10h
	mov esi, [esp+eax]
	mov ebx, [esp+ebx*4]
	add esi, ebx
	mov [esp+eax], esi
	inc edx
	jmp loc_413703

loc_413799:
	jle loc_4137C0
	mov eax, ebx

loc_41379D:
	movsx ebx, cx
	mov ebx, [esp+ebx*2+1Ch]
	sar ebx, 10h
	mov esi, [esp+ebx*4]
	add esi, eax
	movsx eax, dx
	imul ebx, eax, 0E4Ch
	add ebx, esi
	mov [esp+eax*4], ebx
	inc edx
	jmp loc_413703

loc_4137C0:
	mov eax, ebx
	neg eax
	jmp loc_41379D

loc_4137C6:
	mov ebx, dword [dword_4D76B8]
	mov ax, [esp+eax+30h]
	add [esi+ebx+2B0h], ax
	inc edx
	jmp loc_41371C

loc_4137DF:
	mov eax, dword [dword_51221C]
	call sub_41A3A0
	cmp eax, 7 ; switch 8 cases
	ja loc_4137F5 ; jumptable 004137EE default case
	jmp off_413630[eax*4] ; switch jump

loc_4137F5:
	mov eax, dword [dword_4D76B8] ; jumptable 004137EE default case
	or byte [eax+2C4h], 1

loc_413801:
	mov eax, dword [dword_4D76B8]
	mov edx, [eax+2C4h]
	mov ebx, [eax+2C4h]
	shl edx, 1Eh
	and ebx, 1
	shr edx, 1Fh
	add ebx, edx
	mov edx, [eax+2C4h]
	shl edx, 1Dh
	shr edx, 1Fh
	add edx, ebx
	mov ebx, [eax+2C4h]
	shl ebx, 1Ch
	shr ebx, 1Fh
	add ebx, edx
	mov edx, [eax+2C4h]
	shl edx, 1Bh
	shr edx, 1Fh
	add edx, ebx
	mov ebx, [eax+2C4h]
	shl ebx, 1Ah
	shr ebx, 1Fh
	add ebx, edx
	mov edx, [eax+2C4h]
	shl edx, 19h
	shr edx, 1Fh
	add edx, ebx
	mov ebx, [eax+2C4h]
	shl ebx, 18h
	shr ebx, 1Fh
	add edx, ebx
	mov [eax+2C0h], dx
	mov eax, 1
	add esp, 40h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_413887:
	mov eax, dword [dword_4D76B8] ; jumptable 004137EE case 1
	or byte [eax+2C4h], 2
	jmp loc_413801

loc_413898:
	mov eax, dword [dword_4D76B8] ; jumptable 004137EE case 3
	or byte [eax+2C4h], 4
	jmp loc_413801

loc_4138A9:
	mov eax, dword [dword_4D76B8] ; jumptable 004137EE case 4
	or byte [eax+2C4h], 8
	jmp loc_413801

loc_4138BA:
	mov eax, dword [dword_4D76B8] ; jumptable 004137EE case 2
	or byte [eax+2C4h], 10h
	jmp loc_413801

loc_4138CB:
	mov eax, dword [dword_4D76B8] ; jumptable 004137EE case 5
	or byte [eax+2C4h], 20h
	jmp loc_413801

loc_4138DC:
	mov eax, dword [dword_4D76B8] ; jumptable 004137EE case 6
	or byte [eax+2C4h], 40h
	jmp loc_413801

loc_4138ED:
	mov eax, dword [dword_4D76B8] ; jumptable 004137EE case 7
	or byte [eax+2C4h], 80h
	jmp loc_413801
;sub_413650 endp

off_413900: dd loc_413934
	dd loc_413AC5 ; jump table for switch statement
	dd loc_4139FD
	dd loc_4139FD
	dd loc_4139FD

sub_413914: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 58h
	mov ebp, eax
	mov [esp+54h], dx
	mov eax, dword [dword_512208]
	cmp eax, 4 ; switch 5 cases
	ja loc_413934 ; jumptable 0041392D default case
	jmp off_413900[eax*4] ; switch jump

loc_413934:
	mov esi, dword_512F4C ; jumptable 0041392D default case
	mov edi, ebp
	push edi

loc_41393C:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_413954
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_41393C

loc_413954:
	pop edi
	mov eax, 2E7h
	call sub_41B710
	push eax
	push 1
	mov eax, 2A1h
	call sub_41B710
	push eax
	push aSDS ; "%s %d: %s"
	lea eax, [esp+10h]
	push eax
	call sprintf_
	add esp, 14h
	xor eax, eax
	mov ecx, 1
	mov al, [esp+54h]
	mov ebx, 8
	push eax
	lea edx, [esp+4]
	mov eax, ebp
	call sub_401F40
	mov edx, [esp+52h]
	sar edx, 10h
	lea eax, 0[edx*8]
	mov edi, byte_512E84
	add eax, edx
	mov esi, ebp
	add edi, eax
	push edi

loc_4139B5:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_4139CD
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_4139B5

loc_4139CD:
	pop edi

loc_4139CE:
	mov edi, dword_512F4C

loc_4139D3:
	mov esi, ebp
	push edi

loc_4139D6:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_4139EE
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_4139D6

loc_4139EE:
	pop edi

loc_4139EF:
	mov eax, 1
	add esp, 58h
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_4139FD:
	mov edx, [esp+52h] ; jumptable 0041392D cases 2-4
	mov ecx, dword [dword_51220C]
	sar edx, 10h
	cmp edx, ecx
	jnz loc_4139EF
	lea eax, 0[ecx*8]
	add eax, ecx
	mov ecx, byte_512E84
	add ecx, eax
	mov edi, ebp
	mov esi, ecx
	push edi

loc_413A23:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_413A3B
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_413A23

loc_413A3B:
	pop edi
	mov eax, 2E7h
	call sub_41B710
	push eax
	inc edx
	push edx
	mov eax, 2A1h
	call sub_41B710
	push eax
	push aSDS ; "%s %d: %s"
	lea eax, [esp+10h]
	mov ebx, 8
	push eax
	mov [esp+64h], ecx
	mov ecx, 1
	call sprintf_
	add esp, 14h
	xor eax, eax
	mov esi, ebp
	mov al, [esp+54h]
	mov edx, esp
	push eax
	mov eax, ebp
	mov edi, [esp+54h]
	call sub_401F40
	mov edx, [esp+54h]
	push edi

loc_413A8F:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_413AA7
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_413A8F

loc_413AA7:
	pop edi
	test dx, dx
	jz loc_4139CE
	cmp dx, 1
	jnz loc_4139EF
	mov edi, byte_512F55
	jmp loc_4139D3

loc_413AC5:
	mov ecx, [esp+52h] ; jumptable 0041392D case 1
	sar ecx, 10h
	lea eax, 0[ecx*8]
	mov esi, byte_512E84
	add eax, ecx
	mov edi, ebp
	add esi, eax
	push edi

loc_413ADF:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_413AF7
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_413ADF

loc_413AF7:
	pop edi
	mov ebx, dword [dword_5121F8]
	cmp ebx, 2
	jnz loc_413BD1
	test dx, dx
	jnz loc_413BD1
	cmp ebx, dword [dword_512264]
	jle loc_413BD1
	mov eax, dword [dword_4D76BC]
	cmp word [eax], 0
	jnz loc_413BD1
	cmp word [eax+2], 1
	jnz loc_413BD1
	mov eax, 2E7h
	call sub_41B710
	push eax
	add ecx, ebx
	push ecx

loc_413B44:
	mov eax, 2A1h
	call sub_41B710
	push eax
	push aSDS ; "%s %d: %s"
	lea eax, [esp+10h]
	push eax
	call sprintf_
	add esp, 14h
	xor eax, eax
	mov ecx, 1
	mov al, [esp+54h]
	mov ebx, 8
	push eax
	lea edx, [esp+4]
	mov eax, ebp
	call sub_401F40
	mov edx, [esp+52h]
	sar edx, 10h
	lea eax, 0[edx*8]
	mov edi, byte_512E84
	add eax, edx
	mov esi, ebp
	add edi, eax
	mov ebx, [esp+54h]
	push edi

loc_413B9B:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_413BB3
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_413B9B

loc_413BB3:
	pop edi
	test bx, bx
	jz loc_4139CE
	cmp bx, 1
	jnz loc_4139EF
	mov edi, byte_512F55
	jmp loc_4139D3

loc_413BD1:
	mov eax, 2E7h
	call sub_41B710
	push eax
	mov eax, [esp+56h]
	sar eax, 10h
	inc eax
	push eax
	jmp loc_413B44
;sub_413914 endp

sub_413BF0: ;SUBROUTINE
	push ecx
	push ebp
	sub esp, 18Ch
	mov [esp+15Ch], eax
	mov [esp+178h], dx
	mov [esp+16Ch], ebx
	xor edx, edx
	mov ebp, 14h
	mov [esp+184h], edx
	xor edx, edx
	mov ecx, dword [dword_4E5508]
	mov [esp+158h], edx
	cmp ecx, 1
	jnz loc_413C40

loc_413C30:
	mov eax, [esp+184h]
	add esp, 18Ch
	pop ebp
	pop ecx
	ret

loc_413C40:
	call sub_41A240
	cmp ax, 1
	jnz loc_413C30
	cmp byte [byte_512DAA], 3
	jz loc_413C30
	cmp byte [byte_512DD0], 1
	jz loc_413C30
	cmp byte [byte_512DEB], 1
	jz loc_413C30
	push edi
	push esi
	mov ebx, aCNfs2seFront_4 ; "c:\\nfs2se\\frontend\\common\\Statchk.c"
	mov esi, 1CDh
	mov edx, 280h
	mov eax, aToprcrds ; "toprcrds"
	mov edi, aCNfs2seFront_4 ; "c:\\nfs2se\\frontend\\common\\Statchk.c"
	mov ecx, 1CFh
	mov dword [dword_4DB1D8], ebx
	mov dword [dword_4DB1DC], esi
	mov ebx, 20h
	mov esi, [esp+17Eh]
	call sub_484498
	mov ebx, 20h
	mov [esp+160h], eax
	sar esi, 10h
	mov eax, 1CEh
	lea edx, 0[esi*4]
	mov dword [dword_4DB1DC], eax
	mov eax, aCarttime ; "carttime"
	mov dword [dword_4DB1D8], edi
	call sub_484498
	mov ebx, 20h
	mov [esp+170h], eax
	mov dword [dword_4DB1D8], edi
	mov dword [dword_4DB1DC], ecx
	lea edx, [esi+esi]
	mov eax, aCarttrnk ; "carttrnk"
	mov esi, 1D0h
	mov ecx, [esp+164h]
	call sub_484498
	mov ebx, 20h
	mov edx, 0C8h
	mov [esp+16Ch], eax
	mov dword [dword_4DB1D8], edi
	mov eax, aRecords ; "records"
	mov dword [dword_4DB1DC], esi
	call sub_484498
	mov [esp+168h], eax
	xor eax, eax

loc_413D34:
	mov ebx, [esp+17Eh]
	movsx edx, ax
	sar ebx, 10h
	cmp edx, ebx
	jge loc_413D65
	imul edx, 684h
	add edx, ecx
	mov edx, [edx+278h]
	mov ebx, [esp+16Ch]
	add edx, edx
	add edx, ebx
	mov [edx-2], ax
	inc eax
	jmp loc_413D34

loc_413D65:
	mov eax, dword [dword_51221C]
	mov edx, [esp+160h]
	call sub_41A3A0
	cwde
	call sub_41B040
	mov edi, dword [dword_5121FC]
	cmp edi, 2
	jnz loc_413E14
	mov word [esp+184h], 1

loc_413D95:
	mov eax, ebp
	shl eax, 5
	sub eax, ebp
	mov [esp+17Ch], eax
	lea eax, 0[ebp*4]
	add eax, ebp
	xor edi, edi
	add eax, eax
	mov [esp+190h], di
	mov [esp+178h], eax

loc_413DBF:
	mov edx, [esp+17Eh]
	mov eax, [esp+18Eh]
	sar edx, 10h
	sar eax, 10h
	cmp eax, edx
	jge loc_414305
	mov edx, [esp+16Ch]
	movsx edx, word [edx+eax*2]
	imul eax, edx, 684h
	mov ecx, [esp+164h]
	xor ebx, ebx
	add eax, ecx
	mov bl, byte [byte_512DBD]
	mov esi, [eax+21Ch]
	add ebx, 0Ch
	cmp ebx, [esi]
	jg loc_413E37

loc_413E0A:
	inc word [esp+190h]
	jmp loc_413DBF

loc_413E14:
	cmp edi, 4
	jnz loc_413E28
	mov word [esp+184h], 0Bh
	jmp loc_413D95

loc_413E28:
	mov word [esp+184h], 15h
	jmp loc_413D95

loc_413E37:
	cmp dword [dword_512208], 2
	jge loc_41416D
	test byte [eax+1F4h], 4
	jz loc_413E0A
	cmp dword [eax+280h], 2
	jnz loc_413E0A

loc_413E56:
	mov eax, [esp+18Eh]
	sar eax, 10h
	mov edx, [esp+16Ch]
	add eax, eax
	add eax, edx
	movsx eax, word [eax]
	imul eax, 684h
	add eax, [esp+164h]
	mov edx, [eax+234h]
	mov eax, [esp+182h]
	sar eax, 10h
	add eax, 9
	imul eax, 14h
	add eax, [esp+160h]
	mov esi, [eax+0Ch]
	cmp edx, esi
	jg loc_4141A0

loc_413EA3:
	mov dword [esp+18Ch], 1
	mov edx, [esp+18Eh]
	sar edx, 10h
	mov eax, [esp+16Ch]
	add edx, edx
	add edx, eax
	movsx eax, word [edx]
	imul eax, 684h
	mov ecx, [esp+164h]
	add eax, ecx
	mov eax, [eax+234h]
	mov [esp+14Ch], eax
	movsx eax, word [edx]
	imul eax, 684h
	add eax, ecx
	mov eax, [eax+21Ch]
	mov ax, [eax]
	mov esi, dword [dword_512230]
	mov [esp+14Ah], ax
	cmp esi, 1
	jnz loc_4141BD
	mov word [esp+150h], 1

loc_413F17:
	mov edi, [esp+182h]
	sar edi, 10h
	add edi, 9
	imul edi, 14h
	mov eax, [esp+160h]
	mov ecx, 14h
	lea esi, [esp+140h]
	add edi, eax
	mov ebx, [esp+184h]
	push edi
	mov eax, ecx
	shr ecx, 2
	rep movsd
	mov cl, al
	and cl, 3
	rep movsb
	pop edi

loc_413F53:
	mov edx, [esp+182h]
	sar edx, 10h
	movsx eax, bx
	lea esi, [edx+9]
	cmp eax, esi
	jle loc_4141E4
	lea ebx, [esp+12Ch]
	lea edx, [esp+104h]
	mov eax, 0Ah
	call sub_41B2D0
	xor eax, eax

loc_413F85:
	movsx edx, ax
	cmp word [esp+edx*2+12Ch], 9
	jnz loc_413F9E
	mov edx, eax
	inc edx
	mov [esp+188h], dx

loc_413F9E:
	inc eax
	cmp ax, 0Ah
	jl loc_413F85
	mov ebx, [esp+16Ch]
	xor eax, eax

loc_413FAE:
	mov edx, [esp+18Eh]
	sar edx, 10h
	movsx esi, ax
	add edx, edx
	mov esi, [esp+esi*2+12Ah]
	add edx, ebx
	sar esi, 10h
	movsx edx, word [edx]
	cmp esi, edx
	jnz loc_414221
	mov esi, [esp+174h]
	shl edx, 2
	mov eax, [esp+186h]
	add edx, esi
	sar eax, 10h
	mov [edx], eax

loc_413FEC:
	cmp word [esp+188h], 1
	jnz loc_41427E
	mov edi, dword [dword_512208]
	cmp edi, 1
	jnz loc_414245
	cmp edi, dword [dword_512264]
	jge loc_414245
	mov eax, [esp+18Eh]
	sar eax, 10h
	mov esi, [esp+16Ch]
	add eax, eax
	add eax, esi
	mov cx, [eax]
	test cx, cx
	jnz loc_414231
	mov eax, aC04 ; "c04"

loc_41403C:
	call sub_403480

loc_414041:
	mov eax, [esp+18Eh]
	sar eax, 10h
	mov edi, [esp+16Ch]
	add eax, eax
	add eax, edi
	movsx edx, word [eax]
	lea eax, [esp+154h]
	lea esi, [esp+154h]
	call sub_413914
	mov edx, [esp+182h]
	lea edi, [esp+140h]
	sar edx, 10h
	push edi

loc_41407E:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_414096
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_41407E

loc_414096:
	pop edi
	lea eax, [edx+9]
	imul eax, 14h
	imul edx, 14h
	mov ecx, 14h
	mov edi, [esp+160h]
	lea esi, [esp+140h]
	add edi, eax
	push edi
	mov eax, ecx
	shr ecx, 2
	rep movsd
	mov cl, al
	and cl, 3
	rep movsb
	pop edi
	mov esi, [esp+160h]
	mov ecx, [esp+178h]
	mov edi, [esp+168h]
	add esi, edx
	push edi
	mov eax, ecx
	shr ecx, 2
	rep movsd
	mov cl, al
	and cl, 3
	rep movsb
	pop edi
	xor edx, edx

loc_4140EE:
	mov edi, [esp+182h]
	movsx eax, dx
	sar edi, 10h
	mov esi, [esp+eax*2+12Ah]
	add eax, edi
	imul eax, 14h
	sar esi, 10h
	imul esi, ebp
	mov ecx, [esp+168h]
	mov edi, [esp+160h]
	add esi, ecx
	add edi, eax
	mov ecx, ebp
	inc edx
	push edi
	mov eax, ecx
	shr ecx, 2
	rep movsd
	mov cl, al
	and cl, 3
	rep movsb
	pop edi
	cmp dx, 0Ah
	jl loc_4140EE
	mov eax, [esp+17Ch]
	mov ebx, dword [dword_512208]
	cmp ebx, 1
	jnz loc_413E0A
	xor eax, eax
	mov dword [dword_4D1FFC], ebx
	call sub_403550
	inc word [esp+190h]
	jmp loc_413DBF

loc_41416D:
	cmp edx, dword [dword_51220C]
	jnz loc_413E0A
	test byte [eax+1F4h], 4
	jz loc_413E0A
	cmp dword [eax+280h], 2
	jz loc_413E56
	inc word [esp+190h]
	jmp loc_413DBF

loc_4141A0:
	test esi, esi
	jnz loc_413E0A
	test edx, edx
	jg loc_413EA3
	inc word [esp+190h]
	jmp loc_413DBF

loc_4141BD:
	cmp dword [dword_512204], 1
	jnz loc_4141D5
	mov word [esp+150h], 2
	jmp loc_413F17

loc_4141D5:
	xor ebx, ebx
	mov [esp+150h], bx
	jmp loc_413F17

loc_4141E4:
	imul esi, eax, 14h
	add esi, [esp+160h]
	mov edi, eax
	sub edi, edx
	lea edx, 0[edi*4]
	mov esi, [esi+0Ch]
	mov [esp+edx+104h], esi
	test esi, esi
	jz loc_41420D
	inc ebx
	jmp loc_413F53

loc_41420D:
	inc eax
	imul eax, 23280h
	mov [esp+edx+104h], eax
	inc ebx
	jmp loc_413F53

loc_414221:
	inc eax
	cmp ax, 0Ah
	jl loc_413FAE
	jmp loc_413FEC

loc_414231:
	cmp cx, 1
	jnz loc_414041
	mov eax, aC05 ; "c05"
	jmp loc_41403C

loc_414245:
	cmp dword [dword_512208], 2
	jl loc_414274
	mov eax, [esp+18Eh]
	sar eax, 10h
	mov ecx, [esp+16Ch]
	add eax, eax
	add eax, ecx
	mov ebx, dword [dword_51220C]
	movsx eax, word [eax]
	cmp eax, ebx
	jnz loc_414041

loc_414274:
	mov eax, aC03 ; "c03"
	jmp loc_41403C

loc_41427E:
	mov edi, dword [dword_512208]
	cmp edi, 1
	jnz loc_4142CC
	cmp edi, dword [dword_512264]
	jge loc_4142CC
	mov eax, [esp+18Eh]
	sar eax, 10h
	mov esi, [esp+16Ch]
	add eax, eax
	add eax, esi
	mov dx, [eax]
	test dx, dx
	jnz loc_4142B8
	mov eax, aC07 ; "c07"
	jmp loc_41403C

loc_4142B8:
	cmp dx, 1
	jnz loc_414041
	mov eax, aC08 ; "c08"
	jmp loc_41403C

loc_4142CC:
	cmp dword [dword_512208], 2
	jl loc_4142FB
	mov eax, [esp+18Eh]
	sar eax, 10h
	mov ecx, [esp+16Ch]
	add eax, eax
	add eax, ecx
	mov ebx, dword [dword_51220C]
	movsx eax, word [eax]
	cmp eax, ebx
	jnz loc_414041

loc_4142FB:
	mov eax, aC06 ; "c06"
	jmp loc_41403C

loc_414305:
	cmp word [esp+18Ch], 1
	jnz loc_4143A6
	mov esi, aCNfs2seFront_4 ; "c:\\nfs2se\\frontend\\common\\Statchk.c"
	mov edi, 2CAh
	mov edx, 26Ch
	mov eax, aRecord ; "record"
	mov ecx, 26Ch
	xor ebx, ebx
	mov dword [dword_4DB1D8], esi
	mov dword [dword_4DB1DC], edi
	call sub_484498
	lea esi, [esp+160h]
	mov edi, eax
	mov ebp, eax
	push edi
	mov eax, ecx
	shr ecx, 2
	rep movsd
	mov cl, al
	and cl, 3
	rep movsb
	pop edi
	mov eax, dword [dword_51221C]
	lea edx, [esp+8]
	call sub_41A3A0
	cwde
	call sub_41B250
	xor eax, eax

loc_414371:
	inc eax
	cmp ax, 1Fh
	jl loc_414371
	mov ebx, 26Ch
	mov edx, [esp+160h]
	lea eax, [esp+8]
	call sub_4875B0
	test eax, eax
	jnz loc_41439B
	mov eax, 2F3h
	call sub_402CD0

loc_41439B:
	test ebp, ebp
	jz loc_4143A6
	mov eax, ebp
	call sub_4848FC

loc_4143A6:
	mov edx, [esp+168h]
	test edx, edx
	jz loc_4143B8
	mov eax, edx
	call sub_4848FC

loc_4143B8:
	mov ecx, [esp+16Ch]
	test ecx, ecx
	jz loc_4143CA
	mov eax, ecx
	call sub_4848FC

loc_4143CA:
	mov ebx, [esp+170h]
	test ebx, ebx
	jz loc_4143DC
	mov eax, ebx
	call sub_4848FC

loc_4143DC:
	mov esi, [esp+160h]
	test esi, esi
	jz loc_4143EE
	mov eax, esi
	call sub_4848FC

loc_4143EE:
	mov eax, [esp+18Ch]
	pop esi
	pop edi
	add esp, 18Ch
	pop ebp
	pop ecx
	ret
;sub_413BF0 endp

sub_414400: ;SUBROUTINE
	push ebp
	sub esp, 148h
	mov [esp+138h], eax
	mov [esp+13Ch], bx
	mov [esp+144h], cx
	mov eax, [esp+13Ah]
	sar eax, 10h
	imul eax, 684h
	xor edx, edx
	mov [esp+140h], edx
	mov dword [esp+134h], 14h
	mov edx, [esp+138h]
	add edx, eax
	xor eax, eax
	mov [esp+130h], edx
	mov al, byte [byte_512DBD]
	mov edx, [edx+21Ch]
	add eax, 0Ch
	cmp eax, [edx]
	jle loc_414481
	cmp byte [byte_512DAA], 3
	jz loc_414481
	cmp byte [byte_512DD0], 1
	jz loc_414481
	cmp byte [byte_512DEB], 1
	jnz loc_41448B

loc_414481:
	xor eax, eax
	add esp, 148h
	pop ebp
	ret

loc_41448B:
	push edi
	push esi
	mov ebx, aCNfs2seFront_4 ; "c:\\nfs2se\\frontend\\common\\Statchk.c"
	mov esi, 125h
	mov edx, 280h
	mov eax, aTrkrcrds ; "trkrcrds"
	mov dword [dword_4DB1D8], ebx
	mov ebx, 20h
	mov dword [dword_4DB1DC], esi
	call sub_484498
	mov esi, eax
	mov ebp, eax
	mov eax, dword [dword_51221C]
	mov ecx, 14h
	call sub_41A3A0
	mov edx, esi
	cwde
	lea edi, [esp+104h]
	call sub_41B040
	push edi
	mov eax, ecx
	shr ecx, 2
	rep movsd
	mov cl, al
	and cl, 3
	rep movsb
	pop edi
	mov eax, [esp+138h]
	mov eax, [eax+21Ch]
	mov ax, [eax]
	mov [esp+122h], ax
	mov eax, [esp+14Ah]
	sar eax, 10h
	mov edi, [esp+138h]
	shl eax, 2
	add eax, edi
	mov eax, [eax+238h]
	mov [esp+124h], eax
	cmp dword [dword_512230], 1
	jnz loc_4145CE
	mov word [esp+128h], 1

loc_41453B:
	mov ecx, dword [dword_512208]
	cmp ecx, 1
	jnz loc_414609
	cmp ecx, dword [dword_512264]
	jge loc_414609
	mov edi, [esp+144h]
	test di, di
	jnz loc_4145F5
	mov eax, aC10 ; "c10"

loc_41456B:
	call sub_403480

loc_414570:
	mov eax, dword [dword_5121FC]
	cmp eax, 2
	jnz loc_414634
	mov esi, 1

loc_414583:
	mov edx, esi

loc_414585:
	movsx ecx, si
	movsx eax, dx
	add ecx, 9
	cmp eax, ecx
	jge loc_41465E
	mov ecx, [esp+142h]
	sar ecx, 10h
	imul ecx, 684h
	mov ebx, [esp+140h]
	add ebx, ecx
	mov ecx, eax
	shl eax, 2
	add eax, ecx
	shl eax, 2
	lea ecx, [eax+ebp]
	mov eax, [ebx+234h]
	cmp eax, [ecx+0Ch]
	jz loc_41464D
	inc edx
	jmp loc_414585

loc_4145CE:
	cmp dword [dword_512204], 1
	jnz loc_4145E6
	mov word [esp+128h], 2
	jmp loc_41453B

loc_4145E6:
	xor ebx, ebx
	mov [esp+128h], bx
	jmp loc_41453B

loc_4145F5:
	cmp di, 1
	jnz loc_414570
	mov eax, aC11 ; "c11"
	jmp loc_41456B

loc_414609:
	cmp dword [dword_512208], 2
	jl loc_41462A
	mov eax, [esp+142h]
	mov edi, dword [dword_51220C]
	sar eax, 10h
	cmp eax, edi
	jnz loc_414570

loc_41462A:
	mov eax, aC09 ; "c09"
	jmp loc_41456B

loc_414634:
	cmp eax, 4
	jnz loc_414643
	mov esi, 0Bh
	jmp loc_414583

loc_414643:
	mov esi, 15h
	jmp loc_414583

loc_41464D:
	mov dword [esp+148h], 1
	inc edx
	jmp loc_414585

loc_41465E:
	cmp word [esp+148h], 0
	jnz loc_414700
	mov edx, [esp+142h]
	lea eax, [esp+12Ch]
	lea esi, [esp+12Ch]
	sar edx, 10h
	lea edi, [esp+118h]
	call sub_413914

loc_414691:
	push edi

loc_414692:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_4146AA
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_414692

loc_4146AA:
	pop edi
	mov ecx, [esp+13Ch]
	lea esi, [esp+118h]
	mov edi, ebp
	mov edx, [esp+13Ch]
	push edi
	mov eax, ecx
	shr ecx, 2
	rep movsd
	mov cl, al
	and cl, 3
	rep movsb
	pop edi
	mov ecx, 1
	jmp loc_414726

loc_4146E9:
	test ebp, ebp
	jz loc_4146F4
	mov eax, ebp
	call sub_4848FC

loc_4146F4:
	mov eax, ecx
	pop esi
	pop edi
	add esp, 148h
	pop ebp
	ret

loc_414700:
	mov edx, [esp+142h]
	sar edx, 10h
	lea eax, 0[edx*8]
	mov esi, byte_512E84
	add eax, edx
	lea edi, [esp+118h]
	add esi, eax
	jmp loc_414691

loc_414726:
	mov eax, dword [dword_51221C]
	lea edx, [esp+8]
	call sub_41A3A0
	cwde
	mov ebx, 26Ch
	call sub_41B250
	lea eax, [esp+8]
	mov edx, ebp
	call sub_4875B0
	test eax, eax
	jnz loc_4146E9
	mov eax, 2F3h
	call sub_402CD0
	jmp loc_4146E9
;sub_414400 endp

sub_414760: ;SUBROUTINE
	push esi
	push edi
	push ebp
	sub esp, 8Ch
	mov esi, eax
	mov edi, edx
	mov [esp+74h], ebx
	mov [esp+70h], ecx
	xor edx, edx
	mov [esp+84h], edx
	mov edx, dword [dword_4E5508]
	mov ecx, 14h
	cmp edx, 1
	jz loc_4147A9
	cmp byte [byte_512DAA], 3
	jz loc_4147A9
	cmp byte [byte_512DD0], 1
	jz loc_4147A9
	cmp byte [byte_512DEB], 1
	jnz loc_4147BA

loc_4147A9:
	mov eax, [esp+84h]
	add esp, 8Ch
	pop ebp
	pop edi
	pop esi
	ret

loc_4147BA:
	mov eax, esi
	call sub_41A240
	mov ebx, dword [dword_512208]
	cmp ebx, 2
	jl loc_41482F
	imul edx, dword [dword_51220C], 684h
	cmp dword [edx+esi+280h], 2
	jz loc_4147E2
	xor eax, eax

loc_4147E2:
	imul edx, dword [dword_51220C], 684h
	mov ebx, [edx+esi+21Ch]
	xor edx, edx
	mov dl, byte [byte_512DBD]
	mov ebp, [ebx]
	add edx, 0Ch
	cmp edx, ebp
	jg loc_414806
	xor eax, eax

loc_414806:
	imul edx, dword [dword_51220C], 684h
	test byte [edx+esi+1F4h], 4
	jnz loc_4148A2
	mov eax, [esp+84h]
	add esp, 8Ch
	pop ebp
	pop edi
	pop esi
	ret

loc_41482F:
	cmp ebx, 1
	jnz loc_41485F
	cmp ebx, dword [dword_512264]
	jge loc_41485F
	cmp dword [esi+280h], 2
	jz loc_4148A2
	cmp dword [esi+904h], 2
	jz loc_4148A2
	mov eax, [esp+84h]
	add esp, 8Ch
	pop ebp
	pop edi
	pop esi
	ret

loc_41485F:
	mov ebx, dword [dword_512208]
	cmp ebx, 1
	jnz loc_41488C
	cmp ebx, dword [dword_512264]
	jnz loc_41488C
	cmp dword [esi+280h], 2
	jz loc_4148A2
	mov eax, [esp+84h]
	add esp, 8Ch
	pop ebp
	pop edi
	pop esi
	ret

loc_41488C:
	cmp dword [dword_512264], 1
	jnz loc_4148A2
	cmp dword [esi+280h], 2
	jnz loc_4147A9

loc_4148A2:
	cmp ax, 1
	jnz loc_4147A9
	mov ebp, aCNfs2seFront_4 ; "c:\\nfs2se\\frontend\\common\\Statchk.c"
	mov eax, 96h
	mov ebx, 20h
	mov edx, dword [dword_5121FC]
	movsx edi, di
	shl edx, 2
	mov dword [dword_4DB1DC], eax
	mov eax, aBestlaps ; "bestlaps"
	mov dword [dword_4DB1D8], ebp
	call sub_484498
	mov ebx, 20h
	mov edx, dword [dword_5121FC]
	mov [esp+80h], eax
	mov dword [dword_4DB1D8], ebp
	mov ebp, 98h
	mov eax, aRankspd ; "rankspd"
	add edx, edx
	mov dword [dword_4DB1DC], ebp
	call sub_484498
	mov edx, 99h
	mov ebx, 20h
	mov [esp+6Ch], eax
	mov eax, aCNfs2seFront_4 ; "c:\\nfs2se\\frontend\\common\\Statchk.c"
	mov dword [dword_4DB1DC], edx
	mov dword [dword_4DB1D8], eax
	lea edx, 0[edi*4]
	mov eax, aRanklap ; "ranklap"
	mov ebp, 9Ah
	call sub_484498
	mov ebx, aCNfs2seFront_4 ; "c:\\nfs2se\\frontend\\common\\Statchk.c"
	mov [esp+78h], eax
	lea edx, [edi+edi]
	mov eax, aRankbst ; "rankbst"
	mov dword [dword_4DB1D8], ebx
	mov ebx, 20h
	mov dword [dword_4DB1DC], ebp
	call sub_484498
	mov edx, 9Bh
	mov ebx, 20h
	mov [esp+7Ch], eax
	mov eax, aCNfs2seFront_4 ; "c:\\nfs2se\\frontend\\common\\Statchk.c"
	mov dword [dword_4DB1DC], edx
	mov dword [dword_4DB1D8], eax
	mov edx, ecx
	mov eax, aTrkrcrds ; "trkrcrds"
	shl edx, 5
	call sub_484498
	mov ebx, dword [dword_512208]
	mov ebp, eax
	cmp ebx, 1
	jz loc_414A9C
	mov ax, word [dword_51220C]
	mov [esp+88h], ax
	mov ebx, esp
	mov edx, [esp+86h]
	mov eax, esi
	sar edx, 10h

loc_4149C0:
	call sub_41A040

loc_4149C5:
	mov ebx, eax

loc_4149C7:
	mov eax, [esp+86h]
	sar eax, 10h
	imul eax, 684h
	add esi, eax
	movsx eax, bx
	mov eax, [esi+eax*4+238h]
	lea edi, [esp+50h]
	mov [esp+68h], eax
	mov eax, dword [dword_51221C]
	mov edx, ebp
	call sub_41A3A0
	cwde
	mov esi, ebp
	call sub_41B040
	push edi
	mov eax, ecx
	shr ecx, 2
	rep movsd
	mov cl, al
	and cl, 3
	rep movsb
	pop edi
	mov eax, [esp+68h]
	mov edx, [esp+5Ch]
	cmp eax, edx
	jg loc_414B88

loc_414A1F:
	mov dword [esp+84h], 1

loc_414A2A:
	mov edx, [esp+74h]
	mov eax, [esp+88h]
	mov [edx], ax
	mov eax, [esp+70h]
	mov [eax], bx
	test ebp, ebp
	jz loc_414A4A
	mov eax, ebp
	call sub_4848FC

loc_414A4A:
	mov edi, [esp+7Ch]
	test edi, edi
	jz loc_414A59
	mov eax, edi
	call sub_4848FC

loc_414A59:
	mov ebp, [esp+78h]
	test ebp, ebp
	jz loc_414A68
	mov eax, ebp
	call sub_4848FC

loc_414A68:
	mov eax, [esp+6Ch]
	test eax, eax
	jz loc_414A75
	call sub_4848FC

loc_414A75:
	mov edx, [esp+80h]
	test edx, edx
	jz loc_4147A9
	mov eax, edx
	call sub_4848FC
	mov eax, [esp+84h]
	add esp, 8Ch
	pop ebp
	pop edi
	pop esi
	ret

loc_414A9C:
	cmp ebx, ebx
	jnz loc_414AAC
	cmp ebx, dword [dword_512264]
	jz loc_414B2D

loc_414AAC:
	mov edx, [esi+280h]
	cmp edx, 2
	jnz loc_414AC3
	cmp edx, [esi+904h]
	jnz loc_414B49

loc_414AC3:
	cmp dword [esi+280h], 2
	jz loc_414AD9
	cmp dword [esi+904h], 2
	jz loc_414B5E

loc_414AD9:
	mov ebx, esp
	mov eax, esi
	xor edx, edx
	call sub_41A040
	mov ebx, esp
	mov edx, 1
	mov edi, eax
	mov eax, esi
	call sub_41A040
	movsx edx, di
	shl edx, 2
	lea ebx, [esi+edx]
	movsx edx, ax
	shl edx, 2
	mov [esp+64h], ebx
	lea ebx, [esi+edx]
	mov edx, [esp+64h]
	mov edx, [edx+238h]
	cmp edx, [ebx+8BCh]
	jge loc_414B79
	xor eax, eax
	mov ebx, edi
	mov [esp+88h], ax
	jmp loc_4149C7

loc_414B2D:
	mov ebx, esp
	mov eax, esi
	xor edx, edx
	call sub_41A040
	xor edi, edi
	mov ebx, eax
	mov [esp+88h], di
	jmp loc_4149C7

loc_414B49:
	mov eax, esi
	xor ebx, ebx
	xor edx, edx
	mov [esp+88h], bx
	mov ebx, esp
	jmp loc_4149C0

loc_414B5E:
	mov edx, 1
	mov ebx, esp
	mov eax, esi
	mov [esp+88h], dx
	mov edx, 1
	jmp loc_4149C0

loc_414B79:
	mov word [esp+88h], 1
	jmp loc_4149C5

loc_414B88:
	test edx, edx
	jnz loc_414A2A
	test eax, eax
	jg loc_414A1F
	jmp loc_414A2A
;sub_414760 endp

dword_414BD0: dd 0Dh
	times 2 dd 4Ch
off_414C00: dd aMac_2
	dd aFerr_0 ; "ferr"
	dd aFerr_0 ; "ferr"
	dd aGt90_0 ; "gt90"
	dd aIndigo_0 ; "indigo"
	dd aMus_1 ; "mus"
	dd aJag_1 ; "jag"
	dd aGt1_0 ; "gt1"
	dd aLotus_0 ; "lotus"
	dd aNazca_0 ; "nazca"
	dd aItal_0 ; "ital"
	dd aIsdera_0 ; "isdera"
off_414C30: dd aEcon
	dd aGcon ; "gcon"
	dd aFcon ; "fcon"
	dd aScon ; "scon"
	dd aIcon ; "icon"
	dd aWcon ; "wcon"
off_414C48: dd aMcf1_0
	dd aFf50 ; "ff50"
	dd aF355_0 ; "f355"
	dd aFgt9 ; "fgt9"
	dd aFind ; "find"
	dd aFmus ; "fmus"
	dd aJagr ; "jagr"
	dd aLgt1 ; "lgt1"
	dd aLesp ; "lesp"
	dd aNazc ; "nazc"
	dd aCala ; "cala"
	dd aIsde ; "isde"
	dd aBbfs ; "bbfs"
	dd aDayt ; "dayt"
	dd aFzr2 ; "fzr2"
dword_414C84: dd 41h
	times 2 dd 0
	times 4 dd 3Ch
	times 2 dd 0
	times 2 dd 46h
	dd 0
dword_414CB4: times 7 dd 0
	times 2 dd 0FFFFFFF6h
	times 6 dd 0

sub_414CF0: ;SUBROUTINE
	push ecx
	push esi
	push edi
	sub esp, 30h
	mov ecx, 0Ch
	mov edi, esp
	mov esi, dword_414CB4
	rep movsd
	cmp ax, 0Ch
	jge loc_414D1A
	test ax, ax
	jl loc_414D1A
	cwde
	mov eax, [esp+eax*4]
	add esp, 30h
	pop edi
	pop esi
	pop ecx
	ret

loc_414D1A:
	xor eax, eax
	add esp, 30h
	pop edi
	pop esi
	pop ecx
	ret
;sub_414CF0 endp

sub_414D30: ;SUBROUTINE
	push ecx
	push esi
	push edi
	sub esp, 30h
	mov ecx, 0Ch
	mov edi, esp
	mov esi, dword_414C84
	rep movsd
	cmp ax, 0Ch
	jge loc_414D5A
	test ax, ax
	jl loc_414D5A
	cwde
	mov eax, [esp+eax*4]
	add esp, 30h
	pop edi
	pop esi
	pop ecx
	ret

loc_414D5A:
	xor eax, eax
	add esp, 30h
	pop edi
	pop esi
	pop ecx
	ret
;sub_414D30 endp

sub_414D70: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 10h
	mov ecx, eax
	mov ebx, edx
	call sub_41A020
	mov edx, 1
	mov [esp+4], ax
	sub eax, edx
	mov [esp+8], dx
	mov [esp+0Ch], eax
	mov ebp, 4

loc_414D9B:
	mov edx, [esp+2]
	mov esi, [esp+6]
	sar edx, 10h
	sar esi, 10h
	dec edx
	cmp esi, edx
	jge loc_414E72
	mov eax, [esp+0Ch]

loc_414DB6:
	mov esi, [esp+6]
	movsx edx, ax
	sar esi, 10h
	cmp edx, esi
	jge loc_414DCB
	inc word [esp+8]
	jmp loc_414D9B

loc_414DCB:
	add edx, edx
	lea esi, [ebx+edx]
	movsx edx, word [esi-2]
	mov [esp], edx
	mov edi, edx
	mov edx, dword [dword_4D76B8]
	movsx esi, word [esi]
	mov edi, [edx+edi*2+2AEh]
	mov edx, [edx+esi*2+2AEh]
	sar edi, 10h
	sar edx, 10h
	cmp edx, edi
	jz loc_414DFD

loc_414DFA:
	dec eax
	jmp loc_414DB6

loc_414DFD:
	imul esi, 684h
	imul edx, [esp], 684h
	add edx, ecx
	lea edi, [ecx+esi]
	mov esi, [edx+278h]
	cmp esi, [edi+278h]
	jge loc_414E40
	test [edx+1F4h], ebp
	jz loc_414E40

loc_414E25:
	movsx edx, ax
	mov si, [ebx+edx*2]
	mov di, [ebx+edx*2-2]
	mov [ebx+edx*2-2], si
	mov [ebx+edx*2], di
	dec eax
	jmp loc_414DB6

loc_414E40:
	movsx edx, ax
	add edx, edx
	add edx, ebx
	movsx esi, word [edx]
	imul esi, 684h
	test [ecx+esi+1F4h], ebp
	jnz loc_414DFA
	movsx edx, word [edx-2]
	imul edx, 684h
	test [ecx+edx+1F4h], ebp
	jnz loc_414E25
	dec eax
	jmp loc_414DB6

loc_414E72:
	add esp, 10h
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_414D70 endp

sub_414E80: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	mov esi, eax
	mov ecx, edx
	call sub_41A020
	mov edx, dword [dword_4D76B8]
	cwde
	mov ebx, ecx
	add edx, 2B0h
	call sub_41B470
	mov edx, ecx
	mov eax, esi
	call sub_414D70
	mov ax, [ecx+0Eh]
	movsx edi, ax
	imul ebx, edi, 684h
	add ebx, esi
	mov dx, [ecx+0Ch]
	mov cx, [ecx+0Ah]
	test byte [ebx+1F4h], 4
	jz loc_414EF3
	cmp dword [ebx+280h], 2
	jnz loc_414EF3
	cmp dword [dword_512208], 1
	jnz loc_414F7C
	test ax, ax
	jnz loc_414F6C
	mov eax, aC13 ; "c13"

loc_414EEE:
	call sub_403480

loc_414EF3:
	movsx eax, dx
	imul ebx, eax, 684h
	add ebx, esi
	test byte [ebx+1F4h], 4
	jz loc_414F30
	cmp dword [ebx+280h], 2
	jnz loc_414F30
	cmp dword [dword_512208], 1
	jnz loc_414F9F
	test dx, dx
	jnz loc_414F92
	mov eax, aC16 ; "c16"

loc_414F2B:
	call sub_403480

loc_414F30:
	movsx eax, cx
	imul edx, eax, 684h
	add esi, edx
	test byte [esi+1F4h], 4
	jz loc_414F65
	cmp dword [esi+280h], 2
	jnz loc_414F65
	cmp dword [dword_512208], 1
	jnz loc_414FCE
	test cx, cx
	jz loc_414FB1
	cmp cx, 1
	jz loc_414FBD

loc_414F65:
	xor eax, eax
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_414F6C:
	cmp ax, 1
	jnz loc_414EF3
	mov eax, aC14 ; "c14"
	jmp loc_414EEE

loc_414F7C:
	cmp edi, dword [dword_51220C]
	jnz loc_414EF3
	mov eax, aC12 ; "c12"
	jmp loc_414EEE

loc_414F92:
	cmp dx, 1
	jnz loc_414F30
	mov eax, aC17 ; "c17"
	jmp loc_414F2B

loc_414F9F:
	cmp eax, dword [dword_51220C]
	jnz loc_414F30
	mov eax, aC15 ; "c15"
	jmp loc_414F2B

loc_414FB1:
	mov eax, aC19 ; "c19"
	call sub_403480
	jmp loc_414F65

loc_414FBD:
	mov eax, aC20 ; "c20"
	call sub_403480
	xor eax, eax
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_414FCE:
	cmp eax, dword [dword_51220C]
	jnz loc_414F65
	mov eax, aC18 ; "c18"
	call sub_403480
	xor eax, eax
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_414E80 endp

sub_414FF0: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	sub esp, 4
	mov edi, eax
	call sub_41A020
	mov [esp], ax
	xor esi, esi
	xor ebx, ebx
	xor eax, eax

loc_415008:
	mov ecx, [esp-2]
	movsx edx, ax
	sar ecx, 10h
	cmp edx, ecx
	jge loc_415045
	imul edx, 684h
	add edx, edi
	cmp dword [edx+278h], 1
	jz loc_41502A

loc_415027:
	inc eax
	jmp loc_415008

loc_41502A:
	test byte [edx+1F4h], 4
	jz loc_415027
	cmp dword [edx+280h], 2
	jnz loc_415027
	mov esi, 1
	mov ebx, eax
	jmp loc_415027

loc_415045:
	mov ecx, dword [dword_51220C]
	movsx edx, bx
	cmp edx, ecx
	jnz loc_415086
	cmp si, 1
	jnz loc_415086
	cmp dword [dword_512208], 1
	jnz loc_415097
	cmp dword [dword_512264], 2
	jnz loc_415097
	test bx, bx
	jnz loc_41508A
	mov eax, aC25 ; "c25"

loc_415074:
	call sub_403480

loc_415079:
	mov eax, 1

loc_41507E:
	add esp, 4
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_415086:
	xor eax, eax
	jmp loc_41507E

loc_41508A:
	cmp bx, 1
	jnz loc_415079
	mov eax, aC26 ; "c26"
	jmp loc_415074

loc_415097:
	mov eax, aC24 ; "c24"
	call sub_403480
	mov eax, 1
	add esp, 4
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_414FF0 endp

sub_4150B0: ;SUBROUTINE
	push ecx
	push edx
	push esi
	push edi
	mov esi, dword [dword_4D76BC]
	mov edi, eax
	call sub_41A020
	mov ecx, dword [dword_512208]
	xor edx, edx
	cmp ecx, 2
	jl loc_4150FA
	push ebx
	mov esi, dword [dword_4D76BC]
	xor eax, eax
	mov ebx, esi

loc_4150D9:
	movsx ecx, ax
	inc eax
	add dx, [ebx+ecx*2]
	cmp ax, 9
	jl loc_4150D9
	movsx ecx, dx
	mov ax, [edi+ecx*2]
	pop ebx
	mov dword [dword_4D76BC], esi
	pop edi
	pop esi
	pop edx
	pop ecx
	ret

loc_4150FA:
	movsx ecx, ax
	mov esi, dword [dword_4D76BC]
	mov ax, [edi+ecx*2-2]
	mov dword [dword_4D76BC], esi
	pop edi
	pop esi
	pop edx
	pop ecx
	ret
;sub_4150B0 endp

sub_415120: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	mov ecx, eax
	call sub_41A020
	mov eax, edx
	call sub_4150B0
	movsx edx, ax
	imul edx, 684h
	add edx, ecx
	xor ebx, ebx
	mov edi, [edx+280h]
	mov esi, eax
	cmp edi, 2
	jnz loc_41517D
	test byte [edx+1F4h], 4
	jz loc_41517D
	cmp byte [byte_512DA9], 1
	jnz loc_415191
	cmp dword [dword_512264], 1
	jle loc_415191
	test ax, ax
	jnz loc_415184
	mov eax, aC28 ; "c28"

loc_415171:
	call sub_403480

loc_415176:
	mov eax, ebx
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_41517D:
	xor eax, eax
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_415184:
	cmp ax, 1
	jnz loc_415176
	mov eax, aC29 ; "c29"
	jmp loc_415171

loc_415191:
	movsx eax, si
	imul edx, eax, 684h
	test byte [ecx+edx+1F4h], 4
	jz loc_415176
	cmp dword [dword_512208], 2
	jl loc_4151B5
	cmp eax, dword [dword_51220C]
	jnz loc_415176

loc_4151B5:
	mov eax, aC27 ; "c27"
	call sub_403480
	mov eax, ebx
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_415120 endp

sub_4151D0: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 8
	mov ebp, eax
	mov [esp], edx
	call sub_41A020
	mov ecx, dword [dword_512208]
	mov [esp+4], ax
	xor edx, edx
	xor ebx, ebx
	cmp ecx, 2
	jl loc_41524F
	xor eax, eax

loc_4151F8:
	movsx ecx, ax
	lea esi, [ecx+ecx]
	mov ecx, dword [dword_4D76BC]
	mov di, [ecx+esi]
	inc eax
	add edx, edi
	cmp ax, 9
	jl loc_4151F8
	movsx eax, dx
	mov edi, [esp]
	add eax, eax
	add eax, edi
	mov di, [eax]

loc_41521E:
	cmp byte [byte_512DA9], 1
	jnz loc_415329
	xor edx, edx

loc_41522D:
	mov ecx, [esp+2]
	movsx eax, dx
	sar ecx, 10h
	cmp eax, ecx
	jge loc_415270
	imul ecx, eax, 684h
	add ecx, ebp
	test byte [ecx+1F4h], 4
	jnz loc_41525D

loc_41524C:
	inc edx
	jmp loc_41522D

loc_41524F:
	cwde
	mov esi, [esp]
	add eax, eax
	add eax, esi
	mov di, [eax-2]
	jmp loc_41521E

loc_41525D:
	movsx esi, di
	cmp eax, esi
	jz loc_41524C
	cmp dword [ecx+280h], 2
	jnz loc_41524C
	inc ebx
	jmp loc_41524C

loc_415270:
	cmp bx, 1
	jg loc_4152A2
	test bx, bx
	jle loc_415289
	test di, di
	jnz loc_415289
	cmp dword [ebp+904h], 2
	jz loc_4152C9

loc_415289:
	test bx, bx
	jle loc_415297
	cmp dword [ebp+280h], 2
	jz loc_4152F0

loc_415297:
	mov eax, edi
	add esp, 8
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_4152A2:
	mov eax, dword [dword_51221C]
	call sub_41A3A0
	cmp eax, 6
	jnz loc_4152BD
	mov eax, aC37 ; "c37"
	call sub_403480
	jmp loc_415297

loc_4152BD:
	mov eax, aC33 ; "c33"
	call sub_403480
	jmp loc_415297

loc_4152C9:
	mov eax, dword [dword_51221C]
	call sub_41A3A0
	cmp eax, 6
	jnz loc_4152E4
	mov eax, aC36 ; "c36"
	call sub_403480
	jmp loc_415297

loc_4152E4:
	mov eax, aC32 ; "c32"
	call sub_403480
	jmp loc_415297

loc_4152F0:
	mov eax, dword [dword_51221C]
	call sub_41A3A0
	cmp eax, 6
	jnz loc_415314
	mov eax, aC35 ; "c35"
	call sub_403480
	mov eax, edi
	add esp, 8
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_415314:
	mov eax, aC31 ; "c31"
	call sub_403480
	mov eax, edi
	add esp, 8
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_415329:
	cmp dword [dword_512208], 2
	jl loc_4153A0
	mov ecx, dword [dword_51220C]
	movsx eax, di
	cmp eax, ecx
	jz loc_415297
	imul eax, ecx, 684h
	add ebp, eax
	cmp dword [ebp+280h], 2
	jnz loc_415297
	mov eax, [ebp+21Ch]
	cmp dword [eax], 24h
	jz loc_415297
	mov eax, dword [dword_51221C]
	call sub_41A3A0
	cmp eax, 6
	jnz loc_41538B
	mov eax, aC34 ; "c34"
	call sub_403480
	mov eax, edi
	add esp, 8
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_41538B:
	mov eax, aC30 ; "c30"
	call sub_403480
	mov eax, edi
	add esp, 8
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_4153A0:
	test di, di
	jz loc_415297
	cmp dword [ebp+280h], 2
	jnz loc_415297
	mov eax, dword [dword_51221C]
	call sub_41A3A0
	cmp eax, 6
	jnz loc_41538B
	mov eax, aC34 ; "c34"
	call sub_403480
	mov eax, edi
	add esp, 8
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_4151D0 endp

sub_4153E0: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 4
	mov edi, eax
	mov [esp], edx
	mov ebp, dword [dword_51220C]
	xor esi, esi
	xor eax, eax
	xor ebx, ebx

loc_4153F9:
	movsx edx, ax
	mov ecx, [esp]
	add edx, edx
	add edx, ecx
	movsx edx, word [edx]
	imul ecx, edx, 684h
	test byte [ecx+edi+1F4h], 4
	jz loc_415421
	cmp edx, ebp
	jz loc_415421
	mov ebx, 1
	mov esi, eax

loc_415421:
	inc eax
	cmp bx, 1
	jnz loc_4153F9
	mov eax, esi
	add esp, 4
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_4153E0 endp

sub_415440: ;SUBROUTINE
	push ebx
	push ecx
	mov ecx, eax
	mov ebx, edx
	xor eax, eax

loc_415448:
	movsx edx, ax
	movsx edx, word [ebx+edx*2]
	imul edx, 684h
	test byte [ecx+edx+1F4h], 4
	jz loc_415462
	inc eax
	jmp loc_415448

loc_415462:
	pop ecx
	pop ebx
	ret
;sub_415440 endp

sub_415470: ;SUBROUTINE
	mov dl, byte [byte_512ECC]
	cmp dl, 1
	jnz loc_41547F
	or [eax+8], dl
	ret

loc_41547F:
	and byte [eax+8], 0FEh
	ret
;sub_415470 endp

sub_415490: ;SUBROUTINE
	push edx
	mov edx, dword [dword_5121F8]
	cmp edx, 1
	jz loc_4154B3
	cmp edx, 2
	jz loc_4154B3
	cmp byte [byte_512DA9], 1
	jz loc_4154B9
	cmp dword [dword_512264], 2
	jl loc_4154B9

loc_4154B3:
	or byte [eax+8], 1
	pop edx
	ret

loc_4154B9:
	and byte [eax+8], 0FEh
	pop edx
	ret
;sub_415490 endp

sub_4154C0: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 0C8h
	mov [esp+0ACh], eax
	mov ebx, edx
	mov ecx, 1
	mov esi, off_414C30
	xor edx, edx
	xor edi, edi
	xor ebp, ebp
	mov [esp+0B0h], edx
	mov [esp+0C0h], ecx
	mov [esp+0C4h], ecx
	mov [esp+0BCh], edi
	mov ecx, 6
	lea edi, [esp+8Ch]
	mov [esp+0B8h], dx
	mov [esp+0B4h], dx
	rep movsd
	xor edx, edx
	mov ecx, 0Fh
	lea edi, [esp+50h]
	mov esi, off_414C48
	mov [esp+0A8h], edx
	mov [esp+0A4h], edx
	rep movsd
	call sub_41A020
	mov edi, eax
	cmp ax, 2
	jl loc_415594
	xor edx, edx

loc_41554D:
	movsx ecx, di
	movsx eax, dx
	cmp eax, ecx
	jge loc_415594
	imul eax, 684h
	lea esi, [ebx+eax]
	cmp dword [esi+278h], 1
	jz loc_41556C

loc_415569:
	inc edx
	jmp loc_41554D

loc_41556C:
	test byte [esi+1F4h], 4
	jz loc_415569
	cmp dword [esi+280h], 2
	jnz loc_415569
	mov ecx, 1
	mov [esp+0B8h], dx
	mov [esp+0B0h], ecx
	jmp loc_415569

loc_415594:
	cmp word [esp+0B0h], 0
	jz loc_415887
	mov eax, [esp+0B6h]
	mov esi, dword [dword_51220C]
	sar eax, 10h
	cmp eax, esi
	jz loc_4155C4
	cmp dword [dword_512208], 1
	jg loc_415887

loc_4155C4:
	cmp di, 2
	jl loc_415887
	cmp dword [dword_512208], 1
	jnz loc_4155E6
	cmp word [esp+0B8h], 1
	jg loc_415887

loc_4155E6:
	cmp dword [dword_512208], 1
	jg loc_415819

loc_4155F3:
	mov eax, off_4D3DB8
	xor edi, edi
	mov edx, 1
	mov dword [dword_4D2098], edi
	call sub_410E80
	mov eax, ebx
	call sub_4159E0
	mov eax, [esp+0B6h]
	sar eax, 10h
	imul eax, 684h
	mov eax, [ebx+eax+21Ch]
	mov dx, [eax]
	xor ecx, ecx
	mov [esp+0B4h], dx
	mov cl, byte [byte_512DBD]
	mov edx, [esp+0B2h]
	add ecx, 0Ch
	sar edx, 10h
	cmp edx, ecx
	jl loc_41589A

loc_415650:
	xor edi, edi

loc_415652:
	mov ecx, [esp+0A8h]
	cmp edi, ecx
	jnz loc_415831
	call sub_4833C7
	add ebp, eax
	mov eax, [esp+0BCh]
	mov edx, 400h
	inc eax
	mov ebx, ecx
	mov [esp+0BCh], eax
	call sub_428A20
	mov eax, aBack_1 ; "back"
	call sub_405B30
	xor edx, edx
	mov eax, [esp+0B2h]
	mov dl, byte [byte_512DBD]
	sar eax, 10h
	add edx, 0Ch
	mov esi, ebp
	cmp eax, edx
	jge loc_4156B8
	mov edx, 400h
	mov eax, esp
	mov ecx, edi
	mov ebx, edi
	call sub_405B30

loc_4156B8:
	xor eax, eax
	mov edx, 2800h
	mov al, byte [byte_512DFB]
	mov ecx, edi
	mov ebx, edi
	mov eax, [esp+eax*4+8Ch]
	call sub_405B30
	call sub_415CC0
	mov eax, dword [dword_4D4D24]
	mov eax, [eax+20h]
	call sub_426B70
	cmp byte [byte_512ECC], 1
	jnz loc_4158B8
	mov eax, 12h
	mov ecx, edi
	mov ebx, edi
	mov edx, esi

loc_4156FE:
	call sub_4274F0

loc_415703:
	mov ebx, [esp+0BCh]
	call sub_4976B8
	cmp bx, 11h
	jl loc_415731
	mov eax, edi
	call sub_489800
	mov eax, edi
	call sub_403550
	mov eax, edi
	call sub_489800

loc_415731:
	cmp byte [byte_512ECC], 1
	jz loc_415741
	mov eax, edi
	call sub_489800

loc_415741:
	call sub_405960
	mov bl, byte [byte_512ECC]
	mov edx, eax
	cmp bl, 1
	jz loc_41575A
	mov eax, edi
	call sub_489800

loc_41575A:
	test dx, dx
	jz loc_4158EF
	cmp ebp, [esp+0A4h]
	jle loc_4158EF

loc_415770:
	lea eax, [ebp+0Fh]
	mov [esp+0A4h], eax
	mov eax, [esp+0ACh]
	mov edx, 0Dh
	mov bh, byte [byte_512ECC]
	mov [eax+0Ah], di
	cmp bh, 1
	jz loc_41579C
	mov eax, edi
	call sub_489800

loc_41579C:
	mov eax, [esp+0ACh]
	movsx edx, dx
	call sub_410414
	mov cl, byte [byte_512ECC]
	mov [esp+0A8h], eax
	cmp cl, 1
	jz loc_4157C4
	mov eax, edi
	call sub_489800

loc_4157C4:
	mov esi, [esp+0C0h]
	cmp si, 1
	jnz loc_415652
	cmp word [esp+0BCh], 11h
	jl loc_415652
	cmp byte [byte_512ECC], 1
	jz loc_415652
	mov edx, [esp+0C4h]
	mov [esp+0C0h], edi
	cmp dx, si
	jz loc_41590E

loc_415808:
	mov eax, edi
	call sub_489800
	call sub_4833C7
	jmp loc_415652

loc_415819:
	mov eax, [esp+0B6h]
	mov esi, dword [dword_51220C]
	sar eax, 10h
	cmp eax, esi
	jz loc_4155F3

loc_415831:
	cmp byte [byte_512ECC], 1
	jz loc_41585A
	xor eax, eax
	mov edi, 1
	call sub_489800
	xor eax, eax
	mov dword [dword_4D1FFC], edi
	call sub_403550
	xor eax, eax
	call sub_489800

loc_41585A:
	cmp word [esp+0B4h], 0Ch
	jge loc_415882
	cmp byte [byte_512ECC], 1
	jnz loc_415992
	mov eax, 12h
	xor ecx, ecx
	xor ebx, ebx
	xor edx, edx

loc_41587D:
	call sub_4274F0

loc_415882:
	call sub_4159C0

loc_415887:
	mov eax, [esp+0B0h]
	add esp, 0C8h
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_41589A:
	mov eax, [eax]
	mov edx, [esp+eax*4+50h]
	push edx
	push aS_4 ; "%s"
	lea eax, [esp+8]
	push eax
	call sprintf_
	add esp, 0Ch
	jmp loc_415650

loc_4158B8:
	cmp word [esp+0B4h], 0Ch
	jge loc_415703
	mov edx, [esp+0B2h]
	sar edx, 10h
	mov eax, edx
	call sub_414D30
	mov ecx, eax
	mov eax, edx
	call sub_414CF0
	mov ebx, eax
	mov edx, esi
	mov eax, 12h
	jmp loc_4156FE

loc_4158EF:
	cmp ebp, 500h
	jle loc_4157C4
	cmp di, [esp+0C0h]
	jz loc_415770
	jmp loc_4157C4

loc_41590E:
	cmp dword [dword_512208], 1
	jnz loc_415970
	mov ebx, [esp+0B8h]
	cmp di, bx
	jz loc_41594E
	cmp bx, dx
	jnz loc_415808
	mov eax, aC02 ; "c02"
	call sub_403480
	mov eax, edi
	call sub_489800
	mov eax, edi
	call sub_489800
	call sub_4833C7
	jmp loc_415652

loc_41594E:
	mov eax, aC01 ; "c01"
	call sub_403480
	mov eax, edi
	call sub_489800
	mov eax, edi
	call sub_489800
	call sub_4833C7
	jmp loc_415652

loc_415970:
	mov eax, aC00 ; "c00"
	call sub_403480
	mov eax, edi
	call sub_489800
	mov eax, edi
	call sub_489800
	call sub_4833C7
	jmp loc_415652

loc_415992:
	mov edx, [esp+0B2h]
	sar edx, 10h
	mov eax, edx
	call sub_414D30
	mov ecx, eax
	mov eax, edx
	call sub_414CF0
	mov ebx, eax
	xor edx, edx
	mov eax, 12h
	jmp loc_41587D
;sub_4154C0 endp

sub_4159C0: ;SUBROUTINE
	push edx
	mov edx, dword [dword_4D4208]
	test edx, edx
	jnz loc_4159CD
	pop edx
	ret

loc_4159CD:
	push ecx
	mov eax, edx
	xor ecx, ecx
	call sub_4848FC
	mov dword [dword_4D4208], ecx
	pop ecx
	pop edx
	ret
;sub_4159C0 endp

sub_4159E0: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 104h
	mov [esp+100h], eax
	mov ecx, 0Ch
	lea edi, [esp+0A0h]
	mov esi, dword_414BD0
	rep movsd
	mov ecx, 0Ch
	lea edi, [esp+0D0h]
	mov esi, off_414C00
	rep movsd
	call sub_41A020
	mov esi, eax
	mov ah, byte [byte_512ECC]
	xor ebp, ebp
	cmp ah, 1
	jnz loc_415A7F
	cmp dx, 2
	jnz loc_415A7F
	mov edx, aOmg6 ; "omg6"
	mov eax, dword [dword_4D40B8]
	mov ecx, 0Dh
	call sub_482EB4
	xor ebx, ebx
	push ebp

loc_415A49:
	mov edx, eax

loc_415A4B:
	xor eax, eax
	call sub_4280B0

loc_415A52:
	mov ebx, dword [dword_4D4208]
	test ebx, ebx
	jz loc_415A6B
	mov eax, ebx
	xor esi, esi
	call sub_4848FC
	mov dword [dword_4D4208], esi

loc_415A6B:
	test ebp, ebp
	jnz loc_415BD7

loc_415A73:
	add esp, 104h
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_415A7F:
	cmp dx, 1
	jnb loc_415AA4
	test dx, dx
	jnz loc_415A52
	mov edx, aOmg6 ; "omg6"
	mov eax, dword [dword_4D40B8]
	mov ecx, 0Dh
	call sub_482EB4
	xor ebx, ebx
	push 0
	jmp loc_415A49

loc_415AA4:
	jbe loc_415B0F
	cmp dx, 2
	jnz loc_415A52
	mov eax, dword [dword_51221C]
	call sub_41A3A0
	movsx ecx, ax
	lea edx, [esp+50h]
	mov eax, ecx
	call sub_41B230
	lea eax, [esp+50h]
	push eax
	mov edx, dword [dword_5134D4]
	push edx
	push aSS_qfs_1 ; "%s%s.qfs"
	lea eax, [esp+0Ch]
	push eax
	call sprintf_
	add esp, 10h
	xor edx, edx
	mov eax, esp
	call sub_488058
	mov edx, aRec6 ; "rec6"
	mov dword [dword_4D4208], eax
	call sub_482EB4
	push 19h
	mov edx, eax
	mov eax, ecx
	xor ebx, ebx
	call sub_419FD0
	movsx ecx, ax
	jmp loc_415A4B

loc_415B0F:
	mov ecx, aCNfs2seFront_3 ; "c:\\nfs2se\\frontend\\common\\Statdisp.c"
	mov ebx, 0CCAh
	mov eax, aDumirank ; "dumirank"
	movsx edx, si
	mov dword [dword_4DB1DC], ebx
	add edx, edx
	mov ebx, 20h
	mov dword [dword_4DB1D8], ecx
	call sub_4844B0
	mov ebp, eax
	test eax, eax
	jz loc_415A73
	xor edx, edx

loc_415B45:
	movsx ecx, si
	movsx eax, dx
	cmp eax, ecx
	jge loc_415B6A
	imul eax, 684h
	add eax, [esp+100h]
	mov eax, [eax+278h]
	mov [ebp+eax*2-2], dx
	inc edx
	jmp loc_415B45

loc_415B6A:
	movsx eax, word [ebp+0]
	imul eax, 684h
	add eax, [esp+100h]
	mov eax, [eax+21Ch]
	mov ax, [eax]
	cmp ax, 0Ch
	jge loc_415BD7
	movsx ecx, ax
	mov edi, [esp+ecx*4+0D0h]
	push edi
	mov eax, dword [dword_5134B4]
	push eax
	push aSS_qfs_1 ; "%s%s.qfs"
	lea eax, [esp+0Ch]
	push eax
	xor edx, edx
	call sprintf_
	add esp, 10h
	mov eax, esp
	xor ebx, ebx
	call sub_488058
	mov edx, aCar6_0 ; "car6"
	mov dword [dword_4D4208], eax
	call sub_482EB4
	push 0
	mov edx, eax
	mov ecx, [esp+ecx*4+0A4h]
	jmp loc_415A4B

loc_415BD7:
	mov eax, ebp
	call sub_4848FC
	add esp, 104h
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_4159E0 endp

sub_415BF0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	mov ah, 1
	mov ebx, 1
	xor edx, edx
	xor cl, cl
	mov byte [byte_4D76C1], ah
	mov byte [byte_4D76C2], ah
	mov byte [byte_4D76C3], ah
	mov byte [byte_4D76C4], ah
	mov byte [byte_4D76C6], cl
	mov byte [byte_4D76C0], ah
	mov word [word_4D4200], dx
	mov word [word_4D4204], bx
	xor ch, ch
	xor al, al
	mov byte [byte_4D76C7], ch
	mov byte [byte_4D76C8], al
	pop edx
	pop ecx
	pop ebx
	ret
;sub_415BF0 endp

sub_415C50: ;SUBROUTINE
	push esi
	push edi
	sub esp, 58h
	mov [esp+50h], dx
	mov [esp+54h], bx
	mov edi, eax
	imul esi, eax, 1Ah
	add esi, ecx

loc_415C66:
	mov edx, [esp+4Eh]
	movsx eax, di
	sar edx, 10h
	cmp eax, edx
	jg loc_415CBA
	cmp byte [byte_512DFB], 2
	jnz loc_415CB2
	push eax
	push aD_3 ; "%d"

loc_415C83:
	lea eax, [esp+8]
	push eax
	call sprintf_
	add esp, 0Ch
	push 2
	mov edx, [esp+56h]
	mov ecx, 12h
	lea eax, [esp+4]
	movsx ebx, si
	push 4
	sar edx, 10h
	inc edi
	call sub_4054E0
	add esi, 1Ah
	jmp loc_415C66

loc_415CB2:
	push eax
	push aD_ ; "%d."
	jmp loc_415C83

loc_415CBA:
	add esp, 58h
	pop edi
	pop esi
	ret
;sub_415C50 endp

sub_415CC0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push 2
	mov ecx, 12h
	push 5
	mov eax, dword [dword_51221C]
	mov ebx, 0BEh
	call sub_41A3A0
	add eax, 40h
	mov edx, 7Ah
	call sub_41B710
	call sub_4054E0
	pop edx
	pop ecx
	pop ebx
	ret
;sub_415CC0 endp

sub_415D00: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	add eax, 295h
	movsx esi, ax
	mov eax, esi
	call sub_41B650
	movsx ebx, ax
	mov eax, 27Eh
	xor ecx, ecx
	call sub_41B670
	movsx edx, ax
	mov eax, esi
	call sub_405580
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_415D00 endp

sub_415D40: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	sub esp, 50h
	call sub_41A3E0
	push eax
	push aS_4 ; "%s"
	lea eax, [esp+8]
	push eax
	call sprintf_
	add esp, 0Ch
	push 2
	push 5
	mov eax, 284h
	call sub_41B650
	sub eax, 18h
	movsx ebx, ax
	mov eax, 27Eh
	mov ecx, 12h
	call sub_41B670
	movsx edx, ax
	lea eax, [esp+8]
	call sub_4054E0
	add esp, 50h
	pop edx
	pop ecx
	pop ebx
	ret
;sub_415D40 endp

sub_415DA0: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	sub esp, 50h
	mov eax, edx
	call sub_41A170
	mov edi, esp
	mov esi, eax
	push edi

loc_415DB3:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_415DCB
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_415DB3

loc_415DCB:
	pop edi
	push 2
	push 5
	mov eax, 2A3h
	call sub_41B650
	movsx ebx, ax
	mov eax, 2A3h
	mov ecx, 12h
	call sub_41B670
	movsx edx, ax
	lea eax, [esp+8]
	call sub_4054E0
	add esp, 50h
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_415DA0 endp

sub_415E00: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	mov esi, eax
	push 5
	push 5
	mov eax, 2A2h
	call sub_41B650
	movsx ebx, ax
	mov eax, 2A2h
	mov ecx, 12h
	call sub_41B670
	movsx edx, ax
	mov eax, esi
	call sub_4054E0
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_415E00 endp

sub_415E40: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	mov edx, 400h
	mov eax, aBack_1 ; "back"
	xor ecx, ecx
	xor ebx, ebx
	call sub_405B30
	pop edx
	pop ecx
	pop ebx
	ret
;sub_415E40 endp

sub_415E60: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push ebp
	sub esp, 4ED8h
	mov ebp, eax
	mov esi, dword [dword_512214]
	xor edx, edx
	xor ecx, ecx
	xor ebx, ebx
	mov [esp+4EB4h], edx
	mov [esp+4EB0h], ecx
	mov [esp+4EB8h], ecx
	xor ebx, ecx
	mov edx, 1
	mov [esp+4EC8h], ebx
	mov [esp+4EC4h], edx
	cmp esi, 2
	jz loc_415F26
	cmp dword [dword_512208], 1
	jg loc_415F37
	mov word [word_4D3B26], 2DDh

loc_415EC2:
	push edi
	mov eax, [ebp+14h]
	xor ebx, ebx
	xor edx, edx
	call sub_415470
	call sub_41A020
	mov [esp+4ED8h], ax
	movsx edx, ax
	lea eax, [esp+4]
	call sub_41A570
	cmp dword [dword_512208], 1
	jg loc_415F42
	xor edi, edi
	mov [esp+4EC4h], di

loc_415EFB:
	xor eax, eax

loc_415EFD:
	mov ecx, [esp+4ED6h]
	movsx edx, ax
	sar ecx, 10h
	cmp edx, ecx
	jge loc_415F52
	imul edx, 684h
	mov edx, [esp+edx+27Ch]
	mov [esp+edx*2+4E9Ah], ax
	inc eax
	jmp loc_415EFD

loc_415F26:
	mov eax, 0FFFFFFFDh
	add esp, 4ED8h
	pop ebp
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_415F37:
	mov word [word_4D3B26], 2DEh
	jmp loc_415EC2

loc_415F42:
	mov ax, word [dword_51220C]
	mov [esp+4EC4h], ax
	jmp loc_415EFB

loc_415F52:
	xor eax, eax

loc_415F54:
	mov ecx, [esp+4ED6h]
	movsx edx, ax
	sar ecx, 10h
	cmp edx, ecx
	jge loc_415F7D
	imul edx, 684h
	mov edx, [esp+edx+27Ch]
	mov [esp+edx*2+4E82h], ax
	inc eax
	jmp loc_415F54

loc_415F7D:
	xor edx, edx
	mov eax, ebp
	mov dword [dword_4D2098], edx
	call sub_410E80
	mov edx, 2
	lea eax, [esp+4]
	mov ecx, [esp+4EB8h]
	call sub_4159E0
	test ecx, ecx
	jnz loc_416323

loc_415FA9:
	call sub_4833C7
	mov edi, [esp+4EBCh]
	mov edx, [esp+4ECCh]
	add edi, eax
	mov eax, 1
	add edx, eax
	mov [esp+4EBCh], edi
	mov [esp+4ECCh], edx
	mov dl, byte [byte_4D76C4]
	mov [esp+4EC0h], edi
	test dl, dl
	jnz loc_41618A
	xor edi, edi
	mov [esp+4EC8h], edi

loc_415FF1:
	test ax, ax
	jz loc_4161DD

loc_415FFA:
	call sub_428A20
	call sub_415E40
	xor eax, eax
	mov edx, 400h
	mov al, byte [byte_512DFB]
	xor ecx, ecx
	xor ebx, ebx
	mov eax, dword off_4D41D0[eax*4]
	call sub_405B30
	call sub_415CC0
	mov eax, 2D8h
	mov edx, [esp+4ED6h]
	call sub_41B650
	movsx ecx, ax
	mov eax, 2D8h
	sar edx, 10h
	call sub_41B670
	movsx ebx, ax
	mov eax, 1
	call sub_415C50
	xor edx, edx
	mov ebx, 1Ah
	mov [esp+4ED0h], dx
	mov [esp+4ED4h], ebx

loc_416069:
	mov edx, [esp+4ED6h]
	mov eax, [esp+4ECEh]
	sar edx, 10h
	sar eax, 10h
	cmp eax, edx
	jge loc_416413
	mov eax, [esp+eax*2+4E9Ah]
	sar eax, 10h
	imul edx, eax, 684h
	test byte [esp+edx+1F8h], 4
	jz loc_416361
	lea eax, [eax+eax*8]
	add eax, byte_512E84
	push eax
	push aS_4 ; "%s"
	lea eax, [esp+4E3Ch]
	push eax
	call sprintf_
	add esp, 0Ch
	push 5
	push 3
	mov eax, 2D9h
	mov edi, [esp+4EDCh]
	call sub_41B650
	add eax, edi

loc_4160D8:
	movsx ebx, ax
	mov eax, 2D9h
	mov ecx, 12h
	call sub_41B670
	movsx edx, ax
	lea eax, [esp+4E3Ch]
	call sub_4054E0
	mov eax, [esp+4ECEh]
	sar eax, 10h
	mov eax, [esp+eax*2+4E9Ah]
	sar eax, 10h
	imul eax, 684h
	cmp dword [esp+eax+284h], 1
	jz loc_4163DF
	cmp word [esp+4ED0h], 0
	jnz loc_4163AB
	mov eax, 2E3h
	mov esi, [esp+4ED4h]
	call sub_41B650
	add eax, esi
	movsx ebx, ax
	mov eax, 2E3h
	call sub_41B670
	add eax, 19h
	xor ecx, ecx
	movsx edx, ax
	mov eax, 2D4h

loc_41615F:
	call sub_405580
	mov eax, [esp+4ED0h]
	mov edi, [esp+4ED4h]
	inc eax
	add edi, 1Ah
	mov [esp+4ED0h], ax
	mov [esp+4ED4h], edi
	jmp loc_416069

loc_41618A:
	cmp ax, [esp+4EC8h]
	jnz loc_415FF1
	cmp word [esp+4ECCh], 0
	jl loc_415FF1
	xor dh, dh
	lea eax, [esp+4]
	mov byte [byte_4D76C4], dh
	lea edx, [esp+4E9Ch]
	xor esi, esi
	call sub_415120
	lea edx, [esp+4E9Ch]
	lea eax, [esp+4]
	mov [esp+4EC8h], esi
	call sub_414FF0
	jmp loc_415FFA

loc_4161DD:
	cmp dword [dword_4D2094], 0
	jnz loc_415FFA
	cmp word [esp+4ECCh], 0
	jz loc_4161FA
	call sub_423B90

loc_4161FA:
	mov eax, ebp
	call sub_423CA0
	call sub_405960
	mov edx, eax
	test ax, ax
	jz loc_416315
	mov ecx, dword [dword_5637F4]
	cmp ecx, [esp+4EB4h]
	jle loc_416315
	mov ebx, [esp+4EC8h]
	test bx, bx
	jnz loc_416315
	mov ecx, dword [dword_5637F4]
	add ecx, 0Fh
	mov [esp+4EB4h], ecx
	cmp ax, 1Bh
	jnz loc_41648D
	mov edx, 0Dh
	mov [ebp+0Ah], bx

loc_416257:
	mov eax, 1
	call sub_41A1A0
	call sub_415BF0
	xor bh, bh
	xor esi, esi
	mov edi, dword [dword_4D76BC]
	mov byte [byte_512DAA], bh
	mov dword [dword_5121F8], esi
	test edi, edi
	jz loc_41629A
	mov eax, dword [dword_51221C]
	call sub_41A3A0
	cmp eax, 7
	jl loc_41629A
	call sub_41A2A0
	mov dword [dword_4D76BC], esi

loc_41629A:
	mov eax, [esp+4EC2h]
	sar eax, 10h
	imul eax, 684h
	cmp dword [esp+eax+27Ch], 1
	jnz loc_4164A7
	cmp dword [esp+eax+284h], 2
	jnz loc_4164A7
	or byte [byte_512DBC], 1

loc_4162CD:
	cmp word [ebp+0Ah], 1
	jnz loc_4162F0
	cmp dx, 0Dh
	jnz loc_4162F0
	xor al, al
	mov byte [byte_4D76C3], al
	mov byte [byte_4D76C1], al
	mov byte [byte_4D76C0], al
	mov byte [byte_4D76C4], al

loc_4162F0:
	cmp word [ebp+0Ah], 2
	jnz loc_416304
	cmp dx, 0Dh
	jnz loc_416304
	call sub_4098D0
	xor edx, edx

loc_416304:
	movsx edx, dx
	mov eax, ebp
	call sub_410414
	mov [esp+4EB8h], eax

loc_416315:
	cmp dword [esp+4EB8h], 0
	jz loc_415FA9

loc_416323:
	mov ebx, 0FFFFFFF6h
	mov eax, 12h
	xor ecx, ecx
	xor edx, edx
	mov esi, 1
	call sub_4274F0
	call sub_4159C0
	xor eax, eax
	mov dword [dword_4D1FFC], esi
	call sub_403550
	mov eax, [esp+4EB8h]
	pop edi
	add esp, 4ED8h
	pop ebp
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_416361:
	lea eax, [esp+4]
	add eax, edx
	lea edi, [esp+4E34h]
	call sub_41A170
	mov esi, eax
	push edi

loc_416376:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_41638E
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_416376

loc_41638E:
	pop edi
	push 2
	push 3
	mov eax, 2D9h
	mov esi, [esp+4EDCh]
	call sub_41B650
	add eax, esi
	jmp loc_4160D8

loc_4163AB:
	mov eax, 2E4h
	mov ecx, [esp+4ED4h]
	call sub_41B650
	add eax, ecx
	movsx ebx, ax
	mov eax, 2E4h
	call sub_41B670
	add eax, 19h
	xor ecx, ecx
	movsx edx, ax
	mov eax, 2E4h
	jmp loc_41615F

loc_4163DF:
	mov eax, 2E3h
	mov edx, [esp+4ED4h]
	call sub_41B650
	add eax, edx
	movsx ebx, ax
	mov eax, 2E3h
	call sub_41B670
	add eax, 19h
	xor ecx, ecx
	movsx edx, ax
	mov eax, 2A5h
	jmp loc_41615F

loc_416413:
	mov eax, ebp
	call sub_40FA90
	mov eax, dword [dword_4D4D24]
	mov ebx, 0FFFFFFF6h
	mov eax, [eax+20h]
	mov edx, [esp+4EC0h]
	call sub_426B70
	mov eax, dword [dword_51221C]
	xor ecx, ecx
	call sub_41A3A0
	mov eax, 12h
	call sub_4274F0
	cmp dword [dword_4D2310], 0
	jz loc_416465
	mov eax, dword [dword_4D4C7C]
	mov edx, dword [dword_4D4C80]
	sub eax, 7
	call sub_4267C0

loc_416465:
	cmp word [esp+4ECCh], 0
	jz loc_416475

loc_416475:
	call sub_4976B8
	xor eax, eax
	call sub_403550
	jmp loc_4161FA

loc_41648D:
	cmp word [ebp+0Ah], 0
	jnz loc_4162CD
	cmp ax, 0Dh
	jz loc_416257
	jmp loc_4162CD

loc_4164A7:
	xor esi, esi
	xor cl, cl
	mov dword [dword_51221C], esi
	mov byte [byte_512DB0], cl
	jmp loc_4162CD
;sub_415E60 endp

sub_4164C0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	sub esp, 14h
	mov [esp+10h], al
	cmp al, 4
	jnz loc_4164F6
	mov ecx, dword [dword_512264]
	xor edx, edx
	test ecx, ecx
	jle loc_4164EE
	lea ebx, [ecx+ecx]
	xor eax, eax
	mov ecx, dword [dword_4D76BC]

loc_4164E7:
	cmp word [ecx+eax], 0
	jz loc_41653D

loc_4164EE:
	cmp edx, dword [dword_512264]
	jz loc_416547

loc_4164F6:
	mov dl, [esp+10h]
	cmp dl, 3
	jnz loc_416573
	cmp dword [dword_51220C], 0
	jz loc_41654B
	cmp dword [dword_512208], 4
	jnz loc_41654B
	cmp word [word_51345A], 0
	jnz loc_416532
	mov edx, 1
	mov word [word_51345C], dx
	mov word [word_51345A], dx

loc_416532:
	mov al, 3

loc_416534:
	add esp, 14h
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_41653D:
	add eax, 2
	inc edx
	cmp eax, ebx
	jl loc_4164E7
	jmp loc_4164EE

loc_416547:
	mov al, 4
	jmp loc_416534

loc_41654B:
	mov cl, 3
	mov edi, 16h
	mov ebx, 4
	mov edx, esp
	xor eax, eax
	mov [esp], cl
	mov [esp+2], di
	call sub_464070
	mov al, cl
	add esp, 14h
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_416573:
	cmp dl, 4
	jnz loc_416657
	cmp word [word_513458], 0
	jnz loc_41664A

loc_41658A:
	mov bl, 3
	mov eax, 2
	lea edx, [esp+4]
	mov [esp+4], bl
	mov [esp+6], ax
	mov eax, 308h
	mov ebx, 4
	call sub_402CD0
	xor eax, eax
	call sub_464070
	mov ebx, 16h
	xor edx, edx

loc_4165BB:
	mov eax, edx
	call sub_483EB0
	mov cx, word [word_51345A]
	cmp dx, cx
	jnz loc_416532
	cmp cx, word [word_513458]
	jz loc_41668E
	mov cx, word [word_51343A]
	cmp bx, cx
	jz loc_416532
	cmp cx, 2
	jnz loc_4165BB

loc_4165F5:
	cmp word [word_513458], 0
	jz loc_4167BC
	cmp byte [esp+10h], 1
	jnz loc_4167A6
	cmp dword [dword_512208], 4
	jnz loc_4166E0
	mov eax, 2
	mov edx, 1

loc_416625:
	mov ecx, dword [dword_513408]
	sar ecx, 10h
	cmp edx, ecx
	jge loc_41676F
	cmp word word_513448[eax], 0
	jnz loc_416744
	inc edx
	add eax, 2
	jmp loc_416625

loc_41664A:
	cmp dword [dword_512208], 4
	jnz loc_41658A

loc_416657:
	cmp byte [esp+10h], 2
	jnz loc_4165F5
	cmp word [word_513458], 0
	jz loc_4166AD
	mov eax, 2
	mov edx, 1
	mov ebx, eax

loc_416674:
	mov ecx, dword [dword_513408]
	sar ecx, 10h
	cmp edx, ecx
	jge loc_4166D5
	inc edx
	add eax, 2
	jmp loc_416674

loc_41668E:
	mov di, word [dword_513428+2]
	cmp bx, di
	jz loc_416532
	cmp di, 1
	jz loc_4165F5
	jmp loc_4165BB

loc_4166AD:
	mov bx, word [dword_513428+2]
	cmp bx, 16h
	jz loc_416532
	cmp bx, 2
	jz loc_4166CA
	cmp bx, 1
	jnz loc_4166D5

loc_4166CA:
	mov al, 4
	add esp, 14h
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4166D5:
	xor al, al
	add esp, 14h
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4166E0:
	mov dx, word [word_51343A]
	cmp dx, 16h
	jz loc_416532
	mov eax, dword [dword_4D76BC]
	cmp word [eax], 0
	jnz loc_4167A6
	cmp dx, 2
	jnz loc_4167A6

loc_41670A:
	mov eax, 308h
	mov edx, 1
	call sub_402CD0
	xor eax, eax
	call sub_463930
	mov edx, 0Fh
	mov eax, 9600h
	call sub_463930
	cmp word [word_51345A], 0
	jz loc_4166CA
	mov al, 3
	add esp, 14h
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_416744:
	mov dl, 3
	mov eax, 16h
	mov ebx, 4
	mov [esp+8], dl
	mov [esp+0Ah], ax
	lea edx, [esp+8]
	xor eax, eax
	call sub_464070
	mov al, 3
	add esp, 14h
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_41676F:
	mov eax, dword [dword_4D76BC]
	cmp word [eax], 0
	jnz loc_4167A6
	mov eax, 2
	mov edx, 1
	mov ebx, eax

loc_416786:
	mov ecx, dword [dword_513408]
	sar ecx, 10h
	cmp edx, ecx
	jge loc_4167A6
	cmp bx, word (dword_513436+2)[eax]
	jz loc_41670A
	inc edx
	add eax, 2
	jmp loc_416786

loc_4167A6:
	cmp byte [esp+10h], 4
	jz loc_41670A

loc_4167B1:
	xor al, al
	add esp, 14h
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4167BC:
	mov ax, word [dword_513428+2]
	cmp ax, 1
	jnz loc_416839

loc_4167C8:
	cmp byte [esp+10h], 4
	jnz loc_416858

loc_4167D3:
	mov eax, 308h
	call sub_402CD0
	mov si, word [dword_513428+2]
	cmp si, 2
	jnz loc_416805
	mov al, 3
	mov ebx, 4
	lea edx, [esp+0Ch]
	mov [esp+0Ch], al
	xor eax, eax
	mov [esp+0Eh], si
	call sub_464070

loc_416805:
	mov edx, 1
	xor eax, eax
	call sub_463930
	mov edx, 0Fh
	mov eax, 9600h
	call sub_463930
	cmp word [word_51345A], 0
	jz loc_4166CA
	mov al, 3
	add esp, 14h
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_416839:
	cmp ax, 2
	jz loc_4167C8

loc_41683F:
	cmp word [dword_513428+2], 16h
	jnz loc_4167B1
	mov al, 3
	add esp, 14h
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_416858:
	mov eax, dword [dword_4D76BC]
	mov edx, dword [dword_51220C]
	cmp word [eax+edx*2], 0
	jz loc_4167D3
	jmp loc_41683F
;sub_4164C0 endp

off_416870: dd loc_416997
	dd loc_416C3A ; jump table for switch statement
	dd loc_416BFF
	dd loc_416BFF
	dd loc_416BFF

sub_416884: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push ebp
	sub esp, 4F0Ch
	mov ebp, eax
	mov esi, dword [dword_512214]
	xor edx, edx
	xor ebx, ebx
	xor ecx, ecx
	mov [esp+4EE0h], edx
	mov [esp+4EF8h], ebx
	mov [esp+4EECh], ecx
	mov [esp+4EE8h], ecx
	mov [esp+4EFCh], ebx
	mov edx, 1
	mov [esp+4F00h], bx
	mov [esp+4EF0h], edx
	cmp esi, 2
	jnz loc_4168EA
	mov eax, 0FFFFFFFDh
	add esp, 4F0Ch
	pop ebp
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4168EA:
	call sub_41A020
	mov [esp+4F04h], ax
	movsx edx, ax
	mov eax, esp
	call sub_41A570
	xor eax, eax

loc_416903:
	mov ecx, [esp+4F02h]
	movsx edx, ax
	sar ecx, 10h
	cmp edx, ecx
	jge loc_416941
	imul ecx, edx, 684h
	lea ebx, 0[edx*4]
	mov edx, [esp+ecx+234h]
	mov [esp+ebx+4E80h], edx
	mov edx, [esp+ecx+278h]
	mov [esp+edx*2+4EAEh], ax
	inc eax
	jmp loc_416903

loc_416941:
	xor eax, eax

loc_416943:
	mov ecx, [esp+4F02h]
	movsx edx, ax
	sar ecx, 10h
	cmp edx, ecx
	jge loc_41696C
	imul edx, 684h
	mov edx, [esp+edx+278h]
	mov [esp+edx*2+4EC6h], ax
	inc eax
	jmp loc_416943

loc_41696C:
	push edi
	mov eax, [ebp+14h]
	xor ebx, ebx
	xor edx, edx
	call sub_415470
	lea eax, [esp+4EB4h]
	call sub_4150B0
	mov edx, dword [dword_512208]
	cmp edx, 4 ; switch 5 cases
	ja loc_416997 ; jumptable 00416990 default case
	jmp off_416870[edx*4] ; switch jump

loc_416997:
	mov edi, dword [dword_51220C] ; jumptable 00416990 default case
	cwde
	cmp eax, edi
	jnz loc_416CA1

loc_4169A6:
	mov word [word_4D3B26], 2DDh

loc_4169AF:
	mov edx, 2
	xor ecx, ecx
	mov eax, ebp
	mov dword [dword_4D2098], ecx
	call sub_410E80
	lea eax, [esp+4]
	call sub_4159E0
	cmp dword [dword_512208], 1
	jle loc_416CCD
	xor eax, eax

loc_4169DB:
	movsx edx, ax
	lea ecx, [edx+edx]
	mov edx, dword [dword_4D76BC]
	mov ebx, [esp+4F04h]
	add bx, [ecx+edx]
	inc eax
	mov [esp+4F04h], bx
	cmp ax, 9
	jl loc_4169DB
	lea eax, [eax+0]

loc_416A04:
	mov esi, [esp+4EE4h]
	test esi, esi
	jnz loc_4171F2
	call sub_4833C7
	mov edx, [esp+4EECh]
	mov ecx, [esp+4F00h]
	mov bh, byte [byte_4D76C4]
	add edx, eax
	mov eax, 1
	mov [esp+4EECh], edx
	add ecx, eax
	mov [esp+4EE8h], edx
	mov [esp+4F00h], ecx
	test bh, bh
	jnz loc_416CE2
	xor edx, edx
	mov [esp+4EF4h], edx

loc_416A5B:
	test ax, ax
	jz loc_416D2F

loc_416A64:
	call sub_428A20
	call sub_415E40
	xor eax, eax
	mov edx, 400h
	mov al, byte [byte_512DFB]
	xor ecx, ecx
	xor ebx, ebx
	mov eax, dword off_4D41B8[eax*4]
	call sub_405B30
	call sub_415CC0
	mov eax, 2D8h
	mov edx, [esp+4F06h]
	call sub_41B650
	movsx ecx, ax
	mov eax, 2D8h
	sar edx, 10h
	call sub_41B670
	movsx ebx, ax
	mov eax, 1
	mov esi, 1Ah
	call sub_415C50
	xor ecx, ecx
	mov [esp+4EF8h], esi
	mov [esp+4F0Ch], cx

loc_416AD3:
	mov edx, [esp+4F06h]
	mov eax, [esp+4F0Ah]
	sar edx, 10h
	sar eax, 10h
	cmp eax, edx
	jge loc_41704A
	mov edx, [esp+eax*2+4EB2h]
	sar edx, 10h
	imul eax, edx, 684h
	test byte [esp+eax+1F8h], 4
	jz loc_416EFF
	lea edx, [edx+edx*8]
	add edx, byte_512E84
	push edx
	push aS_4 ; "%s"
	lea eax, [esp+4E3Ch]
	push eax
	call sprintf_
	add esp, 0Ch
	push 5
	push 3
	mov eax, 2D9h
	mov ebx, [esp+4F00h]
	call sub_41B650
	add eax, ebx

loc_416B43:
	movsx ebx, ax
	mov eax, 2D9h
	mov ecx, 12h
	call sub_41B670
	movsx edx, ax
	lea eax, [esp+4E3Ch]
	call sub_4054E0
	mov eax, [esp+4F0Ah]
	sar eax, 10h
	mov eax, [esp+eax*2+4EB2h]
	sar eax, 10h
	imul eax, 684h
	mov edx, [esp+4F02h]
	sar edx, 10h
	cmp edx, [esp+eax+27Ch]
	jl loc_416FC7
	mov edx, [esp+eax+284h]
	cmp edx, 2
	jnz loc_416F49
	mov eax, 2E3h
	mov ebx, [esp+4EF8h]
	call sub_41B650
	add eax, ebx
	movsx ebx, ax
	mov eax, 2E3h
	call sub_41B670
	add eax, 19h
	xor ecx, ecx
	movsx edx, ax
	mov eax, 2E3h

loc_416BD4:
	call sub_405580

loc_416BD9:
	mov esi, [esp+4F0Ch]
	mov ecx, [esp+4EF8h]
	inc esi
	add ecx, 1Ah
	mov [esp+4F0Ch], si
	mov [esp+4EF8h], ecx
	jmp loc_416AD3

loc_416BFF:
	mov eax, dword [dword_51220C] ; jumptable 00416990 cases 2-4
	mov eax, [esp+eax*2+4EB2h]
	sar eax, 10h
	imul eax, 684h
	cmp dword [esp+eax+284h], 1
	jnz loc_416C2C
	mov word [word_4D3B26], 2DEh
	jmp loc_4169AF

loc_416C2C:
	mov word [word_4D3B26], 2DCh
	jmp loc_4169AF

loc_416C3A:
	cmp dword [dword_512264], 2 ; jumptable 00416990 case 1
	jnz loc_416C65
	cmp dword [esp+284h], 1
	jnz loc_416C5B

loc_416C4D:
	mov word [word_4D3B26], 2DDh
	jmp loc_416997 ; jumptable 00416990 default case

loc_416C5B:
	cmp dword [esp+908h], 1
	jz loc_416C4D

loc_416C65:
	cmp dword [dword_512264], 1
	jnz loc_416C93
	movsx edx, ax
	imul edx, 684h
	test byte [esp+edx+1F8h], 4
	jz loc_416997 ; jumptable 00416990 default case
	mov word [word_4D3B26], 2DDh
	jmp loc_416997 ; jumptable 00416990 default case

loc_416C93:
	mov word [word_4D3B26], 2DCh
	jmp loc_416997 ; jumptable 00416990 default case

loc_416CA1:
	mov eax, [esp+edi*2+4EB2h]
	sar eax, 10h
	imul eax, 684h
	cmp dword [esp+eax+284h], 1
	jz loc_4169A6
	mov word [word_4D3B26], 2DCh
	jmp loc_4169AF

loc_416CCD:
	mov eax, [esp+4F08h]
	dec eax
	mov [esp+4F04h], ax
	jmp loc_416A04

loc_416CE2:
	cmp ax, [esp+4EF4h]
	jnz loc_416A5B
	test cx, cx
	jl loc_416A5B
	lea edx, [esp+4EB4h]
	xor eax, eax
	xor cl, cl
	mov [esp+4EF4h], eax
	lea eax, [esp+4]
	mov byte [byte_4D76C4], cl
	call sub_415120
	lea edx, [esp+4EB4h]
	lea eax, [esp+4]
	call sub_4151D0
	jmp loc_416A64

loc_416D2F:
	cmp dword [dword_4D2094], 0
	jnz loc_416A64
	cmp word [esp+4F00h], 0
	jz loc_416D4C
	call sub_423B90

loc_416D4C:
	mov eax, ebp
	call sub_423CA0
	call sub_405960
	mov edi, eax
	cmp byte [byte_51345E], 0
	jz loc_416D75
	mov eax, 1
	call sub_4164C0
	cmp al, 3
	jnb loc_4170C4

loc_416D75:
	test di, di
	jz loc_416A04
	mov eax, dword [dword_5637F4]
	cmp eax, [esp+4EF0h]
	jle loc_416A04
	cmp word [esp+4EF4h], 0
	jnz loc_416A04
	mov eax, dword [dword_5637F4]
	add eax, 0Fh
	mov [esp+4EF0h], eax
	cmp di, 1Bh
	jnz loc_417149
	mov edi, 0Dh
	mov word [ebp+0Ah], 0

loc_416DC3:
	xor eax, eax
	call sub_41A1A0
	cmp byte [byte_512DA9], 1
	jnz loc_416E4F
	cmp dword [dword_512264], 1
	jle loc_416E4F
	mov eax, dword [dword_4D76BC]
	cmp word [eax], 0
	jnz loc_416E4F
	mov cx, [eax+2]
	cmp cx, 1
	jnz loc_416E4F
	cmp cx, word [word_4D4202]
	jnz loc_416E4F
	mov ebx, 9
	mov edx, byte_512F55
	mov eax, dword_512F4C
	call strncpy_
	mov ebx, 9
	mov edx, byte_512E8D
	mov eax, byte_512E84
	call strncpy_
	mov eax, dword [dword_4D5EF8]
	mov edx, [eax+8FCh]
	mov [eax+278h], edx
	mov edx, [esp+4F06h]
	sar edx, 10h
	mov [eax+8FCh], edx
	xor eax, eax
	mov word [word_4D4202], ax

loc_416E4F:
	cmp byte [byte_51345E], 0
	jz loc_416E9E
	mov eax, 4
	call sub_4164C0
	cmp al, 3
	jnz loc_416E9E
	mov edx, 1
	mov ebx, dword [dword_4D76BC]
	mov word [ebp+0Ah], 3
	mov [esp+4EFCh], edx
	test ebx, ebx
	jz loc_416E8F
	xor esi, esi
	call sub_41A2A0
	mov dword [dword_4D76BC], esi

loc_416E8F:
	xor eax, eax
	xor bl, bl
	mov dword [dword_5121F8], eax
	mov byte [byte_512DAA], bl

loc_416E9E:
	call sub_415BF0

loc_416EA3:
	cmp word [ebp+0Ah], 1
	jnz loc_416ECA
	cmp di, 0Dh
	jnz loc_416ECA
	xor bh, bh
	mov byte [byte_4D76C1], bh
	mov byte [byte_4D76C3], bh
	mov byte [byte_4D76C4], bh
	mov byte [byte_4D76C0], bh

loc_416ECA:
	cmp word [ebp+0Ah], 2
	jnz loc_416EDE
	cmp di, 0Dh
	jnz loc_416EDE
	call sub_4098D0
	xor edi, edi

loc_416EDE:
	cmp word [ebp+0Ah], 3
	jz loc_417163

loc_416EE9:
	movsx edx, di
	mov eax, ebp
	call sub_410414
	mov [esp+4EE4h], eax
	jmp loc_416A04

loc_416EFF:
	lea edx, [esp+4]
	add eax, edx
	lea edi, [esp+4E34h]
	call sub_41A170
	mov esi, eax
	push edi

loc_416F14:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_416F2C
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_416F14

loc_416F2C:
	pop edi
	push 2
	push 3
	mov eax, 2D9h
	mov edx, [esp+4F00h]
	call sub_41B650
	add eax, edx
	jmp loc_416B43

loc_416F49:
	cmp edx, 3
	jnz loc_416F82
	mov eax, 2E4h
	mov edx, [esp+4EF8h]
	call sub_41B650
	add eax, edx
	movsx ebx, ax
	mov eax, 2E4h
	call sub_41B670
	add eax, 19h
	xor ecx, ecx
	movsx edx, ax
	mov eax, 2E4h
	jmp loc_416BD4

loc_416F82:
	push 4
	push 4
	mov eax, 2E3h
	mov edi, [esp+4F00h]
	call sub_41B650
	add eax, edi
	movsx ebx, ax
	mov eax, 2E3h
	call sub_41B670
	add eax, 19h
	movsx edx, ax
	mov eax, 2A5h
	mov ecx, 12h
	call sub_41B710
	call sub_4054E0
	jmp loc_416BD9

loc_416FC7:
	cmp dword [esp+eax+284h], 1
	jz loc_417005
	mov eax, 2E4h
	mov esi, [esp+4EF8h]
	call sub_41B650
	add eax, esi
	movsx ebx, ax
	mov eax, 2E4h
	call sub_41B670
	add eax, 19h
	xor ecx, ecx
	movsx edx, ax
	mov eax, 2E4h
	jmp loc_416BD4

loc_417005:
	push 4
	push 4
	mov eax, 2E3h
	mov ecx, [esp+4F00h]
	call sub_41B650
	add eax, ecx
	movsx ebx, ax
	mov eax, 2E3h
	call sub_41B670
	add eax, 19h
	movsx edx, ax
	mov eax, 2A5h
	mov ecx, 12h
	call sub_41B710
	call sub_4054E0
	jmp loc_416BD9

loc_41704A:
	mov eax, ebp
	call sub_40FA90
	mov eax, dword [dword_4D4D24]
	mov ebx, 0FFFFFFF6h
	mov eax, [eax+20h]
	mov edx, [esp+4EE8h]
	call sub_426B70
	mov eax, dword [dword_51221C]
	xor ecx, ecx
	call sub_41A3A0
	mov eax, 12h
	call sub_4274F0
	cmp dword [dword_4D2310], 0
	jz loc_41709C
	mov eax, dword [dword_4D4C7C]
	mov edx, dword [dword_4D4C80]
	sub eax, 7
	call sub_4267C0

loc_41709C:
	cmp word [esp+4F00h], 0
	jz loc_4170AC

loc_4170AC:
	call sub_4976B8
	xor eax, eax
	call sub_403550
	jmp loc_416D4C

loc_4170C4:
	ja loc_41710F
	mov edi, 1
	mov ebx, dword [dword_4D76BC]
	mov [esp+4EFCh], edi
	test ebx, ebx
	jnz loc_41713A

loc_4170DC:
	mov edx, 0Dh
	xor ah, ah
	xor edi, edi
	mov byte [byte_512DAA], ah
	mov dword [dword_5121F8], edi
	call sub_415BF0
	mov eax, ebp
	mov word [ebp+0Ah], 3
	call sub_410414
	mov [esp+4EE4h], eax
	jmp loc_416A04

loc_41710F:
	cmp al, 4
	jnz loc_416D75
	call sub_415BF0
	mov edx, 0Dh
	mov eax, ebp
	mov word [ebp+0Ah], 0
	call sub_410414
	mov [esp+4EE4h], eax
	jmp loc_416A04

loc_41713A:
	xor esi, esi
	call sub_41A2A0
	mov dword [dword_4D76BC], esi
	jmp loc_4170DC

loc_417149:
	cmp word [ebp+0Ah], 0
	jnz loc_416EA3
	cmp di, 0Dh
	jz loc_416DC3
	jmp loc_416EA3

loc_417163:
	cmp di, 0Dh
	jnz loc_416EE9
	cmp word [esp+4EFCh], 0
	jnz loc_416EE9
	push 2ECh
	push 1
	call sub_401AE0
	add esp, 8
	mov [esp+4EFCh], eax
	cmp ax, 1
	jnz loc_4171E5
	mov eax, 1
	call sub_41A1A0
	cmp byte [byte_51345E], 0
	jz loc_4171B5
	mov eax, 3
	call sub_4164C0

loc_4171B5:
	cmp dword [dword_4D76BC], 0
	jz loc_4171CB
	xor ecx, ecx
	call sub_41A2A0
	mov dword [dword_4D76BC], ecx

loc_4171CB:
	xor dl, dl
	xor ebx, ebx
	mov byte [byte_512DAA], dl
	mov dword [dword_5121F8], ebx
	call sub_415BF0
	jmp loc_416EE9

loc_4171E5:
	mov word [ebp+0Ah], 0
	xor edi, edi
	jmp loc_416EE9

loc_4171F2:
	mov ebx, 0FFFFFFF6h
	mov eax, 12h
	xor ecx, ecx
	xor edx, edx
	mov edi, 1
	call sub_4274F0
	call sub_4159C0
	xor eax, eax
	mov dword [dword_4D1FFC], edi
	call sub_403550
	mov eax, esi
	pop edi
	add esp, 4F0Ch
	pop ebp
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_416884 endp

sub_417230: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push ebp
	sub esp, 4ED4h
	mov ebp, eax
	mov esi, dword [dword_512214]
	xor edx, edx
	xor ecx, ecx
	xor ebx, ebx
	mov [esp+4EB0h], edx
	mov [esp+4EBCh], ecx
	mov [esp+4EB8h], ecx
	xor ebx, ecx
	mov edx, 1
	mov [esp+4ED0h], ebx
	mov [esp+4EC0h], edx
	cmp esi, 2
	jz loc_4172D8
	cmp dword [dword_512208], 1
	jg loc_4172E9
	mov word [word_4D3B96], 2C1h

loc_41728A:
	mov eax, [ebp+14h]
	xor ebx, ebx
	xor edx, edx
	call sub_415470
	call sub_41A020
	mov [esp+4ECCh], ax
	movsx edx, ax
	mov eax, esp
	call sub_41A570
	xor eax, eax

loc_4172AF:
	mov ecx, [esp+4ECAh]
	movsx edx, ax
	sar ecx, 10h
	cmp edx, ecx
	jge loc_4172F4
	imul edx, 684h
	mov edx, [esp+edx+278h]
	mov [esp+edx*2+4E96h], ax
	inc eax
	jmp loc_4172AF

loc_4172D8:
	mov eax, 0FFFFFFFDh
	add esp, 4ED4h
	pop ebp
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4172E9:
	mov word [word_4D3B96], 2CEh
	jmp loc_41728A

loc_4172F4:
	push edi
	lea ebx, [esp+4E84h]
	mov edx, dword [dword_4D76B8]
	mov eax, ecx
	add edx, 2B0h
	call sub_41B470
	lea edx, [esp+4E84h]
	lea eax, [esp+4]
	call sub_414D70
	cmp dword [dword_512208], 1
	jg loc_417753
	xor edi, edi
	mov [esp+4EC8h], di

loc_417336:
	xor edx, edx
	mov eax, ebp
	mov dword [dword_4D2098], edx
	call sub_410E80
	mov edx, 2
	lea eax, [esp+4]
	mov ecx, [esp+4EB4h]
	call sub_4159E0
	test ecx, ecx
	jnz loc_417727
	mov eax, [esp+4ED0h]
	dec eax
	mov [esp+4ECCh], eax

loc_417371:
	call sub_4833C7
	mov esi, [esp+4EBCh]
	mov edx, [esp+4ED4h]
	add esi, eax
	mov eax, 1
	add edx, eax
	mov [esp+4EBCh], esi
	mov [esp+4ED4h], edx
	mov dl, byte [byte_4D76C5]
	mov [esp+4EB8h], esi
	test dl, dl
	jnz loc_417766
	xor edi, edi
	mov [esp+4EC4h], edi

loc_4173B9:
	test ax, ax
	jz loc_417848

loc_4173C2:
	call sub_428A20
	call sub_415E40
	mov edx, 400h
	xor eax, eax
	mov esi, [esp+4ECEh]
	mov al, byte [byte_512DFB]
	xor ecx, ecx
	xor ebx, ebx
	mov eax, dword off_4D41A0[eax*4]
	sar esi, 10h
	call sub_405B30
	call sub_415CC0
	mov eax, [esp+esi*2+4E80h]
	sar eax, 10h
	imul eax, 684h
	test byte [esp+eax+1F8h], 4
	jz loc_4177CF
	mov edi, [esp+eax+284h]
	cmp edi, 2
	jnz loc_4177A9
	mov eax, 2D4h
	call sub_41B650
	add eax, 1Ah
	movsx ebx, ax
	mov eax, 2D4h
	xor ecx, ecx
	call sub_41B670
	movsx edx, ax
	mov eax, 2D4h
	call sub_405580
	mov eax, 2C9h
	call sub_41B650
	movsx ecx, ax
	mov eax, 2C9h
	mov edx, esi
	call sub_41B670
	movsx ebx, ax
	mov eax, edi

loc_41746E:
	call sub_415C50
	mov edi, [esp+4ECCh]
	test di, di
	jl loc_41759B
	imul esi, edi, 1Ah
	imul eax, [esp+4ED0h], 1Ah
	neg esi
	add esi, eax

loc_417492:
	movsx edx, di
	mov edx, [esp+edx*2+4E82h]
	sar edx, 10h
	imul eax, edx, 684h
	test byte [esp+eax+1F8h], 4
	jz loc_417820
	lea eax, [edx+edx*8]
	add eax, byte_512E84
	push eax
	push aS_4 ; "%s"
	lea eax, [esp+4E3Ch]
	push eax
	call sprintf_
	add esp, 0Ch
	push 5

loc_4174D3:
	push 3
	mov eax, 2CAh
	call sub_41B650
	add eax, esi
	movsx ebx, ax
	mov eax, 2CAh
	mov ecx, 12h
	call sub_41B670
	movsx edx, ax
	lea eax, [esp+4E3Ch]
	call sub_4054E0
	movsx eax, di
	mov eax, [esp+eax*2+4E82h]
	mov edx, dword [dword_4D76B8]
	sar eax, 10h
	mov eax, [edx+eax*2+2AEh]
	sar eax, 10h
	push eax
	push aD_3 ; "%d"
	lea eax, [esp+4E3Ch]
	push eax
	call sprintf_
	add esp, 0Ch
	push 2
	push 4
	mov eax, 2CBh
	call sub_41B650
	add eax, esi
	movsx ebx, ax
	mov eax, 2CBh
	mov ecx, 12h
	call sub_41B670
	movsx edx, ax
	lea eax, [esp+4E3Ch]
	call sub_4054E0
	mov eax, 2CBh
	call sub_41B650
	add eax, esi
	dec edi
	movsx ebx, ax
	mov eax, 2C7h
	xor ecx, ecx
	call sub_41B670
	movsx edx, ax
	mov eax, 2C7h
	add esi, 1Ah
	call sub_405580
	test di, di
	jge loc_417492

loc_41759B:
	mov eax, ebp
	call sub_40FA90
	mov eax, dword [dword_4D4D24]
	mov ebx, 0FFFFFFF6h
	mov eax, [eax+20h]
	mov edx, [esp+4EB8h]
	call sub_426B70
	mov eax, dword [dword_51221C]
	xor ecx, ecx
	call sub_41A3A0
	mov eax, 12h
	call sub_4274F0
	cmp dword [dword_4D2310], 0
	jz loc_4175ED
	mov eax, dword [dword_4D4C7C]
	mov edx, dword [dword_4D4C80]
	sub eax, 7
	call sub_4267C0

loc_4175ED:
	cmp word [esp+4ED4h], 0
	jz loc_4175FD

loc_4175FD:
	call sub_4976B8
	xor eax, eax
	call sub_403550

loc_417610:
	mov eax, ebp
	call sub_423CA0
	call sub_405960
	mov edx, eax
	test ax, ax
	jz loc_417719
	mov ecx, dword [dword_5637F4]
	cmp ecx, [esp+4EC0h]
	jle loc_417719
	mov ecx, dword [dword_5637F4]
	add ecx, 0Fh
	mov [esp+4EC0h], ecx
	cmp ax, 1Bh
	jnz loc_417861
	mov edx, 0Dh
	mov word [ebp+0Ah], 0

loc_41765F:
	call sub_415BF0
	call sub_41A350
	mov eax, [esp+4EC6h]
	mov cl, 1
	sar eax, 10h
	mov byte [byte_4D76C5], cl
	imul ecx, eax, 684h
	cmp dword [esp+ecx+284h], 2
	jnz loc_4176B9
	mov ebx, [esp+4ECEh]
	sar ebx, 10h
	add ebx, ebx
	mov ecx, [esp+ebx+4E80h]
	sar ecx, 10h
	cmp ecx, eax
	jnz loc_41787B
	cmp byte [byte_512DBD], 3
	jnb loc_4176B9
	mov byte [byte_512DBD], 3

loc_4176B9:
	xor edi, edi
	xor ch, ch
	mov dword [dword_5121F8], edi
	mov byte [byte_512DAA], ch

loc_4176C9:
	cmp word [ebp+0Ah], 1
	jnz loc_4176E7
	cmp dx, 0Dh
	jnz loc_4176E7
	xor al, al
	mov byte [byte_4D76C1], al
	mov byte [byte_4D76C2], al
	mov byte [byte_4D76C0], al

loc_4176E7:
	cmp word [ebp+0Ah], 2
	jnz loc_417708
	cmp dx, 0Dh
	jnz loc_417708
	cmp dword [dword_512208], 1
	jle loc_4178CD
	call sub_4098D0
	xor edx, edx

loc_417708:
	movsx edx, dx
	mov eax, ebp
	call sub_410414
	mov [esp+4EB4h], eax

loc_417719:
	cmp dword [esp+4EB4h], 0
	jz loc_417371

loc_417727:
	mov ebx, 0FFFFFFF6h
	mov eax, 12h
	xor ecx, ecx
	xor edx, edx
	call sub_4274F0
	call sub_4159C0
	mov eax, [esp+4EB4h]
	pop edi
	add esp, 4ED4h
	pop ebp
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_417753:
	mov ax, word [dword_51220C]
	mov [esp+4EC8h], ax
	jmp loc_417336

loc_417766:
	cmp ax, [esp+4EC4h]
	jnz loc_4173B9
	cmp word [esp+4ED4h], 0
	jl loc_4173B9
	lea eax, [esp+4]
	xor dh, dh
	xor esi, esi
	mov byte [byte_4D76C5], dh
	lea edx, [esp+4E84h]
	mov [esp+4EC4h], esi
	call sub_414E80
	jmp loc_4173C2

loc_4177A9:
	mov eax, 2C9h
	call sub_41B650
	movsx ecx, ax
	mov eax, 2C9h
	mov edx, esi
	call sub_41B670
	movsx ebx, ax
	mov eax, 1
	jmp loc_41746E

loc_4177CF:
	mov eax, 2D4h
	call sub_41B650
	add eax, 1Ah
	movsx ebx, ax
	mov eax, 2D4h
	xor ecx, ecx
	call sub_41B670
	movsx edx, ax
	mov eax, 2D4h
	call sub_405580
	mov eax, 2C9h
	call sub_41B650
	movsx ecx, ax
	mov eax, 2C9h
	mov edx, esi
	call sub_41B670
	movsx ebx, ax
	mov eax, 2
	jmp loc_41746E

loc_417820:
	lea edx, [esp+4]
	add eax, edx
	call sub_41A170
	push eax
	push aS_4 ; "%s"
	lea eax, [esp+4E3Ch]
	push eax
	call sprintf_
	add esp, 0Ch
	push 2
	jmp loc_4174D3

loc_417848:
	cmp word [esp+4ED4h], 0
	jz loc_417610
	call sub_423B90
	jmp loc_417610

loc_417861:
	cmp word [ebp+0Ah], 0
	jnz loc_4176C9
	cmp ax, 0Dh
	jz loc_41765F
	jmp loc_4176C9

loc_41787B:
	mov ecx, [esp+ebx+4E7Eh]
	sar ecx, 10h
	cmp ecx, eax
	jnz loc_4178A2
	cmp byte [byte_512DBD], 2
	jnb loc_4176B9
	mov byte [byte_512DBD], 2
	jmp loc_4176B9

loc_4178A2:
	mov ecx, [esp+ebx+4E7Ch]
	sar ecx, 10h
	cmp ecx, eax
	jnz loc_4176B9
	cmp byte [byte_512DBD], 1
	jnb loc_4176B9
	mov byte [byte_512DBD], 1
	jmp loc_4176B9

loc_4178CD:
	xor bh, bh
	mov ecx, 2
	mov byte [byte_4D76C2], bh
	mov byte [byte_4D76C1], bh
	mov byte [byte_4D76C0], bh
	mov dword [dword_512214], ecx
	jmp loc_417708
;sub_417230 endp

sub_417900: ;SUBROUTINE
	push edx
	push esi
	push ebp
	sub esp, 4ECCh
	mov ebp, eax
	xor edx, edx
	mov [esp+4EB0h], edx
	mov [esp+4EB8h], edx
	mov [esp+4EBCh], edx
	xor edx, edx
	mov esi, dword [dword_512214]
	mov [esp+4EC0h], edx
	cmp esi, 2
	jz loc_4179E2
	mov eax, dword [dword_4D76B8]
	cmp word [eax+2C0h], 6
	jg loc_4179F1
	cmp dword [dword_512208], 1
	jle loc_4179FF
	mov word [word_4D3C02], 2C2h

loc_417963:
	push edi
	push ecx
	push ebx
	mov eax, [ebp+14h]
	xor ebx, ebx
	xor edx, edx
	call sub_415470
	call sub_41A020
	mov [esp+4ED0h], ax
	movsx ecx, ax
	lea eax, [esp+0Ch]
	mov edx, ecx
	lea ebx, [esp+4EA4h]
	call sub_41A570
	mov edx, dword [dword_4D76B8]
	mov eax, ecx
	add edx, 2B0h
	call sub_41B470
	lea edx, [esp+4EA4h]
	lea eax, [esp+0Ch]
	call sub_414D70
	xor eax, eax

loc_4179B9:
	mov ecx, [esp+4ECEh]
	movsx edx, ax
	sar ecx, 10h
	cmp edx, ecx
	jge loc_417A0D
	imul edx, 684h
	mov edx, [esp+edx+284h]
	mov [esp+edx*2+4E8Ah], ax
	inc eax
	jmp loc_4179B9

loc_4179E2:
	mov eax, 0FFFFFFFDh
	add esp, 4ECCh
	pop ebp
	pop esi
	pop edx
	ret

loc_4179F1:
	mov word [word_4D3C02], 2C0h
	jmp loc_417963

loc_4179FF:
	mov word [word_4D3C02], 2C1h
	jmp loc_417963

loc_417A0D:
	xor eax, eax
	mov dword [dword_4D2098], eax
	mov eax, ebp
	mov edx, 2
	call sub_410E80
	lea eax, [esp+0Ch]
	call sub_4159E0
	cmp dword [esp+4EC8h], 0
	jnz loc_417D3D
	mov eax, [esp+4ED0h]
	dec eax
	mov [esp+4ED4h], eax

loc_417A46:
	mov ebx, [esp+4EC4h]
	call sub_4833C7
	add ebx, eax
	mov eax, [esp+4ECCh]
	mov edx, 400h
	inc eax
	xor ecx, ecx
	mov [esp+4ECCh], eax
	call sub_428A20
	call sub_415E40
	xor eax, eax
	mov [esp+4EC4h], ebx
	mov al, byte [byte_512DFB]
	mov [esp+4EC0h], ebx
	xor ebx, ebx
	mov eax, dword off_4D4188[eax*4]
	call sub_405B30
	call sub_415CC0
	mov eax, 2BDh
	mov edx, [esp+4ECEh]
	call sub_41B650
	movsx ecx, ax
	mov eax, 2BDh
	sar edx, 10h
	call sub_41B670
	movsx ebx, ax
	mov eax, 1
	mov edi, [esp+4ED4h]
	call sub_415C50
	test di, di
	jl loc_417BF3
	imul esi, edi, 1Ah
	imul eax, [esp+4ED0h], 1Ah
	neg esi
	add esi, eax

loc_417AE9:
	movsx edx, di
	mov edx, [esp+edx*2+4EA2h]
	sar edx, 10h
	imul eax, edx, 684h
	test byte [esp+eax+200h], 4
	jz loc_417D69
	lea edx, [edx+edx*8]
	add edx, byte_512E84
	push edx
	push aS_4 ; "%s"
	lea eax, [esp+4E44h]
	push eax
	call sprintf_
	add esp, 0Ch
	push 5

loc_417B2B:
	push 3
	mov eax, 2BEh
	call sub_41B650
	add eax, esi
	movsx ebx, ax
	mov eax, 2BEh
	mov ecx, 12h
	call sub_41B670
	movsx edx, ax
	lea eax, [esp+4E44h]
	call sub_4054E0
	movsx eax, di
	mov eax, [esp+eax*2+4EA2h]
	mov edx, dword [dword_4D76B8]
	sar eax, 10h
	mov eax, [edx+eax*2+2AEh]
	sar eax, 10h
	push eax
	push aD_3 ; "%d"
	lea eax, [esp+4E44h]
	push eax
	call sprintf_
	add esp, 0Ch
	push 2
	push 4
	mov eax, 2BFh
	call sub_41B650
	add eax, esi
	movsx ebx, ax
	mov eax, 2BFh
	mov ecx, 12h
	call sub_41B670
	movsx edx, ax
	lea eax, [esp+4E44h]
	call sub_4054E0
	mov eax, 2BFh
	call sub_41B650
	add eax, esi
	dec edi
	movsx ebx, ax
	mov eax, 2C7h
	xor ecx, ecx
	call sub_41B670
	movsx edx, ax
	mov eax, 2C7h
	add esi, 1Ah
	call sub_405580
	test di, di
	jge loc_417AE9

loc_417BF3:
	mov eax, ebp
	call sub_40FA90
	mov eax, dword [dword_4D4D24]
	mov ebx, 0FFFFFFF6h
	mov eax, [eax+20h]
	mov edx, [esp+4EC0h]
	call sub_426B70
	mov eax, dword [dword_51221C]
	xor ecx, ecx
	call sub_41A3A0
	mov eax, 12h
	call sub_4274F0
	cmp dword [dword_4D2310], 0
	jz loc_417C45
	mov eax, dword [dword_4D4C7C]
	mov edx, dword [dword_4D4C80]
	sub eax, 7
	call sub_4267C0

loc_417C45:
	cmp word [esp+4ECCh], 0
	jz loc_417C55

loc_417C55:
	call sub_4976B8
	xor eax, eax
	call sub_403550
	mov eax, ebp
	call sub_423CA0
	call sub_405960
	mov edx, eax
	test ax, ax
	jz loc_417D2F
	mov ecx, dword [dword_5637F4]
	cmp ecx, [esp+4EBCh]
	jle loc_417D2F
	mov ecx, dword [dword_5637F4]
	add ecx, 0Fh
	mov [esp+4EBCh], ecx
	cmp ax, 1Bh
	jnz loc_417D91
	mov edx, 0Dh
	mov word [ebp+0Ah], 0

loc_417CB7:
	call sub_415BF0
	lea eax, [esp+4EA4h]
	call sub_41A530

loc_417CC8:
	cmp word [ebp+0Ah], 1
	jnz loc_417CE9
	cmp dx, 0Dh
	jnz loc_417CE9
	xor ah, ah
	mov byte [byte_4D76C1], ah
	mov byte [byte_4D76C2], ah
	mov byte [byte_4D76C0], ah

loc_417CE9:
	cmp word [ebp+0Ah], 2
	jnz loc_417D1E
	cmp dx, 0Dh
	jnz loc_417D1E
	cmp dword [dword_512208], 1
	jle loc_417DAB
	call sub_4098D0
	xor edx, edx

loc_417D0A:
	xor cl, cl
	mov byte [byte_4D76C1], cl
	mov byte [byte_4D76C2], cl
	mov byte [byte_4D76C0], cl

loc_417D1E:
	movsx edx, dx
	mov eax, ebp
	call sub_410414
	mov [esp+4EC8h], eax

loc_417D2F:
	cmp dword [esp+4EC8h], 0
	jz loc_417A46

loc_417D3D:
	mov ebx, 0FFFFFFF6h
	mov eax, 12h
	xor ecx, ecx
	xor edx, edx
	call sub_4274F0
	call sub_4159C0
	mov eax, [esp+4EC8h]
	pop ebx
	pop ecx
	pop edi
	add esp, 4ECCh
	pop ebp
	pop esi
	pop edx
	ret

loc_417D69:
	lea edx, [esp+0Ch]
	add eax, edx
	call sub_41A170
	push eax
	push aS_4 ; "%s"
	lea eax, [esp+4E44h]
	push eax
	call sprintf_
	add esp, 0Ch
	push 2
	jmp loc_417B2B

loc_417D91:
	cmp word [ebp+0Ah], 0
	jnz loc_417CC8
	cmp ax, 0Dh
	jz loc_417CB7
	jmp loc_417CC8

loc_417DAB:
	mov dword [dword_512214], 2
	jmp loc_417D0A
;sub_417900 endp

off_417DC0: dd loc_417F8B
	dd loc_418322 ; jump table for switch statement
	dd loc_41827F
	dd loc_41827F
	dd loc_4182A2

sub_417DD4: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 4F74h
	mov ebp, eax
	xor edx, edx
	xor ebx, ebx
	xor ecx, ecx
	xor edi, edi
	xor eax, eax
	mov [esp+4EECh], edx
	mov [esp+4F04h], ebx
	mov [esp+4F5Ch], bx
	mov [esp+4F2Ch], bx
	mov [esp+4EF0h], ecx
	mov [esp+4EF4h], ecx
	mov [esp+4F60h], edi
	mov [esp+4F30h], ax
	mov edx, 1
	mov edi, dword [dword_512214]
	mov [esp+4F28h], edx
	mov esi, edx
	cmp edi, 2
	jz loc_417EE8
	cmp dword [dword_512264], 2
	jg loc_417EFC
	mov eax, [ebp+20h]
	or byte [eax+2], 1
	mov eax, [ebp+24h]
	or byte [eax+2], 1

loc_417E5F:
	cmp byte [byte_512ECC], 0
	jz loc_417E6F
	mov eax, [ebp+1Ch]
	or byte [eax+8], 1

loc_417E6F:
	mov edx, dword [dword_5121F8]
	cmp edx, 1
	jnz loc_417F0F

loc_417E7E:
	mov word [word_4D3C6E], 2ACh

loc_417E87:
	call sub_41A210
	mov edi, eax
	call sub_41A020
	mov [esp+4F58h], ax
	cmp dword [dword_4D21AC], 0
	jz loc_417F3D

loc_417EA8:
	mov edx, [esp+4F56h]
	mov eax, esp
	sar edx, 10h
	call sub_41A570
	xor eax, eax

loc_417EBB:
	mov ecx, [esp+4F56h]
	sar ecx, 10h
	movsx edx, ax
	cmp edx, ecx
	jge loc_417F7A
	imul edx, 684h
	mov edx, [esp+edx+278h]
	mov [esp+edx*2+4ECEh], ax
	inc eax
	jmp loc_417EBB

loc_417EE8:
	mov esi, 0FFFFFFFDh
	mov eax, esi
	add esp, 4F74h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_417EFC:
	mov eax, [ebp+20h]
	and byte [eax+2], 0FEh
	mov eax, [ebp+24h]
	and byte [eax+2], 0FEh
	jmp loc_417E5F

loc_417F0F:
	cmp edx, 2
	jz loc_417E7E
	cmp dword [dword_512208], 1
	jle loc_417F2F
	mov word [word_4D3C6E], 2AEh
	jmp loc_417E87

loc_417F2F:
	mov word [word_4D3C6E], 2ADh
	jmp loc_417E87

loc_417F3D:
	cmp byte [byte_512ECC], 1
	jz loc_417EA8
	mov edx, dword [dword_4D5A28]
	mov eax, dword [dword_51221C]
	call sub_476750
	mov edx, 1
	mov eax, 64h
	mov dword [dword_4D21AC], edx
	mov edx, dword [dword_4D5A28]
	call sub_4864A0
	jmp loc_417EA8

loc_417F7A:
	mov eax, dword [dword_512208]
	cmp eax, 4 ; switch 5 cases
	ja loc_417F8B ; jumptable 00417F84 default case
	jmp off_417DC0[eax*4] ; switch jump

loc_417F8B:
	mov eax, dword [dword_51221C] ; jumptable 00417F84 default case
	lea edx, [esp+4E80h]
	call sub_41A3A0
	cwde
	mov ecx, [esp+4F28h]
	call sub_41AEF0
	mov [esp+4F34h], eax
	cmp cx, 1
	jnz loc_417FE5
	cmp byte [byte_4D76C1], 1
	jnz loc_417FE5
	mov edx, [esp+4F56h]
	lea ecx, [esp+4F2Ch]
	lea ebx, [esp+4F5Ch]
	mov eax, esp
	sar edx, 10h
	call sub_414760
	mov [esp+4F04h], eax

loc_417FE5:
	mov eax, [ebp+18h]
	mov edx, [esp+4F2Eh]
	call sub_415490
	movsx ebx, si
	sar edx, 10h
	mov eax, [ebp+14h]
	call sub_415470
	mov eax, ebp
	xor ebx, ebx
	xor edx, edx
	mov dword [dword_4D2098], ebx
	call sub_410E80
	mov eax, esp
	call sub_4159E0
	cmp dword [esp+4EECh], 0
	jnz loc_418B67
	mov eax, [esp+4F58h]
	dec eax
	mov [esp+4F0Ch], eax

loc_418037:
	mov edx, [esp+4EF4h]
	call sub_4833C7
	add edx, eax
	mov eax, [esp+4F60h]
	xor ecx, ecx
	inc eax
	xor ebx, ebx
	mov [esp+4F60h], eax
	call sub_428A20
	call sub_415E40
	xor eax, eax
	mov [esp+4EF4h], edx
	mov al, byte [byte_512DFB]
	mov [esp+4EFCh], edx
	mov edx, 400h
	mov eax, dword off_4D41E8[eax*4]
	call sub_405B30
	xor eax, eax
	mov edx, 400h
	mov al, byte [byte_512DFB]
	xor ecx, ecx
	xor ebx, ebx
	mov eax, dword off_4D4170[eax*4]
	call sub_405B30
	call sub_415CC0
	mov eax, 2B5h
	call sub_41B650
	movsx ebx, ax
	mov eax, 2B5h
	xor ecx, ecx
	call sub_41B670
	movsx edx, ax
	mov eax, 2B5h
	call sub_405580
	cmp word [esp+4F34h], 0
	jz loc_41810E
	push 2
	push 3
	mov eax, 2B5h
	call sub_41B650
	movsx ebx, ax
	mov eax, 2B5h
	call sub_41B670
	add eax, 0Ah
	mov ecx, 12h
	movsx edx, ax
	lea eax, [esp+4E88h]
	call sub_4054E0

loc_41810E:
	cmp dword [dword_512264], 2
	jl loc_418BD7
	mov eax, 2B6h
	call sub_41B650
	add eax, edi
	movsx ebx, ax
	mov eax, 2B6h
	xor ecx, ecx
	call sub_41B670
	movsx edx, ax
	mov eax, 2B6h
	call sub_405580
	mov eax, 2B6h
	call sub_41B650
	add eax, edi
	movsx ecx, ax
	mov eax, 2B6h
	call sub_41B670
	mov edx, dword [dword_5121F8+2]
	movsx ebx, ax
	mov eax, 1
	sar edx, 10h
	call sub_415C50
	mov eax, [esp+4F2Eh]
	sar eax, 10h
	imul edx, eax, 684h
	cmp dword [esp+edx+280h], 2
	jnz loc_418388
	lea ebx, [esp+4E30h]
	mov edx, eax
	mov eax, esp
	call sub_41A040
	mov [esp+4F38h], ax
	inc eax
	imul eax, 1Ah
	xor edx, edx
	mov ebx, 1Ah
	mov [esp+4F48h], dx
	mov [esp+4F1Ch], ebx
	mov [esp+4F6Ch], eax

loc_4181C9:
	mov ecx, [esp+4F46h]
	mov ebx, dword [dword_5121FC]
	sar ecx, 10h
	cmp ecx, ebx
	jge loc_418483
	mov eax, [esp+4F2Eh]
	sar eax, 10h
	imul edx, eax, 684h
	lea eax, 0[ecx*4]
	add eax, edx
	lea edx, [esp+4E30h]
	mov eax, [esp+eax+238h]
	call sub_41B150
	mov eax, [esp+4F36h]
	sar eax, 10h
	cmp ecx, eax
	jz loc_41836C
	push 4
	push 5
	mov eax, 2B6h
	mov ebx, [esp+4F24h]
	call sub_41B650
	add eax, ebx

loc_418236:
	add eax, edi
	movsx ebx, ax
	mov eax, 2A8h
	mov ecx, 12h
	call sub_41B670
	movsx edx, ax
	lea eax, [esp+4E38h]
	call sub_4054E0
	mov eax, [esp+4F48h]
	mov ecx, [esp+4F1Ch]
	inc eax
	add ecx, 1Ah
	mov [esp+4F48h], ax
	mov [esp+4F1Ch], ecx
	jmp loc_4181C9

loc_41827F:
	mov ax, word [dword_51220C] ; jumptable 00417F84 cases 2,3
	lea edx, [esp+4ED0h]
	mov [esp+4F30h], ax
	mov eax, esp
	call sub_4153E0
	mov esi, eax
	jmp loc_417F8B ; jumptable 00417F84 default case

loc_4182A2:
	mov ax, word [dword_51220C] ; jumptable 00417F84 case 4
	mov [esp+4F30h], ax
	xor eax, eax
	cmp bx, 1
	jz loc_417F8B ; jumptable 00417F84 default case

loc_4182BC:
	movsx edx, ax
	mov edx, [esp+edx*2+4ECEh]
	sar edx, 10h
	mov [esp+4EF8h], edx
	imul edx, 684h
	test byte [esp+edx+1F4h], 4
	jz loc_4182FC
	mov edx, [esp+4F2Eh]
	mov ecx, [esp+4EF8h]
	sar edx, 10h
	cmp edx, ecx
	jz loc_4182FC
	mov ebx, 1
	mov esi, eax

loc_4182FC:
	inc eax
	mov edx, [esp+4F56h]
	movsx ecx, ax
	sar edx, 10h
	cmp ecx, edx
	jl loc_418317
	test bx, bx
	jz loc_417F8B ; jumptable 00417F84 default case

loc_418317:
	cmp bx, 1
	jnz loc_4182BC
	jmp loc_417F8B ; jumptable 00417F84 default case

loc_418322:
	mov esi, 1 ; jumptable 00417F84 case 1
	xor eax, eax
	mov ebx, dword [dword_512264]
	mov [esp+4F30h], ax
	cmp ebx, 2
	jge loc_418357
	test byte [esp+1F4h], 4
	jnz loc_417F8B ; jumptable 00417F84 default case
	mov [esp+4F30h], si
	jmp loc_417F8B ; jumptable 00417F84 default case

loc_418357:
	lea edx, [esp+4ED0h]
	mov eax, esp
	call sub_4153E0
	mov esi, eax
	jmp loc_417F8B ; jumptable 00417F84 default case

loc_41836C:
	push 2
	push 5
	mov eax, 2B6h
	mov edx, [esp+4F74h]
	call sub_41B650
	add eax, edx
	jmp loc_418236

loc_418388:
	cmp dword [dword_5121F8], 2
	jz loc_41844A
	mov eax, 1Ah
	xor ecx, ecx
	mov [esp+4F18h], eax
	mov [esp+4F4Ch], cx

loc_4183AB:
	mov edx, [esp+4F2Eh]
	sar edx, 10h
	imul edx, 684h
	mov eax, [esp+4F4Ah]
	sar eax, 10h
	cmp eax, [esp+edx+230h]
	jge loc_418596
	shl eax, 2
	add eax, edx
	lea edx, [esp+4E30h]
	mov eax, [esp+eax+238h]
	call sub_41B150
	push 4
	push 5
	mov eax, 2B6h
	mov ebx, [esp+4F20h]
	call sub_41B650
	add eax, ebx
	add eax, edi
	movsx ebx, ax
	mov eax, 2A8h
	mov ecx, 12h
	call sub_41B670
	movsx edx, ax
	lea eax, [esp+4E38h]
	call sub_4054E0
	mov ecx, [esp+4F18h]
	mov eax, [esp+4F4Ch]
	add ecx, 1Ah
	inc eax
	mov [esp+4F18h], ecx
	mov [esp+4F4Ch], ax
	jmp loc_4183AB

loc_41844A:
	push 4
	push 5
	mov eax, 2B6h
	call sub_41B650
	add eax, 1Ah
	add eax, edi
	movsx ebx, ax
	mov eax, 2A8h
	call sub_41B670
	movsx edx, ax
	mov eax, 2E4h

loc_418474:
	mov ecx, 12h
	call sub_41B710
	call sub_4054E0

loc_418483:
	movsx eax, si
	mov eax, [esp+eax*2+4ECEh]
	sar eax, 10h
	imul edx, eax, 684h
	cmp dword [esp+edx+280h], 2
	jnz loc_4185E5
	lea ebx, [esp+4E30h]
	mov edx, eax
	mov eax, esp
	call sub_41A040
	mov [esp+4F3Ch], ax
	inc eax
	imul eax, 1Ah
	xor ecx, ecx
	mov [esp+4F68h], eax
	mov eax, 1Ah
	mov [esp+4F64h], cx
	mov [esp+4F24h], eax

loc_4184DD:
	mov ecx, [esp+4F62h]
	mov ebx, dword [dword_5121FC]
	sar ecx, 10h
	cmp ecx, ebx
	jge loc_4186E3
	movsx eax, si
	mov eax, [esp+eax*2+4ECEh]
	sar eax, 10h
	imul edx, eax, 684h
	lea eax, 0[ecx*4]
	add eax, edx
	lea edx, [esp+4E30h]
	mov eax, [esp+eax+238h]
	call sub_41B150
	mov eax, [esp+4F3Ah]
	sar eax, 10h
	cmp ecx, eax
	jz loc_4185C9
	push 4
	push 5
	mov eax, 2B6h
	mov ebx, [esp+4F2Ch]
	call sub_41B650
	add eax, ebx

loc_41854D:
	add eax, edi
	movsx ebx, ax
	mov eax, 2AAh
	mov ecx, 12h
	call sub_41B670
	movsx edx, ax
	lea eax, [esp+4E38h]
	call sub_4054E0
	mov eax, [esp+4F64h]
	mov ecx, [esp+4F24h]
	inc eax
	add ecx, 1Ah
	mov [esp+4F64h], ax
	mov [esp+4F24h], ecx
	jmp loc_4184DD

loc_418596:
	push 4
	push 5
	mov eax, 2B6h
	mov edx, [esp+4F20h]
	call sub_41B650
	add eax, edx
	add eax, edi
	movsx ebx, ax
	mov eax, 2A8h
	call sub_41B670
	movsx edx, ax
	mov eax, 2A5h
	jmp loc_418474

loc_4185C9:
	push 2
	push 5
	mov eax, 2B6h
	mov edx, [esp+4F70h]
	call sub_41B650
	add eax, edx
	jmp loc_41854D

loc_4185E5:
	cmp dword [dword_5121F8], 2
	jz loc_4186AA
	mov ebx, 1Ah
	xor edx, edx
	mov [esp+4F20h], ebx
	mov [esp+4F44h], dx

loc_418608:
	movsx eax, si
	mov eax, [esp+eax*2+4ECEh]
	sar eax, 10h
	imul eax, 684h
	mov edx, [esp+4F42h]
	sar edx, 10h
	cmp edx, [esp+eax+230h]
	jge loc_418BA4
	shl edx, 2
	add eax, edx
	lea edx, [esp+4E30h]
	mov eax, [esp+eax+238h]
	call sub_41B150
	push 4
	push 5
	mov eax, 2B6h
	mov ebx, [esp+4F28h]
	call sub_41B650
	add eax, ebx
	add eax, edi
	movsx ebx, ax
	mov eax, 2AAh
	mov ecx, 12h
	call sub_41B670
	movsx edx, ax
	lea eax, [esp+4E38h]
	call sub_4054E0
	mov ecx, [esp+4F20h]
	mov eax, [esp+4F44h]
	add ecx, 1Ah
	inc eax
	mov [esp+4F20h], ecx
	mov [esp+4F44h], ax
	jmp loc_418608

loc_4186AA:
	push 4
	push 5
	mov eax, 2B6h
	call sub_41B650
	add eax, 1Ah
	add eax, edi
	movsx ebx, ax
	mov eax, 2AAh
	call sub_41B670
	movsx edx, ax
	mov eax, 2E4h

loc_4186D4:
	mov ecx, 12h
	call sub_41B710
	call sub_4054E0

loc_4186E3:
	mov eax, [esp+4F2Eh]
	sar eax, 10h
	mov [esp+4F00h], eax
	lea eax, [eax+eax*8]
	add eax, byte_512E84
	push eax
	push aS_4 ; "%s"
	lea eax, [esp+4E38h]
	push eax
	call sprintf_
	add esp, 0Ch
	push 5
	push 5
	mov eax, 2BAh
	call sub_41B650
	add eax, edi
	movsx ebx, ax
	mov eax, 2BAh
	mov ecx, 12h
	call sub_41B670
	movsx edx, ax
	lea eax, [esp+4E38h]
	call sub_4054E0
	movsx eax, si
	add eax, eax
	mov [esp+4EE8h], eax
	mov eax, [esp+eax+4ECEh]
	sar eax, 10h
	lea eax, [eax+eax*8]
	add eax, byte_512E84
	push eax
	push aS_4 ; "%s"
	lea eax, [esp+4E38h]
	push eax
	call sprintf_
	add esp, 0Ch
	push 5
	push 5
	mov eax, 2BBh
	call sub_41B650
	add eax, edi
	movsx ebx, ax
	mov eax, 2BBh
	mov ecx, 12h
	call sub_41B670
	movsx edx, ax
	lea eax, [esp+4E38h]
	call sub_4054E0
	imul eax, [esp+4F00h], 684h
	mov eax, [esp+eax+21Ch]
	mov eax, [eax]
	call sub_41A3E0
	push eax
	push aS_4 ; "%s"
	lea eax, [esp+4E38h]
	push eax
	call sprintf_
	add esp, 0Ch
	push 2
	push 5
	mov eax, 2B6h
	call sub_41B650
	add eax, edi
	movsx ebx, ax
	mov eax, 2A8h
	mov ecx, 12h
	call sub_41B670
	movsx edx, ax
	lea eax, [esp+4E38h]
	call sub_4054E0
	mov eax, [esp+4EE8h]
	mov eax, [esp+eax+4ECEh]
	sar eax, 10h
	imul eax, 684h
	mov eax, [esp+eax+21Ch]
	mov eax, [eax]
	call sub_41A3E0
	push eax
	push aS_4 ; "%s"
	lea eax, [esp+4E38h]
	push eax
	call sprintf_
	add esp, 0Ch
	push 2
	push 5
	mov eax, 2B6h
	call sub_41B650
	add eax, edi
	movsx ebx, ax
	mov eax, 2AAh

loc_41885B:
	mov ecx, 12h
	call sub_41B670
	movsx edx, ax
	lea eax, [esp+4E38h]
	call sub_4054E0
	mov eax, ebp
	call sub_40FA90
	mov eax, dword [dword_4D4D24]
	mov edx, [esp+4EFCh]
	xor ecx, ecx
	mov eax, [eax+20h]
	xor ebx, ebx
	call sub_426B70
	mov eax, 12h
	call sub_4274F0
	cmp dword [dword_4D2310], 0
	jz loc_4188B9
	mov eax, dword [dword_4D4C7C]
	mov edx, dword [dword_4D4C80]
	sub eax, 7
	call sub_4267C0

loc_4188B9:
	cmp word [esp+4F60h], 0
	jz loc_4188C9

loc_4188C9:
	call sub_4976B8
	xor eax, eax
	call sub_403550
	mov eax, ebp
	mov ebx, [esp+4F60h]
	call sub_423CA0
	call sub_405960
	mov [esp+4F40h], ax
	test bx, bx
	jl loc_418976
	mov ecx, [esp+4F04h]
	cmp cx, 1
	jnz loc_418976
	mov eax, [esp+4F28h]
	cmp ax, cx
	jnz loc_418976
	cmp byte [byte_4D76C1], 1
	jnz loc_418976
	mov ebx, [esp+4F5Ah]
	xor edx, edx
	xor ah, ch
	mov ecx, [esp+4F2Ah]
	mov [esp+4F28h], edx
	mov byte [byte_4D76C1], ah
	sar ebx, 10h
	mov edx, [esp+4F56h]
	mov eax, esp
	sar ecx, 10h
	sar edx, 10h
	call sub_414400
	mov [esp+4F34h], eax
	mov eax, dword [dword_51221C]
	lea edx, [esp+4E80h]
	call sub_41A3A0
	cwde
	call sub_41AEF0

loc_418976:
	cmp word [esp+4F40h], 0
	jz loc_418B59
	mov eax, dword [dword_5637F4]
	cmp eax, [esp+4EF0h]
	jle loc_418B59
	cmp word [esp+4F04h], 0
	jnz loc_418EE8

loc_4189A6:
	mov eax, dword [dword_5637F4]
	add eax, 0Fh
	mov [esp+4EF0h], eax
	cmp word [ebp+0Ah], 2
	jnz loc_4189E3
	cmp word [esp+4F40h], 0Dh
	jnz loc_4189E3
	cmp dword [dword_512208], 1
	jle loc_418EFA
	xor ebx, ebx
	call sub_4098D0
	mov [esp+4F40h], bx

loc_4189E3:
	cmp word [ebp+0Ah], 3
	jnz loc_4189FA
	cmp word [esp+4F40h], 0Dh
	jnz loc_4189FA
	call sub_415BF0

loc_4189FA:
	cmp word [ebp+0Ah], 4
	jnz loc_418A10
	cmp word [esp+4F40h], 0Dh
	jz loc_418F11

loc_418A10:
	mov ecx, [esp+4F40h]
	cmp cx, 1Bh
	jnz loc_418F59
	mov ebx, 0Dh
	mov word [ebp+0Ah], 0
	mov [esp+4F40h], bx

loc_418A34:
	cmp dword [dword_5121F8], 0
	jz loc_418F73
	xor bl, bl
	mov byte [byte_4D76C2], bl
	mov byte [byte_4D76C1], bl

loc_418A4F:
	cmp word [ebp+0Ah], 1
	jnz loc_418A7B
	cmp word [esp+4F40h], 0Dh
	jnz loc_418A7B
	xor cl, cl
	mov byte [byte_4D76C1], cl
	mov byte [byte_4D76C2], cl
	mov byte [byte_4D76C3], cl
	mov byte [byte_4D76C0], cl

loc_418A7B:
	cmp dword [dword_512264], 2
	jle loc_418B41
	mov edx, [esp+4F40h]
	cmp dx, 4D00h
	jnz loc_418F7D
	mov eax, 0Dh
	mov word [ebp+0Ah], 6
	mov [esp+4F40h], ax

loc_418AAD:
	mov ecx, dword [dword_51220C]

loc_418AB3:
	mov eax, [esp+4F56h]
	sar eax, 10h
	movsx edx, si
	dec eax
	cmp edx, eax
	jnz loc_419009
	xor esi, esi

loc_418ACB:
	movsx eax, si
	mov eax, [esp+eax*2+4ECEh]
	sar eax, 10h
	imul edx, eax, 684h
	test byte [esp+edx+1F4h], 4
	jz loc_418AB3
	cmp eax, ecx
	jz loc_418AB3
	mov edx, 7Fh
	xor eax, eax
	mov word [ebp+0Ah], 6

loc_418AF9:
	call sub_4423F0

loc_418AFE:
	mov dx, [ebp+0Ah]
	cmp dx, 5
	jnz loc_41900F

loc_418B0C:
	mov ecx, [esp+4F40h]
	cmp cx, 4800h
	jnz loc_41901E

loc_418B1E:
	mov edx, 7Fh
	xor eax, eax
	call sub_4423F0
	mov eax, ebp
	mov word [ebp+0Ah], 0
	xor edx, edx
	call sub_423E10
	mov [esp+4F40h], dx

loc_418B41:
	mov edx, [esp+4F3Eh]
	mov eax, ebp
	sar edx, 10h
	call sub_410414
	mov [esp+4EECh], eax

loc_418B59:
	cmp dword [esp+4EECh], 0
	jz loc_418037

loc_418B67:
	mov eax, 12h
	xor ecx, ecx
	xor ebx, ebx
	xor edx, edx
	mov esi, 1
	call sub_4274F0
	call sub_4159C0
	xor eax, eax
	mov dword [dword_4D1FFC], esi
	call sub_403550
	mov esi, [esp+4EECh]
	mov eax, esi
	add esp, 4F74h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_418BA4:
	push 4
	push 5
	mov eax, 2B6h
	mov edx, [esp+4F28h]
	call sub_41B650
	add eax, edx
	add eax, edi
	movsx ebx, ax
	mov eax, 2AAh
	call sub_41B670
	movsx edx, ax
	mov eax, 2A5h
	jmp loc_4186D4

loc_418BD7:
	mov eax, 2B6h
	call sub_41B650
	add eax, edi
	movsx ebx, ax
	mov eax, 2B6h
	xor ecx, ecx
	call sub_41B670
	movsx edx, ax
	mov eax, 2B6h
	call sub_405580
	mov eax, 2B6h
	call sub_41B650
	add eax, edi
	movsx ecx, ax
	mov eax, 2B6h
	call sub_41B670
	mov edx, dword [dword_5121F8+2]
	movsx ebx, ax
	mov eax, 1
	sar edx, 10h
	call sub_415C50
	mov edx, [esp+4F2Eh]
	sar edx, 10h
	imul eax, edx, 684h
	cmp dword [esp+eax+280h], 2
	jnz loc_418D4E
	lea ebx, [esp+4E30h]
	mov eax, esp
	call sub_41A040
	mov [esp+4F70h], ax
	inc eax
	imul eax, 1Ah
	xor edx, edx
	mov ebx, 1Ah
	mov [esp+4F50h], dx
	mov [esp+4F14h], ebx
	mov [esp+4F08h], eax

loc_418C83:
	mov ecx, [esp+4F4Eh]
	mov ebx, dword [dword_5121FC]
	sar ecx, 10h
	cmp ecx, ebx
	jge loc_418E3C
	mov eax, [esp+4F2Eh]
	sar eax, 10h
	imul edx, eax, 684h
	lea eax, 0[ecx*4]
	add eax, edx
	lea edx, [esp+4E30h]
	mov eax, [esp+eax+238h]
	call sub_41B150
	mov eax, [esp+4F6Eh]
	sar eax, 10h
	cmp ecx, eax
	jz loc_418D35
	push 4
	push 5
	mov eax, 2B6h
	mov ebx, [esp+4F1Ch]
	call sub_41B650
	add eax, ebx

loc_418CEC:
	add eax, edi
	movsx ebx, ax
	mov eax, 2A8h
	mov ecx, 12h
	call sub_41B670
	movsx edx, ax
	lea eax, [esp+4E38h]
	call sub_4054E0
	mov eax, [esp+4F50h]
	mov ecx, [esp+4F14h]
	inc eax
	add ecx, 1Ah
	mov [esp+4F50h], ax
	mov [esp+4F14h], ecx
	jmp loc_418C83

loc_418D35:
	push 2
	push 5
	mov eax, 2B6h
	mov edx, [esp+4F10h]
	call sub_41B650
	add eax, edx
	jmp loc_418CEC

loc_418D4E:
	mov ecx, 1Ah
	xor ebx, ebx
	mov [esp+4F10h], ecx
	mov [esp+4F54h], bx

loc_418D64:
	mov edx, [esp+4F2Eh]
	sar edx, 10h
	imul edx, 684h
	mov eax, [esp+4F52h]
	sar eax, 10h
	cmp eax, [esp+edx+230h]
	jge loc_418DFF
	shl eax, 2
	add eax, edx
	lea edx, [esp+4E30h]
	mov eax, [esp+eax+238h]
	call sub_41B150
	push 4
	push 5
	mov eax, 2B6h
	mov edx, [esp+4F18h]
	call sub_41B650
	add eax, edx
	add eax, edi
	movsx ebx, ax
	mov eax, 2A8h
	mov ecx, 12h
	call sub_41B670
	movsx edx, ax
	lea eax, [esp+4E38h]
	call sub_4054E0
	mov ebx, [esp+4F10h]
	mov ecx, [esp+4F54h]
	add ebx, 1Ah
	inc ecx
	mov [esp+4F10h], ebx
	mov [esp+4F54h], cx
	jmp loc_418D64

loc_418DFF:
	push 4
	push 5
	mov eax, 2B6h
	mov ecx, [esp+4F18h]
	call sub_41B650
	add eax, ecx
	add eax, edi
	movsx ebx, ax
	mov eax, 2A8h
	call sub_41B670
	movsx edx, ax
	mov eax, 2A5h
	mov ecx, 12h
	call sub_41B710
	call sub_4054E0

loc_418E3C:
	mov eax, [esp+4F2Eh]
	sar eax, 10h
	mov [esp+4F00h], eax
	lea eax, [eax+eax*8]
	add eax, byte_512E84
	push eax
	push aS_4 ; "%s"
	lea eax, [esp+4E38h]
	push eax
	call sprintf_
	add esp, 0Ch
	push 5
	push 5
	mov eax, 2AAh
	call sub_41B650
	add eax, edi
	movsx ebx, ax
	mov eax, 2A8h
	mov ecx, 12h
	call sub_41B670
	movsx edx, ax
	lea eax, [esp+4E38h]
	call sub_4054E0
	imul eax, [esp+4F00h], 684h
	mov eax, [esp+eax+21Ch]
	mov eax, [eax]
	call sub_41A3E0
	push eax
	push aS_4 ; "%s"
	lea eax, [esp+4E38h]
	push eax
	call sprintf_
	add esp, 0Ch
	push 2
	push 5
	mov eax, 2B6h
	call sub_41B650
	add eax, edi
	movsx ebx, ax
	mov eax, 2A8h
	jmp loc_41885B

loc_418EE8:
	cmp byte [byte_4D76C1], 0
	jz loc_4189A6
	jmp loc_418B59

loc_418EFA:
	mov dword [dword_512214], 2
	xor dh, dh
	mov byte [byte_4D76C1], dh
	jmp loc_4189E3

loc_418F11:
	mov eax, 12h
	xor ecx, ecx
	xor ebx, ebx
	xor edx, edx
	mov edi, 1
	call sub_4274F0
	xor esi, esi
	call sub_4159C0
	mov dword [dword_4D21AC], esi
	call sub_4762E0
	mov esi, dword_4D28C4
	xor eax, eax
	mov dword [dword_4D1FFC], edi
	call sub_403550
	mov eax, esi
	add esp, 4F74h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_418F59:
	cmp word [ebp+0Ah], 0
	jnz loc_418A4F
	cmp cx, 0Dh
	jz loc_418A34
	jmp loc_418A4F

loc_418F73:
	call sub_415BF0
	jmp loc_418A4F

loc_418F7D:
	cmp dx, 4B00h
	jnz loc_418FDA
	mov ecx, 0Dh
	mov word [ebp+0Ah], 5
	mov [esp+4F40h], cx

loc_418F97:
	test si, si
	jnz loc_419006
	mov esi, [esp+4F0Ch]

loc_418FA3:
	movsx eax, si
	mov eax, [esp+eax*2+4ECEh]
	sar eax, 10h
	imul edx, eax, 684h
	test byte [esp+edx+1F4h], 4
	jz loc_418F97
	cmp eax, dword [dword_51220C]
	jz loc_418F97
	mov edx, 7Fh
	xor eax, eax
	mov word [ebp+0Ah], 5
	jmp loc_418AF9

loc_418FDA:
	cmp word [ebp+0Ah], 5
	jnz loc_418FE7
	cmp dx, 0Dh
	jz loc_418F97

loc_418FE7:
	cmp word [ebp+0Ah], 6
	jnz loc_418AFE
	cmp word [esp+4F40h], 0Dh
	jz loc_418AAD
	jmp loc_418AFE

loc_419006:
	dec esi
	jmp loc_418FA3

loc_419009:
	inc esi
	jmp loc_418ACB

loc_41900F:
	cmp dx, 6
	jz loc_418B0C
	jmp loc_418B41

loc_41901E:
	cmp cx, 5000h
	jz loc_418B1E
	jmp loc_418B41
;sub_417DD4 endp

off_419030: dd loc_41924E
	dd loc_419B54 ; jump table for switch statement
	dd loc_419AC4
	dd loc_419AC4
	dd loc_419ADC

sub_419044: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 4F6Ch
	mov ebp, eax
	mov edi, dword [dword_512214]
	xor edx, edx
	xor ecx, ecx
	xor ebx, ebx
	mov [esp+4F44h], edx
	mov [esp+4F38h], ebx
	mov [esp+4F48h], ebx
	mov edx, 1
	mov [esp+4F5Ch], ecx
	mov [esp+4F50h], edx
	mov [esp+4F64h], dx
	cmp edi, 2
	jz loc_419202
	cmp byte [byte_4D76C0], 1
	jz loc_419214

loc_4190A4:
	call sub_41A020
	mov [esp+4F60h], ax
	cmp dword [dword_4D21AC], 0
	jnz loc_4190E5
	cmp byte [byte_512ECC], 1
	jz loc_4190E5
	mov edx, dword [dword_4D5A28]
	mov eax, dword [dword_51221C]
	call sub_476750
	xor eax, eax
	mov edx, 1
	call sub_489800
	mov dword [dword_4D21AC], edx

loc_4190E5:
	cmp dword [dword_4D5EF8], 0
	jnz loc_41911D
	mov esi, aCNfs2seFront_3 ; "c:\\nfs2se\\frontend\\common\\Statdisp.c"
	mov edi, 0C2h
	mov ebx, 20h
	mov edx, 4E30h
	mov eax, aDumicars ; "dumicars"
	mov dword [dword_4DB1D8], esi
	mov dword [dword_4DB1DC], edi
	call sub_4844B0
	mov dword [dword_4D5EF8], eax

loc_41911D:
	mov edx, [esp+4F5Eh]
	mov eax, esp
	sar edx, 10h
	call sub_41A570
	cmp dword [dword_5121F8], 1
	jnz loc_41914F
	cmp byte [byte_4D76C2], 1
	jnz loc_41914F
	mov eax, esp
	xor bl, bl
	call sub_413650
	mov byte [byte_4D76C2], bl

loc_41914F:
	cmp dword [dword_5121F8], 2
	jnz loc_41916F
	cmp byte [byte_4D76C3], 1
	jnz loc_41916F
	mov eax, esp
	call sub_4131C4
	xor al, al
	mov byte [byte_4D76C3], al

loc_41916F:
	cmp byte [byte_512DAF], 1
	jnz loc_419191
	cmp word [word_4D4204], 1
	jnz loc_419191
	mov eax, esp
	call sub_424E60
	xor eax, eax
	mov word [word_4D4204], ax

loc_419191:
	cmp byte [byte_4D76C0], 1
	jnz loc_4191A3
	mov edx, esp
	mov eax, ebp
	call sub_4154C0

loc_4191A3:
	cmp byte [byte_512ECC], 1
	jnz loc_419228

loc_4191B0:
	lea ebx, [esp+4E30h]
	mov eax, dword [dword_51221C]
	mov edx, dword [dword_5121F8+2]
	call sub_41A3A0
	sar edx, 10h
	cwde
	call sub_41ACA0
	mov [esp+4F54h], eax
	xor eax, eax

loc_4191D9:
	mov ebx, [esp+4F5Eh]
	movsx edx, ax
	sar ebx, 10h
	cmp edx, ebx
	jge loc_41923D
	imul edx, 684h
	mov edx, [esp+edx+278h]
	mov [esp+edx*2+4F1Eh], ax
	inc eax
	jmp loc_4191D9

loc_419202:
	mov eax, 0FFFFFFFDh
	add esp, 4F6Ch
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_419214:
	mov edx, 30h
	mov eax, dword_4E5FFC
	call sub_48A01C
	jmp loc_4190A4

loc_419228:
	mov eax, 64h
	mov edx, dword [dword_4D5A28]
	call sub_4864A0
	jmp loc_4191B0

loc_41923D:
	mov eax, dword [dword_512208]
	cmp eax, 4 ; switch 5 cases
	ja loc_41924E ; jumptable 00419247 default case
	jmp off_419030[eax*4] ; switch jump

loc_41924E:
	xor eax, eax ; jumptable 00419247 default case
	mov edx, [esp+4F60h]
	mov [esp+4F68h], ax
	cmp dx, 1

loc_419263:
	jle loc_41927B

loc_419265:
	lea edx, [esp+4F20h]
	mov eax, esp
	call sub_415440
	mov [esp+4F64h], ax

loc_41927B:
	cmp word [esp+4F60h], 2
	jle loc_419BFC
	mov eax, [ebp+1Ch]
	and byte [eax+2], 0FEh
	mov eax, [ebp+20h]
	and byte [eax+2], 0FEh

loc_419298:
	mov ebx, [esp+4F62h]
	mov eax, [ebp+10h]
	mov edx, [esp+4F66h]
	call sub_415490
	sar ebx, 10h
	sar edx, 10h
	mov eax, [ebp+14h]
	call sub_415470
	cmp byte [byte_512ECC], 0
	jz loc_4192CC
	mov eax, [ebp+18h]
	or byte [eax+8], 1

loc_4192CC:
	mov eax, ebp
	xor esi, esi
	xor edx, edx
	mov dword [dword_4D2098], esi
	call sub_410E80
	mov eax, esp
	mov edi, [esp+4F44h]
	call sub_4159E0
	test edi, edi
	jnz loc_419A89
	mov eax, [esp+4F60h]
	dec eax
	mov [esp+4F58h], eax

loc_419302:
	call sub_4833C7
	mov ecx, [esp+4F48h]
	mov edx, 400h
	add ecx, eax
	call sub_428A20
	call sub_415E40
	mov [esp+4F48h], ecx
	mov [esp+4F40h], ecx
	xor eax, eax
	mov ecx, [esp+4F5Ch]
	mov al, byte [byte_512DFB]
	xor ebx, ebx
	inc ecx
	mov eax, dword off_4D41E8[eax*4]
	mov [esp+4F5Ch], ecx
	xor ecx, ecx
	call sub_405B30
	xor eax, eax
	mov edx, 400h
	mov al, byte [byte_512DFB]
	xor ecx, ecx
	xor ebx, ebx
	mov eax, dword off_4D4158[eax*4]
	call sub_405B30
	call sub_415CC0
	cmp byte [byte_512DFB], 5
	jnz loc_419C0F
	mov esi, dword [dword_5121FC]
	push esi
	mov eax, 2B8h
	call sub_41B710
	push eax
	push aSD_0 ; "%s %d"

loc_419398:
	lea eax, [esp+4E8Ch]
	push eax
	call sprintf_
	add esp, 10h
	push 2
	push 4
	mov eax, 2B8h
	call sub_41B650
	movsx ebx, ax
	mov eax, 2B8h
	mov ecx, 12h
	call sub_41B670
	movsx edx, ax
	lea eax, [esp+4E88h]
	call sub_4054E0
	mov eax, 288h
	call sub_41B650
	movsx ebx, ax
	mov eax, 288h
	xor ecx, ecx
	call sub_41B670
	movsx edx, ax
	mov eax, 288h
	mov esi, [esp+4F54h]
	call sub_405580
	test si, si
	jz loc_41943D
	push 2
	push 3
	mov eax, 288h
	call sub_41B650
	movsx ebx, ax
	mov eax, 288h
	call sub_41B670
	add eax, 0Ah
	mov ecx, 12h
	movsx edx, ax
	lea eax, [esp+4E38h]
	call sub_4054E0

loc_41943D:
	mov eax, 284h
	call sub_41B650
	movsx ebx, ax
	mov eax, 284h
	xor ecx, ecx
	call sub_41B670
	movsx edx, ax
	mov eax, 284h
	call sub_405580
	mov eax, 285h
	mov edi, 27Dh
	call sub_41B650
	movsx ebx, ax
	mov eax, 285h
	xor ecx, ecx
	call sub_41B670
	movsx edx, ax
	mov eax, 285h
	mov [esp+4F4Ch], di
	call sub_405580
	mov eax, 286h
	mov edi, [esp+4F66h]
	call sub_41B650
	movsx ebx, ax
	mov eax, 286h
	xor ecx, ecx
	call sub_41B670
	movsx edx, ax
	mov eax, 286h
	sar edi, 10h
	call sub_405580
	lea eax, [edi+edi*8]
	add eax, byte_512E84
	push eax
	push aS_4 ; "%s"
	lea eax, [esp+4E88h]
	push eax
	call sprintf_
	add esp, 0Ch
	push 5
	push 5
	mov eax, 2A1h
	call sub_41B650
	movsx ebx, ax
	mov eax, 27Dh
	mov ecx, 12h
	call sub_41B670
	movsx edx, ax
	lea eax, [esp+4E88h]
	call sub_4054E0
	imul esi, edi, 684h
	mov eax, [esp+esi+21Ch]
	mov eax, [eax]
	call sub_41A3E0
	push eax
	push aS_4 ; "%s"
	lea eax, [esp+4E88h]
	push eax
	call sprintf_
	add esp, 0Ch
	push 2
	push 5
	mov eax, 284h
	call sub_41B650
	sub eax, 18h
	movsx ebx, ax
	mov eax, 27Dh
	mov ecx, 12h
	call sub_41B670
	movsx edx, ax
	lea eax, [esp+4E88h]
	call sub_4054E0
	cmp dword [esp+esi+280h], 2
	jnz loc_419C2B
	mov ax, [esp+esi+278h]
	add eax, 288h
	push 4
	movsx ecx, ax
	push 5
	mov eax, ecx
	call sub_41B650
	movsx ebx, ax
	mov eax, 27Dh
	call sub_41B670
	cwde
	mov [esp+4F44h], eax
	mov edx, [esp+4F44h]
	mov eax, ecx
	mov ecx, 12h
	call sub_41B710
	call sub_4054E0
	lea edx, [esp+4E80h]
	mov eax, [esp+esi+234h]
	shl edi, 2
	call sub_41B150
	mov ecx, dword dword_4E5FFC[edi]
	test ecx, ecx
	jz loc_419636
	lea eax, [ecx+288h]
	call sub_41B710
	push eax
	lea eax, [esp+4E84h]
	push eax
	push aSS_0 ; "%s (%s)"
	lea eax, [esp+4EDCh]
	push eax
	call sprintf_
	add esp, 10h
	lea esi, [esp+4ED0h]
	lea edi, [esp+4E80h]
	push edi

loc_41961D:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_419635
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_41961D

loc_419635:
	pop edi

loc_419636:
	push 4
	push 5
	mov eax, 285h
	mov esi, [esp+4F52h]
	call sub_41B650
	sar esi, 10h
	movsx ebx, ax
	mov eax, esi
	mov ecx, 12h
	call sub_41B670
	movsx edx, ax
	lea eax, [esp+4E88h]
	call sub_4054E0
	mov edx, [esp+4F66h]
	lea ebx, [esp+4E80h]
	mov eax, esp
	sar edx, 10h
	call sub_41A0B0
	push 4
	push 5
	mov eax, 286h
	call sub_41B650
	movsx ebx, ax
	mov eax, esi
	mov ecx, 12h
	call sub_41B670
	movsx edx, ax
	lea eax, [esp+4E88h]

loc_4196AB:
	call sub_4054E0
	cmp word [esp+4F60h], 1
	jle loc_419853
	cmp dword [dword_512208], 0
	jnz loc_419C98
	mov eax, [esp+4F62h]
	sar eax, 10h
	mov eax, [esp+eax*2+4F1Eh]
	sar eax, 10h
	imul edx, eax, 684h

loc_4196E6:
	mov ecx, esp
	add edx, ecx
	call sub_415DA0

loc_4196EF:
	mov edx, [esp+4F62h]
	sar edx, 10h
	lea ecx, [edx+edx]
	mov eax, [esp+ecx+4F1Eh]
	sar eax, 10h
	imul eax, 684h
	mov eax, [esp+eax+21Ch]
	mov eax, [eax]
	call sub_415D40
	mov eax, [esp+ecx+4F1Eh]
	sar eax, 10h
	imul eax, 684h
	cmp dword [esp+eax+280h], 2
	jnz loc_419CD2
	mov eax, edx
	call sub_415D00
	mov eax, [esp+ecx+4F1Eh]
	sar eax, 10h
	imul eax, 684h
	lea edx, [esp+4E80h]
	mov eax, [esp+eax+234h]
	call sub_41B150
	cmp dword [dword_512208], 1
	jg loc_4197D3
	mov eax, [esp+ecx+4F1Eh]
	sar eax, 10h
	shl eax, 2
	mov edx, dword dword_4E5FFC[eax]
	test edx, edx
	jz loc_4197D3
	lea eax, [edx+0B3h]
	call sub_41B710
	push eax
	lea eax, [esp+4E84h]
	push eax
	push aSS_0 ; "%s (%s)"
	lea eax, [esp+4EDCh]
	push eax
	call sprintf_
	add esp, 10h
	lea esi, [esp+4ED0h]
	lea edi, [esp+4E80h]
	push edi

loc_4197BA:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_4197D2
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_4197BA

loc_4197D2:
	pop edi

loc_4197D3:
	push 4
	push 5
	mov eax, 285h
	call sub_41B650
	movsx ebx, ax
	mov eax, 27Eh
	mov ecx, 12h
	call sub_41B670
	movsx edx, ax
	lea eax, [esp+4E88h]
	call sub_4054E0
	mov eax, [esp+4F62h]
	sar eax, 10h
	lea ebx, [esp+4E80h]
	mov edx, [esp+eax*2+4F1Eh]
	mov eax, esp
	sar edx, 10h
	call sub_41A0B0
	push 4
	push 5
	mov eax, 286h
	call sub_41B650
	movsx ebx, ax
	mov eax, 27Eh
	mov ecx, 12h
	call sub_41B670
	movsx edx, ax
	lea eax, [esp+4E88h]

loc_41984E:
	call sub_4054E0

loc_419853:
	mov eax, ebp
	call sub_40FA90
	mov eax, [esp+4F1Eh]
	sar eax, 10h
	imul eax, 684h
	mov edx, [esp+eax+21Ch]
	mov eax, dword [dword_4D4D24]
	mov eax, [eax+20h]
	mov dx, [edx]
	call sub_426B70
	cmp dx, 0Ch
	jge loc_41989C
	mov edx, [esp+4F40h]
	mov eax, 12h
	xor ecx, ecx
	xor ebx, ebx
	call sub_4274F0

loc_41989C:
	cmp dword [dword_4D2310], 0
	jz loc_4198B8
	mov eax, dword [dword_4D4C7C]
	mov edx, dword [dword_4D4C80]
	sub eax, 7
	call sub_4267C0

loc_4198B8:
	cmp word [esp+4F5Ch], 0
	jz loc_4198C8

loc_4198C8:
	call sub_4976B8
	xor eax, eax
	call sub_403550
	xor ebx, ebx
	mov eax, ebp
	mov dword [dword_4D2094], ebx
	call sub_423CA0
	cmp word [word_51345C], 0
	jz loc_419911
	call sub_401080
	mov eax, 300h
	xor ecx, ecx
	call sub_402CD0
	mov word [word_51345C], cx
	call sub_48A2B4

loc_419911:
	mov esi, [esp+4F50h]
	cmp si, 1
	jnz loc_419984
	cmp byte [byte_4D76C0], 1
	jnz loc_419984
	cmp word [esp+4F5Ch], 0
	jl loc_419984
	mov edx, [esp+4F5Eh]
	xor eax, eax
	mov ebx, dword_4E5FFC
	mov [esp+4F50h], eax
	xor al, al
	sar edx, 10h
	mov byte [byte_4D76C0], al
	mov eax, esp
	call sub_413BF0
	cmp ax, si
	jnz loc_419984
	lea ebx, [esp+4E30h]
	mov eax, dword [dword_51221C]
	mov edx, dword [dword_5121F8+2]
	call sub_41A3A0
	sar edx, 10h
	cwde
	call sub_41ACA0
	mov [esp+4F54h], eax

loc_419984:
	call sub_405960
	mov ebx, eax
	test ax, ax
	jz loc_419A7B
	mov edx, dword [dword_5637F4]
	cmp edx, [esp+4F38h]
	jle loc_419A7B
	cmp byte [byte_4D76C0], 0
	jnz loc_419A7B
	mov edx, dword [dword_5637F4]
	add edx, 0Fh
	mov [esp+4F38h], edx
	cmp ax, 1Bh
	jnz loc_419D3F
	mov ebx, 0Dh
	mov word [ebp+0Ah], 0

loc_4199D9:
	xor dh, dh
	mov byte [byte_4D76C2], dh
	mov byte [byte_4D76C0], dh

loc_4199E7:
	cmp word [ebp+0Ah], 2
	jnz loc_419A08
	cmp bx, 0Dh
	jnz loc_419A08
	cmp dword [dword_512208], 1
	jle loc_419D59
	call sub_4098D0
	xor ebx, ebx

loc_419A08:
	cmp word [ebp+0Ah], 1
	jnz loc_419A1A
	cmp bx, 0Dh
	jnz loc_419A1A
	call sub_415BF0

loc_419A1A:
	cmp word [ebp+0Ah], 3
	jnz loc_419A2B
	cmp bx, 0Dh
	jz loc_419D7C

loc_419A2B:
	cmp word [esp+4F60h], 2
	jle loc_419A6A
	mov dx, [ebp+0Ah]
	cmp dx, 4
	jnz loc_419DC2

loc_419A44:
	cmp bx, 4800h
	jnz loc_419EC5

loc_419A4F:
	mov edx, 7Fh
	xor eax, eax
	call sub_4423F0
	xor ebx, ebx
	mov eax, ebp
	mov word [ebp+0Ah], 0
	call sub_423E10

loc_419A6A:
	movsx edx, bx
	mov eax, ebp
	call sub_410414
	mov [esp+4F44h], eax

loc_419A7B:
	cmp dword [esp+4F44h], 0
	jz loc_419302

loc_419A89:
	mov eax, 12h
	xor ecx, ecx
	xor ebx, ebx
	xor edx, edx
	call sub_4274F0
	call sub_4159C0
	mov edx, 1
	xor eax, eax
	mov dword [dword_4D1FFC], edx
	call sub_403550
	mov eax, [esp+4F44h]
	add esp, 4F6Ch
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_419AC4:
	lea edx, [esp+4F20h] ; jumptable 00419247 cases 2,3
	mov eax, esp
	call sub_4153E0
	xor ecx, ecx
	mov [esp+4F64h], ax

loc_419ADC:
	mov ax, word [dword_51220C] ; jumptable 00419247 case 4
	mov [esp+4F68h], ax
	xor eax, eax
	cmp cx, 1
	jz loc_41927B

loc_419AF6:
	movsx edx, ax
	mov edx, [esp+edx*2+4F1Eh]
	sar edx, 10h
	imul ebx, edx, 684h
	test byte [esp+ebx+1F4h], 4
	jz loc_419B2E
	mov ebx, [esp+4F66h]
	sar ebx, 10h
	cmp edx, ebx
	jz loc_419B2E
	mov ecx, 1
	mov [esp+4F64h], ax

loc_419B2E:
	inc eax
	mov edx, [esp+4F5Eh]
	movsx ebx, ax
	sar edx, 10h
	cmp ebx, edx
	jl loc_419B49
	test cx, cx
	jz loc_419265

loc_419B49:
	cmp cx, 1
	jnz loc_419AF6
	jmp loc_41927B

loc_419B54:
	mov ebx, 1 ; jumptable 00419247 case 1
	xor edx, edx
	mov [esp+4F64h], bx
	mov ebx, dword [dword_512264]
	mov [esp+4F68h], dx
	cmp ebx, 2
	jge loc_419BB6
	test byte [esp+1F4h], 4
	jz loc_419B8E
	cmp word [esp+4F60h], 1
	jmp loc_419263

loc_419B8E:
	lea edx, [esp+4F20h]
	mov eax, esp
	mov ecx, 1
	call sub_415440
	mov [esp+4F64h], ax
	mov [esp+4F68h], cx
	jmp loc_41927B

loc_419BB6:
	xor eax, eax
	cmp cx, 1
	jz loc_41927B

loc_419BC2:
	movsx edx, ax
	mov edx, [esp+edx*2+4F1Eh]
	sar edx, 10h
	imul ebx, edx, 684h
	test byte [esp+ebx+1F4h], 4
	jz loc_419BF0
	test edx, edx
	jz loc_419BF0
	mov ecx, 1
	mov [esp+4F64h], ax

loc_419BF0:
	inc eax
	cmp cx, 1
	jnz loc_419BC2
	jmp loc_41927B

loc_419BFC:
	mov eax, [ebp+1Ch]
	or byte [eax+2], 1
	mov eax, [ebp+20h]
	or byte [eax+2], 1
	jmp loc_419298

loc_419C0F:
	mov eax, 2B8h
	call sub_41B710
	push eax
	mov ebx, dword [dword_5121FC]
	push ebx
	push aDS ; "%d %s"
	jmp loc_419398

loc_419C2B:
	cmp dword [dword_5121F8], 2
	jnz loc_419C66
	push 4
	push 5
	mov eax, 289h
	call sub_41B650
	movsx ebx, ax
	mov eax, 27Dh
	call sub_41B670
	movsx edx, ax
	mov eax, 2E4h
	mov ecx, 12h
	call sub_41B710
	jmp loc_4196AB

loc_419C66:
	push 4
	push 5
	mov eax, 289h
	call sub_41B650
	movsx ebx, ax
	mov eax, 27Dh
	call sub_41B670
	movsx edx, ax
	mov eax, 2A5h
	mov ecx, 12h
	call sub_41B710
	jmp loc_4196AB

loc_419C98:
	mov eax, [esp+4F62h]
	sar eax, 10h
	mov eax, [esp+eax*2+4F1Eh]
	sar eax, 10h
	imul edx, eax, 684h
	test byte [esp+edx+1F4h], 4
	jz loc_4196E6
	lea eax, [eax+eax*8]
	add eax, byte_512E84
	call sub_415E00
	jmp loc_4196EF

loc_419CD2:
	cmp dword [dword_5121F8], 2
	jnz loc_419D0D
	push 4
	push 5
	mov eax, 295h
	call sub_41B650
	movsx ebx, ax
	mov eax, 27Eh
	call sub_41B670
	movsx edx, ax
	mov eax, 2E4h
	mov ecx, 12h
	call sub_41B710
	jmp loc_41984E

loc_419D0D:
	push 4
	push 5
	mov eax, 295h
	call sub_41B650
	movsx ebx, ax
	mov eax, 27Eh
	call sub_41B670
	movsx edx, ax
	mov eax, 2A5h
	mov ecx, 12h
	call sub_41B710
	jmp loc_41984E

loc_419D3F:
	cmp word [ebp+0Ah], 0
	jnz loc_4199E7
	cmp ax, 0Dh
	jz loc_4199D9
	jmp loc_4199E7

loc_419D59:
	xor ch, ch
	mov eax, 2
	mov byte [byte_4D76C3], ch
	mov byte [byte_4D76C2], ch
	mov byte [byte_4D76C0], ch
	mov dword [dword_512214], eax
	jmp loc_419A08

loc_419D7C:
	mov eax, 12h
	xor ecx, ecx
	xor ebx, ebx
	xor edx, edx
	mov esi, 1
	call sub_4274F0
	xor ebx, ebx
	call sub_4159C0
	mov dword [dword_4D21AC], ebx
	call sub_4762E0
	xor eax, eax
	mov dword [dword_4D1FFC], esi
	call sub_403550
	mov eax, dword_4D28C4
	add esp, 4F6Ch
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_419DC2:
	cmp dx, 5
	jz loc_419A44

loc_419DCC:
	cmp bx, 4B00h
	jnz loc_419E41
	mov eax, [esp+4F64h]
	test ax, ax
	jnz loc_419EFB
	mov eax, [esp+4F58h]
	mov [esp+4F64h], ax

loc_419DF2:
	mov eax, [esp+4F62h]
	sar eax, 10h
	mov eax, [esp+eax*2+4F1Eh]
	mov edx, dword [dword_51220C]
	sar eax, 10h
	cmp eax, edx
	jnz loc_419E2F
	mov ecx, [esp+4F64h]
	test cx, cx
	jnz loc_419F0B
	mov eax, [esp+4F58h]
	mov [esp+4F64h], ax

loc_419E2F:
	mov edx, 7Fh
	xor eax, eax
	mov word [ebp+0Ah], 4
	call sub_4423F0

loc_419E41:
	cmp bx, 4D00h
	jnz loc_419A6A

loc_419E4C:
	mov eax, [esp+4F5Eh]
	mov edx, [esp+4F62h]
	sar eax, 10h
	sar edx, 10h
	dec eax
	cmp edx, eax
	jnz loc_419F1B
	xor eax, eax
	mov [esp+4F64h], ax

loc_419E73:
	mov eax, [esp+4F62h]
	sar eax, 10h
	mov edx, [esp+eax*2+4F1Eh]
	mov ecx, dword [dword_51220C]
	sar edx, 10h
	cmp edx, ecx
	jnz loc_419EAE
	mov edx, [esp+4F5Eh]
	sar edx, 10h
	dec edx
	cmp eax, edx
	jnz loc_419F28
	xor ecx, ecx
	mov [esp+4F64h], cx

loc_419EAE:
	mov edx, 7Fh
	xor eax, eax
	mov word [ebp+0Ah], 5
	call sub_4423F0
	jmp loc_419A6A

loc_419EC5:
	cmp bx, 5000h
	jz loc_419A4F
	cmp bx, 0Dh
	jnz loc_419DCC
	cmp word [ebp+0Ah], 4
	jnz loc_419EE6
	mov ebx, 4B00h

loc_419EE6:
	cmp word [ebp+0Ah], 5
	jnz loc_419DCC
	mov ebx, 4D00h
	jmp loc_419E4C

loc_419EFB:
	mov edx, eax
	dec edx
	mov [esp+4F64h], dx
	jmp loc_419DF2

loc_419F0B:
	mov esi, ecx
	dec esi
	mov [esp+4F64h], si
	jmp loc_419E2F

loc_419F1B:
	inc word [esp+4F64h]
	jmp loc_419E73

loc_419F28:
	inc word [esp+4F64h]
	jmp loc_419EAE
;sub_419044 endp

off_419F40: dd aOval
	dd aOz ; "oz"
	dd aLast ; "last"
	dd aNort ; "nort"
	dd aPac_0 ; "pac"
	dd aMed_0 ; "med"
	dd aMyst ; "myst"
	dd aMono ; "mono"
aSSSS_0: db '%s     %s     %s     %s',0
aSSSS: db '%s     %s     %s     %s',0
dword_419F90: times 2 dd 0
	dd 1, 4, 2, 3, 5, 6, 7
dword_419FB4: dd 120031h, 350038h, 380031h, 3A0032h
	times 3 dd 0

sub_419FD0: ;SUBROUTINE
	push esi
	push edi
	sub esp, 10h
	mov edi, esp
	mov esi, dword_419FB4
	movsd
	movsd
	movsd
	movsd
	cmp ax, 8
	jl loc_419FE8
	xor eax, eax

loc_419FE8:
	cwde
	mov ax, [esp+eax*2]
	add esp, 10h
	pop edi
	pop esi
	ret
;sub_419FD0 endp

sub_41A000: ;SUBROUTINE
	cmp ax, 2
	jz loc_41A012
	cmp ax, 4
	jnz loc_41A015
	mov eax, 1
	ret

loc_41A012:
	xor eax, eax
	ret

loc_41A015:
	mov eax, 2
	ret
;sub_41A000 endp

sub_41A020: ;SUBROUTINE
	push edx
	mov dx, word [dword_512268]
	mov ax, word [dword_512264]
	add eax, edx
	cmp ax, 1
	jge loc_41A03B
	mov eax, 1

loc_41A03B:
	pop edx
	ret
;sub_41A020 endp

sub_41A040: ;SUBROUTINE
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 34h
	mov edi, eax
	mov [esp+30h], dx
	mov ebp, ebx
	mov esi, dword [dword_5121FC]
	xor eax, eax

loc_41A058:
	movsx edx, ax
	cmp edx, esi
	jge loc_41A081
	mov ecx, [esp+2Eh]
	sar ecx, 10h
	imul ecx, 684h
	lea ebx, [edi+ecx]
	mov ebx, [ebx+edx*4+238h]
	mov [esp+edx*4], ebx
	mov [esp+edx*2+20h], ax
	inc eax
	jmp loc_41A058

loc_41A081:
	lea ebx, [esp+20h]
	mov edx, esp
	mov eax, esi
	call sub_41B2D0
	mov eax, [esp+1Eh]
	sar eax, 10h
	mov edx, ebp
	mov eax, [esp+eax*4]
	call sub_41B150
	mov eax, [esp+20h]
	add esp, 34h
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret
;sub_41A040 endp

sub_41A0B0: ;SUBROUTINE
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 34h
	mov ebp, eax
	mov edi, edx
	mov [esp+30h], ebx
	mov esi, dword [dword_5121FC]
	xor eax, eax

loc_41A0C7:
	movsx edx, ax
	cmp edx, esi
	jge loc_41A0EC
	movsx ecx, di
	imul ecx, 684h
	lea ebx, [ecx+ebp]
	mov ebx, [ebx+edx*4+258h]
	mov [esp+edx*4], ebx
	mov [esp+edx*2+20h], ax
	inc eax
	jmp loc_41A0C7

loc_41A0EC:
	lea ebx, [esp+20h]
	mov edx, esp
	mov eax, esi
	call sub_41B2D0
	mov ebx, esi
	mov ah, byte [byte_512DFA]
	dec ebx
	cmp ah, 1
	jnz loc_41A142
	movsx eax, bx
	mov eax, [esp+eax*2+1Eh]
	sar eax, 10h
	fild dword [esp+eax*4]
	fmul dword [flt_4C8FB8]
	sub esp, 8
	fstp qword [esp]
	push a5_2f ; "%5.2f"
	mov ecx, [esp+3Ch]
	push ecx

loc_41A12A:
	call sprintf_
	add esp, 10h
	movsx eax, bx
	mov ax, [esp+eax*2+20h]
	add esp, 34h
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret

loc_41A142:
	movsx eax, bx
	mov eax, [esp+eax*2+1Eh]
	sar eax, 10h
	fild dword [esp+eax*4]
	fmul dword [flt_4C8FB4]
	sub esp, 8
	fstp qword [esp]
	push a5_2f ; "%5.2f"
	mov edx, [esp+3Ch]
	push edx
	jmp loc_41A12A
;sub_41A0B0 endp

sub_41A170: ;SUBROUTINE
	mov eax, [eax+21Ch]
	mov eax, [eax+30h]
	test eax, eax
	jl loc_41A18A
	cmp eax, 0Bh
	jge loc_41A18A
	mov eax, dword off_4D4A9C[eax*4]
	ret

loc_41A18A:
	mov eax, 2A3h
	jmp sub_41B710
;sub_41A170 endp

sub_41A1A0: ;SUBROUTINE
	push ecx
	push edx
	cmp dword [dword_512208], 1
	jnz loc_41A1E3
	test eax, eax
	jz loc_41A1B8
	cmp byte [byte_512DA9], 1
	jz loc_41A1E6

loc_41A1B8:
	mov ecx, dword [dword_4D76BC]
	test ecx, ecx
	jz loc_41A1E3
	cmp word [ecx], 0
	jnz loc_41A1D1
	cmp dword [dword_512208], 1
	jz loc_41A1F9

loc_41A1D1:
	mov eax, dword [dword_4D76BC]
	cmp word [eax], 0
	jnz loc_41A1E3
	cmp word [eax+2], 0
	jz loc_41A1F9

loc_41A1E3:
	pop edx
	pop ecx
	ret

loc_41A1E6:
	push ebx
	xor bl, bl
	mov byte [byte_512E8D], bl
	mov byte [byte_512E84], bl
	pop ebx
	pop edx
	pop ecx
	ret

loc_41A1F9:
	xor dl, dl
	mov byte [byte_512E8D], dl
	mov byte [byte_512E84], dl
	pop edx
	pop ecx
	ret
;sub_41A1A0 endp

sub_41A210: ;SUBROUTINE
	mov eax, dword [dword_5121FC]
	cmp eax, 4
	jnb loc_41A223
	cmp eax, 2

loc_41A21D:
	mov eax, 64h
	ret

loc_41A223:
	jbe loc_41A22D
	cmp eax, 8
	jnz loc_41A21D
	xor eax, eax
	ret

loc_41A22D:
	mov eax, 4Ch
	ret
;sub_41A210 endp

sub_41A240: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	mov esi, eax
	mov di, word [dword_512264]
	mov dx, word [dword_512268]
	xor eax, eax
	xor ebx, ebx
	add edi, edx

loc_41A25B:
	movsx ecx, di
	movsx edx, ax
	cmp edx, ecx
	jge loc_41A28B
	imul edx, 684h
	add edx, esi
	test byte [edx+1F4h], 4
	jz loc_41A284
	cmp dword [edx+280h], 2
	jnz loc_41A284
	mov ebx, 1

loc_41A284:
	inc eax
	cmp bx, 1
	jnz loc_41A25B

loc_41A28B:
	mov eax, ebx
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_41A240 endp

sub_41A2A0: ;SUBROUTINE
	push ecx
	push edx
	cmp dword [dword_512208], 1
	jz loc_41A2DA
	cmp byte [byte_512DA9], 1
	jz loc_41A2DA

loc_41A2B4:
	mov edx, 12h
	mov eax, word_513062
	call sub_48A01C
	xor ecx, ecx
	mov edx, 1
	mov dword [dword_4D76BC], ecx
	mov word [word_4D4202], dx
	pop edx
	pop ecx
	ret

loc_41A2DA:
	push ebx
	mov eax, 1
	mov ebx, 9
	mov edx, dword_512F4C
	call sub_41A1A0
	call sub_408CC0
	mov eax, byte_512E84
	call strncpy_
	mov ebx, 9
	mov edx, byte_512F55
	mov eax, byte_512E8D
	call strncpy_
	call sub_408BF0
	pop ebx
	jmp loc_41A2B4
;sub_41A2A0 endp

sub_41A320: ;SUBROUTINE
	push edx
	mov edx, 12h
	mov eax, word_513062
	call sub_48A01C
	mov dword [dword_4D76BC], word_513062
	mov word [word_4D4202], 1
	pop edx
	ret
;sub_41A320 endp

sub_41A350: ;SUBROUTINE
	push edx
	mov edx, 2C8h
	mov eax, dword_512AD8
	call sub_48A01C
	xor edx, edx
	mov dword [dword_4D76B8], edx
	pop edx
	ret
;sub_41A350 endp

sub_41A370: ;SUBROUTINE
	push ecx
	push edx
	mov edx, 2C8h
	mov eax, dword_512AD8
	call sub_48A01C
	mov edx, dword_512AD8
	xor ecx, ecx
	mov dword [dword_4D76B8], edx

loc_41A38E:
	mov byte byte_512AD0[ecx], cl
	inc ecx
	cmp ecx, 8
	jl loc_41A38E
	pop edx
	pop ecx
	ret
;sub_41A370 endp

sub_41A3A0: ;SUBROUTINE
	push ecx
	push esi
	push edi
	sub esp, 24h
	mov ecx, 9
	mov edi, esp
	mov esi, dword_419F90
	rep movsd
	test eax, eax
	jl loc_41A3BD
	cmp eax, 8
	jle loc_41A3BF

loc_41A3BD:
	xor eax, eax

loc_41A3BF:
	mov eax, [esp+eax*4]
	add esp, 24h
	pop edi
	pop esi
	pop ecx
	ret
;sub_41A3A0 endp

sub_41A3E0: ;SUBROUTINE
	cmp eax, 24h
	jnz loc_41A3F7
	cmp dword [dword_512208], 1
	jle loc_41A3F7
	cmp dword [dword_5121F8], 2
	jz loc_41A406

loc_41A3F7:
	cmp eax, 0Fh
	jl loc_41A40C
	mov eax, 70h
	jmp sub_41B710

loc_41A406:
	mov eax, aJacques ; "Jacques"
	ret

loc_41A40C:
	add eax, 60h
	jmp sub_41B710
;sub_41A3E0 endp

sub_41A420: ;SUBROUTINE
	cmp eax, 12h
	jz loc_41A439
	cmp eax, 24h
	jz loc_41A439
	cmp eax, 0Fh
	jle loc_41A43F
	mov eax, 70h
	jmp sub_41B710

loc_41A439:
	mov eax, aJacques ; "Jacques"
	ret

loc_41A43F:
	add eax, 60h
	jmp sub_41B710
;sub_41A420 endp

sub_41A450: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	mov ebx, dword [dword_4D76BC]
	test ebx, ebx
	jz loc_41A481

loc_41A45D:
	mov ebx, dword [dword_4D76BC]
	xor eax, eax
	mov edx, ebx

loc_41A467:
	movsx ecx, ax
	inc eax
	mov word [edx+ecx*2], 1
	cmp ax, 9
	jl loc_41A467
	mov dword [dword_4D76BC], ebx
	pop edx
	pop ecx
	pop ebx
	ret

loc_41A481:
	call sub_41A320
	jmp loc_41A45D
;sub_41A450 endp

sub_41A490: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	mov ebx, dword [dword_4D76B8]
	mov cl, byte [byte_50B480]
	xor edx, edx
	mov dl, cl
	mov dl, byte byte_4D5A49[edx]
	and edx, 0FFh
	mov edi, 0Bh
	mov eax, edx
	sar edx, 1Fh
	idiv edi
	inc cl
	mov byte [byte_50B480], cl
	mov dword [dword_512DA4], edx
	xor eax, eax
	mov edx, ebx

loc_41A4CF:
	movsx ecx, ax
	inc eax
	mov word [edx+ecx*2+2B0h], 0
	cmp ax, 8
	jl loc_41A4CF
	mov ecx, 2ACh
	mov esi, (dword_512D9E+2)
	mov word [ebx+2C0h], 0
	lea edi, [ebx+4]
	mov byte [ebx+2C4h], 0
	mov dword [dword_4D76B8], ebx
	push edi
	mov eax, ecx
	shr ecx, 2
	rep movsd
	mov cl, al
	and cl, 3
	rep movsb
	pop edi
	mov eax, 1
	mov ebx, dword [dword_4D76B8]
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_41A490 endp

sub_41A530: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	mov edi, dword [dword_4D5EF8]
	mov esi, eax
	mov ecx, edi
	xor eax, eax

loc_41A541:
	movsx edx, ax
	movsx ebx, word [esi+edx*2]
	imul ebx, 684h
	inc eax
	mov [ecx+ebx+278h], edx
	cmp ax, 8
	jl loc_41A541
	mov dword [dword_4D5EF8], edi
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_41A530 endp

sub_41A570: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 4Ch
	mov ebp, eax
	mov [esp+48h], dx
	xor edx, edx
	xor ebx, ebx

loc_41A583:
	mov eax, [esp+46h]
	movsx ecx, dx
	sar eax, 10h
	cmp ecx, eax
	jl loc_41A5DA
	cmp dword [dword_512214], 0
	jnz loc_41A81D
	cmp dword [dword_512208], 2
	jge loc_41A611
	xor ecx, ecx
	mov esi, 1

loc_41A5AE:
	mov edx, [esp+46h]
	movsx eax, cx
	sar edx, 10h
	cmp eax, edx
	jge loc_41A689
	imul eax, 684h
	mov edx, dword [dword_4D5EF8]
	mov edi, [edx+eax+280h]
	cmp esi, edi
	jz loc_41A603

loc_41A5D7:
	inc ecx
	jmp loc_41A5AE

loc_41A5DA:
	imul ecx, 684h
	mov esi, dword [dword_4D5EF8]
	add esi, ecx
	lea edi, [ecx+ebp]
	mov ecx, 684h
	inc edx
	push edi
	mov eax, ecx
	shr ecx, 2
	rep movsd
	mov cl, al
	and cl, 3
	rep movsb
	pop edi
	jmp loc_41A583 ;short

loc_41A603:
	test byte [eax+ebp+1F4h], 4
	jz loc_41A5D7
	mov ebx, edi
	jmp loc_41A5D7

loc_41A611:
	mov esi, 1
	mov cx, word [dword_512264]

loc_41A61D:
	mov edx, [esp+46h]
	movsx eax, cx
	sar edx, 10h
	cmp eax, edx
	jl loc_41A659
	mov ebx, 1
	xor eax, eax

loc_41A632:
	mov edx, [esp+46h]
	movsx esi, ax
	sar edx, 10h
	cmp esi, edx
	jge loc_41A689
	imul esi, 684h
	mov edx, dword [dword_4D5EF8]
	cmp dword [edx+esi+280h], 2
	jz loc_41A67B

loc_41A656:
	inc eax
	jmp loc_41A632

loc_41A659:
	mov edx, dword [dword_4D5EF8]
	mov ebx, [edx+280h]
	cmp esi, ebx
	jz loc_41A66C

loc_41A669:
	inc ecx
	jmp loc_41A61D

loc_41A66C:
	imul eax, 684h
	mov [eax+ebp+280h], ebx
	jmp loc_41A669

loc_41A67B:
	test byte [esi+ebp+1F4h], 4
	jz loc_41A656
	xor ebx, ebx
	jmp loc_41A656

loc_41A689:
	cmp bx, 1
	jnz loc_41A6B7
	mov ax, word [dword_512264]

loc_41A695:
	mov ecx, [esp+46h]
	movsx edx, ax
	sar ecx, 10h
	cmp edx, ecx
	jge loc_41A6B7
	imul edx, 684h
	inc eax
	mov dword [edx+ebp+280h], 1
	jmp loc_41A695

loc_41A6B7:
	xor eax, eax

loc_41A6B9:
	mov ecx, [esp+46h]
	movsx edx, ax
	sar ecx, 10h
	cmp edx, ecx
	jge loc_41A6F1
	imul edx, 684h
	mov ecx, dword [dword_4D5EF8]
	mov ebx, dword [dword_5121FC]
	cmp ebx, [ecx+edx+230h]
	jle loc_41A6E5

loc_41A6E2:
	inc eax
	jmp loc_41A6B9

loc_41A6E5:
	lea ecx, [ebx-1]
	mov [edx+ebp+230h], ecx
	jmp loc_41A6E2

loc_41A6F1:
	mov eax, dword [dword_5121F8]
	cmp eax, 2
	jnz loc_41A81D
	cmp eax, dword [dword_512208]
	jg loc_41A81D
	xor edx, edx

loc_41A70D:
	mov eax, [esp+46h]
	movsx esi, dx
	sar eax, 10h
	cmp esi, eax
	jl loc_41A769
	mov ebx, 186A0h
	xor edx, edx

loc_41A722:
	mov ecx, [esp+46h]
	movsx eax, dx
	sar ecx, 10h
	cmp eax, ecx
	jl loc_41A79A
	lea ebx, [esp+30h]
	mov edx, esp
	mov eax, ecx
	call sub_41B2D0
	xor edx, edx

loc_41A73F:
	mov ecx, [esp+46h]
	movsx eax, dx
	sar ecx, 10h
	cmp eax, ecx
	jge loc_41A81D
	mov ecx, [esp+eax*2+2Eh]
	sar ecx, 10h
	imul ecx, 684h
	inc eax
	inc edx
	mov [ecx+ebp+278h], eax
	jmp loc_41A73F

loc_41A769:
	imul esi, 684h
	mov eax, dword [dword_4D5EF8]
	add eax, esi
	mov ecx, [eax+21Ch]
	cmp dword [ecx], 24h
	jz loc_41A784

loc_41A781:
	inc edx
	jmp loc_41A70D

loc_41A784:
	cmp dword [eax+280h], 1
	jz loc_41A781
	mov dword [esi+ebp+280h], 3
	jmp loc_41A781

loc_41A79A:
	imul ecx, eax, 684h
	mov esi, dword [dword_4D5EF8]
	mov edi, [ecx+esi+21Ch]
	imul esi, eax, 0E4Ch
	lea eax, [ecx+ebp]
	cmp dword [edi], 24h
	jnz loc_41A806
	mov ecx, [eax+234h]
	test ecx, ecx
	jle loc_41A7F3
	lea esi, [ecx+ebx]

loc_41A7C8:
	mov [eax+234h], esi

loc_41A7CE:
	movsx eax, dx
	imul ecx, eax, 684h
	mov [esp+eax*2+30h], dx
	lea esi, 0[eax*4]
	mov eax, [ecx+ebp+234h]
	inc edx
	mov [esp+esi], eax
	jmp loc_41A722

loc_41A7F3:
	imul ecx, -1
	add ecx, 186A0h
	add ecx, esi
	mov [eax+234h], ecx
	jmp loc_41A7CE

loc_41A806:
	mov edi, [eax+234h]
	test edi, edi
	jg loc_41A7CE
	imul ecx, edi, -1
	add ecx, 186A0h
	add esi, ecx
	jmp loc_41A7C8

loc_41A81D:
	mov eax, 1
	add esp, 4Ch
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_41A570 endp

sub_41A830: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 380h
	mov [esp+370h], ax
	mov ebp, 14h
	cmp dx, 1
	jz loc_41A9CE
	add eax, 14h
	lea edx, [esp+26Ch]
	cwde
	call sub_41B250
	lea eax, [esp+26Ch]
	push aR
	push eax
	call fopen_c
	mov esi, eax
	mov ecx, eax
	test eax, eax
	jnz loc_41AA2B
	xor ebx, ebx
	xor edx, edx

loc_41A885:
	movsx ecx, bx
	imul ecx, 14h
	mov edi, esp
	mov esi, dword_4C8F90
	add edi, ecx
	push edi

loc_41A895:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_41A8AD
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_41A895

loc_41A8AD:
	pop edi
	mov [esp+ecx+0Ah], dx
	mov [esp+ecx+0Ch], edx
	inc ebx
	mov [esp+ecx+10h], dx
	cmp bx, 1Fh
	jl loc_41A885
	nop

loc_41A8C4:
	xor eax, eax
	xor edx, edx

loc_41A8C8:
	movsx ecx, ax
	imul ecx, 14h
	mov bx, [esp+ecx+0Ah]
	cmp dx, bx
	jle loc_41AC4C

loc_41A8DC:
	movsx ecx, ax
	imul ecx, 14h
	mov [esp+ecx+0Ah], dx

loc_41A8E7:
	movsx ecx, ax
	imul ecx, 14h
	mov ebx, [esp+ecx+0Ch]
	cmp edx, ebx
	jle loc_41AC5B

loc_41A8F9:
	movsx ecx, ax
	imul ecx, 14h
	mov [esp+ecx+0Ch], edx

loc_41A903:
	movsx ecx, ax
	imul ecx, 14h
	mov di, [esp+ecx+10h]
	cmp dx, di
	jle loc_41AC6C

loc_41A917:
	movsx ecx, ax
	imul ecx, 14h
	mov [esp+ecx+10h], dx

loc_41A922:
	inc eax
	cmp ax, 1Fh
	jl loc_41A8C8
	mov dword [dword_4DB1DC], 2ECh
	mov eax, ebp
	mov edi, aCNfs2seFront_5 ; "c:\\nfs2se\\frontend\\common\\Stattool.c"
	shl eax, 5
	mov esi, esp
	sub eax, ebp
	xor ebx, ebx
	mov ecx, eax
	mov edx, eax
	mov eax, aRecords_0 ; "records"
	mov dword [dword_4DB1D8], edi
	call sub_484498
	mov ebp, eax
	mov edi, eax
	mov [esp+36Ch], eax
	push edi
	mov eax, ecx
	shr ecx, 2
	rep movsd
	mov cl, al
	and cl, 3
	rep movsb
	pop edi
	mov eax, [esp+36Eh]
	lea edx, [esp+26Ch]
	sar eax, 10h
	call sub_41B250
	mov eax, ebp
	call sub_484D94
	mov edx, ebp
	mov ebx, eax
	lea eax, [esp+26Ch]
	call sub_4875B0
	test ax, ax
	jnz loc_41A9AE
	mov eax, 2F3h
	call sub_402CD0

loc_41A9AE:
	mov edx, [esp+36Ch]
	test edx, edx
	jnz loc_41AC7B
	mov eax, 1
	add esp, 380h
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_41A9CE:
	mov eax, [esp+36Eh]
	lea edx, [esp+26Ch]
	sar eax, 10h
	xor ebx, ebx
	call sub_41B250
	xor edx, edx

loc_41A9E8:
	movsx ecx, bx
	imul ecx, 14h
	mov edi, esp
	mov esi, dword_4C8F90
	add edi, ecx
	push edi

loc_41A9F8:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_41AA10
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_41A9F8

loc_41AA10:
	pop edi
	mov [esp+ecx+0Ah], dx
	mov [esp+ecx+0Ch], edx
	inc ebx
	mov [esp+ecx+10h], dx
	cmp bx, 1Fh
	jl loc_41A9E8
	jmp loc_41A8C4

loc_41AA2B:
	mov ebx, eax
	lea eax, [esp+26Ch]

	push ecx

	push ebx
	push 50h
	push eax
	call fgets
	add esp, 0Ch

	lea eax, [esp+368h]
	push eax
	push aD ; "%d\n"
	push esi
	call fscanf
	add esp, 0Ch
	lea eax, [esp+26Ch]

	push esi
	push 50h
	push eax
	call fgets
	add esp, 0Ch

	lea eax, [esp+26Ch]
	mov edi, esp

	push esi
	push 9
	push eax
	call fgets
	add esp, 0Ch

	pop ecx

	lea esi, [esp+26Ch]
	mov dl, 0Ah
	push edi

loc_41AA86:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_41AA9E
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_41AA86

loc_41AA9E:
	pop edi
	mov esi, esp

loc_41AAA1:
	mov al, [esi]
	cmp al, dl
	jz loc_41AAB9
	cmp al, 0
	jz loc_41AAB7
	inc esi
	mov al, [esi]
	cmp al, dl
	jz loc_41AAB9
	inc esi
	cmp al, 0
	jnz loc_41AAA1

loc_41AAB7:
	sub esi, esi

loc_41AAB9:
	test esi, esi
	jnz loc_41AC05

loc_41AAC1:
	lea eax, [esp+0Ah]
	push eax
	push aD_0 ; "%d"
	push ecx
	call fscanf
	pop ecx
	add esp, 8
	lea eax, [esp+0Ch]
	push eax
	push aD_0 ; "%d"
	push ecx
	call fscanf
	pop ecx
	add esp, 8
	lea eax, [esp+10h]
	push eax
	push aD ; "%d\n"
	push ecx
	xor edx, edx
	call fscanf
	pop ecx
	add esp, 8
	mov [esp+374h], dx
	mov [esp+37Ch], edx

loc_41AB0B:
	lea eax, [esp+26Ch]

	push ecx
	push 50h
	push eax
	call fgets
	add esp, 8
	pop ecx

	mov eax, [esp+37Ch]
	inc eax
	mov [esp+378h], ax

loc_41AB2E:
	mov eax, [esp+372h]
	sar eax, 10h
	imul eax, 0Ah
	mov esi, [esp+376h]
	sar esi, 10h
	add eax, 0Ah
	cmp esi, eax
	jg loc_41AC0D
	lea eax, [esp+26Ch]

	push ecx
	push 9
	push eax
	call fgets
	add esp, 8
	pop ecx

	imul ebx, esi, 14h
	mov eax, esp
	add ebx, eax
	lea esi, [esp+26Ch]
	mov edi, ebx
	mov dl, 0Ah
	push edi

loc_41AB76:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_41AB8E
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_41AB76

loc_41AB8E:
	pop edi
	mov esi, ebx

loc_41AB91:
	mov al, [esi]
	cmp al, dl
	jz loc_41ABA9
	cmp al, 0
	jz loc_41ABA7
	inc esi
	mov al, [esi]
	cmp al, dl
	jz loc_41ABA9
	inc esi
	cmp al, 0
	jnz loc_41AB91

loc_41ABA7:
	sub esi, esi

loc_41ABA9:
	test esi, esi
	jnz loc_41AC44

loc_41ABB1:
	mov ebx, [esp+376h]
	sar ebx, 10h
	imul ebx, 14h
	mov eax, esp
	add ebx, eax
	lea eax, [ebx+0Ah]
	push eax
	push aD_0 ; "%d"
	push ecx
	call fscanf
	pop ecx
	add esp, 8
	lea eax, [ebx+0Ch]
	push eax
	push aD_0 ; "%d"
	push ecx
	call fscanf
	pop ecx
	add esp, 8
	add ebx, 10h
	push ebx
	push aD ; "%d\n"
	push ecx
	call fscanf
	pop ecx
	add esp, 8
	inc word [esp+378h]
	jmp loc_41AB2E

loc_41AC05:
	mov byte [esi], 0
	jmp loc_41AAC1

loc_41AC0D:
	mov edi, [esp+374h]
	mov esi, [esp+37Ch]
	inc edi
	add esi, 0Ah
	mov [esp+374h], di
	mov [esp+37Ch], esi
	cmp di, 2
	jle loc_41AB0B
	push ecx
	call fclose
	add esp, 4
	jmp loc_41A8C4

loc_41AC44:
	mov byte [esi], 0
	jmp loc_41ABB1

loc_41AC4C:
	cmp bx, 0Bh
	jg loc_41A8DC
	jmp loc_41A8E7

loc_41AC5B:
	cmp ebx, 38400h
	jg loc_41A8F9
	jmp loc_41A903

loc_41AC6C:
	cmp di, 2
	jg loc_41A917
	jmp loc_41A922

loc_41AC7B:
	mov eax, edx
	call sub_4848FC
	mov eax, 1
	add esp, 380h
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_41A830 endp

sub_41ACA0: ;SUBROUTINE
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 0D8h
	mov [esp+0D0h], ax
	mov [esp+0D4h], edx
	mov [esp+0CCh], ebx
	mov ecx, 6
	lea edi, [esp+0A0h]
	mov edx, aCNfs2seFront_5 ; "c:\\nfs2se\\frontend\\common\\Stattool.c"
	mov esi, aSSSS ; "%s %s %s %s"
	mov ebx, 20h
	mov eax, aTrkrcrds_0 ; "trkrcrds"
	rep movsd
	mov dword [dword_4DB1D8], edx
	mov ecx, 21Dh
	mov edx, 280h
	mov dword [dword_4DB1DC], ecx
	call sub_484498
	mov ecx, [esp+0CEh]
	mov ebx, eax
	sar ecx, 10h
	mov edx, eax
	mov eax, ecx
	call sub_41B040
	mov edx, [esp+0D4h]
	mov ebp, 14h
	cmp dx, 2
	jnz loc_41AE23
	mov eax, 1

loc_41AD2D:
	movsx edx, ax
	lea eax, 0[edx*4]
	add eax, edx
	lea edi, [esp+0B8h]
	shl eax, 2
	mov ecx, ebp
	lea esi, [ebx+eax]
	lea edx, [esp+50h]
	push edi
	mov eax, ecx
	shr ecx, 2
	rep movsd
	mov cl, al
	and cl, 3
	rep movsb
	pop edi
	mov eax, [esp+0C4h]
	call sub_41B150
	mov esi, [esp+0C8h]
	cmp si, 2
	jnz loc_41AE3D
	mov eax, 1Fh

loc_41AD7E:
	call sub_41B710
	push eax
	push aS ; "%s"
	lea eax, [esp+8]
	push eax
	call sprintf_
	add esp, 0Ch
	lea edi, [esp+0B8h]
	sub ecx, ecx
	dec ecx
	xor eax, eax
	repne scasb
	not ecx
	dec ecx
	cmp byte [esp+ecx+0B7h], 0Ah
	jnz loc_41ADCB
	lea edi, [esp+0B8h]
	xor dl, dl
	sub ecx, ecx
	dec ecx
	xor eax, eax
	repne scasb
	not ecx
	dec ecx
	mov [esp+ecx+0B7h], dl

loc_41ADCB:
	mov eax, esp
	push eax
	lea eax, [esp+54h]
	push eax
	mov eax, [esp+0C8h]
	sar eax, 10h
	call sub_41A420
	push eax
	lea eax, [esp+0C4h]
	push eax
	lea eax, [esp+0B0h]
	push eax
	mov esi, [esp+0E0h]
	push esi
	call sprintf_
	add esp, 18h
	cmp dword [esp+0C4h], 0
	jz loc_41AE57
	mov edx, 1

loc_41AE12:
	test ebx, ebx
	jnz loc_41AE5B
	mov eax, edx
	add esp, 0D8h
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret

loc_41AE23:
	cmp dx, 4
	jnz loc_41AE33
	mov eax, 0Bh
	jmp loc_41AD2D

loc_41AE33:
	mov eax, 15h
	jmp loc_41AD2D

loc_41AE3D:
	cmp si, 1
	jnz loc_41AE4D
	mov eax, 1Bh
	jmp loc_41AD7E

loc_41AE4D:
	mov eax, 1Eh
	jmp loc_41AD7E

loc_41AE57:
	xor edx, edx
	jmp loc_41AE12

loc_41AE5B:
	mov eax, ebx
	call sub_4848FC
	mov eax, edx
	add esp, 0D8h
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret
;sub_41ACA0 endp

sub_41AE70: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	sub esp, 14h
	mov edi, eax
	mov edx, aCNfs2seFront_5 ; "c:\\nfs2se\\frontend\\common\\Stattool.c"
	mov ecx, 1F6h
	mov ebx, 20h
	mov eax, aTrkrcrds_0 ; "trkrcrds"
	mov dword [dword_4DB1D8], edx
	mov dword [dword_4DB1DC], ecx
	mov edx, 280h
	mov ecx, 14h
	call sub_4844B0
	mov ebx, eax
	movsx eax, di
	mov edx, ebx
	mov esi, ebx
	mov edi, esp
	call sub_41B040
	push edi
	mov eax, ecx
	shr ecx, 2
	rep movsd
	mov cl, al
	and cl, 3
	rep movsb
	pop edi
	test ebx, ebx
	jnz loc_41AEDA
	mov eax, [esp+0Ch]
	add esp, 14h
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_41AEDA:
	mov eax, ebx
	call sub_4848FC
	mov eax, [esp+0Ch]
	add esp, 14h
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_41AE70 endp

sub_41AEF0: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 0D0h
	mov [esp+0CCh], ax
	mov ebp, edx
	mov ecx, 6
	lea edi, [esp+0A0h]
	mov edx, aCNfs2seFront_5 ; "c:\\nfs2se\\frontend\\common\\Stattool.c"
	mov esi, aSSSS_0 ; "%s %s %s %s"
	mov ebx, 20h
	mov eax, aTrkrcrds_0 ; "trkrcrds"
	rep movsd
	mov dword [dword_4DB1D8], edx
	mov ecx, 1B1h
	mov edx, 280h
	lea edi, [esp+0B8h]
	mov dword [dword_4DB1DC], ecx
	call sub_484498
	mov esi, eax
	mov ebx, eax
	mov eax, [esp+0CAh]
	mov edx, esi
	sar eax, 10h
	mov ecx, 14h
	call sub_41B040
	push edi
	mov eax, ecx
	shr ecx, 2
	rep movsd
	mov cl, al
	and cl, 3
	rep movsb
	pop edi
	lea edx, [esp+50h]
	mov eax, [esp+0C4h]
	call sub_41B150
	mov edx, [esp+0C8h]
	cmp dx, 2
	jz loc_41B00D
	cmp dx, 1
	jnz loc_41B014
	mov eax, 1Bh

loc_41AFA3:
	call sub_41B710
	push eax
	push aS ; "%s"
	lea eax, [esp+8]
	push eax
	call sprintf_
	add esp, 0Ch
	mov eax, esp
	push eax
	lea eax, [esp+54h]
	push eax
	mov eax, [esp+0C8h]
	sar eax, 10h
	call sub_41A420
	push eax
	lea eax, [esp+0C4h]
	push eax
	lea eax, [esp+0B0h]
	push eax
	push ebp
	call sprintf_
	add esp, 18h
	cmp dword [esp+0C4h], 0
	jz loc_41B01B
	mov esi, 1

loc_41AFFB:
	test ebx, ebx
	jnz loc_41B01F
	mov eax, esi
	add esp, 0D0h
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_41B00D:
	mov eax, 1Fh
	jmp loc_41AFA3

loc_41B014:
	mov eax, 1Eh
	jmp loc_41AFA3

loc_41B01B:
	xor esi, esi
	jmp loc_41AFFB

loc_41B01F:
	mov eax, ebx
	call sub_4848FC
	mov eax, esi
	add esp, 0D0h
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_41AEF0 endp

sub_41B040: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 108h
	mov edi, edx
	lea ecx, [esp+104h]
	xor edx, edx
	movsx ebp, ax
	mov [esp+100h], edx
	mov eax, ebp
	mov edx, esp
	lea ebx, [esp+100h]
	call sub_41B250
	xor eax, eax
	lea edx, [esp+0FCh]
	call sub_403550
	mov eax, esp
	call sub_4877BC
	mov ecx, [esp+0FCh]
	test ecx, ecx
	jz loc_41B118
	cmp dword [esp+104h], 26Ch
	jnz loc_41B123
	mov esi, aCNfs2seFront_5 ; "c:\\nfs2se\\frontend\\common\\Stattool.c"
	mov ebp, 189h
	mov edx, [esp+104h]
	mov eax, aRecords_0 ; "records"
	xor ebx, ebx
	mov dword [dword_4DB1D8], esi
	mov dword [dword_4DB1DC], ebp
	call sub_4844B0
	mov ebx, [esp+104h]
	mov ebp, eax
	mov edx, eax
	mov eax, [esp+0FCh]
	mov ecx, 26Ch
	call sub_487958
	mov eax, [esp+0FCh]
	mov esi, ebp
	call sub_487950
	push edi
	mov eax, ecx
	shr ecx, 2
	rep movsd
	mov cl, al
	and cl, 3
	rep movsb
	pop edi
	test ebp, ebp
	jnz loc_41B13C

loc_41B10C:
	add esp, 108h
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_41B118:
	mov eax, ebp
	xor edx, edx
	call sub_41A830
	jmp loc_41B10C

loc_41B123:
	mov eax, ecx
	call sub_487950
	mov eax, esp
	xor edx, edx
	call sub_4879AE
	mov eax, ebp
	call sub_41A830
	jmp loc_41B10C

loc_41B13C:
	mov eax, ebp
	call sub_4848FC
	add esp, 108h
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_41B040 endp

sub_41B150: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	mov ebp, esp
	sub esp, 8
	and esp, 0FFFFFFF8h
	mov [esp], eax
	mov esi, edx
	mov [esp+4], eax
	fild dword [esp+4]
	fmul qword [dbl_4C8F70]
	call __CHP
	fistp dword [esp]
	mov eax, [esp]
	mov edx, eax
	mov ecx, 1770h
	sar edx, 1Fh
	idiv ecx
	movsx ecx, ax
	lea eax, 0[ecx*4]
	sub eax, ecx
	shl eax, 3
	add eax, ecx
	shl eax, 4
	mov edx, eax
	shl eax, 4
	sub eax, edx
	mov edx, [esp]
	sub edx, eax
	mov ebx, 64h
	mov [esp], edx
	mov eax, edx
	sar edx, 1Fh
	idiv ebx
	movsx ebx, ax
	mov edx, ebx
	lea eax, 0[ebx*4]
	sub eax, ebx
	shl eax, 3
	add eax, ebx
	mov edi, [esp]
	shl eax, 2
	sub edi, eax
	mov [esp], edi
	mov eax, [esp-2]
	sar eax, 10h
	push eax
	xor eax, eax
	mov al, byte [byte_512DFB]
	xor edx, ebx
	mov dl, byte byte_4D4A8E[eax]
	push edx
	mov al, byte byte_4D4A88[eax]
	push ebx
	and eax, 0FFh
	push eax
	push ecx
	push a01dC02dC02d ; "%01d%c%02d%c%02d"
	push esi
	call sprintf_
	add esp, 1Ch
	mov esp, ebp
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_41B150 endp

sub_41B210: ;SUBROUTINE
	push ebx
	push ecx
	mov ebx, eax
	cwde
	mov ecx, dword off_4D4A48[eax*4]
	push ecx
	push aSinfo ; "%sinfo"
	push edx
	call sprintf_
	add esp, 0Ch
	mov eax, ebx
	pop ecx
	pop ebx
	ret
;sub_41B210 endp

sub_41B230: ;SUBROUTINE
	push ebx
	push ecx
	mov ebx, eax
	cwde
	mov ecx, dword off_4D4A68[eax*4]
	push ecx
	push aSrec ; "%srec"
	push edx
	call sprintf_
	add esp, 0Ch
	mov eax, ebx
	pop ecx
	pop ebx
	ret
;sub_41B230 endp

sub_41B250: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 20h
	mov ebx, eax
	mov ecx, 8
	mov edi, esp
	mov esi, off_419F40
	rep movsd
	cmp ax, 7
	jle loc_41B2A3
	cmp ax, 14h
	jge loc_41B2A3

loc_41B274:
	xor ebx, ebx

loc_41B276:
	movsx eax, bx
	push a_stf ; ".stf"
	mov edi, [esp+eax*4+4]
	push edi
	mov ebp, dword [dword_5134C4]
	push ebp

loc_41B28A:
	push aSSS ; "%s%s%s"
	push edx
	call sprintf_
	add esp, 14h
	mov eax, ebx
	add esp, 20h
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_41B2A3:
	test bx, bx
	jl loc_41B274
	cmp bx, 1Bh
	jg loc_41B274
	cmp bx, 14h
	jl loc_41B276
	movsx eax, bx
	push a_ssf ; ".ssf"
	mov ecx, [esp+eax*4-4Ch]
	push ecx
	mov esi, dword [dword_5134C4]
	push esi
	jmp loc_41B28A
;sub_41B250 endp

sub_41B2D0: ;SUBROUTINE
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 14h
	mov [esp+0Ch], eax
	mov esi, edx
	mov [esp+4], ebx
	cmp eax, 32h
	jg loc_41B40F
	mov ecx, aCNfs2seFront_5 ; "c:\\nfs2se\\frontend\\common\\Stattool.c"
	lea edx, 0[eax*4]
	mov ebx, 8Dh
	mov eax, aTempsort ; "TempSort"
	mov dword [dword_4DB1DC], ebx
	add edx, 4
	mov ebx, 20h
	mov dword [dword_4DB1D8], ecx
	call sub_4844B0
	mov [esp+8], eax
	test eax, eax
	jz loc_41B434
	mov ebp, [esp+0Ch]
	xor edi, edi
	test ebp, ebp
	jle loc_41B354
	mov ecx, eax
	mov edx, esi
	mov eax, [esp+4]
	mov esi, [esp+0Ch]

loc_41B33B:
	add ecx, 4
	add edx, 4
	mov [eax], di
	add eax, 2
	mov ebx, [edx-4]
	inc edi
	mov [ecx-4], ebx
	cmp edi, esi
	jl loc_41B33B
	mov eax, eax

loc_41B354:
	cmp dword [esp+0Ch], 1
	jz loc_41B454
	mov ebp, [esp+0Ch]
	mov edi, 1
	cmp ebp, edi
	jle loc_41B3FF
	mov eax, [esp+8]
	mov ebp, [esp+4]
	add eax, 4
	add ebp, 2
	mov [esp+10h], eax

loc_41B382:
	mov esi, [esp+10h]
	movsx eax, word [ebp+0]
	lea ecx, [edi-1]
	mov [esp], eax
	mov esi, [esi]
	test ecx, ecx
	jl loc_41B3C8
	mov edx, [esp+8]
	lea eax, 0[ecx*4]
	mov ebx, [esp+4]
	add eax, edx
	lea edx, [ecx+ecx]
	add edx, ebx

loc_41B3AC:
	cmp esi, [eax]
	jge loc_41B3C8
	mov ebx, [eax]
	sub edx, 2
	mov [eax+4], ebx
	sub eax, 4
	mov bx, [edx+2]
	dec ecx
	mov [edx+4], bx
	test ecx, ecx
	jge loc_41B3AC

loc_41B3C8:
	mov edx, [esp+8]
	lea eax, 0[ecx*4]
	mov ebx, [esp+10h]
	add eax, edx
	add ebp, 2
	inc edi
	mov [eax+4], esi
	lea eax, [ecx+ecx]
	add ebx, 4
	mov ecx, [esp+4]
	mov edx, [esp]
	add eax, ecx
	mov [esp+10h], ebx
	mov esi, [esp+0Ch]
	mov [eax+2], dx
	cmp edi, esi
	jl loc_41B382

loc_41B3FF:
	mov edi, [esp+8]
	test edi, edi
	jnz loc_41B45F

loc_41B407:
	add esp, 14h
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret

loc_41B40F:
	mov ecx, aCNfs2seFront_5 ; "c:\\nfs2se\\frontend\\common\\Stattool.c"
	mov ebx, 82h
	push aStattool_ncrea ; "Stattool_nCreateIndex: This routine is"...
	mov dword [dword_4DB1D8], ecx
	mov dword [dword_4DB1DC], ebx
	call sub_4840F0
	add esp, 4
	jmp loc_41B407

loc_41B434:
	mov edx, 8Fh
	push aStattoolMemory ; "Stattool: memory allocation failure\n"
	mov dword [dword_4DB1D8], ecx
	mov dword [dword_4DB1DC], edx
	call sub_4840F0
	add esp, 4
	jmp loc_41B407

loc_41B454:
	mov eax, [esp+8]
	call sub_4848FC
	jmp loc_41B407

loc_41B45F:
	mov eax, edi
	call sub_4848FC
	add esp, 14h
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret
;sub_41B2D0 endp

sub_41B470: ;SUBROUTINE
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 18h
	mov [esp], eax
	mov ecx, edx
	mov ebp, ebx
	cmp eax, 32h
	jg loc_41B5DD
	mov ebx, aCNfs2seFront_5 ; "c:\\nfs2se\\frontend\\common\\Stattool.c"
	lea edx, [eax+eax]
	mov esi, 46h
	mov eax, aTempsort ; "TempSort"
	mov dword [dword_4DB1D8], ebx
	add edx, 2
	mov ebx, 20h
	mov dword [dword_4DB1DC], esi
	call sub_4844B0
	mov [esp+4], eax
	test eax, eax
	jnz loc_41B4DC
	mov edi, aCNfs2seFront_5 ; "c:\\nfs2se\\frontend\\common\\Stattool.c"
	mov eax, 48h
	push aStattoolMemory ; "Stattool: memory allocation failure\n"
	mov dword [dword_4DB1D8], edi
	mov dword [dword_4DB1DC], eax
	call sub_4840F0
	add esp, 4

loc_41B4DC:
	xor edx, edx
	mov ebx, [esp]
	mov [esp+10h], edx
	test ebx, ebx
	jle loc_41B518
	mov esi, [esp]
	mov edx, [esp+4]
	mov eax, ecx
	mov ecx, ebp

loc_41B4F4:
	mov ebx, [esp+10h]
	mov [ecx], bx
	add edx, 2
	mov bx, [eax]
	mov [edx-2], bx
	mov ebx, [esp+10h]
	add eax, 2
	inc ebx
	add ecx, 2
	mov [esp+10h], ebx
	cmp ebx, esi
	jl loc_41B4F4

loc_41B518:
	mov edi, [esp]
	cmp edi, 1
	jz loc_41B602
	mov eax, 1
	mov [esp+10h], eax
	cmp edi, eax
	jle loc_41B5CD
	lea eax, [ebp+2]
	mov [esp+8], eax
	mov eax, [esp+4]
	add eax, 2
	mov [esp+0Ch], eax

loc_41B547:
	mov eax, [esp+8]
	mov edx, [esp+10h]
	mov edi, [esp+0Ch]
	dec edx
	mov ax, [eax]
	mov di, [edi]
	mov [esp+14h], eax
	test edx, edx
	jl loc_41B591
	mov ecx, [esp+4]
	lea eax, [edx+edx]
	add eax, ecx

loc_41B56B:
	movsx ecx, di
	movsx ebx, word [eax]
	lea esi, [edx+edx]
	cmp ecx, ebx
	jge loc_41B591
	mov bx, [eax]
	lea ecx, [esi+ebp]
	mov [eax+2], bx
	sub eax, 2
	mov bx, [ecx]
	dec edx
	mov [ecx+2], bx
	test edx, edx
	jge loc_41B56B

loc_41B591:
	mov eax, [esp+4]
	mov ecx, [esp+8]
	mov ebx, [esp+0Ch]
	mov esi, [esp+10h]
	add ecx, 2
	add ebx, 2
	inc esi
	mov [eax+edx*2+2], di
	mov eax, [esp+14h]
	mov edi, [esp]
	mov [esp+8], ecx
	mov [esp+0Ch], ebx
	mov [esp+10h], esi
	mov [ebp+edx*2+2], ax
	cmp esi, edi
	jl loc_41B547

loc_41B5CD:
	mov ebp, [esp+4]
	test ebp, ebp
	jnz loc_41B60D

loc_41B5D5:
	add esp, 18h
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret

loc_41B5DD:
	mov esi, aCNfs2seFront_5 ; "c:\\nfs2se\\frontend\\common\\Stattool.c"
	mov edi, 41h
	push aStattool_creat ; "Stattool_CreateIndex: This routine is "...
	mov dword [dword_4DB1D8], esi
	mov dword [dword_4DB1DC], edi
	call sub_4840F0
	add esp, 4
	jmp loc_41B5D5

loc_41B602:
	mov eax, [esp+4]
	call sub_4848FC
	jmp loc_41B5D5

loc_41B60D:
	mov eax, ebp
	call sub_4848FC
	add esp, 18h
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret
;sub_41B470 endp

sub_41B620: ;SUBROUTINE
	push ecx
	push edx
	mov edx, dword [dword_4D4AE0]
	test edx, edx
	jnz loc_41B637
	xor ecx, ecx
	mov dword [dword_4D4AE0], ecx
	pop edx
	pop ecx
	ret

loc_41B637:
	mov eax, edx
	call sub_4848FC
	xor ecx, ecx
	mov dword [dword_4D4AE0], ecx
	pop edx
	pop ecx
	ret
;sub_41B620 endp

sub_41B650: ;SUBROUTINE
	push edx
	mov edx, eax
	shl eax, 2
	sub eax, edx
	lea edx, 0[eax*4]
	mov eax, dword [dword_4D4AE0]
	movsx eax, word [edx+eax+6]
	pop edx
	ret
;sub_41B650 endp

sub_41B670: ;SUBROUTINE
	push edx
	mov edx, eax
	shl eax, 2
	sub eax, edx
	lea edx, 0[eax*4]
	mov eax, dword [dword_4D4AE0]
	movsx eax, word [edx+eax+4]
	pop edx
	ret
;sub_41B670 endp

sub_41B690: ;SUBROUTINE
	push edx
	mov edx, eax
	shl eax, 2
	sub eax, edx
	lea edx, 0[eax*4]
	mov eax, dword [dword_4D4AE0]
	mov al, [edx+eax+3]
	and eax, 0FFh
	pop edx
	ret
;sub_41B690 endp

sub_41B6B0: ;SUBROUTINE
	push edx
	mov edx, eax
	shl eax, 2
	sub eax, edx
	lea edx, 0[eax*4]
	mov eax, dword [dword_4D4AE0]
	mov al, [edx+eax+2]
	and eax, 0FFh
	pop edx
	ret
;sub_41B6B0 endp

sub_41B6D0: ;SUBROUTINE
	push edx
	mov edx, eax
	shl eax, 2
	sub eax, edx
	lea edx, 0[eax*4]
	mov eax, dword [dword_4D4AE0]
	mov al, [edx+eax+1]
	and eax, 0FFh
	pop edx
	ret
;sub_41B6D0 endp

sub_41B6F0: ;SUBROUTINE
	push edx
	mov edx, eax
	shl eax, 2
	sub eax, edx
	lea edx, 0[eax*4]
	mov eax, dword [dword_4D4AE0]
	mov al, [edx+eax]
	and eax, 0FFh
	pop edx
	ret
;sub_41B6F0 endp

sub_41B710: ;SUBROUTINE
	push edx
	mov edx, eax
	shl eax, 2
	sub eax, edx
	lea edx, 0[eax*4]
	mov eax, dword [dword_4D4AE0]
	add eax, [edx+eax+8]
	pop edx
	ret
;sub_41B710 endp

sub_41B730: ;SUBROUTINE
	push ecx
	push edx
	sub esp, 0FCh
	mov edx, eax
	cmp eax, 6
	jg loc_41B785
	mov ecx, dword [dword_4D4AE0]
	test ecx, ecx
	jz loc_41B750
	mov eax, ecx
	call sub_4848FC

loc_41B750:
	push esi
	push ebx
	mov ebx, dword off_4D4AC8[edx*4]
	push ebx
	mov esi, dword [dword_5134BC]
	push esi
	push aSS_1 ; "%s%s"
	lea eax, [esp+14h]
	push eax
	call sprintf_
	add esp, 10h
	xor edx, edx
	lea eax, [esp+8]
	call sub_486F40
	mov dword [dword_4D4AE0], eax
	pop ebx
	pop esi

loc_41B785:
	add esp, 0FCh
	pop edx
	pop ecx
	ret
;sub_41B730 endp

off_41B790: dd aEngl_2
	dd aGerm_1 ; "germ"
	dd aFren_1 ; "fren"
	dd aSpan_1 ; "span"
	dd aItal_1 ; "ital"
	dd aSwed_1 ; "swed"
off_41B7A8: dd aEngl_2
	dd aGerm_1 ; "germ"
	dd aFren_1 ; "fren"
	dd aSpan_1 ; "span"
	dd aItly_1 ; "itly"
	dd aSwed_1 ; "swed"
	dd aEngl_2 ; "engl"
	dd aGerm_1 ; "germ"
	dd aFren_1 ; "fren"
	dd aEngl_2 ; "engl"
	dd aEngl_2 ; "engl"
	dd aGerm_1 ; "germ"
	dd aEngl_2 ; "engl"
	dd aGerm_1 ; "germ"
	dd aFren_1 ; "fren"
	dd aSpan_1 ; "span"
	dd aItal_1 ; "ital"
	dd aEngl_2 ; "engl"
	dd aEngl_2 ; "engl"
	dd aGerm_1 ; "germ"
	dd aFren_1 ; "fren"
	dd aSpan_1 ; "span"
	dd aItly_1 ; "itly"
	dd aSwed_1 ; "swed"
	dd aEngl_2 ; "engl"
	dd aGerm_1 ; "germ"
	dd aEngl_2 ; "engl"
	dd aSpan_1 ; "span"
	dd aEngl_2 ; "engl"
	dd aGerm_1 ; "germ"
	dd aEngl_2 ; "engl"
	dd aGerm_1 ; "germ"
	dd aFren_1 ; "fren"
	dd aItly_1 ; "itly"
	dd aItly_1 ; "itly"
	dd aSwed_1 ; "swed"
	dd aEngl_2 ; "engl"
	dd aEngl_2 ; "engl"
	dd aFren_1 ; "fren"
	dd aEngl_2 ; "engl"
	dd aEngl_2 ; "engl"
	dd aEngl_2 ; "engl"
	dd aEngl_2 ; "engl"
	dd aGerm_1 ; "germ"
	dd aFren_1 ; "fren"
	dd aSpan_1 ; "span"
	dd aItly_1 ; "itly"
	dd aSwed_1 ; "swed"
off_41B868: dd a5_1
	dd a7_5 ; "7.5"
	dd a7_5 ; "7.5"
	dd a7_5 ; "7.5"
	dd a8_1 ; "8.1"
	dd a6_5 ; "6.5"
	dd a7_6 ; "7.6"
	dd a7_3 ; "7.3"
off_41B888: dd a3_2
	dd a4_7 ; "4.7"
	dd a4_7 ; "4.7"
	dd a4_7 ; "4.7"
	dd a5_0 ; "5.0"
	dd a4_0 ; "4.0"
	dd a4_7 ; "4.7"
	dd a4_5 ; "4.5"
dword_41B8A8: dd 0A200A2h, 0A300A3h, 0A400A3h, 0A300A4h
off_41B8B8: dd aEngl_2
	dd aGerm_1 ; "germ"
	dd aFren_1 ; "fren"
	dd aSpan_1 ; "span"
	dd aItal_1 ; "ital"
	dd aSwed_1 ; "swed"

sub_41B8D0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 0F4h
	mov [esp+0C8h], eax
	mov ecx, 6
	lea edi, [esp+0A0h]
	mov ax, word [dword_5121FC]
	xor edx, edx
	mov esi, off_41B8B8
	mov [esp+0CCh], edx
	mov [esp+0D4h], ax
	rep movsd
	mov edx, 1
	mov ah, byte [byte_512DBC]
	xor ecx, ecx
	mov [esp+0D0h], edx
	mov [esp+0ECh], edx
	mov [esp+0E8h], ecx
	xor ecx, ecx
	mov edx, 14h
	mov [esp+0BCh], ecx
	mov [esp+0C4h], ecx
	test ah, 1
	jnz loc_41BF15
	mov word [esp+0E4h], 7

loc_41B957:
	call sub_428A20
	mov eax, 0FF000000h
	mov esi, aCNfs2seFront_6 ; "c:\\nfs2se\\frontend\\common\\Trkstat.c"
	mov edi, 31Ah
	mov ebx, 20h
	call sub_48266C
	call sub_482740
	call sub_4824BC
	call unknown_libname_4 ; Watcom v9-*1.5 32bit NT runtime
	mov eax, 0FF000000h
	shl edx, 5
	call sub_48266C
	call sub_482740
	call sub_4824BC
	mov eax, aVtrkrcrd ; "vtrkrcrd"
	mov dword [dword_4DB1D8], esi
	mov dword [dword_4DB1DC], edi
	call sub_484498
	mov ebp, eax
	mov eax, dword [dword_51221C]
	call sub_41A3A0
	mov [esp+0F0h], ax
	cmp dword [dword_4D21AC], 0
	jz loc_41BF24

loc_41B9D2:
	mov eax, [esp+0E4h]
	dec eax
	mov [esp+0E0h], eax

loc_41B9E1:
	mov ecx, [esp+0CCh]
	test ecx, ecx
	jnz loc_41C120
	cmp word [esp+0D0h], 0
	jz loc_41BA4B
	xor edx, edx
	mov ebx, [esp+0EEh]
	mov [esp+0D0h], edx
	sar ebx, 10h
	mov edx, esp
	mov eax, ebx
	call sub_41B230
	mov edx, [esp+0C8h]
	mov eax, esp
	mov [edx], eax
	mov eax, edx
	mov dword [dword_4D2098], ecx
	call sub_410E80
	push ecx
	mov eax, ebx
	mov edx, aRec6_0 ; "rec6"
	call sub_419FD0
	mov ebx, 1
	movsx ecx, ax
	xor eax, eax
	call sub_428140

loc_41BA4B:
	cmp word [esp+0ECh], 0
	jz loc_41BA84
	mov ebx, [esp+0EEh]
	sar ebx, 10h
	lea edx, [esp+50h]
	mov eax, ebx
	xor ecx, ecx
	call sub_41AEF0
	mov [esp+0E8h], eax
	mov edx, ebp
	mov eax, ebx
	mov [esp+0ECh], ecx
	call sub_41B040

loc_41BA84:
	call sub_4833C7
	mov edi, [esp+0C4h]
	mov edx, 400h
	add edi, eax
	call sub_428A20
	mov eax, [esp+0C8h]
	xor ecx, ecx
	xor ebx, ebx
	mov eax, [eax+4]
	call sub_405B30
	xor eax, eax
	mov edx, 400h
	mov al, byte [byte_512DFB]
	xor ecx, ecx
	xor ebx, ebx
	mov eax, [esp+eax*4+0A0h]
	mov [esp+0C4h], edi
	call sub_405B30
	mov dl, byte [byte_512DFB]
	mov [esp+0B8h], edi
	cmp dl, 5
	jnz loc_41BF43
	mov eax, [esp+0D2h]
	sar eax, 10h
	push eax
	mov eax, 0AEh
	call sub_41B710
	push eax
	push aSD_1 ; "%s %d"

loc_41BB03:
	lea eax, [esp+0Ch]
	push eax
	call sprintf_
	add esp, 10h
	push 2
	push 4
	mov eax, 0AEh
	call sub_41B650
	movsx ebx, ax
	mov eax, 0AEh
	call sub_41B670
	sub eax, 14h
	mov ecx, 12h
	movsx edx, ax
	lea eax, [esp+8]
	mov esi, [esp+0DCh]
	call sub_4054E0
	cmp si, 2
	jnz loc_41BF63
	mov dword [esp+0C0h], 1

loc_41BB5B:
	mov eax, 0A7h
	mov ebx, 1ACh
	call sub_41B670
	xor ecx, ecx
	movsx edx, ax
	mov eax, 0B3h
	call sub_405580
	cmp word [esp+0E8h], 0
	jnz loc_41BF89

loc_41BB88:
	mov esi, 0B4h
	xor ecx, ecx
	mov [esp+0D8h], si
	mov [esp+0DCh], cx

loc_41BB9F:
	mov edi, [esp+0DAh]
	sar edi, 10h
	lea esi, [edi+0B4h]
	mov eax, esi
	call sub_41B650
	movsx ebx, ax
	mov eax, 0A7h
	call sub_41B670
	movsx edx, ax
	mov eax, [esp+0D6h]
	xor ecx, ecx
	sar eax, 10h
	call sub_405580
	add edi, [esp+0C0h]
	imul edi, 14h
	add edi, ebp
	cmp dword [edi+0Ch], 0
	jz loc_41BCF2
	push 4
	push 3
	mov eax, esi
	call sub_41B650
	movsx ebx, ax
	mov eax, 0A8h
	mov ecx, 12h
	call sub_41B670
	movsx edx, ax
	mov eax, edi
	call sub_4054E0
	mov eax, [edi+8]
	sar eax, 10h
	call sub_41A420
	push eax
	push aS_0 ; "%s"
	lea eax, [esp+8]
	push eax
	call sprintf_
	add esp, 0Ch
	push 4
	push 3
	mov eax, esi
	call sub_41B650
	movsx ebx, ax
	mov eax, 0A9h
	call sub_41B670
	sub eax, 19h
	mov ecx, 12h
	movsx edx, ax
	lea eax, [esp+8]
	call sub_4054E0
	mov edx, esp
	mov eax, [edi+0Ch]
	call sub_41B150
	push 4
	push 3
	mov eax, esi
	call sub_41B650
	movsx ebx, ax
	mov eax, 0AAh
	mov ecx, 12h
	call sub_41B670
	movsx edx, ax
	lea eax, [esp+8]
	call sub_4054E0
	mov ax, [edi+10h]
	cmp ax, 2
	jnz loc_41C082
	mov eax, 1Fh

loc_41BCA4:
	call sub_41B710
	push eax
	push aS_0 ; "%s"
	lea eax, [esp+8]
	push eax
	call sprintf_
	add esp, 0Ch
	mov eax, [esp+0DAh]
	push 4
	sar eax, 10h
	push 3
	add eax, 0B4h
	call sub_41B650
	movsx ebx, ax
	mov eax, 0ABh
	mov ecx, 12h
	call sub_41B670
	movsx edx, ax
	lea eax, [esp+8]
	call sub_4054E0

loc_41BCF2:
	mov ecx, [esp+0DCh]
	mov ebx, [esp+0D8h]
	inc ecx
	inc ebx
	mov [esp+0DCh], cx
	mov [esp+0D8h], bx
	cmp cx, 0Ah
	jl loc_41BB9F
	mov eax, [esp+0C8h]
	call sub_40FA90
	mov eax, dword [dword_4D4D24]
	mov edx, [esp+0B8h]
	xor ecx, ecx
	mov eax, [eax+20h]
	xor ebx, ebx
	call sub_426B70
	mov eax, 12h
	call sub_4274F0
	cmp dword [dword_4D2310], 0
	jz loc_41BD66
	mov eax, dword [dword_4D4C7C]
	mov edx, dword [dword_4D4C80]
	sub eax, 7
	call sub_4267C0

loc_41BD66:
	call sub_4976B8
	mov eax, [esp+0C8h]
	call sub_423CA0
	call sub_405960
	mov esi, eax
	test ax, ax
	jz loc_41B9E1
	mov edx, [esp+0C4h]
	cmp edx, [esp+0BCh]
	jle loc_41B9E1
	add edx, 0Fh
	mov [esp+0BCh], edx
	mov edx, [esp+0C8h]
	cmp word [edx+0Ah], 0
	jnz loc_41BE15
	cmp ax, 4B00h
	jnz loc_41BE15
	mov edx, [esp+0F0h]
	mov eax, 1
	sub edx, eax
	mov [esp+0ECh], eax
	mov [esp+0F0h], dx
	test dx, dx
	jl loc_41C09C

loc_41BDE6:
	mov edx, 7Fh
	xor eax, eax
	mov ecx, 1
	call sub_4423F0
	xor ebx, ebx
	xor eax, eax
	mov [esp+0D0h], ecx
	call sub_403550
	xor edx, edx
	mov eax, 12h
	xor ecx, ecx
	call sub_4274F0

loc_41BE15:
	mov eax, [esp+0C8h]
	cmp word [eax+0Ah], 0
	jnz loc_41BE93
	cmp si, 4D00h
	jnz loc_41C0B0

loc_41BE2E:
	mov edx, [esp+0EEh]
	mov eax, 1
	mov ecx, [esp+0E2h]
	sar edx, 10h
	mov [esp+0ECh], eax
	inc edx
	sar ecx, 10h
	mov eax, edx
	sar edx, 1Fh
	idiv ecx
	mov [esp+0F0h], dx
	mov dword [esp+0D0h], 1
	cmp si, 4D00h
	jnz loc_41BE7C
	mov edx, 7Fh
	xor eax, eax
	call sub_4423F0

loc_41BE7C:
	xor eax, eax
	call sub_403550
	xor ecx, ecx
	xor ebx, ebx
	xor edx, edx
	mov eax, 12h
	call sub_4274F0

loc_41BE93:
	mov eax, [esp+0C8h]
	mov bx, [eax+0Ah]
	cmp bx, 1
	jnz loc_41C0BF
	cmp si, 4B00h
	jnz loc_41C0BF
	mov [esp+0ECh], ebx
	mov ebx, [esp+0D2h]
	sar ebx, 10h
	mov edx, ebx
	mov eax, ebx
	sar edx, 1Fh
	sub eax, edx
	sar eax, 1
	mov [esp+0D4h], ax
	cmp ax, 2
	jge loc_41BEE7
	mov word [esp+0D4h], 8

loc_41BEE7:
	mov edx, 7Fh
	xor eax, eax
	call sub_4423F0

loc_41BEF3:
	xor eax, eax
	call sub_403550

loc_41BEFA:
	mov eax, [esp+0C8h]
	movsx edx, si
	call sub_410414
	mov [esp+0CCh], eax
	jmp loc_41B9E1

loc_41BF15:
	mov word [esp+0E4h], 8
	jmp loc_41B957

loc_41BF24:
	mov edx, dword [dword_4D5A28]
	mov eax, dword [dword_51221C]
	call sub_476750
	mov dword [dword_4D21AC], 1
	jmp loc_41B9D2

loc_41BF43:
	mov eax, 0AEh
	call sub_41B710
	push eax
	mov eax, [esp+0D6h]
	sar eax, 10h
	push eax
	push aDS_0 ; "%d %s"
	jmp loc_41BB03

loc_41BF63:
	cmp si, 4
	jnz loc_41BF79
	mov dword [esp+0C0h], 0Bh
	jmp loc_41BB5B

loc_41BF79:
	mov dword [esp+0C0h], 15h
	jmp loc_41BB5B

loc_41BF89:
	push 2
	mov eax, 0A8h
	push 3
	mov ecx, 12h
	mov ebx, 1ACh
	call sub_41B670
	movsx edx, ax
	mov eax, ebp
	call sub_4054E0
	mov eax, [ebp+8]
	sar eax, 10h
	call sub_41A420
	push eax
	push aS_0 ; "%s"
	lea eax, [esp+8]
	push eax
	call sprintf_
	add esp, 0Ch
	push 2
	push 3
	mov eax, 0A9h
	mov ecx, 12h
	call sub_41B670
	sub eax, 19h
	mov ebx, 1ACh
	movsx edx, ax
	lea eax, [esp+8]
	call sub_4054E0
	mov edx, esp
	mov eax, [ebp+0Ch]
	call sub_41B150
	push 2
	mov ecx, 12h
	push 3
	mov eax, 0AAh
	mov ebx, 1ACh
	call sub_41B670
	movsx edx, ax
	lea eax, [esp+8]
	call sub_4054E0
	mov dx, [ebp+10h]
	cmp dx, 2
	jnz loc_41C06E
	mov eax, 1Fh

loc_41C02D:
	call sub_41B710
	push eax
	push aS_0 ; "%s"
	lea eax, [esp+8]
	push eax
	call sprintf_
	add esp, 0Ch
	push 2
	mov eax, 0ABh
	push 3
	mov ecx, 12h
	mov ebx, 1ACh
	call sub_41B670
	movsx edx, ax
	lea eax, [esp+8]
	call sub_4054E0
	jmp loc_41BB88

loc_41C06E:
	cmp dx, 1
	jnz loc_41C07B
	mov eax, 1Bh
	jmp loc_41C02D

loc_41C07B:
	mov eax, 1Eh
	jmp loc_41C02D

loc_41C082:
	cmp ax, 1
	jnz loc_41C092
	mov eax, 1Bh
	jmp loc_41BCA4

loc_41C092:
	mov eax, 1Eh
	jmp loc_41BCA4

loc_41C09C:
	mov eax, [esp+0E0h]
	mov [esp+0F0h], ax
	jmp loc_41BDE6

loc_41C0B0:
	cmp si, 0Dh
	jz loc_41BE2E
	jmp loc_41BE93

loc_41C0BF:
	mov eax, [esp+0C8h]
	cmp word [eax+0Ah], 1
	jnz loc_41BEFA
	cmp si, 4D00h
	jnz loc_41C115

loc_41C0D8:
	mov eax, [esp+0D4h]
	mov edi, 1
	add eax, eax
	mov [esp+0ECh], edi
	mov [esp+0D4h], ax
	cmp ax, 8
	jle loc_41C105
	mov word [esp+0D4h], 2

loc_41C105:
	cmp si, 4D00h
	jnz loc_41BEF3
	jmp loc_41BEE7

loc_41C115:
	cmp si, 0Dh
	jz loc_41C0D8
	jmp loc_41BEFA

loc_41C120:
	test ebp, ebp
	jnz loc_41C199

loc_41C124:
	xor eax, eax
	call sub_403550
	xor ecx, ecx
	xor ebx, ebx
	xor edx, edx
	mov eax, 12h
	call sub_4274F0
	xor ebx, ebx
	mov dword [dword_4D2098], ebx
	mov dword [dword_4D21AC], ebx
	call sub_428A20
	mov eax, 0FF000000h
	call sub_48266C
	call sub_482740
	call sub_4824BC
	call unknown_libname_4 ; Watcom v9-*1.5 32bit NT runtime
	mov eax, 0FF000000h
	call sub_48266C
	call sub_482740
	call sub_4824BC
	call sub_4762E0
	call sub_47D410
	mov eax, [esp+0CCh]
	add esp, 0F4h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_41C199:
	mov eax, ebp
	call sub_4848FC
	jmp loc_41C124
;sub_41B8D0 endp

sub_41C1B0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 1D0h
	mov ebp, eax
	mov ecx, 30h
	mov edi, esp
	mov esi, off_41B7A8
	xor eax, eax
	xor edx, edx
	mov al, byte [byte_512DB0]
	rep movsd
	mov [esp+1B0h], edx
	mov ecx, 8
	lea edi, [esp+16Ch]
	mov esi, off_41B868
	mov edx, 1
	mov [esp+1C8h], ax
	rep movsd
	mov ah, byte [byte_512DBC]
	mov ecx, 8
	lea edi, [esp+14Ch]
	mov esi, off_41B888
	mov [esp+1BCh], edx
	mov [esp+1CCh], edx
	rep movsd
	mov [esp+1B4h], edx
	lea edi, [esp+18Ch]
	xor ecx, ecx
	mov esi, dword_41B8A8
	mov [esp+1C0h], ecx
	xor ecx, ecx
	movsd
	movsd
	movsd
	movsd
	mov [esp+1A8h], ecx
	mov [esp+1ACh], ecx
	mov dword [dword_4D2310], ecx
	test ah, 1
	jnz loc_41C795
	mov word [esp+1C4h], 7

loc_41C26C:
	mov ecx, [esp+1C6h]
	call sub_40EB20
	sar ecx, 10h
	lea edx, [esp+0C0h]
	mov eax, ecx
	mov ebx, 1
	call sub_41B210
	lea eax, [esp+0C0h]
	xor edi, edi
	mov [ebp+0], eax
	mov eax, ebp
	mov dword [dword_4D2098], edi
	call sub_410E80
	push edi
	mov eax, ecx
	mov edx, aRec6_0 ; "rec6"
	call sub_419FD0
	movsx ecx, ax
	xor eax, eax
	call sub_428140
	mov edx, [esp+1B0h]
	mov dword [dword_4D2420], edi
	test edx, edx
	jnz loc_41C740
	mov eax, [esp+1C4h]
	dec eax
	mov [esp+1B8h], eax

loc_41C2E2:
	cmp word [esp+1BCh], 0
	jz loc_41C3DF
	mov ecx, [esp+1C6h]
	lea edx, [esp+0C0h]
	sar ecx, 10h
	xor ebx, ebx
	mov eax, ecx
	mov [esp+1BCh], ebx
	call sub_41B210
	lea eax, [esp+0C0h]
	xor ebx, ebx
	mov [ebp+0], eax
	mov eax, ebp
	mov dword [dword_4D2098], ebx
	call sub_410E80
	push ebx
	mov eax, ecx
	mov edx, aRec6_0 ; "rec6"
	call sub_419FD0
	mov ebx, 1
	movsx ecx, ax
	xor eax, eax
	call sub_428140
	mov edx, aSldr ; "sldr"
	mov eax, dword [dword_4D40B8]
	call sub_482EB4
	mov edx, aBack_2 ; "back"
	mov esi, eax
	mov eax, dword [dword_4D40B8]
	xor ecx, ecx
	call sub_482EB4
	mov edi, eax
	mov eax, [esp+1B4h]
	mov [esp+1C0h], ecx
	test ax, ax
	jz loc_41C7A4
	mov ebx, 1
	mov eax, 8Ch
	xor ecx, ecx
	xor edx, edx
	call sub_427280
	xor eax, eax
	xor edx, edx
	call sub_4273B0
	mov [esp+1B4h], edx

loc_41C3A5:
	mov eax, esi
	xor edx, edx
	mov ebx, 1
	call sub_428250
	mov edx, 1
	mov eax, edi
	xor ecx, ecx
	call sub_428250
	xor eax, eax
	mov edx, 0E6h
	call sub_427450
	xor eax, eax
	mov esi, 1
	call sub_427320
	mov dword [dword_4D2310], esi

loc_41C3DF:
	call sub_4833C7
	mov edi, [esp+1ACh]
	mov edx, 1
	mov ebx, [esp+1C0h]
	add edi, eax
	add ebx, edx
	mov [esp+1ACh], edi
	mov [esp+1C0h], ebx
	cmp bx, 23h
	jl loc_41C459
	cmp dx, [esp+1CCh]
	jnz loc_41C459
	mov eax, [esp+1C6h]
	sar eax, 10h
	call sub_407160
	cwde
	push eax
	push aTD0 ; "t%d0"
	lea eax, [esp+1A4h]
	push eax
	call sprintf_
	add esp, 0Ch
	lea eax, [esp+19Ch]
	xor edi, edi
	call sub_403480
	call sub_486F28
	mov [esp+1CCh], edi

loc_41C459:
	test dx, dx
	jz loc_41C7AE

loc_41C462:
	call sub_403550
	call sub_428A20
	mov edx, 400h
	mov eax, aBack_2 ; "back"
	mov esi, [esp+1C6h]
	xor ecx, ecx
	xor ebx, ebx
	sar esi, 10h
	call sub_405B30
	imul edx, esi, 18h
	xor eax, eax
	mov al, byte [byte_512DFB]
	shl eax, 2
	xor ecx, ecx
	add eax, edx
	xor ebx, ebx
	mov edx, 400h
	mov eax, [esp+eax]
	call sub_405B30
	mov edx, 1000h
	mov eax, aSldr ; "sldr"
	xor ecx, ecx
	xor ebx, ebx
	call sub_405B30
	push 2
	mov ecx, 12h
	mov ebx, 3Fh
	mov eax, [esp+esi*2+18Eh]
	push 4
	sar eax, 10h
	mov edx, 268h
	call sub_41B710
	call sub_4054E0
	mov dl, byte [byte_512DFA]
	shl esi, 2
	test dl, dl
	jz loc_41C7C5
	lea edi, [esp+110h]
	mov esi, [esp+esi+16Ch]
	push edi

loc_41C50C:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_41C524
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_41C50C

loc_41C524:
	pop edi
	mov esi, asc_4C90D4 ; " "
	lea edi, [esp+110h]
	push edi
	sub ecx, ecx
	dec ecx
	mov al, 0
	repne scasb
	dec edi

loc_41C53A:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_41C552
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_41C53A

loc_41C552:
	pop edi
	mov eax, 0A0h

loc_41C558:
	lea edi, [esp+110h]
	call sub_41B710
	mov esi, eax
	push edi
	sub ecx, ecx
	dec ecx
	mov al, 0
	repne scasb
	dec edi

loc_41C56F:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_41C587
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_41C56F

loc_41C587:
	pop edi
	cmp byte [byte_512DFB], 5
	jnz loc_41C599
	mov byte [esp+111h], 2Ch

loc_41C599:
	push 2
	mov ecx, 12h
	mov ebx, 5Ah
	push 4
	mov edx, 268h
	lea eax, [esp+118h]
	call sub_4054E0
	mov eax, ebp
	call sub_40FA90
	mov eax, dword [dword_4D4D24]
	mov edx, [esp+1ACh]
	xor ecx, ecx
	mov eax, [eax+20h]
	xor ebx, ebx
	call sub_426B70
	mov eax, 12h
	call sub_4274F0
	cmp dword [dword_4D2310], 0
	jz loc_41C5FD
	mov eax, dword [dword_4D4C7C]
	mov edx, dword [dword_4D4C80]
	sub eax, 7
	call sub_4267C0

loc_41C5FD:
	call sub_4976B8

loc_41C609:
	mov eax, ebp
	call sub_423CA0
	call sub_405960
	mov esi, eax
	test ax, ax
	jz loc_41C732
	mov edx, dword [dword_5637F4]
	cmp edx, [esp+1A8h]
	jle loc_41C732
	mov edx, dword [dword_5637F4]
	add edx, 0Fh
	mov [esp+1A8h], edx
	cmp word [ebp+0Ah], 0
	jnz loc_41C6A3
	cmp ax, 4B00h
	jnz loc_41C6A3
	mov edx, 7Fh
	mov ebx, [esp+1C8h]
	xor eax, eax
	dec ebx
	call sub_4423F0
	mov [esp+1C8h], bx
	test bx, bx
	jl loc_41C825

loc_41C675:
	mov edi, 1
	mov ebx, 1
	mov eax, 12h
	xor ecx, ecx
	xor edx, edx
	mov [esp+1BCh], edi
	mov dword [dword_4D1FFC], ebx
	xor ebx, ebx
	mov [esp+1CCh], edi
	call sub_4274F0

loc_41C6A3:
	cmp word [ebp+0Ah], 0
	jnz loc_41C71A
	cmp si, 4D00h
	jnz loc_41C839

loc_41C6B5:
	cmp si, 4D00h
	jnz loc_41C6C8
	mov edx, 7Fh
	xor eax, eax
	call sub_4423F0

loc_41C6C8:
	mov edx, [esp+1C6h]
	sar edx, 10h
	mov ecx, [esp+1C2h]
	inc edx
	sar ecx, 10h
	mov eax, edx
	sar edx, 1Fh
	idiv ecx
	mov ebx, 1
	mov edi, 1
	mov [esp+1BCh], ebx
	mov [esp+1CCh], ebx
	xor ebx, ebx
	mov eax, 12h
	mov [esp+1C8h], dx
	xor ecx, ecx
	xor edx, edx
	mov dword [dword_4D1FFC], edi
	call sub_4274F0

loc_41C71A:
	movsx edx, si
	mov eax, ebp
	call sub_410414
	mov [esp+1B0h], eax
	xor eax, eax
	call sub_403550

loc_41C732:
	cmp dword [esp+1B0h], 0
	jz loc_41C2E2

loc_41C740:
	mov al, [esp+1C8h]
	mov ebp, 1
	xor ecx, ecx
	mov byte [byte_512DB0], al
	xor eax, eax
	xor ebx, ebx
	call sub_403550
	xor eax, eax
	mov dword [dword_4D1FFC], ebp
	call sub_403550
	xor eax, eax
	xor edx, edx
	mov dword [dword_4D2098], eax
	mov eax, 12h
	call sub_4274F0
	mov eax, [esp+1B0h]
	add esp, 1D0h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_41C795:
	mov word [esp+1C4h], 8
	jmp loc_41C26C

loc_41C7A4:
	call sub_427210
	jmp loc_41C3A5

loc_41C7AE:
	cmp dword [dword_4D2094], 0
	jnz loc_41C462
	call sub_423B90
	jmp loc_41C609

loc_41C7C5:
	lea edi, [esp+110h]
	mov esi, [esp+esi+14Ch]
	push edi

loc_41C7D4:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_41C7EC
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_41C7D4

loc_41C7EC:
	pop edi
	mov esi, asc_4C90D4 ; " "
	lea edi, [esp+110h]
	push edi
	sub ecx, ecx
	dec ecx
	mov al, 0
	repne scasb
	dec edi

loc_41C802:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_41C81A
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_41C802

loc_41C81A:
	pop edi
	mov eax, 0A1h
	jmp loc_41C558

loc_41C825:
	mov eax, [esp+1B8h]
	mov [esp+1C8h], ax
	jmp loc_41C675

loc_41C839:
	cmp si, 0Dh
	jz loc_41C6B5
	jmp loc_41C71A
;sub_41C1B0 endp

sub_41C850: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 0F4h
	mov [esp+0C4h], eax
	mov ecx, 6
	lea edi, [esp+0A0h]
	mov esi, off_41B790
	xor eax, eax
	xor edx, edx
	mov al, byte [byte_512DB8]
	mov [esp+0BCh], edx
	rep movsd
	mov edx, 1
	mov [esp+0E0h], ax
	xor ecx, ecx
	mov [esp+0D8h], edx
	mov [esp+0DCh], edx
	mov [esp+0D4h], ecx
	xor eax, eax
	mov edx, 14h
	xor ecx, ecx
	mov al, byte [byte_512DB0]
	mov [esp+0B8h], ecx
	mov [esp+0F0h], ax
	mov ah, byte [byte_512DBC]
	mov [esp+0C8h], ecx
	test ah, 1
	jnz loc_41CED7
	mov word [esp+0E4h], 7

loc_41C8E7:
	mov esi, aCNfs2seFront_6 ; "c:\\nfs2se\\frontend\\common\\Trkstat.c"
	mov edi, 64h
	mov ebx, 20h
	mov eax, aTrkrcrds_1 ; "trkrcrds"
	shl edx, 5
	mov dword [dword_4DB1D8], esi
	mov dword [dword_4DB1DC], edi
	call sub_484498
	mov dl, byte [byte_512DAF]
	mov ebp, eax
	test dl, dl
	jnz loc_41CEE6
	mov eax, [esp+0C4h]
	mov eax, [eax+18h]
	or byte [eax+8], 1

loc_41C92D:
	mov eax, [esp+0E4h]
	dec eax
	mov [esp+0D0h], eax

loc_41C93C:
	cmp dword [esp+0BCh], 0
	jnz loc_41D14E
	cmp word [esp+0D8h], 0
	jz loc_41C9B0
	xor edx, edx
	mov ebx, [esp+0EEh]
	mov [esp+0D8h], edx
	sar ebx, 10h
	lea edx, [esp+50h]
	mov eax, ebx
	call sub_41B230
	mov edx, [esp+0C4h]
	lea eax, [esp+50h]
	mov [edx], eax
	xor edx, edx
	mov eax, [esp+0C4h]
	mov dword [dword_4D2098], edx
	call sub_410E80
	push edx
	mov eax, ebx
	call sub_419FD0
	mov ebx, 1
	mov edx, aRec6_0 ; "rec6"
	movsx ecx, ax
	xor eax, eax
	call sub_428140

loc_41C9B0:
	cmp word [esp+0DCh], 0
	jnz loc_41CEF9

loc_41C9BF:
	call sub_4833C7
	mov ecx, [esp+0C8h]
	xor edx, edx
	add ecx, eax
	xor esi, esi
	mov [esp+0C8h], ecx
	mov [esp+0C0h], ecx

loc_41C9DF:
	movsx eax, si
	imul eax, 14h
	cmp dword [eax+ebp+0Ch], 0
	jz loc_41C9F1
	mov edx, 1

loc_41C9F1:
	inc esi
	cmp si, 1Fh
	jl loc_41C9DF
	test dx, dx
	jz loc_41CF2A
	mov eax, [esp+0C4h]
	mov eax, [eax+14h]
	and byte [eax+8], 0FEh

loc_41CA0F:
	call sub_428A20
	call sub_40EB20
	mov eax, [esp+0C4h]
	mov edx, 400h
	xor ecx, ecx
	xor ebx, ebx
	mov eax, [eax+4]
	call sub_405B30
	xor eax, eax
	mov edx, 400h
	mov al, byte [byte_512DFB]
	xor ecx, ecx
	xor ebx, ebx
	mov eax, [esp+eax*4+0A0h]
	call sub_405B30
	cmp byte [byte_512DFB], 5
	jnz loc_41CF4F
	mov eax, [esp+0DEh]
	sar eax, 10h
	push eax
	mov eax, 0AEh
	call sub_41B710
	push eax
	push aSD_1 ; "%s %d"

loc_41CA75:
	lea eax, [esp+5Ch]
	push eax
	call sprintf_
	add esp, 10h
	push 2
	push 4
	mov eax, 0AEh
	call sub_41B650
	movsx ebx, ax
	mov eax, 0AEh
	call sub_41B670
	sub eax, 14h
	mov ecx, 12h
	movsx edx, ax
	lea eax, [esp+58h]
	mov edi, [esp+0E8h]
	call sub_4054E0
	cmp di, 2
	jnz loc_41CF6F
	mov dword [esp+0CCh], 1

loc_41CACD:
	mov eax, 0A7h
	mov ebx, 1ACh
	call sub_41B670
	xor ecx, ecx
	movsx edx, ax
	mov eax, 0B3h
	call sub_405580
	cmp word [esp+0D4h], 0
	jnz loc_41CF95

loc_41CAFA:
	mov edi, 0B4h
	xor esi, esi
	mov [esp+0E8h], di
	mov [esp+0ECh], si

loc_41CB11:
	mov edi, [esp+0EAh]
	sar edi, 10h
	lea esi, [edi+0B4h]
	mov eax, esi
	call sub_41B650
	movsx ebx, ax
	mov eax, 0A7h
	call sub_41B670
	movsx edx, ax
	mov eax, [esp+0E6h]
	xor ecx, ecx
	sar eax, 10h
	call sub_405580
	add edi, [esp+0CCh]
	imul edi, 14h
	add edi, ebp
	cmp dword [edi+0Ch], 0
	jz loc_41CC66
	push 4
	push 3
	mov eax, esi
	call sub_41B650
	movsx ebx, ax
	mov eax, 0A8h
	mov ecx, 12h
	call sub_41B670
	movsx edx, ax
	mov eax, edi
	call sub_4054E0
	mov eax, [edi+8]
	sar eax, 10h
	call sub_41A420
	push eax
	push aS_0 ; "%s"
	lea eax, [esp+58h]
	push eax
	call sprintf_
	add esp, 0Ch
	push 4
	push 3
	mov eax, esi
	call sub_41B650
	movsx ebx, ax
	mov eax, 0A9h
	call sub_41B670
	sub eax, 19h
	mov ecx, 12h
	movsx edx, ax
	lea eax, [esp+58h]
	call sub_4054E0
	lea edx, [esp+50h]
	mov eax, [edi+0Ch]
	call sub_41B150
	push 4
	push 3
	mov eax, esi
	call sub_41B650
	movsx ebx, ax
	mov eax, 0AAh
	mov ecx, 12h
	call sub_41B670
	movsx edx, ax
	lea eax, [esp+58h]
	call sub_4054E0
	mov ax, [edi+10h]
	cmp ax, 2
	jnz loc_41D090
	mov eax, 1Fh

loc_41CC18:
	call sub_41B710
	push eax
	push aS_0 ; "%s"
	lea eax, [esp+58h]
	push eax
	call sprintf_
	add esp, 0Ch
	mov eax, [esp+0EAh]
	push 4
	sar eax, 10h
	push 3
	add eax, 0B4h
	call sub_41B650
	movsx ebx, ax
	mov eax, 0ABh
	mov ecx, 12h
	call sub_41B670
	movsx edx, ax
	lea eax, [esp+58h]
	call sub_4054E0

loc_41CC66:
	mov ecx, [esp+0ECh]
	mov ebx, [esp+0E8h]
	inc ecx
	inc ebx
	mov [esp+0ECh], cx
	mov [esp+0E8h], bx
	cmp cx, 0Ah
	jl loc_41CB11
	mov eax, [esp+0C4h]
	call sub_40FA90
	mov eax, dword [dword_4D4D24]
	mov edx, [esp+0C0h]
	xor ecx, ecx
	mov eax, [eax+20h]
	xor ebx, ebx
	call sub_426B70
	mov eax, 12h
	call sub_4274F0
	cmp dword [dword_4D2310], 0
	jz loc_41CCDA
	mov eax, dword [dword_4D4C7C]
	mov edx, dword [dword_4D4C80]
	sub eax, 7
	call sub_4267C0

loc_41CCDA:
	call sub_4976B8
	mov eax, [esp+0C4h]
	call sub_423CA0
	call sub_405960
	mov esi, eax
	test ax, ax
	jz loc_41C93C
	mov edx, [esp+0C8h]
	cmp edx, [esp+0B8h]
	jle loc_41C93C
	add edx, 0Fh
	mov [esp+0B8h], edx
	mov edx, [esp+0C4h]
	cmp word [edx+0Ah], 0
	jnz loc_41CD89
	cmp ax, 4B00h
	jnz loc_41CD89
	mov edx, [esp+0F0h]
	mov eax, 1
	sub edx, eax
	mov [esp+0DCh], eax
	mov [esp+0F0h], dx
	test dx, dx
	jl loc_41D0AA

loc_41CD5A:
	mov edx, 7Fh
	xor eax, eax
	mov ecx, 1
	call sub_4423F0
	xor ebx, ebx
	xor eax, eax
	mov [esp+0D8h], ecx
	call sub_403550
	xor edx, edx
	mov eax, 12h
	xor ecx, ecx
	call sub_4274F0

loc_41CD89:
	mov eax, [esp+0C4h]
	cmp word [eax+0Ah], 0
	jnz loc_41CE07
	cmp si, 4D00h
	jnz loc_41D0BE

loc_41CDA2:
	mov edx, [esp+0EEh]
	mov eax, 1
	mov ecx, [esp+0E2h]
	sar edx, 10h
	mov [esp+0DCh], eax
	inc edx
	sar ecx, 10h
	mov eax, edx
	sar edx, 1Fh
	idiv ecx
	mov [esp+0F0h], dx
	mov dword [esp+0D8h], 1
	cmp si, 4D00h
	jnz loc_41CDF0
	mov edx, 7Fh
	xor eax, eax
	call sub_4423F0

loc_41CDF0:
	xor eax, eax
	call sub_403550
	xor ecx, ecx
	xor ebx, ebx
	xor edx, edx
	mov eax, 12h
	call sub_4274F0

loc_41CE07:
	mov eax, [esp+0C4h]
	mov bx, [eax+0Ah]
	cmp bx, 1
	jnz loc_41D0CD
	cmp si, 4B00h
	jnz loc_41D0CD
	mov [esp+0DCh], ebx
	mov ebx, [esp+0DEh]
	sar ebx, 10h
	mov edx, ebx
	mov eax, ebx
	sar edx, 1Fh
	sub eax, edx
	sar eax, 1
	mov [esp+0E0h], ax
	cmp ax, 2
	jge loc_41CE5B
	mov word [esp+0E0h], 8

loc_41CE5B:
	mov edx, 7Fh
	xor eax, eax
	call sub_4423F0

loc_41CE67:
	xor eax, eax
	call sub_403550

loc_41CE6E:
	mov eax, [esp+0C4h]
	movsx edx, si
	call sub_410414
	mov [esp+0BCh], eax
	mov eax, [esp+0C4h]
	cmp word [eax+0Ah], 2
	jnz loc_41C93C
	cmp si, 0Dh
	jnz loc_41C93C
	push 34Dh
	mov ebx, 1
	push 1
	mov [esp+0E0h], ebx
	call sub_401AE0
	mov [esp+0E4h], ebx
	add esp, 8
	cmp ax, bx
	jz loc_41D12E
	xor eax, eax
	call sub_403550
	jmp loc_41C93C

loc_41CED7:
	mov word [esp+0E4h], 8
	jmp loc_41C8E7

loc_41CEE6:
	mov eax, [esp+0C4h]
	mov eax, [eax+18h]
	and byte [eax+8], 0FEh
	jmp loc_41C92D

loc_41CEF9:
	mov ebx, [esp+0EEh]
	sar ebx, 10h
	mov edx, esp
	mov eax, ebx
	xor ecx, ecx
	call sub_41AEF0
	mov [esp+0D4h], eax
	mov edx, ebp
	mov eax, ebx
	mov [esp+0DCh], ecx
	call sub_41B040
	jmp loc_41C9BF

loc_41CF2A:
	mov eax, [esp+0C4h]
	cmp word [eax+0Ah], 2
	jnz loc_41CF3C
	mov [eax+0Ah], dx

loc_41CF3C:
	mov eax, [esp+0C4h]
	mov eax, [eax+14h]
	or byte [eax+8], 1
	jmp loc_41CA0F

loc_41CF4F:
	mov eax, 0AEh
	call sub_41B710
	push eax
	mov eax, [esp+0E2h]
	sar eax, 10h
	push eax
	push aDS_0 ; "%d %s"
	jmp loc_41CA75

loc_41CF6F:
	cmp di, 4
	jnz loc_41CF85
	mov dword [esp+0CCh], 0Bh
	jmp loc_41CACD

loc_41CF85:
	mov dword [esp+0CCh], 15h
	jmp loc_41CACD

loc_41CF95:
	push 2
	mov eax, 0A8h
	push 3
	mov ecx, 12h
	mov ebx, 1ACh
	call sub_41B670
	movsx edx, ax
	mov eax, ebp
	call sub_4054E0
	mov eax, [ebp+8]
	sar eax, 10h
	call sub_41A420
	push eax
	push aS_0 ; "%s"
	lea eax, [esp+58h]
	push eax
	call sprintf_
	add esp, 0Ch
	push 2
	push 3
	mov eax, 0A9h
	mov ecx, 12h
	call sub_41B670
	sub eax, 19h
	mov ebx, 1ACh
	movsx edx, ax
	lea eax, [esp+58h]
	call sub_4054E0
	lea edx, [esp+50h]
	mov eax, [ebp+0Ch]
	call sub_41B150
	push 2
	mov ecx, 12h
	push 3
	mov eax, 0AAh
	mov ebx, 1ACh
	call sub_41B670
	movsx edx, ax
	lea eax, [esp+58h]
	call sub_4054E0
	mov bx, [ebp+10h]
	cmp bx, 2
	jnz loc_41D07C
	mov eax, 1Fh

loc_41D03B:
	call sub_41B710
	push eax
	push aS_0 ; "%s"
	lea eax, [esp+58h]
	push eax
	call sprintf_
	add esp, 0Ch
	push 2
	mov eax, 0ABh
	push 3
	mov ecx, 12h
	mov ebx, 1ACh
	call sub_41B670
	movsx edx, ax
	lea eax, [esp+58h]
	call sub_4054E0
	jmp loc_41CAFA

loc_41D07C:
	cmp bx, 1
	jnz loc_41D089
	mov eax, 1Bh
	jmp loc_41D03B

loc_41D089:
	mov eax, 1Eh
	jmp loc_41D03B

loc_41D090:
	cmp ax, 1
	jnz loc_41D0A0
	mov eax, 1Bh
	jmp loc_41CC18

loc_41D0A0:
	mov eax, 1Eh
	jmp loc_41CC18

loc_41D0AA:
	mov eax, [esp+0D0h]
	mov [esp+0F0h], ax
	jmp loc_41CD5A

loc_41D0BE:
	cmp si, 0Dh
	jz loc_41CDA2
	jmp loc_41CE07

loc_41D0CD:
	mov eax, [esp+0C4h]
	cmp word [eax+0Ah], 1
	jnz loc_41CE6E
	cmp si, 4D00h
	jnz loc_41D123

loc_41D0E6:
	mov eax, [esp+0E0h]
	mov edi, 1
	add eax, eax
	mov [esp+0DCh], edi
	mov [esp+0E0h], ax
	cmp ax, 8
	jle loc_41D113
	mov word [esp+0E0h], 2

loc_41D113:
	cmp si, 4D00h
	jnz loc_41CE67
	jmp loc_41CE5B

loc_41D123:
	cmp si, 0Dh
	jz loc_41D0E6
	jmp loc_41CE6E

loc_41D12E:
	mov eax, [esp+0EEh]
	mov edx, 1
	sar eax, 10h
	call sub_41A830
	xor eax, eax
	call sub_403550
	jmp loc_41C93C

loc_41D14E:
	mov al, [esp+0F0h]
	xor bh, bh
	mov byte [byte_512DB0], al
	mov al, [esp+0E0h]
	mov byte [byte_512DB9], bh
	mov byte [byte_512DB8], al
	cmp al, 8
	jnz loc_41D179
	mov byte [byte_512DB9], 1

loc_41D179:
	mov al, byte [byte_512DB8]
	cmp al, 2
	jnz loc_41D187
	mov byte [byte_512DB9], al

loc_41D187:
	xor eax, eax
	call sub_403550
	test ebp, ebp
	jnz loc_41D1CA

loc_41D197:
	xor eax, eax
	call sub_403550
	xor ebp, ebp
	xor ecx, ecx
	xor ebx, ebx
	xor edx, edx
	mov eax, 12h
	mov dword [dword_4D2098], ebp
	call sub_4274F0
	mov eax, [esp+0BCh]
	add esp, 0F4h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_41D1CA:
	mov eax, ebp
	call sub_4848FC
	jmp loc_41D197
;sub_41C850 endp

sub_41D1E0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push ebp
	sub esp, 190h
	mov ebx, eax
	cmp dword [dword_4D4B48], 0
	jz loc_41D205

loc_41D1F5:
	mov eax, dword [dword_4D4B48]
	add esp, 190h
	pop ebp
	pop edx
	pop ecx
	pop ebx
	ret

loc_41D205:
	mov eax, esp
	push eax ; lpWSAData
	push 101h ; wVersionRequested
	call WSAStartup_wrap
	test eax, eax
	jnz loc_41D1F5
	push edi
	push esi
	xor edx, edx
	call sub_41D7B0
	test eax, eax
	jz loc_41D263
	mov ecx, 1
	mov esi, off_4D4AEC
	mov dword [dword_4D4B48], ecx
	call sub_41D720
	mov eax, dword [dword_4DBADC]
	mov edi, dword_4DBB00
	lea ebp, [eax+ecx]
	mov dword dword_564344[eax*4], esi
	mov dword dword_564324[eax*4], edi
	mov dword [dword_4DBADC], ebp
	test ebx, ebx
	jz loc_41D263
	mov dword [off_4D4AEC], ebx

loc_41D263:
	call WSACleanup_wrap
	pop esi
	pop edi
	mov eax, dword [dword_4D4B48]
	add esp, 190h
	pop ebp
	pop edx
	pop ecx
	pop ebx
	ret
;sub_41D1E0 endp

sub_41D280: ;SUBROUTINE
	push ebp
	sub esp, 20h
	mov ebp, eax
	mov [esp+1Ch], ebx
	mov [esp], ebx
	test edx, edx
	jnz loc_41D2B7
	mov [esp+18h], edx

loc_41D295:
	cmp dword [dword_4DBAD8], 4
	jge loc_41D2CC

loc_41D29E:
	mov ebx, esp
	mov edx, sub_41DA70
	lea eax, [ebp+68h]
	call sub_48BFFC
	mov eax, 1
	add esp, 20h
	pop ebp
	ret

loc_41D2B7:
	push edi
	push esi
	lea edi, [esp+0Ch]
	mov esi, edx
	movsd
	movsd
	movsd
	movsd
	movsd
	mov [esp+20h], eax
	pop esi
	pop edi
	jmp loc_41D295

loc_41D2CC:
	push 0
	mov ecx, 14h
	mov eax, aWinipxflush ; "WINIPXFlush"
	push 0
	mov ebx, edx
	lea edx, [esp+24h]
	call sub_48B724
	jmp loc_41D29E
;sub_41D280 endp

sub_41D2F0: ;SUBROUTINE
	push esi
	push edi
	push ebp
	sub esp, 30h
	mov [esp+2Ch], eax
	mov [esp+20h], edx
	mov [esp+24h], ebx
	mov [esp+1Ch], ecx
	lea ebx, [eax+4Ch]
	mov eax, ebx
	call sub_48BAFC
	mov ebp, eax
	test eax, eax
	jz loc_41D346
	mov esi, [esp+2Ch]
	add esi, 68h

loc_41D31D:
	mov eax, [esp+2Ch]
	mov edx, ebp
	call sub_41DB50
	test eax, eax
	jz loc_41D3E3
	mov edx, ebp
	mov eax, esi
	call sub_48BAB4
	mov eax, ebx
	call sub_48BAFC
	mov ebp, eax
	test eax, eax
	jnz loc_41D31D

loc_41D346:
	mov eax, [esp+24h]
	lea edi, [esp+4]
	mov eax, [eax]
	mov esi, [esp+20h]
	mov [esp], eax
	mov eax, [esp+2Ch]
	movsd
	movsd
	movsd
	movsd
	movsd
	mov ebx, esp
	mov [esp+18h], eax
	lea esi, [eax+68h]
	mov edx, sub_41DAC0
	mov eax, esi
	call sub_48BE10
	mov ebp, eax
	test eax, eax
	jz loc_41D3CE
	mov edi, [esp+2Ch]
	add edi, 4Ch

loc_41D382:
	mov eax, dword [dword_5637F0]
	add eax, 10h
	cmp eax, [ebp+4]
	jge loc_41D3F1
	cmp dword [dword_4DBAD8], 4
	jl loc_41D3B1
	push 0
	mov ecx, 14h
	lea ebx, [ebp+0Ch]
	push 0
	mov eax, aTurfBuffer ; "Turf Buffer"
	lea edx, [ebp+20h]
	call sub_48B724

loc_41D3B1:
	mov edx, ebp
	mov eax, edi
	mov ebx, esp
	call sub_48BA80
	mov edx, sub_41DAC0
	mov eax, esi
	call sub_48BE10
	mov ebp, eax
	test eax, eax
	jnz loc_41D382

loc_41D3CE:
	mov eax, [esp+24h]
	mov dword [eax], 0
	xor eax, eax
	add esp, 30h
	pop ebp
	pop edi
	pop esi
	ret 4

loc_41D3E3:
	mov edx, ebp
	mov eax, ebx
	call sub_48BA80
	jmp loc_41D346

loc_41D3F1:
	mov eax, [ebp+8]
	sub eax, 4
	mov ecx, [esp+40h]
	mov [esp+28h], eax
	cmp eax, ecx
	jle loc_41D46F
	mov [esp+28h], ecx

loc_41D407:
	mov edi, [esp+20h]
	lea esi, [ebp+0Ch]
	movsd
	movsd
	movsd
	movsd
	movsd
	mov edx, [esp+24h]
	mov eax, [ebp+20h]
	mov edi, [esp+28h]
	mov [edx], eax
	test edi, edi
	jz loc_41D432
	mov edx, [esp+1Ch]
	lea eax, [ebp+28h]
	mov ebx, edi
	call sub_48A980

loc_41D432:
	cmp dword [dword_4DBAD8], 4
	jl loc_41D454
	push 0
	mov ecx, 14h
	lea ebx, [ebp+0Ch]
	push 0
	mov eax, aWinipxrecv ; "WINIPXRecv"
	lea edx, [ebp+20h]
	call sub_48B724

loc_41D454:
	mov eax, [esp+2Ch]
	mov edx, ebp
	add eax, 4Ch
	call sub_48BA80
	mov eax, [esp+28h]
	add esp, 30h
	pop ebp
	pop edi
	pop esi
	ret 4

loc_41D46F:
	test eax, eax
	jge loc_41D407
	xor esi, esi
	mov [esp+28h], esi
	jmp loc_41D407
;sub_41D2F0 endp

sub_41D480: ;SUBROUTINE
	push esi
	push edi
	push ebp
	sub esp, 138h
	mov edi, [esp+148h]
	mov ebp, eax
	mov esi, edx
	mov [esp+12Ch], ebx
	cmp edi, 118h
	jle loc_41D4A8
	mov edi, 118h

loc_41D4A8:
	mov ebx, 4
	mov edx, [esp+12Ch]
	mov eax, esp
	call sub_48C054
	lea edx, [esp+4]
	mov ebx, edi
	mov eax, ecx
	call sub_48A980
	test esi, esi
	jz loc_41D571
	lea edx, [esp+11Ch]
	mov eax, esi
	call sub_41DC90

loc_41D4DE:
	mov eax, dword [dword_4DB6A0]
	call sub_489F48
	push 0Eh ; tolen
	lea eax, [esp+120h]
	push eax ; to
	push 0 ; flags
	lea eax, [edi+4]
	push eax ; len
	lea eax, [esp+10h]
	push eax ; buf
	mov edx, [ebp+34h]
	push edx ; s
	call sendto_wrap
	mov ecx, eax
	mov [esp+134h], eax
	mov eax, dword [dword_4DB6A0]
	call sub_489F60
	cmp ecx, 0FFFFFFFFh
	jnz loc_41D586
	call WSAGetLastError_wrap
	mov ebx, dword [dword_4DBAD8]
	mov [esp+130h], eax
	cmp ebx, 4
	jl loc_41D552
	push 0
	mov ecx, 4
	lea edx, [esp+134h]
	push 1
	mov eax, aIpxfailsend ; "ipxfailsend"
	lea ebx, [ebp+34h]

loc_41D54D:
	call sub_48B724

loc_41D552:
	mov esi, [esp+134h]
	add edi, 4
	cmp edi, esi
	jnz loc_41D5A8
	mov eax, 1
	add esp, 138h
	pop ebp
	pop edi
	pop esi
	ret 4

loc_41D571:
	lea edx, [esp+11Ch]
	movsx eax, word [ebp+0]
	call sub_41DC40
	jmp loc_41D4DE

loc_41D586:
	cmp dword [dword_4DBAD8], 4
	jl loc_41D552
	push 0
	mov ecx, 14h
	lea edx, [esp+130h]
	push 0
	mov eax, aWinipxsend ; "WINIPXSend"
	mov ebx, esi
	jmp loc_41D54D

loc_41D5A8:
	xor eax, eax
	add esp, 138h
	pop ebp
	pop edi
	pop esi
	ret 4
;sub_41D480 endp

sub_41D5C0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	sub esp, 8
	mov ebx, eax
	add eax, 68h
	call sub_48BC4C
	test eax, eax
	jbe loc_41D5E0

loc_41D5D4:
	mov eax, 1
	add esp, 8
	pop edx
	pop ecx
	pop ebx
	ret

loc_41D5E0:
	lea eax, [esp+4]
	push eax ; argp
	push 4004667Fh ; cmd
	mov edx, [ebx+34h]
	push edx ; s
	call ioctlsocket_wrap
	mov [esp], eax
	cmp eax, 0FFFFFFFFh
	jz loc_41D60B
	cmp dword [esp+4], 0
	ja loc_41D5D4
	xor eax, eax
	add esp, 8
	pop edx
	pop ecx
	pop ebx
	ret

loc_41D60B:
	cmp dword [dword_4DBAD8], 4
	jl loc_41D62E
	push 0
	mov ecx, 4
	lea edx, [esp+4]
	push 1
	mov eax, aIpxfailready ; "ipxfailready"
	add ebx, 34h
	call sub_48B724

loc_41D62E:
	xor eax, eax
	add esp, 8
	pop edx
	pop ecx
	pop ebx
	ret
;sub_41D5C0 endp

sub_41D640: ;SUBROUTINE
	mov eax, 1
	ret
;sub_41D640 endp

sub_41D650: ;SUBROUTINE
	push esi
	push edi
	mov edi, edx
	lea esi, [eax+38h]
	mov eax, 1
	movsd
	movsd
	movsd
	movsd
	movsd
	pop edi
	pop esi
	ret
;sub_41D650 endp

sub_41D670: ;SUBROUTINE
	push ecx
	push esi
	push edi
	mov ecx, 8
	lea edi, [ebx+4]
	lea esi, [edx+4]
	xor eax, eax
	repe cmpsb
	jz loc_41D689
	sbb eax, eax
	sbb eax, 0FFFFFFFFh

loc_41D689:
	test eax, eax
	jnz loc_41D696
	mov eax, 1
	pop edi
	pop esi
	pop ecx
	ret

loc_41D696:
	xor eax, eax
	pop edi
	pop esi
	pop ecx
	ret
;sub_41D670 endp

sub_41D6A0: ;SUBROUTINE
	mov byte [eax+2], 0
	mov eax, 1
	ret
;sub_41D6A0 endp

sub_41D6B0: ;SUBROUTINE
	push ebx
	push ecx
	mov ecx, eax
	mov ebx, 30h
	add eax, 2
	call strncpy_
	mov eax, [ecx+34h]
	call sub_48A9E0
	pop ecx
	pop ebx
	ret
;sub_41D6B0 endp

;	Attributes: thunk

sub_41D6D0: ;SUBROUTINE
	jmp sub_48AF34
;sub_41D6D0 endp

sub_41D6E0: ;SUBROUTINE
	push ebx
	push ecx
	lea ecx, [eax+38h]
	mov ebx, edx
	mov edx, ecx
	call sub_48AE40
	pop ecx
	pop ebx
	ret
;sub_41D6E0 endp

sub_41D700: ;SUBROUTINE
	push ecx
	mov ecx, 2
	mov eax, [eax]
	bswap eax
	neg ecx
	lea ecx, 20h[ecx*8]
	shr eax, cl
	pop ecx
	ret
;sub_41D700 endp

sub_41D720: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	sub esp, 4
	mov esi, eax
	cmp dword [dword_4DBAD8], 4
	jl loc_41D746
	push 0
	mov eax, aIpxclosesocket ; "ipxclosesocket"
	xor ecx, ecx
	push 0
	xor ebx, ebx
	xor edx, edx
	call sub_48B724

loc_41D746:
	mov ecx, [esi+34h]
	push ecx ; s
	call closesocket_wrap
	cmp eax, 0FFFFFFFFh
	jz loc_41D778

loc_41D754:
	lea eax, [esi+4Ch]
	call sub_48BA6C
	lea eax, [esi+68h]
	call sub_48BA6C
	mov eax, esi
	call sub_4848FC
	mov eax, 1
	add esp, 4
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_41D778:
	call WSAGetLastError_wrap
	mov ebx, dword [dword_4DBAD8]
	mov [esp], eax
	cmp ebx, 4
	jl loc_41D754
	push 0
	lea edx, [esp+4]
	mov eax, aCloseerr ; "closeerr"
	push 1
	xor ecx, ecx
	xor ebx, ebx
	call sub_48B724
	jmp loc_41D754
;sub_41D720 endp

sub_41D7B0: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 20h
	mov [esp+10h], eax
	mov edx, aCNfs2seFron_13 ; "c:\\nfs2se\\frontend\\pc\\ipx.c"
	mov ecx, 0E6h
	mov ebx, 300h
	mov eax, aSocket ; "socket"
	mov dword [dword_4DB1D8], edx
	mov edx, 14084h
	mov dword [dword_4DB1DC], ecx
	call sub_484498
	mov edx, 14084h
	mov ecx, eax
	mov edi, eax
	call sub_48A01C
	xor ebx, ebx
	lea esi, [ecx+4Ch]
	xor edx, edx
	mov eax, esi
	call sub_48BA2C
	lea eax, [ecx+68h]
	xor ebx, ebx
	xor edx, edx
	xor ebp, ebp
	call sub_48BA2C
	lea eax, [ecx+84h]
	mov ebx, esi
	mov ecx, eax
	lea esi, [eax+14000h]

loc_41D820:
	mov edx, ecx
	mov eax, ebx
	add ecx, 140h
	call sub_48BA80
	cmp ecx, esi
	jnz loc_41D820
	push 3E8h ; protocol
	push 2 ; type
	push 6 ; af
	call socket_wrap
	mov ebx, dword [dword_4DBAD8]
	mov [edi+34h], eax
	cmp ebx, 4
	jge loc_41D8BB

loc_41D84F:
	cmp dword [edi+34h], 0FFFFFFFFh
	jnz loc_41D8DA

loc_41D859:
	test ebp, ebp
	jnz loc_41D8B0
	cmp dword [dword_4DBAD8], 4
	jge loc_41D9D9

loc_41D86A:
	mov ecx, [edi+34h]
	cmp ecx, 0FFFFFFFFh
	jz loc_41D8A7
	push ecx ; s
	call closesocket_wrap
	cmp eax, 0FFFFFFFFh
	jnz loc_41D8A7
	call WSAGetLastError_wrap
	mov esi, dword [dword_4DBAD8]
	mov [esp+1Ch], eax
	cmp esi, 4
	jl loc_41D8A7
	push 0
	lea edx, [esp+20h]
	mov eax, aAborterr ; "aborterr"
	push 1
	xor ecx, ecx
	xor ebx, ebx
	call sub_48B724

loc_41D8A7:
	mov eax, edi
	call sub_4848FC
	xor edi, edi

loc_41D8B0:
	mov eax, edi
	add esp, 20h
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_41D8BB:
	push 0
	mov ecx, 4
	lea edx, [esp+14h]
	push 1
	mov eax, aIpxopensocket ; "ipxopensocket"
	lea ebx, [edi+34h]
	call sub_48B724
	jmp loc_41D84F

loc_41D8DA:
	mov eax, 1
	push 4 ; optlen
	mov [esp+18h], eax
	lea eax, [esp+18h]
	push eax ; optval
	push 20h ; optname
	push 0FFFFh ; level
	mov edx, [edi+34h]
	push edx ; s
	call setsockopt_wrap
	push 4 ; optlen
	lea eax, [esp+18h]
	push eax ; optval
	xor ecx, ecx
	push 400Fh ; optname
	mov [esp+20h], ecx
	push 0FFFFh ; level
	mov ebx, [edi+34h]
	push ebx ; s
	call setsockopt_wrap
	push 4 ; optlen
	lea eax, [esp+18h]
	push eax ; optval
	push 400Fh ; optname
	push 3E8h ; level
	mov esi, [edi+34h]
	push esi ; s
	call setsockopt_wrap
	mov dword [esp+14h], 1
	lea eax, [esp+14h]
	push eax ; argp
	push 8004667Eh ; cmd
	mov edx, [edi+34h]
	push edx ; s
	call ioctlsocket_wrap
	mov edx, 0Eh
	mov eax, esp
	call sub_48A01C
	xor eax, eax
	mov ax, [esp+10h]
	mov edx, 6
	push eax ; hostshort
	mov [esp+4], dx
	call htons_wrap
	push 0Eh ; namelen
	mov [esp+10h], ax
	lea eax, [esp+4]
	push eax ; name
	mov ecx, [edi+34h]
	push ecx ; s
	call bind_wrap
	test eax, eax
	jnz loc_41D859
	lea eax, [esp+18h]
	mov ebx, 0Eh
	push eax ; namelen
	lea eax, [esp+4]
	mov [esp+1Ch], ebx
	push eax ; name
	mov esi, [edi+34h]
	push esi ; s
	call getsockname_wrap
	test eax, eax
	jnz loc_41D859
	cmp ebx, [esp+18h]
	jnz loc_41D859
	mov eax, esp
	lea edx, [edi+38h]
	call sub_41DCD0
	mov eax, [esp+0Ch]
	mov [edi], ax
	mov eax, edi
	add esp, 20h
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_41D9D9:
	push ebp
	mov eax, aOpenfailed ; "openfailed"
	xor ecx, ecx
	push 1
	xor ebx, ebx
	xor edx, edx
	call sub_48B724
	jmp loc_41D86A
;sub_41D7B0 endp

sub_41DA00: ;SUBROUTINE
	push ecx
	push edx
	call WSACleanup_wrap
	test eax, eax
	jnz loc_41DA13
	mov eax, 1
	pop edx
	pop ecx
	ret

loc_41DA13:
	xor eax, eax
	pop edx
	pop ecx
	ret
;sub_41DA00 endp

sub_41DA20: ;SUBROUTINE
	push ecx
	push edx
	sub esp, 190h
	mov eax, esp
	push eax ; lpWSAData
	push 101h ; wVersionRequested
	call WSAStartup_wrap
	test eax, eax
	jnz loc_41DA58
	mov edx, [esp+188h]
	test dx, dx
	jz loc_41DA51
	mov ax, dx

loc_41DA48:
	add esp, 190h
	pop edx
	pop ecx
	ret

loc_41DA51:
	mov eax, 2000h
	jmp loc_41DA48

loc_41DA58:
	xor eax, eax
	add esp, 190h
	pop edx
	pop ecx
	ret
;sub_41DA20 endp

sub_41DA70: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	mov ecx, [eax+20h]
	mov ebx, [edx]
	mov esi, eax
	cmp ecx, ebx
	jnz loc_41DA8D
	mov edi, [edx+18h]
	test edi, edi
	jnz loc_41DA97

loc_41DA86:
	mov dword [esi+4], 0

loc_41DA8D:
	mov eax, 1
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_41DA97:
	lea ebx, [edx+4]
	lea edx, [eax+0Ch]
	mov eax, edi
	call sub_41D670
	test eax, eax
	jnz loc_41DA86
	mov eax, 1
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_41DA70 endp

sub_41DAC0: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	mov ecx, dword [dword_5637F0]
	add ecx, 10h
	cmp ecx, [eax+4]
	jl loc_41DAD8
	mov esi, [eax+20h]
	cmp esi, [edx]
	jz loc_41DAE1

loc_41DAD8:
	mov eax, 1
	pop esi
	pop ecx
	pop ebx
	ret

loc_41DAE1:
	lea ebx, [eax+0Ch]
	lea eax, [edx+4]
	mov ecx, [edx+18h]
	mov edx, eax
	mov eax, ecx
	call sub_41D670
	test eax, eax
	jnz loc_41DAD8
	pop esi
	pop ecx
	pop ebx
	ret
;sub_41DAC0 endp

sub_41DB00: ;SUBROUTINE
	push esi
	push ebp
	sub esp, 4
	mov ebp, eax
	mov [esp], edx
	mov esi, ebx
	lea edx, [eax+2]
	mov ebx, 30h
	mov eax, esi
	call strncmp_
	test eax, eax
	jz loc_41DB25
	add esp, 4
	pop ebp
	pop esi
	ret

loc_41DB25:
	push edi
	push ecx
	mov edi, esi
	mov ebx, 0EA737276h
	sub ecx, ecx
	dec ecx
	xor eax, eax
	repne scasb
	not ecx
	dec ecx
	inc ecx
	mov edx, [esp+8]
	push ecx
	mov eax, ebp
	mov ecx, esi
	call sub_41D480
	pop ecx
	pop edi
	add esp, 4
	pop ebp
	pop esi
	ret
;sub_41DB00 endp

sub_41DB50: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 14h
	mov edi, eax
	mov esi, edx
	mov edx, 0Eh
	mov eax, dword [dword_4DB6A0]
	mov [esp+10h], edx
	call sub_489F48
	lea eax, [esp+10h]
	push eax ; fromlen
	lea eax, [esp+4]
	push eax ; from
	push 0 ; flags
	push 11Ch ; len
	lea ebx, [esi+24h]
	push ebx ; buf
	mov ecx, [edi+34h]
	push ecx ; s
	call recvfrom_wrap
	mov [esi+8], eax
	mov eax, dword [dword_4DB6A0]
	call sub_489F60
	mov ebp, [esi+8]
	test ebp, ebp
	jle loc_41DBE8
	cmp byte [edi+2], 0
	jnz loc_41DBF3

loc_41DBA7:
	mov eax, dword [dword_5637F0]
	mov ecx, 4
	mov [esi+4], eax
	lea eax, [esi+24h]
	mov eax, [eax]
	bswap eax
	neg ecx
	lea ecx, 20h[ecx*8]
	shr eax, cl
	mov [esi+20h], eax
	test eax, eax
	jz loc_41DBDA
	cmp dword [esi+8], 4
	jl loc_41DBDA
	cmp dword [esp+10h], 0Eh
	jz loc_41DC04

loc_41DBDA:
	mov dword [esi+8], 0
	mov dword [esi+20h], 0

loc_41DBE8:
	xor eax, eax
	add esp, 14h
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_41DBF3:
	mov edx, esp
	mov ecx, ebp
	mov eax, edi
	call sub_48AA98
	test eax, eax
	jz loc_41DBA7
	jmp loc_41DBE8

loc_41DC04:
	lea ebx, [esi+0Ch]
	mov eax, esp
	mov edx, ebx
	call sub_41DCD0
	cmp dword [dword_4DBAD8], 4
	jl loc_41DC2F
	push 0
	mov ecx, 14h
	push 0
	mov eax, aRecvfrom ; "recvfrom"
	lea edx, [esi+20h]
	call sub_48B724

loc_41DC2F:
	mov eax, 1
	add esp, 14h
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_41DB50 endp

sub_41DC40: ;SUBROUTINE
	push ebx
	push ecx
	sub esp, 4
	mov [esp], eax
	mov ecx, edx
	lea eax, [edx+2]
	mov word [edx], 6
	xor ebx, ebx
	mov edx, 4
	call sub_48A026
	mov ebx, 0FFh
	mov edx, 6
	lea eax, [ecx+6]
	call sub_48A026
	mov ebx, 2
	mov eax, esp
	lea edx, [ecx+0Ch]
	call sub_48A980
	add esp, 4
	pop ecx
	pop ebx
	ret
;sub_41DC40 endp

sub_41DC90: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	mov esi, eax
	mov ecx, edx
	mov ebx, 4
	add edx, 2
	call sub_48A980
	mov ebx, 6
	lea edx, [ecx+6]
	lea eax, [esi+4]
	call sub_48A980
	mov ebx, 2
	lea edx, [ecx+0Ch]
	lea eax, [esi+0Ah]
	call sub_48A980
	mov word [ecx], 6
	pop esi
	pop ecx
	pop ebx
	ret
;sub_41DC90 endp

sub_41DCD0: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	mov esi, eax
	mov ecx, edx
	mov ebx, 4
	add eax, 2
	call sub_48A980
	mov ebx, 6
	lea edx, [ecx+4]
	lea eax, [esi+6]
	call sub_48A980
	mov ebx, 2
	lea edx, [ecx+0Ah]
	lea eax, [esi+0Ch]
	call sub_48A980
	pop esi
	pop ecx
	pop ebx
	ret
;sub_41DCD0 endp

sub_41DD10: ;SUBROUTINE
	push ecx
	push edx
	cmp dword [dword_4D4BC0], 0
	jz loc_41DD23

loc_41DD1B:
	mov eax, dword [dword_4D4BC0]
	pop edx
	pop ecx
	ret

loc_41DD23:
	push dword_4E6030 ; lpWSAData
	push 101h ; wVersionRequested
	call WSAStartup_wrap
	test eax, eax
	jnz loc_41DD1B
	push eax ; protocol
	push 1 ; type
	push 2 ; af
	call socket_wrap
	cmp eax, 0FFFFFFFFh
	jz loc_41DD90
	push edi
	push esi
	push ebx
	mov ecx, off_4D4B64
	mov ebx, dword_4DBB6C
	mov edi, 1
	mov edx, dword [dword_4DBADC]
	push eax ; s
	lea esi, [edx+1]
	mov dword dword_564344[edx*4], ecx
	mov dword dword_564324[edx*4], ebx
	mov dword [dword_4DBADC], esi
	call closesocket_wrap
	mov dword [dword_4D4BC0], edi
	pop ebx
	pop esi
	pop edi

loc_41DD90:
	call WSACleanup_wrap
	mov eax, dword [dword_4D4BC0]
	pop edx
	pop ecx
	ret
;sub_41DD10 endp

sub_41DDA0: ;SUBROUTINE
	push ebx
	push ecx
	sub esp, 4
	mov dword [esp], 14h
	mov ecx, esp
	push ecx ; namelen
	push edx ; name
	mov ebx, [eax+18h]
	push ebx ; s
	call getsockname_wrap
	cmp eax, 0FFFFFFFFh
	jz loc_41DDC9
	mov eax, 1
	add esp, 4
	pop ecx
	pop ebx
	ret

loc_41DDC9:
	xor eax, eax
	add esp, 4
	pop ecx
	pop ebx
	ret
;sub_41DDA0 endp

sub_41DDE0: ;SUBROUTINE
	push ecx
	push esi
	push edi
	mov ecx, 10h
	mov edi, ebx
	mov esi, edx
	xor eax, eax
	repe cmpsb
	jz loc_41DDF7
	sbb eax, eax
	sbb eax, 0FFFFFFFFh

loc_41DDF7:
	test eax, eax
	jnz loc_41DE04
	mov eax, 1
	pop edi
	pop esi
	pop ecx
	ret

loc_41DE04:
	xor eax, eax
	pop edi
	pop esi
	pop ecx
	ret
;sub_41DDE0 endp

sub_41DE10: ;SUBROUTINE
	push esi
	push edi
	push ebp
	sub esp, 0Ch
	mov [esp], eax
	mov esi, edx
	mov [esp+8], ebx
	mov ebx, ecx
	mov ebp, 1
	mov [esp+4], ecx
	test edx, edx
	jnz loc_41DE37

loc_41DE2E:
	xor eax, eax
	add esp, 0Ch
	pop ebp
	pop edi
	pop esi
	ret

loc_41DE37:
	mov edi, edx
	sub ecx, ecx
	dec ecx
	xor eax, eax
	repne scasb
	not ecx
	dec ecx
	test ecx, ecx
	jz loc_41DE2E
	mov edi, edx
	sub ecx, ecx
	dec ecx
	xor eax, eax
	repne scasb
	not ecx
	dec ecx
	cmp byte [ecx+esi-1], 2Eh
	jz loc_41DE2E
	push edx ; cp
	call inet_addr_wrap
	mov edx, 14h
	mov ecx, eax
	mov eax, ebx
	call sub_48A01C
	mov word [ebx], 2
	cmp ecx, 0FFFFFFFFh
	jnz loc_41DED4
	push esi ; name
	call gethostbyname_wrap
	mov ecx, eax
	test eax, eax
	jz loc_41DED0
	mov ebx, [eax+8]
	sar ebx, 10h
	cmp ebx, 4
	jnb loc_41DEC9

loc_41DE8F:
	mov edx, [esp+4]
	mov eax, [ecx+0Ch]
	add edx, 4
	mov eax, [eax]
	call sub_48A980

loc_41DEA0:
	test ebp, ebp
	jz loc_41DEC0
	cmp dword [esp+8], 0
	jz loc_41DED9
	xor eax, eax
	mov ax, [esp+8]

loc_41DEB2:
	push eax ; hostshort
	call htons_wrap
	mov edx, [esp+4]
	mov [edx+2], ax

loc_41DEC0:
	mov eax, ebp
	add esp, 0Ch
	pop ebp
	pop edi
	pop esi
	ret

loc_41DEC9:
	mov ebx, 4
	jmp loc_41DE8F

loc_41DED0:
	xor ebp, ebp
	jmp loc_41DEC0

loc_41DED4:
	mov [ebx+4], ecx
	jmp loc_41DEA0

loc_41DED9:
	mov edx, [esp]
	xor eax, eax
	mov ax, [edx]
	jmp loc_41DEB2
;sub_41DE10 endp

sub_41DEF0: ;SUBROUTINE
	xor eax, eax
	ret
;sub_41DEF0 endp

sub_41DF00: ;SUBROUTINE
	xor eax, eax
	ret
;sub_41DF00 endp

sub_41DF10: ;SUBROUTINE
	xor eax, eax
	ret
;sub_41DF10 endp

sub_41DF20: ;SUBROUTINE
	xor eax, eax
	ret
;sub_41DF20 endp

sub_41DF30: ;SUBROUTINE
	mov eax, [eax]
	ret
;sub_41DF30 endp

sub_41DF40: ;SUBROUTINE
	push ebx
	push edx
	mov ebx, eax
	cmp byte [eax+43h], 0
	jnz loc_41DF63
	mov eax, eax

loc_41DF4C:
	mov edx, [ebx+18h]
	cmp edx, 0FFFFFFFFh
	jnz loc_41DF87
	mov eax, ebx
	call sub_4848FC
	mov eax, 1
	pop edx
	pop ebx
	ret

loc_41DF63:
	mov dl, [ebx+43h]
	mov byte [ebx+42h], 1
	test dl, dl
	jz loc_41DF4C

loc_41DF6E:
	xor eax, eax
	call sub_483EB0
	mov eax, 1
	call sub_489B9C
	cmp byte [ebx+43h], 0
	jnz loc_41DF6E
	jmp loc_41DF4C

loc_41DF87:
	push ecx
	push edx ; s
	call closesocket_wrap
	pop ecx
	mov eax, ebx
	call sub_4848FC
	mov eax, 1
	pop edx
	pop ebx
	ret
;sub_41DF40 endp

sub_41DFA0: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	mov ecx, eax
	mov ebp, edx
	mov edx, aCNfs2seFron_14 ; "c:\\nfs2se\\frontend\\pc\\tcp.c"
	mov ebx, 22Ch
	mov eax, aSocket_0 ; "socket"
	mov dword [dword_4DB1D8], edx
	mov dword [dword_4DB1DC], ebx
	mov ebx, 300h
	mov edx, 44h
	call sub_484498
	mov edx, 44h
	mov ebx, eax
	mov esi, eax
	call sub_48A01C
	mov eax, ecx
	mov dword [ebx+1Ch], 0FFFFFFFFh
	call sub_41EBB0
	mov [ebx+18h], eax
	mov [ebx+3Ch], ebp
	mov ebp, [ebx+18h]
	xor edi, edi
	cmp ebp, 0FFFFFFFFh
	jnz loc_41E00F

loc_41DFFF:
	test edi, edi
	jz loc_41E072
	mov eax, esi
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_41E00F:
	push 5 ; backlog
	push ebp ; s
	call listen_wrap
	test eax, eax
	jnz loc_41DFFF
	mov ecx, 0FFFFFFFFh
	mov dword [dword_4E61E0], ebx
	add ebx, 4
	mov eax, sub_41E5D0
	push ebx
	xor edx, edx
	mov ebx, 2
	call sub_489AE0
	test eax, eax
	jz loc_41DFFF
	mov edi, 1
	xor ecx, ecx

loc_41E046:
	mov ah, [esi+43h]
	cmp cl, ah
	jnz loc_41E062
	cmp ah, [esi+42h]
	jnz loc_41E062
	mov eax, ecx
	call sub_483EB0
	mov eax, edi
	call sub_489B9C
	jmp loc_41E046

loc_41E062:
	movzx edi, byte [esi+43h]
	test edi, edi
	jz loc_41E072
	mov eax, esi
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_41E072:
	mov eax, esi
	call sub_41DF40
	xor esi, esi
	mov eax, esi
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_41DFA0 endp

sub_41E090: ;SUBROUTINE
	push ecx
	push edx
	mov edx, dword [dword_4D4B4C]
	test edx, edx
	jz loc_41E0BA
	lea ecx, [edx-1]
	mov dword [dword_4D4B4C], ecx
	test ecx, ecx
	jz loc_41E0B1

loc_41E0A9:
	mov eax, 1
	pop edx
	pop ecx
	ret

loc_41E0B1:
	call WSACleanup_wrap
	test eax, eax
	jz loc_41E0A9

loc_41E0BA:
	xor eax, eax
	pop edx
	pop ecx
	ret
;sub_41E090 endp

sub_41E0C0: ;SUBROUTINE
	push ecx
	push edx
	sub esp, 100h
	cmp dword [dword_4D4B4C], 0
	jz loc_41E17A

loc_41E0D5:
	push esi
	push ebx
	push 0 ; protocol
	push 1 ; type
	push 2 ; af
	call socket_wrap
	mov ebx, eax
	cmp eax, 0FFFFFFFFh
	jz loc_41E14E
	push 100h ; namelen
	lea eax, [esp+0Ch]
	push eax ; name
	call gethostname_wrap
	test eax, eax
	jnz loc_41E148
	lea eax, [esp+8]
	push eax ; name
	call gethostbyname_wrap
	test eax, eax
	jz loc_41E148
	cmp word [eax+8], 2
	jnz loc_41E148
	cmp word [eax+0Ah], 4
	jnz loc_41E148
	push edi
	mov eax, [eax+0Ch]
	mov eax, [eax]
	mov ecx, [eax]
	push ecx ; in
	mov edi, dword_4E61C0
	call inet_ntoa_wrap
	mov esi, eax
	push edi

loc_41E12E:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_41E146
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_41E12E

loc_41E146:
	pop edi
	pop edi

loc_41E148:
	push ebx ; s
	call closesocket_wrap

loc_41E14E:
	mov ebx, dword [dword_4D4B4C]
	inc ebx
	mov si, word [word_4E61B8]
	mov dword [dword_4D4B4C], ebx
	test si, si
	jz loc_41E195
	xor eax, eax
	mov ax, si
	sub eax, 2
	pop ebx
	pop esi

loc_41E171:
	add esp, 100h
	pop edx
	pop ecx
	ret

loc_41E17A:
	push dword_4E6030 ; lpWSAData
	push 101h ; wVersionRequested
	call WSAStartup_wrap
	test eax, eax
	jz loc_41E0D5
	xor eax, eax
	jmp loc_41E171

loc_41E195:
	mov eax, 400h
	pop ebx
	pop esi
	add esp, 100h
	pop edx
	pop ecx
	ret
;sub_41E0C0 endp

sub_41E1B0: ;SUBROUTINE
	push ebx
	push edx
	push esi
	mov ebx, eax
	mov esi, eax
	mov edx, eax
	mov eax, dword_56428C
	call sub_48BC18
	test eax, eax
	jz loc_41E1EC
	push ecx
	mov eax, [ebx+44h]
	push eax ; s
	call closesocket_wrap
	mov dword [ebx+44h], 0FFFFFFFFh
	mov dword [ebx+4], 0
	mov eax, dword_564270
	mov edx, ebx
	call sub_48BA80
	pop ecx

loc_41E1EC:
	mov eax, dword_564270
	mov edx, esi
	call sub_48BC18
	test eax, eax
	jz loc_41E215
	mov eax, [esi+10h]
	cmp dword [eax], 0
	jz loc_41E210
	call sub_4848FC
	mov dword [esi+10h], 0

loc_41E210:
	mov eax, 1

loc_41E215:
	pop esi
	pop edx
	pop ebx
	ret
;sub_41E1B0 endp

sub_41E220: ;SUBROUTINE
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 4
	mov ebp, edx
	mov ecx, ebx
	mov esi, [eax+10h]
	mov [esp], eax
	xor eax, eax
	mov ax, [esi+4]
	cmp ebx, eax
	ja loc_41E24C

loc_41E23B:
	cmp word [esi+6], 0
	jbe loc_41E278
	xor eax, eax
	add esp, 4
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret

loc_41E24C:
	xor eax, eax
	mov ax, [esi+4]
	push eax
	mov edx, aCNfs2seFron_14 ; "c:\\nfs2se\\frontend\\pc\\tcp.c"
	mov ebx, 1C2h
	push aSendpacketPack ; "sendpacket - PACKET TOO LONG, MAXIMUM S"...
	mov dword [dword_4DB1D8], edx
	mov dword [dword_4DB1DC], ebx
	call sub_4840F0
	add esp, 8
	jmp loc_41E23B

loc_41E278:
	mov eax, dword [dword_4DB6A0]
	mov ebx, 2
	call sub_489F48
	lea edi, [esi+0Ch]
	mov edx, ecx
	mov eax, edi
	call sub_48C054
	lea edx, [esi+0Eh]
	mov ebx, ecx
	mov eax, ebp
	call sub_48A980
	push 0 ; flags
	add ecx, 2
	xor eax, eax
	mov [esi+8], edi
	mov ax, cx
	mov edi, [esi+8]
	push eax ; len
	mov eax, [esp+8]
	mov [esi+6], cx
	push edi ; buf
	mov eax, [eax+44h]
	push eax ; s
	call send_wrap
	mov edx, eax
	cmp eax, 0FFFFFFFFh
	jnz loc_41E2F6
	call WSAGetLastError_wrap
	cmp eax, 2747h
	jz loc_41E2DC
	cmp eax, 2733h
	jnz loc_41E30C

loc_41E2DC:
	mov eax, dword [dword_4DB6A0]
	mov word [esi+6], 0
	call sub_489F60
	xor eax, eax
	add esp, 4
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret

loc_41E2F6:
	test eax, eax
	jle loc_41E30C
	mov bx, [esi+6]
	mov ebp, [esi+8]
	sub ebx, eax
	add ebp, eax
	mov [esi+6], bx
	mov [esi+8], ebp

loc_41E30C:
	mov eax, dword [dword_4DB6A0]
	call sub_489F60
	mov eax, 1
	add esp, 4
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret
;sub_41E220 endp

sub_41E330: ;SUBROUTINE
	push esi
	push edi
	push ebp
	sub esp, 14h
	mov edi, eax
	mov esi, eax
	lea eax, [ebx+10h]
	test edi, edi
	jz loc_41E493
	mov edx, [edi+10h]
	test edx, edx
	jz loc_41E40B
	mov [esp], edx

loc_41E353:
	cmp dword [dword_4DB6A0], 0
	jnz loc_41E366
	call sub_489EF8
	mov dword [dword_4DB6A0], eax

loc_41E366:
	cmp dword [edi+10h], 0
	jnz loc_41E43B
	mov eax, 1

loc_41E375:
	mov edx, [esp]
	mov [edx], eax
	mov dx, word [word_4E61B8]
	test dx, dx
	jz loc_41E442
	xor eax, eax
	mov ax, dx
	sub eax, 2

loc_41E392:
	mov edx, [esp]
	mov word [edx+6], 0
	mov dword [edx+8], 0
	mov [edx+4], ax
	mov edi, [esi+48h]
	mov edi, [edi+0Ch]
	mov dword [esi+4], 0
	mov bx, [esi+30h]
	mov [esi+10h], edx
	test bx, bx
	jnz loc_41E44C
	mov eax, 1

loc_41E3C8:
	mov ebp, eax
	test eax, eax
	jz loc_41E453
	mov ebx, 3E8h
	xor ecx, ecx

loc_41E3D9:
	cmp dword [edi+1Ch], 0FFFFFFFFh
	jnz loc_41E453
	mov eax, ecx
	call sub_483EB0
	test eax, eax
	jl loc_41E453
	mov eax, esi
	call dword [esi+14h]
	test eax, eax
	jnz loc_41E453
	mov edx, ebx
	mov eax, ebx
	sar edx, 1Fh
	idiv dword [dword_4DABCC]
	call sub_489B9C
	jmp loc_41E3D9

loc_41E40B:
	mov ecx, aCNfs2seFron_14 ; "c:\\nfs2se\\frontend\\pc\\tcp.c"
	mov ebx, 160h
	mov edx, eax
	mov eax, aTcpdata ; "TCPDATA"
	mov dword [dword_4DB1DC], ebx
	mov ebx, dword [dword_4DABE8]
	mov dword [dword_4DB1D8], ecx
	call sub_484498
	mov [esp], eax
	jmp loc_41E353

loc_41E43B:
	xor eax, eax
	jmp loc_41E375

loc_41E442:
	mov eax, 400h
	jmp loc_41E392

loc_41E44C:
	xor eax, eax
	jmp loc_41E3C8

loc_41E453:
	cmp dword [edi+1Ch], 0FFFFFFFFh
	jz loc_41E4AC
	test ebp, ebp
	jz loc_41E49A

loc_41E45D:
	mov eax, [edi+1Ch]
	mov [esi+44h], eax
	mov dword [edi+1Ch], 0FFFFFFFFh
	mov dword [esi+4], 1

loc_41E471:
	mov edx, [esi+4]
	test edx, edx
	jnz loc_41E5B0
	mov eax, [esp]
	cmp dword [eax], 0
	jz loc_41E5B0
	mov [esi+10h], edx
	call sub_4848FC

loc_41E490:
	mov eax, [esi+4]

loc_41E493:
	add esp, 14h
	pop ebp
	pop edi
	pop esi
	ret

loc_41E49A:
	lea ebx, [edi+20h]
	lea edx, [esi+30h]
	mov eax, [esi+48h]
	call sub_48B2F0
	test eax, eax
	jnz loc_41E45D

loc_41E4AC:
	test ebp, ebp
	jnz loc_41E471
	mov [edi+38h], esi
	test esi, esi
	jz loc_41E471
	lea eax, [esi+30h]
	mov [esp+8], eax

loc_41E4BE:
	test ebp, ebp
	jnz loc_41E471
	xor eax, eax
	call sub_41EBB0
	mov ebx, eax
	mov [esp+0Ch], eax
	call SDL_GetTicks
	add eax, 3E8h
	mov [esp+10h], eax
	cmp ebx, 0FFFFFFFFh
	jnz loc_41E4F1
	mov ebp, 1

loc_41E4E9:
	cmp dword [edi+38h], 0
	jnz loc_41E4BE
	jmp loc_41E471

loc_41E4F1:
	mov eax, ebx
	call sub_41EB50
	push 10h ; namelen
	mov edx, [esp+0Ch]
	push edx ; name
	push ebx ; s
	call connect_wrap
	mov [esp+4], eax
	call WSAGetLastError_wrap
	cmp eax, 2733h
	jnz loc_41E594
	mov [esi+44h], ebx
	cmp dword [edi+38h], 0
	jz loc_41E55C

loc_41E522:
	call SDL_GetTicks
	cmp eax, [esp+10h]
	jnb loc_41E55C
	xor eax, eax
	call sub_483EB0
	test eax, eax
	jl loc_41E543
	mov eax, esi
	call dword [esi+14h]
	test eax, eax
	jz loc_41E57B

loc_41E543:
	mov ebp, 1
	mov dword [edi+38h], 0
	mov dword [esi+4], 0

loc_41E556:
	cmp dword [edi+38h], 0
	jnz loc_41E522

loc_41E55C:
	cmp dword [esi+4], 0
	jnz loc_41E4E9
	mov eax, [esp+0Ch]
	push eax ; s
	call closesocket_wrap
	cmp dword [edi+38h], 0
	jnz loc_41E4BE
	jmp loc_41E471

loc_41E57B:
	mov eax, 3E8h
	mov edx, eax
	mov ecx, dword [dword_4DABCC]
	sar edx, 1Fh
	idiv ecx
	call sub_489B9C
	jmp loc_41E556

loc_41E594:
	cmp dword [esp+4], 0
	jz loc_41E55C
	mov ebp, 1
	mov dword [edi+38h], 0
	mov dword [esi+4], 0
	jmp loc_41E55C

loc_41E5B0:
	cmp dword [esi+4], 0
	jz loc_41E490
	mov eax, dword_56428C
	mov edx, esi
	call sub_48BA80
	mov eax, [esi+4]
	add esp, 14h
	pop ebp
	pop edi
	pop esi
	ret
;sub_41E330 endp

sub_41E5D0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 430h
	mov eax, dword [dword_4E61E0]
	mov [esp], eax
	mov byte [eax+43h], 1
	mov eax, [esp]
	cmp byte [eax+42h], 0
	jnz loc_41E842

loc_41E5F5:
	mov eax, [esp]
	mov edx, [eax+3Ch]
	test edx, edx
	jz loc_41E856
	mov eax, [edx+10h]

loc_41E606:
	mov edx, [esp]
	mov ecx, [edx+1Ch]
	mov ebx, eax
	cmp ecx, 0FFFFFFFFh
	jz loc_41E644
	test eax, eax
	jz loc_41E85D
	mov eax, [esp]
	add edx, 20h
	mov eax, [eax+3Ch]
	call ebx
	test eax, eax
	jnz loc_41E85D

loc_41E62E:
	mov eax, [esp]
	mov esi, [eax+1Ch]
	push esi ; s
	call closesocket_wrap
	mov eax, [esp]
	mov dword [eax+1Ch], 0FFFFFFFFh

loc_41E644:
	xor edi, edi
	mov eax, [esp]
	mov [esp+4], edi
	mov [esp+108h], edi
	mov [esp+20Ch], edi
	mov [esp+310h], edi
	cmp dword [eax+1Ch], 0FFFFFFFFh
	jnz loc_41E873
	mov dword [esp+4], 1
	mov eax, [eax+18h]
	mov [esp+8], eax

loc_41E67B:
	mov eax, [esp]
	mov esi, [eax+38h]
	test esi, esi
	jz loc_41E6A5
	mov edi, [esp+108h]
	cmp edi, 40h
	jnb loc_41E6A5
	lea ebp, [edi+1]
	mov [esp+108h], ebp
	mov eax, [esi+44h]
	mov [esp+edi*4+10Ch], eax

loc_41E6A5:
	mov ebx, esp
	mov edx, sub_41EAB0
	mov eax, dword_56428C
	call sub_48BFFC
	mov eax, dword [dword_4DB6A0]
	call sub_489F48
	mov eax, dword [dword_4DB6A0]
	call sub_489F60
	xor eax, eax
	mov [esp+424h], eax
	lea eax, [esp+424h]
	push eax ; timeout
	lea eax, [esp+210h]
	push eax ; exceptfds
	lea eax, [esp+110h]
	push eax ; writefds
	lea eax, [esp+10h]
	push eax ; readfds
	mov edx, 2710h
	push 0 ; nfds
	mov [esp+43Ch], edx
	call select_wrap
	cmp eax, 0FFFFFFFFh
	jz loc_41E835
	lea eax, [esp+4]
	push eax ; fd_set *
	mov eax, [esp+4]
	mov ecx, [eax+18h]
	push ecx ; fd
	call WSAFDIsSet_wrap
	test eax, eax
	jz loc_41E762
	lea eax, [esp+42Ch]
	push eax ; addrlen
	lea eax, [esp+418h]
	mov ebx, 10h
	push eax ; addr
	mov eax, [esp+8]
	mov [esp+434h], ebx
	mov esi, [eax+18h]
	push esi ; s
	call accept_wrap
	mov edx, [esp]
	mov [edx+1Ch], eax
	mov eax, [esp]
	cmp dword [eax+1Ch], 0FFFFFFFFh
	jnz loc_41E882
	mov byte [eax+42h], 1

loc_41E762:
	mov ebp, [esp]
	mov ebp, [ebp+38h]
	test ebp, ebp
	jz loc_41E796
	lea eax, [esp+20Ch]
	push eax ; fd_set *
	mov eax, [ebp+44h]
	push eax ; fd
	call WSAFDIsSet_wrap
	test eax, eax
	jz loc_41E8BE
	mov dword [ebp+4], 0

loc_41E78C:
	mov eax, [esp]
	mov dword [eax+38h], 0

loc_41E796:
	mov eax, [esp+310h]
	xor edi, edi
	test eax, eax
	jle loc_41E835
	xor ebx, ebx

loc_41E7A9:
	mov eax, [esp+ebx+314h]
	xor esi, esi
	cmp dword [eax+44h], 0FFFFFFFFh
	jz loc_41E80C
	cmp eax, ebp
	jz loc_41E80C
	lea edx, [esp+4]
	push edx ; fd_set *
	mov eax, [eax+44h]
	push eax ; fd
	call WSAFDIsSet_wrap
	test eax, eax
	jz loc_41E7DF
	mov eax, [esp]
	mov edx, [esp+ebx+314h]
	call sub_41E9D0
	mov esi, eax

loc_41E7DF:
	lea eax, [esp+108h]
	push eax ; fd_set *
	mov eax, [esp+ebx+318h]
	mov eax, [eax+44h]
	push eax ; fd
	call WSAFDIsSet_wrap
	test eax, eax
	jz loc_41E80C
	mov eax, [esp]
	mov edx, [esp+ebx+314h]
	call sub_41E940
	or esi, eax

loc_41E80C:
	test esi, esi
	jz loc_41E822
	mov esi, [esp+ebx+314h]
	test esi, esi
	jz loc_41E822
	mov eax, esi
	call sub_41E8F0

loc_41E822:
	mov edx, [esp+310h]
	inc edi
	add ebx, 4
	cmp edi, edx
	jl loc_41E7A9

loc_41E835:
	mov eax, [esp]
	cmp byte [eax+42h], 0
	jz loc_41E5F5

loc_41E842:
	mov eax, [esp]
	mov byte [eax+43h], 0
	add esp, 430h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_41E856:
	xor eax, eax
	jmp loc_41E606

loc_41E85D:
	mov eax, dword [dword_5637F4]
	mov edx, [esp]
	cmp eax, [edx+34h]
	jg loc_41E62E
	jmp loc_41E644

loc_41E873:
	mov eax, 1
	call sub_489B9C
	jmp loc_41E67B

loc_41E882:
	lea edx, [eax+20h]
	mov ebx, [esp+42Ch]
	lea eax, [esp+414h]
	call sub_48A980
	mov eax, [esp]
	mov eax, [eax+1Ch]
	call sub_41EB50
	mov eax, dword [dword_5637F4]
	mov ebx, dword [dword_4DABCC]
	shl ebx, 2
	mov edx, [esp]
	add eax, ebx
	mov [edx+34h], eax
	jmp loc_41E762

loc_41E8BE:
	lea eax, [esp+108h]
	push eax ; fd_set *
	mov eax, [ebp+44h]
	push eax ; fd
	call WSAFDIsSet_wrap
	test eax, eax
	jz loc_41E796
	mov dword [ebp+4], 1
	jmp loc_41E78C
;sub_41E5D0 endp

sub_41E8F0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	mov ebx, eax
	mov eax, [eax+44h]
	push eax ; s
	call closesocket_wrap
	mov dword [ebx+44h], 0FFFFFFFFh
	mov eax, dword_56428C
	mov edx, ebx
	call sub_48BC18
	test eax, eax
	jnz loc_41E919
	pop edx
	pop ecx
	pop ebx
	ret

loc_41E919:
	mov dword [ebx+4], 0
	mov eax, ebx
	mov edx, ebx
	call dword [ebx+18h]
	mov eax, dword_564270
	call sub_48BA80
	pop edx
	pop ecx
	pop ebx
	ret
;sub_41E8F0 endp

sub_41E940: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	mov ebx, [edx+10h]
	mov cx, [ebx+6]
	xor esi, esi
	test cx, cx
	ja loc_41E957
	mov eax, esi
	pop esi
	pop ecx
	pop ebx
	ret

loc_41E957:
	mov eax, dword [dword_4DB6A0]
	call sub_489F48
	xor eax, eax
	push esi ; flags
	mov ax, [ebx+6]
	push eax ; len
	mov ecx, [ebx+8]
	push ecx ; buf
	mov eax, [edx+44h]
	push eax ; s
	call send_wrap
	mov edx, eax
	cmp eax, 0FFFFFFFFh
	jnz loc_41E9AB
	call WSAGetLastError_wrap
	cmp eax, 2747h
	jz loc_41E99B
	cmp eax, 2733h
	jz loc_41E99B
	mov esi, 1
	mov word [ebx+6], 0

loc_41E99B:
	mov eax, dword [dword_4DB6A0]
	call sub_489F60
	mov eax, esi
	pop esi
	pop ecx
	pop ebx
	ret

loc_41E9AB:
	test eax, eax
	jle loc_41E99B
	add [ebx+8], eax
	sub [ebx+6], ax
	mov eax, dword [dword_4DB6A0]
	call sub_489F60
	mov eax, esi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_41E940 endp

sub_41E9D0: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 404h
	mov esi, edx
	mov eax, dword [dword_4DB6A0]
	mov ebp, [edx+10h]
	call sub_489F48
	push 2 ; flags
	push 2 ; len
	lea eax, [esp+8]
	xor edi, edi
	push eax ; buf
	mov eax, [edx+44h]
	push eax ; s
	call recv_wrap
	test eax, eax
	jz loc_41EA13
	cmp eax, 0FFFFFFFFh
	jnz loc_41EA30
	call WSAGetLastError_wrap
	cmp eax, 2733h
	jz loc_41EA30

loc_41EA13:
	mov edi, 1

loc_41EA18:
	mov eax, dword [dword_4DB6A0]
	call sub_489F60
	mov eax, edi
	add esp, 404h
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_41EA30:
	mov ecx, 2
	mov eax, esp
	mov eax, [eax]
	bswap eax
	neg ecx
	lea ecx, 20h[ecx*8]
	shr eax, cl
	mov ebx, eax
	xor eax, eax
	mov ax, [ebp+4]
	cmp ebx, eax
	jg loc_41EA18
	push 2 ; flags
	lea ebp, [ebx+2]
	push ebp ; len
	lea eax, [esp+8]
	push eax ; buf
	mov eax, [esi+44h]
	push eax ; s
	call recv_wrap
	mov ecx, eax
	cmp eax, ebp
	jz loc_41EA83

loc_41EA6C:
	test ecx, ecx
	jz loc_41EA13
	cmp ecx, 0FFFFFFFFh
	jnz loc_41EA18
	call WSAGetLastError_wrap
	cmp eax, 2733h
	jz loc_41EA18
	jmp loc_41EA13

loc_41EA83:
	lea edx, [esp+2]
	mov eax, esi
	call dword [esi+20h]
	test eax, eax
	jz loc_41EA6C
	push 0 ; flags
	push ebp ; len
	lea eax, [esp+8]
	push eax ; buf
	mov eax, [esi+44h]
	push eax ; s
	call recv_wrap
	mov ecx, eax
	jmp loc_41EA6C
;sub_41E9D0 endp

sub_41EAB0: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	mov ebx, [eax+0Ch]
	mov ecx, edx
	mov esi, [ebx]
	mov ebp, eax
	cmp esi, 1
	jnz loc_41EB08
	cmp dword [eax+44h], 0FFFFFFFFh
	jz loc_41EB08
	mov ebx, [edx]
	cmp eax, [ebx+38h]
	jz loc_41EB08
	mov ebx, [edx+310h]
	lea esi, 0[ebx*4]
	inc ebx
	mov edi, [eax+10h]
	mov [edx+310h], ebx
	mov [edx+esi+314h], eax
	mov ebx, [edx+4]
	cmp ebx, 40h
	jb loc_41EB13

loc_41EAF6:
	cmp word [edi+6], 0
	jbe loc_41EB08
	mov esi, [ecx+108h]
	cmp esi, 40h
	jb loc_41EB27

loc_41EB08:
	mov eax, 1
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_41EB13:
	lea esi, 0[ebx*4]
	inc ebx
	mov [edx+4], ebx
	mov eax, [eax+44h]
	mov [edx+esi+8], eax
	jmp loc_41EAF6

loc_41EB27:
	lea edx, 0[esi*4]
	lea eax, [esi+1]
	mov [ecx+108h], eax
	mov eax, [ebp+44h]
	mov [ecx+edx+10Ch], eax
	mov eax, 1
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_41EAB0 endp

sub_41EB50: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	sub esp, 4
	mov ebx, eax
	mov eax, esp
	push eax ; argp
	push 8004667Eh ; cmd
	mov edx, 1
	push ebx ; s
	mov [esp+0Ch], edx
	call ioctlsocket_wrap
	push 4 ; optlen
	lea eax, [esp+4]
	push eax ; optval
	push 8 ; optname
	push 0FFFFh ; level
	mov ecx, 1
	push ebx ; s
	mov [esp+14h], ecx
	call setsockopt_wrap
	push 4 ; optlen
	lea eax, [esp+4]
	push eax ; optval
	mov esi, 1
	push esi ; optname
	push 6 ; level
	push ebx ; s
	mov [esp+14h], esi
	call setsockopt_wrap
	add esp, 4
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_41EB50 endp

sub_41EBB0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	sub esp, 10h
	mov esi, eax
	push 0 ; protocol
	push 1 ; type
	push 2 ; af
	call socket_wrap
	mov ebx, eax
	cmp eax, 0FFFFFFFFh
	jnz loc_41EBDA
	mov ebx, 0FFFFFFFFh

loc_41EBD0:
	mov eax, ebx
	add esp, 10h
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_41EBDA:
	mov edx, 10h
	mov eax, esp
	call sub_48A01C
	xor eax, eax
	mov ax, si
	mov edx, 2
	push eax ; hostshort
	mov [esp+4], dx
	call htons_wrap
	push 10h ; namelen
	mov [esp+6], ax
	lea eax, [esp+4]
	push eax ; name
	push ebx ; s
	call bind_wrap
	test eax, eax
	jz loc_41EBD0
	push ebx ; s
	call closesocket_wrap
	mov ebx, 0FFFFFFFFh
	mov eax, ebx
	add esp, 10h
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_41EBB0 endp

sub_41EC30: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	mov edi, eax
	test eax, eax
	jz loc_41ECF8
	mov edx, [eax+10h]
	test edx, edx
	jz loc_41ECF8
	mov ecx, dword [dword_4DBAB8]
	mov esi, edx
	mov ebp, [edx+4]
	cmp ecx, 1
	jge loc_41ECA7

loc_41EC5B:
	mov eax, dword_56428C
	mov edx, edi
	call sub_48BC18
	test eax, eax
	jz loc_41ED01
	cmp dword [edi+4], 0
	jz loc_41ECDC
	mov ecx, 4
	mov dword [edi+4], 0

loc_41EC81:
	dec ecx
	cmp ecx, 0FFFFFFFFh
	jz loc_41ECCD
	mov eax, edi
	call dword [ebp+8]
	test eax, eax
	jz loc_41ECCD
	mov ebx, 0FFh
	mov edx, esi
	mov eax, [esi+18h]
	call sub_41FC60
	test eax, eax
	jz loc_41ECC1
	xor ecx, ecx
	jmp loc_41EC81

loc_41ECA7:
	xor eax, eax
	mov al, [edx+0Dh]
	push eax
	xor ecx, ecx
	xor ebx, ebx
	push 0
	xor edx, edx
	mov eax, aClosepktconn ; "ClosePktConn"
	call sub_48B724
	jmp loc_41EC5B

loc_41ECC1:
	mov eax, 1
	call sub_483410
	jmp loc_41EC81

loc_41ECCD:
	mov eax, 3
	call sub_483410
	mov eax, edi
	call dword [ebp+4]

loc_41ECDC:
	mov eax, dword_564270
	mov edx, edi
	call sub_48BA80

loc_41ECE8:
	mov eax, dword_564270
	mov edx, edi
	call sub_48BC18
	test eax, eax
	jnz loc_41ED16

loc_41ECF8:
	xor eax, eax
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_41ED01:
	cmp dword [edi+4], 0
	jz loc_41ECE8
	push aClosepacketcon ; "closepacketconnection - DID NOT FIND AC"...
	call sub_48EC20
	add esp, 4
	jmp loc_41ECE8

loc_41ED16:
	lea eax, [esi+38h]
	call sub_48BA6C
	lea eax, [esi+54h]
	call sub_48BA6C
	lea eax, [esi+78h]
	call sub_48BA6C
	lea eax, [esi+94h]
	call sub_48BA6C
	mov eax, [esi+14h]
	call sub_489F74
	cmp byte [esi+0Ch], 0
	jz loc_41ED55
	mov eax, esi
	call sub_4848FC
	mov dword [edi+10h], 0

loc_41ED55:
	mov eax, 1
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_41EC30 endp

sub_41ED70: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	mov edi, eax
	mov edx, dword [dword_4DBAB8]
	mov esi, [eax+10h]
	cmp edx, 5
	jge loc_41EDEF

loc_41ED85:
	dec dword [edi+4]
	mov ebx, [edi+4]
	test ebx, ebx
	jnz loc_41EDB5
	cmp dword [dword_4DBAB8], 3
	jl loc_41EDAD
	xor eax, eax
	mov al, [esi+0Dh]
	push eax
	xor ecx, ecx
	push ebx
	xor edx, edx
	mov eax, aConntimeout ; "conntimeout"
	call sub_48B724

loc_41EDAD:
	mov eax, edi
	call dword [edi+1Ch]
	mov [edi+4], eax

loc_41EDB5:
	cmp dword [edi+4], 0
	jnz loc_41EE0C

loc_41EDBB:
	cmp dword [dword_4DBAB8], 2
	jl loc_41EDDD
	xor eax, eax
	mov al, [esi+0Dh]
	push eax
	lea edx, [edi+4]
	xor ecx, ecx
	push 1
	xor ebx, ebx
	mov eax, aFailedconn ; "failedconn"
	call sub_48B724

loc_41EDDD:
	mov eax, esi
	call sub_41FA00

loc_41EDE4:
	mov eax, 1
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_41EDEF:
	xor eax, eax
	mov al, [esi+0Dh]
	push eax
	xor ecx, ecx
	xor ebx, ebx
	push 0
	xor edx, edx
	mov eax, aProcessconn ; "processconn"
	call sub_48B724
	jmp loc_41ED85

loc_41EE0C:
	mov edx, [esi+4]
	mov eax, edi
	call dword [edx+8]
	test eax, eax
	jz loc_41EDBB
	lea edi, [esi+54h]
	mov edx, sub_41F710
	mov ebx, esi
	mov eax, edi
	call sub_48BFFC
	mov edx, sub_41F700
	mov ebx, esi
	mov eax, edi
	call sub_48BF74
	mov eax, [esi+2Ch]
	lea edx, [eax-1]
	mov [esi+2Ch], edx
	test eax, eax
	jg loc_41EDE4
	mov ebx, 0FBh
	mov edx, esi
	mov eax, [esi+18h]
	call sub_41FC60
	mov eax, 1
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_41ED70 endp

sub_41EE60: ;SUBROUTINE
	push ecx
	push esi
	push edi
	push ebp
	mov ecx, ebx
	test eax, eax
	jz loc_41EE70
	cmp dword [eax+4], 0
	jnz loc_41EE77

loc_41EE70:
	xor eax, eax
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret

loc_41EE77:
	mov esi, [eax+10h]
	lea eax, [esi+38h]
	call sub_48BAFC
	mov ebp, [esi+8]
	mov edi, eax
	cmp ecx, ebp
	jbe loc_41EEAD
	mov eax, aCNfs2seFron_15 ; "c:\\nfs2se\\frontend\\pc\\eacpkt.c"
	mov ebx, 2B6h
	push aSendpacketTooM ; "sendpacket - TOO MUCH DATA TO FIT INTO "...
	mov dword [dword_4DB1D8], eax
	mov dword [dword_4DB1DC], ebx
	call sub_4840F0
	add esp, 4

loc_41EEAD:
	test edi, edi
	jnz loc_41EED7
	cmp dword [dword_4DBAB8], 2
	jl loc_41EE70
	xor eax, eax
	mov al, [esi+0Dh]
	push eax
	mov ebx, edx
	push 1
	xor edx, edx
	mov eax, aNobuffers ; "nobuffers"
	call sub_48B724
	xor eax, eax
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret

loc_41EED7:
	mov ebx, edx
	mov eax, edi
	mov edx, esi
	call sub_41FE70
	mov edx, esi
	mov eax, edi
	call sub_41FD00
	lea eax, [esi+54h]
	mov edx, edi
	call sub_48BBA4
	cmp dword [esi+30h], 0
	jnz loc_41EF1D
	mov eax, aCNfs2seFron_15 ; "c:\\nfs2se\\frontend\\pc\\eacpkt.c"
	mov edx, 2C2h
	push aSendpacketSorr ; "sendpacket - SORRY, TOO MANY PACKETS HA"...
	mov dword [dword_4DB1D8], eax
	mov dword [dword_4DB1DC], edx
	call sub_4840F0
	add esp, 4

loc_41EF1D:
	mov eax, 1
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret
;sub_41EE60 endp

sub_41EF30: ;SUBROUTINE
	push esi
	push edi
	push ebp
	sub esp, 2Ch
	mov esi, eax
	mov [esp+14h], ebx
	mov ebp, [esp+14h]
	xor ebx, ebx
	mov [esp+10h], edx
	mov [esp+0Ch], ebx
	mov [esp+24h], ebx
	cmp ebp, 6
	jl loc_41F1B5
	cmp ebp, 0FAh
	jle loc_41F1C2
	push 0FAh
	mov edi, aCNfs2seFron_15 ; "c:\\nfs2se\\frontend\\pc\\eacpkt.c"
	mov ebp, 201h
	push aOpenpacketconn ; "openpacketconnection - MAXIMUM SUPPORTE"...
	mov dword [dword_4DB1D8], edi
	mov dword [dword_4DB1DC], ebp
	call sub_4840F0
	add esp, 8

loc_41EF8B:
	test esi, esi
	jz loc_41EFB8
	cmp dword [esi+4], 0
	jz loc_41EFB8
	mov ebx, aCNfs2seFron_15 ; "c:\\nfs2se\\frontend\\pc\\eacpkt.c"
	mov edi, 206h
	push aOpenpacketco_0 ; "openpacketconnection - CALLED WITH AN A"...
	mov dword [dword_4DB1D8], ebx
	mov dword [dword_4DB1DC], edi
	call sub_4840F0
	add esp, 4

loc_41EFB8:
	test esi, esi
	jz loc_41F207
	xor eax, eax
	call sub_489BE8
	test eax, eax
	jnz loc_41F207
	mov ebx, aCNfs2seFron_15 ; "c:\\nfs2se\\frontend\\pc\\eacpkt.c"
	mov edi, 20Ah
	push aOpenpacketco_1 ; "openpacketconnection - MAY ONLY BE CALL"...
	mov dword [dword_4DB1D8], ebx
	mov dword [dword_4DB1DC], edi

loc_41EFEA:
	call sub_4840F0
	add esp, 4

loc_41EFF2:
	cmp ecx, 2
	jge loc_41F23B
	mov ecx, 2

loc_41F000:
	mov edx, [esp+10h]
	xor eax, eax
	mov ebp, [esp+14h]
	mov al, [edx+1Eh]
	cmp eax, ebp
	jle loc_41F015
	mov [esp+14h], eax

loc_41F015:
	mov edx, 1
	shl edx, cl
	mov eax, edx
	sar edx, 1Fh
	sub eax, edx
	sar eax, 1
	lea ebp, [eax-1]
	mov dword [esp+8], 100h
	mov eax, [esp+10h]
	mov dl, [eax+1Fh]
	mov [esp+28h], ebp
	test dl, dl
	jnz loc_41F047
	mov dword [esp+8], 200h

loc_41F047:
	mov edx, [esp+28h]
	lea eax, [ebp+1]
	add edx, eax
	mov eax, [esp+14h]
	add eax, 15h
	and al, 0FCh
	imul eax, edx
	mov ecx, [esp+8]
	add eax, 0B0h
	add eax, ecx
	test esi, esi
	jz loc_41F24E
	mov ebx, [esi+10h]
	test ebx, ebx
	jnz loc_41F259
	mov edi, aCNfs2seFron_15 ; "c:\\nfs2se\\frontend\\pc\\eacpkt.c"
	mov edx, 227h
	mov ecx, 1
	mov ebx, dword [dword_4DABE8]
	mov dword [dword_4DB1D8], edi
	mov dword [dword_4DB1DC], edx
	mov edx, eax
	mov eax, aPktbuf ; "PKTBUF"
	mov [esp+0Ch], ecx
	call sub_484498
	mov edi, eax

loc_41F0AD:
	test edi, edi
	jz loc_41F40A
	lea ecx, [edi+0B0h]
	mov dword [esi], 0
	mov dword [esi+4], 0
	mov eax, [esi+18h]
	mov [esi+10h], edi
	mov [esp+4], eax
	mov dword [esi+18h], sub_48A130
	mov eax, [esp+14h]
	mov [edi], esi
	mov [edi+8], eax
	mov eax, [esi+24h]
	mov [edi+2Ch], eax
	mov al, [esp+0Ch]
	mov [edi+0Ch], al
	mov eax, [esp+10h]
	mov [edi+4], eax
	mov eax, dword [dword_4D4BC4]
	mov [edi+0Dh], al
	inc eax
	mov dword [dword_4D4BC4], eax
	mov dword [edi+10h], 0
	call sub_489EF8
	mov dword [edi+30h], 1
	mov dword [edi+34h], 0
	xor ebx, ebx
	mov [edi+14h], eax
	lea eax, [edi+38h]
	xor edx, edx
	mov [esp], eax
	call sub_48BA2C
	lea eax, [edi+54h]
	mov edx, sub_41F740
	mov ebx, edi
	call sub_48BA2C
	mov edx, sub_41F740
	lea eax, [edi+78h]
	mov dword [edi+70h], 1
	mov ebx, edi
	mov dword [edi+74h], 1
	call sub_48BA2C
	lea eax, [edi+94h]
	mov edx, sub_41F740
	mov ebx, edi
	call sub_48BA2C
	mov eax, [esp+14h]
	add eax, 15h
	and al, 0FCh
	mov ebx, [esp]
	mov [esp+1Ch], eax

loc_41F17E:
	mov eax, [esp+28h]
	dec eax
	mov [esp+28h], eax
	cmp eax, 0FFFFFFFFh
	jz loc_41F260
	mov edx, ecx
	mov dword [edx], 0
	mov eax, [esp+1Ch]
	mov dword [edx+4], 0
	add ecx, eax
	mov eax, ebx
	mov dword [edx+8], 0
	call sub_48BA80
	jmp loc_41F17E

loc_41F1B5:
	mov dword [esp+14h], 6
	jmp loc_41EF8B

loc_41F1C2:
	mov bx, [edx+1Ch]
	test bx, bx
	jz loc_41EF8B
	xor eax, eax
	lea edx, [ebp+6]
	mov ax, bx
	cmp edx, eax
	jbe loc_41EF8B
	mov edx, aCNfs2seFron_15 ; "c:\\nfs2se\\frontend\\pc\\eacpkt.c"
	mov ebx, 203h
	push aOpenpacketco_2 ; "openpacketconnection - PACKETSIZE IS GR"...
	mov dword [dword_4DB1D8], edx
	mov dword [dword_4DB1DC], ebx
	call sub_4840F0
	add esp, 4
	jmp loc_41EF8B

loc_41F207:
	test esi, esi
	jz loc_41EFF2
	cmp dword [dword_4DB274], 0
	jz loc_41EFF2
	mov eax, aCNfs2seFron_15 ; "c:\\nfs2se\\frontend\\pc\\eacpkt.c"
	mov edx, 20Ch
	push aOpenpacketco_3 ; "openpacketconnection - MAY NOT BE CALLE"...
	mov dword [dword_4DB1D8], eax
	mov dword [dword_4DB1DC], edx
	jmp loc_41EFEA

loc_41F23B:
	cmp ecx, 7
	jle loc_41F000
	mov ecx, 7
	jmp loc_41F000

loc_41F24E:
	mov edx, eax
	mov eax, edx
	add esp, 2Ch
	pop ebp
	pop edi
	pop esi
	ret

loc_41F259:
	mov edi, ebx
	jmp loc_41F0AD

loc_41F260:
	lea eax, [edi+78h]
	mov [esp+20h], eax
	mov eax, [esp+14h]
	add eax, 15h
	mov [esp+18h], eax

loc_41F272:
	mov eax, [esp+18h]
	and al, 0FCh
	dec ebp
	add eax, ecx
	cmp ebp, 0FFFFFFFFh
	jz loc_41F2A8
	mov edx, ecx
	mov dword [edx], 0
	mov ecx, eax
	mov eax, [edi+74h]
	lea ebx, [eax+1]
	mov [edi+74h], ebx
	mov [edx+4], eax
	mov eax, [esp+20h]
	mov dword [edx+8], 0
	call sub_48BBA4
	jmp loc_41F272

loc_41F2A8:
	mov dword [edi+24h], 0
	mov [edi+1Ch], eax
	mov [edi+18h], ecx
	mov eax, [esp+8]
	mov edx, dword [dword_4DBABC]
	mov [edi+20h], eax
	test edx, edx
	jnz loc_41F2E9
	mov ecx, aCNfs2seFron_15 ; "c:\\nfs2se\\frontend\\pc\\eacpkt.c"
	mov ebx, 272h
	push aPacketlayer_ti ; "packetlayer_timeout - MUST BE NONZERO\n"
	mov dword [dword_4DB1D8], ecx
	mov dword [dword_4DB1DC], ebx
	call sub_4840F0
	add esp, 4

loc_41F2E9:
	mov ecx, [esp+10h]
	mov edx, sub_41F4E0
	mov eax, esi
	call dword [ecx]
	test eax, eax
	jz loc_41F454
	mov dword [esi+4], 3B9ACA00h
	mov eax, dword_56428C
	mov edx, esi
	call sub_48BA80
	cmp dword [dword_4DBAB8], 1
	jge loc_41F420

loc_41F31E:
	xor ebp, ebp

loc_41F320:
	mov eax, 1
	call sub_483F44
	test eax, eax
	jl loc_41F33B
	mov eax, esi
	call dword [esi+14h]
	test eax, eax
	jz loc_41F43D

loc_41F33B:
	mov edx, 1

loc_41F340:
	mov [esp+24h], edx
	test edx, edx
	jz loc_41F368
	cmp dword [dword_4DBAB8], 2
	jl loc_41F368
	xor eax, eax
	mov al, [edi+0Dh]
	push eax
	mov ecx, ebp
	mov ebx, ebp
	push ebp
	mov edx, ebp
	mov eax, aConnAborted ; "conn aborted"
	call sub_48B724

loc_41F368:
	cmp ebp, [esi+4]
	jz loc_41F374
	mov dword [esi+4], 3B9ACA00h

loc_41F374:
	cmp ebp, [esi+4]
	jz loc_41F386
	mov eax, [edi+10h]
	cmp ebp, eax
	jnz loc_41F386
	cmp eax, [esp+24h]
	jz loc_41F320

loc_41F386:
	cmp dword [esi+4], 0
	jnz loc_41F444

loc_41F390:
	mov ebp, [esi+4]
	test ebp, ebp
	jnz loc_41F3B7
	cmp dword [dword_4DBAB8], 2
	jl loc_41F3B7
	xor eax, eax
	mov al, [edi+0Dh]
	push eax
	xor ecx, ecx
	xor ebx, ebx
	push ebp
	xor edx, edx
	mov eax, aConnInactive ; "conn inactive"
	call sub_48B724

loc_41F3B7:
	mov dword [esi+4], 0
	mov edx, [esp+10h]
	mov eax, esi
	call dword [edx+4]

loc_41F3C7:
	cmp dword [esi+4], 0
	jz loc_41F47C
	mov ecx, [esp+24h]
	test ecx, ecx
	jnz loc_41F47C
	mov eax, dword [dword_4DBABC]
	mov [esi+4], eax
	mov eax, [esp+4]
	mov [esi+18h], eax
	cmp dword [dword_4DBAB8], 1
	jl loc_41F40A
	xor eax, eax
	mov al, [edi+0Dh]
	push eax
	xor ebx, ebx
	push ecx
	xor edx, edx
	mov eax, aOpenpktconnSuc ; "OpenPktConn Success"
	call sub_48B724

loc_41F40A:
	test edi, edi
	jz loc_41F4CB
	mov edx, 1
	mov eax, edx
	add esp, 2Ch
	pop ebp
	pop edi
	pop esi
	ret

loc_41F420:
	xor eax, eax
	mov al, [edi+0Dh]
	push eax
	xor ecx, ecx
	xor ebx, ebx
	push 0
	xor edx, edx
	mov eax, aOpenpktconn ; "OpenPktConn"
	call sub_48B724
	jmp loc_41F31E

loc_41F43D:
	mov edx, ebp
	jmp loc_41F340

loc_41F444:
	cmp dword [esp+24h], 0
	jnz loc_41F390
	jmp loc_41F3C7

loc_41F454:
	cmp dword [dword_4DBAB8], 3
	jl loc_41F3C7
	mov al, [edi+0Dh]
	push eax
	xor ecx, ecx
	xor ebx, ebx
	push 0
	xor edx, edx
	mov eax, aConnectFailed ; "connect failed"
	call sub_48B724
	jmp loc_41F3C7

loc_41F47C:
	cmp dword [dword_4DBAB8], 1
	jl loc_41F49D
	xor eax, eax
	mov al, [edi+0Dh]
	push eax
	xor ecx, ecx
	xor ebx, ebx
	push 0
	xor edx, edx
	mov eax, aOpenpktconnFai ; "OpenPktConn Failed"
	call sub_48B724

loc_41F49D:
	mov eax, dword_56428C
	mov edx, esi
	call sub_48BC18
	mov eax, dword_564270
	mov edx, esi
	mov ebp, [esp+0Ch]
	call sub_48BC18
	test ebp, ebp
	jz loc_41F4CB
	mov eax, edi
	call sub_4848FC
	mov dword [esi+10h], 0

loc_41F4CB:
	xor edx, edx
	mov eax, edx
	add esp, 2Ch
	pop ebp
	pop edi
	pop esi
	ret
;sub_41EF30 endp

sub_41F4E0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	mov ebp, esp
	sub esp, 18h
	mov [ebp-4], eax
	mov edi, [eax+10h]
	mov eax, [edi+4]
	mov edx, dword [dword_4DBAB8]
	mov [ebp-18h], eax
	cmp edx, 5
	jge loc_41F662

loc_41F506:
	mov eax, [ebp-4]
	mov dword [edi+28h], 0
	cmp dword [eax+4], 0
	jz loc_41F659
	lea eax, [edi+94h]
	mov [ebp-14h], eax
	lea eax, [edi+78h]
	mov [ebp-8], eax
	mov eax, [ebp-14h]
	mov [ebp-0Ch], eax

loc_41F52F:
	mov edx, [ebp-18h]
	mov eax, [ebp-4]
	call dword [edx+10h]
	test eax, eax
	jnz loc_41F67F

loc_41F540:
	mov [ebp-10h], eax
	mov eax, [ebp-14h]
	mov edx, [edi+70h]
	call sub_48BF0C
	mov esi, eax
	test eax, eax
	jz loc_41F5D7

loc_41F558:
	cmp dword [dword_4DBAB8], 3
	jl loc_41F57E
	xor eax, eax
	mov al, [edi+0Dh]
	lea ebx, [esi+12h]
	push eax
	xor ecx, ecx
	lea edx, [esi+4]
	push 0
	mov cl, [esi+0Dh]
	mov eax, aRecv ; "recv"
	call sub_48B724

loc_41F57E:
	mov eax, [ebp-4]
	xor ebx, ebx
	mov ecx, eax
	lea edx, [esi+12h]
	mov bl, [esi+0Dh]
	call dword [ecx+20h]
	test eax, eax
	jz loc_41F68B
	mov eax, [edi+6Ch]
	call sub_489F48
	mov eax, [edi+74h]
	lea edx, [eax+1]
	mov [edi+74h], edx
	mov [esi+4], eax
	inc dword [edi+70h]
	mov eax, [edi+6Ch]
	mov edx, esi
	call sub_489F60
	mov eax, [ebp-8]
	mov dword [esi+8], 0
	call sub_48BBA4
	mov eax, [ebp-0Ch]
	mov edx, [edi+70h]
	call sub_48BF0C
	mov esi, eax
	test eax, eax
	jnz loc_41F558

loc_41F5D7:
	cmp dword [ebp-10h], 0
	jnz loc_41F52F
	cmp byte [edi+0Eh], 0
	jnz loc_41F6C1
	lea eax, [edi+94h]
	call sub_48BCC0
	cmp eax, 0FFFFFFFFh
	jz loc_41F6BA
	cmp eax, [edi+70h]
	jz loc_41F6BA
	mov eax, 1

loc_41F60D:
	mov byte [edi+0Eh], 1

loc_41F611:
	cmp dword [edi+28h], 0
	jz loc_41F6C8

loc_41F61B:
	cmp dword [dword_4DBAB8], 4
	jl loc_41F647
	xor eax, eax
	mov esi, [edi+28h]
	mov al, [edi+0Dh]
	xor ecx, ecx
	push eax
	xor ebx, ebx
	xor edx, edx
	push 1
	test esi, esi
	jz loc_41F6D9
	mov eax, aGrbg ; "grbg"

loc_41F642:
	call sub_48B724

loc_41F647:
	lea eax, [edi+78h]
	xor edx, edx
	call sub_48BD74
	test eax, eax
	jnz loc_41F6E3

loc_41F659:
	mov esp, ebp
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_41F662:
	xor eax, eax
	mov al, [edi+0Dh]
	push eax
	xor ecx, ecx
	xor ebx, ebx
	push 0
	xor edx, edx
	mov eax, aRecvnotify ; "recvnotify"
	call sub_48B724
	jmp loc_41F506

loc_41F67F:
	mov eax, edi
	call sub_41F750
	jmp loc_41F540

loc_41F68B:
	cmp dword [dword_4DBAB8], 3
	jl loc_41F6AB
	mov al, [edi+0Dh]
	push eax
	lea edx, [esi+4]
	xor ecx, ecx
	push 1
	xor ebx, ebx
	mov eax, aDeny ; "deny"
	call sub_48B724

loc_41F6AB:
	mov eax, [ebp-14h]
	mov edx, esi
	call sub_48BBA4
	jmp loc_41F5D7

loc_41F6BA:
	xor eax, eax
	jmp loc_41F60D

loc_41F6C1:
	xor eax, eax
	jmp loc_41F611

loc_41F6C8:
	test eax, eax
	jnz loc_41F61B
	mov esp, ebp
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_41F6D9:
	mov eax, aBad ; "bad#"
	jmp loc_41F642

loc_41F6E3:
	mov edx, edi
	call sub_41FC00
	mov esp, ebp
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_41F4E0 endp

sub_41F700: ;SUBROUTINE
	cmp dword [eax+8], 0
	jle sub_41FD00
	mov eax, 1
	ret
;sub_41F700 endp

sub_41F710: ;SUBROUTINE
	mov edx, [eax+8]
	test edx, edx
	jle loc_41F726
	push ecx
	lea ecx, [edx-1]
	mov [eax+8], ecx
	test ecx, ecx
	jle loc_41F72C
	xor eax, eax
	pop ecx
	ret

loc_41F726:
	mov eax, 1
	ret

loc_41F72C:
	mov eax, 1
	pop ecx
	ret
;sub_41F710 endp

sub_41F740: ;SUBROUTINE
	mov eax, [eax+4]
	ret
;sub_41F740 endp

sub_41F750: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 0Ch
	mov edi, eax
	xor edx, edx
	mov [esp], edx
	mov eax, [eax]
	mov [esp+4], eax
	mov eax, [edi+4]
	mov dl, [eax+1Fh]
	mov [esp+8], eax
	test dl, dl
	jnz loc_41F807

loc_41F778:
	mov ecx, [edi+24h]
	mov eax, [edi+20h]
	cmp eax, ecx
	jbe loc_41F799
	mov esi, [esp+8]
	mov ebx, eax
	mov edx, [edi+1Ch]
	mov eax, [esp+4]
	sub ebx, ecx
	add edx, ecx
	call dword [esi+14h]
	add [edi+24h], eax

loc_41F799:
	mov eax, [edi+24h]
	test eax, eax
	jz loc_41F7F2
	mov esi, eax
	xor ebp, ebp

loc_41F7A4:
	mov edx, esp
	mov ecx, esi
	mov ebx, [edi+1Ch]
	mov eax, edi
	add ebx, ebp
	call sub_41F820
	mov edx, [esp+8]
	cmp byte [edx+1Fh], 0
	jnz loc_41F7D4
	test eax, eax
	jz loc_41F7D4
	sub esi, eax
	add ebp, eax
	test eax, eax
	jz loc_41F7D4
	mov eax, [esp+4]
	cmp dword [eax+4], 0
	jnz loc_41F7A4

loc_41F7D4:
	mov eax, [esp+8]
	cmp byte [eax+1Fh], 0
	jnz loc_41F7F2
	test ebp, ebp
	jz loc_41F7F2
	mov edx, [edi+1Ch]
	mov ebx, esi
	lea eax, [edx+ebp]
	call sub_48A980
	mov [edi+24h], esi

loc_41F7F2:
	cmp dword [esp], 0
	jz loc_41F813
	mov eax, 1
	add esp, 0Ch
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_41F807:
	mov dword [edi+24h], 0
	jmp loc_41F778

loc_41F813:
	xor eax, eax
	add esp, 0Ch
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_41F750 endp

sub_41F820: ;SUBROUTINE
	push esi
	push edi
	push ebp
	sub esp, 10h
	mov edi, eax
	mov [esp+4], edx
	mov ebp, ebx
	mov ebx, ecx
	mov eax, [eax]
	mov [esp+8], eax
	mov eax, [edi+4]
	xor esi, esi
	mov dl, [eax+1Fh]
	mov [esp], esi
	test dl, dl
	jnz loc_41F857
	mov eax, ebp
	lea edx, [ecx+ebp]

loc_41F84A:
	cmp eax, edx
	jnb loc_41F857
	cmp byte [eax], 0FEh
	jz loc_41F857
	inc esi
	inc eax
	jmp loc_41F84A

loc_41F857:
	lea eax, [esi+ebp]
	cmp byte [eax], 0FEh
	jnz loc_41F888
	lea ecx, [esi+6]
	cmp ecx, ebx
	jbe loc_41F88C

loc_41F866:
	mov edx, [esp]
	add edi, 28h
	cmp esi, edx
	jbe loc_41F9EB
	mov eax, 1
	mov ecx, [edi]
	add ecx, eax
	mov eax, esi
	mov [edi], ecx

loc_41F881:
	add esp, 10h
	pop ebp
	pop edi
	pop esi
	ret

loc_41F888:
	mov eax, ebx
	jmp loc_41F881

loc_41F88C:
	xor edx, edx
	mov dl, [eax+1]
	mov ebp, eax
	cmp edx, [edi+8]
	ja loc_41F9CF
	add ecx, edx
	cmp ecx, ebx
	ja loc_41F866
	sub ecx, esi
	mov edx, ecx
	call sub_41FF30
	test eax, eax
	jz loc_41F9C7
	mov eax, [esp+8]
	cmp dword [eax+4], 0
	jz loc_41F8C9
	mov edx, [esp+8]
	mov eax, dword [dword_4DBABC]
	mov [edx+4], eax

loc_41F8C9:
	inc dword [edi+10h]
	mov dh, [ebp+3]
	add esi, ecx
	cmp dh, 7Fh
	ja loc_41F8E2
	xor edx, edx
	mov eax, edi
	mov dl, [ebp+3]
	call sub_41FB50

loc_41F8E2:
	mov bl, [ebp+1]
	mov [esp], ecx
	test bl, bl
	jz loc_41F8F4
	mov bh, [ebp+2]
	cmp bh, 7Fh
	jbe loc_41F936

loc_41F8F4:
	mov cl, [ebp+2]
	cmp cl, 7Fh
	jbe loc_41F9B7
	cmp cl, 0FFh
	jnz loc_41F866
	cmp dword [dword_4DBAB8], 2
	jl loc_41F92A
	xor eax, eax
	mov al, [edi+0Dh]
	push eax
	xor ecx, ecx
	xor ebx, ebx
	push 1
	xor edx, edx
	mov eax, aCloseconnmsg ; "closeconnmsg"
	call sub_48B724

loc_41F92A:
	mov eax, edi
	call sub_41FA00
	jmp loc_41F866

loc_41F936:
	xor edx, edx
	mov eax, [edi+70h]
	mov dl, bh
	mov ebx, 7Fh
	call sub_41FF90
	lea ebx, [edi+78h]
	mov edx, eax
	mov eax, ebx
	call sub_48BF0C
	mov [esp+0Ch], eax
	mov byte [edi+0Eh], 0
	test eax, eax
	jz loc_41F866
	lea edx, [eax+0Ch]
	mov ebx, ecx
	mov eax, ebp
	call sub_48A980
	mov edx, [esp+0Ch]
	lea eax, [edi+94h]
	call sub_48BBA4
	mov eax, [esp+4]
	inc dword [eax]
	cmp dword [dword_4DBAB8], 3
	jl loc_41F866
	xor eax, eax
	mov al, [edi+0Dh]
	push eax
	mov eax, [esp+10h]
	xor ecx, ecx
	lea ebx, [eax+12h]
	push 0
	lea edx, [eax+4]
	mov cl, [eax+0Dh]
	mov eax, aQdat ; "qdat"
	call sub_48B724
	jmp loc_41F866

loc_41F9B7:
	xor edx, edx
	mov eax, edi
	mov dl, cl
	call sub_41FAD0
	jmp loc_41F866

loc_41F9C7:
	add esi, 3
	jmp loc_41F866

loc_41F9CF:
	cmp dl, 0FEh
	jz loc_41F9E1
	mov eax, 1
	inc eax
	add esi, eax
	jmp loc_41F866

loc_41F9E1:
	xor eax, eax
	inc eax
	add esi, eax
	jmp loc_41F866

loc_41F9EB:
	xor eax, eax
	mov ecx, [edi]
	add ecx, eax
	mov eax, esi
	mov [edi], ecx
	add esp, 10h
	pop ebp
	pop edi
	pop esi
	ret
;sub_41F820 endp

sub_41FA00: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	mov edi, eax
	cmp dword [dword_4DBAB8], 2
	jl loc_41FA28
	xor eax, eax
	mov al, [edi+0Dh]
	push eax
	xor ecx, ecx
	xor ebx, ebx
	push 1
	xor edx, edx
	mov eax, aShutdownconn ; "shutdownconn"
	call sub_48B724

loc_41FA28:
	mov eax, dword_56428C
	mov edx, [edi]
	call sub_48BC18
	test eax, eax
	jz loc_41FAA6
	mov ebx, dword [dword_4DBAB8]
	mov esi, [edi]
	cmp ebx, 1
	jl loc_41FA5D
	xor eax, eax
	mov al, [edi+0Dh]
	push eax
	xor ecx, ecx
	xor ebx, ebx
	push 1
	xor edx, edx
	mov eax, aDisconnect ; "disconnect"
	call sub_48B724

loc_41FA5D:
	mov dword [esi+4], 0
	mov edx, [edi+4]
	mov eax, esi
	call dword [edx+4]
	mov eax, esi
	mov edx, esi
	call dword [esi+18h]
	mov eax, dword_564270
	call sub_48BA80
	cmp dword [dword_4DBAB8], 2
	jge loc_41FA8C

loc_41FA86:
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_41FA8C:
	xor eax, eax
	mov al, [edi+0Dh]
	push eax
	xor ecx, ecx
	xor ebx, ebx
	push 1
	xor edx, edx
	mov eax, aConnclosed ; "connclosed"
	call sub_48B724
	jmp loc_41FA86

loc_41FAA6:
	cmp dword [dword_4DBAB8], 1
	jl loc_41FA86
	mov al, [edi+0Dh]
	push eax
	xor ecx, ecx
	xor ebx, ebx
	push 1
	xor edx, edx
	mov eax, aDupShutdown ; "dup shutdown"
	call sub_48B724
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_41FA00 endp

sub_41FAD0: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	sub esp, 4
	mov esi, eax
	lea ecx, [eax+54h]
	mov eax, ecx
	call sub_48BCC0
	mov ebx, 7Fh
	and edx, 0FFh
	call sub_41FF90
	mov [esp], eax
	mov edx, eax
	mov eax, ecx
	call sub_48BDB8
	mov edi, eax
	test eax, eax
	jz loc_41FB15
	cmp dword [dword_4DBAB8], 3
	jge loc_41FB1D
	mov dword [edi+8], 0

loc_41FB15:
	add esp, 4
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_41FB1D:
	xor eax, eax
	mov al, [esi+0Dh]
	push eax
	lea edx, [esp+4]
	xor ecx, ecx
	push 1
	xor ebx, ebx
	mov eax, aNakr ; "nakr"
	call sub_48B724
	mov dword [edi+8], 0
	add esp, 4
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_41FAD0 endp

sub_41FB50: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	sub esp, 4
	mov esi, eax
	mov ebx, 7Fh
	and edx, 0FFh
	mov eax, [eax+34h]
	call sub_41FF90
	mov [esp], eax
	cmp eax, [esi+30h]
	jnb loc_41FBBD
	cmp eax, [esi+34h]
	jbe loc_41FBBD
	mov edi, dword [dword_4DBAB8]
	mov [esi+34h], eax
	cmp edi, 3
	jge loc_41FBA1

loc_41FB87:
	lea ebx, [esi+38h]
	lea ecx, [esi+54h]

loc_41FB8D:
	mov eax, ecx
	call sub_48BCC0
	cmp eax, [esi+34h]
	jbe loc_41FBE2

loc_41FB99:
	add esp, 4
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_41FBA1:
	xor eax, eax
	mov al, [esi+0Dh]
	push eax
	lea edx, [esp+4]
	xor ecx, ecx
	push 0
	xor ebx, ebx
	mov eax, aAckr ; "ackr"
	call sub_48B724
	jmp loc_41FB87

loc_41FBBD:
	cmp dword [dword_4DBAB8], 3
	jl loc_41FB87
	xor eax, eax
	mov al, [esi+0Dh]
	push eax
	lea edx, [esp+4]
	xor ecx, ecx
	push 0
	xor ebx, ebx
	mov eax, aAckQ ; "ack?"
	call sub_48B724
	jmp loc_41FB87

loc_41FBE2:
	mov eax, ecx
	call sub_48BAFC
	test eax, eax
	jz loc_41FB99
	mov edx, eax
	mov eax, ebx
	call sub_48BA80
	jmp loc_41FB8D
;sub_41FB50 endp

sub_41FC00: ;SUBROUTINE
	push esi
	push edi
	mov esi, eax
	mov edi, edx
	test eax, eax
	jz loc_41FC17
	mov eax, [eax+8]
	lea edx, [eax-1]
	mov [esi+8], edx
	test eax, eax
	jle loc_41FC1F

loc_41FC17:
	mov eax, 1
	pop edi
	pop esi
	ret

loc_41FC1F:
	push ebx
	cmp dword [dword_4DBAB8], 3
	jl loc_41FC44
	push ecx
	xor eax, eax
	mov al, [edi+0Dh]
	push eax
	lea edx, [esi+4]
	xor ecx, ecx
	push 1
	xor ebx, ebx
	mov eax, aNakt ; "NAKt"
	call sub_48B724
	pop ecx

loc_41FC44:
	mov edx, edi
	mov ebx, [esi+4]
	mov eax, [edi+18h]
	and ebx, 7Fh
	call sub_41FC60
	pop ebx
	pop edi
	pop esi
	ret
;sub_41FC00 endp

sub_41FC60: ;SUBROUTINE
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 4
	mov ecx, eax
	mov esi, edx
	mov [esp], ebx
	mov edi, [esi]
	mov dword [eax+8], 1
	mov ebp, [esi+4]
	mov eax, edi
	xor edx, edx
	call dword [ebp+0Ch]
	cmp eax, 6
	jnb loc_41FC90

loc_41FC86:
	mov eax, edx
	add esp, 4
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret

loc_41FC90:
	mov eax, esi
	call sub_41FEC0
	mov edx, 6
	and eax, 0FFh
	mov byte [ecx+0Ch], 0FEh
	mov ah, [esp]
	mov ebx, 6
	mov [ecx+0Eh], ah
	lea ebp, [ecx+0Ch]
	mov [ecx+0Fh], al
	mov eax, ebp
	mov byte [ecx+0Dh], 0
	call sub_41FF60
	mov esi, [esi+4]
	mov edx, ebp
	mov eax, edi
	call dword [esi+18h]
	cmp eax, 6
	jnz loc_41FCF1
	mov esi, 1

loc_41FCD5:
	mov edx, esi
	test esi, esi
	jz loc_41FC86
	cmp dword [esp], 7Fh
	ja loc_41FC86
	mov eax, [edi+28h]
	mov [ecx+8], eax
	mov eax, edx
	add esp, 4
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret

loc_41FCF1:
	xor esi, esi
	jmp loc_41FCD5
;sub_41FC60 endp

sub_41FD00: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	mov ebp, esp
	sub esp, 14h
	mov esi, eax
	mov ecx, edx
	xor edx, edx
	mov eax, [ecx]
	mov [ebp-10h], edx
	mov edx, [ecx+4]
	mov [ebp-8], eax
	call dword [edx+0Ch]
	xor edx, edx
	mov ebx, esi
	mov dl, [esi+0Dh]
	add ebx, 4
	add edx, 6
	mov [ebp-4], ebx
	cmp eax, edx
	jnb loc_41FD7C
	cmp dword [esi+8], 0
	jl loc_41FE34
	cmp dword [dword_4DBAB8], 3
	jl loc_41FD5E
	xor eax, eax
	mov al, [ecx+0Dh]
	push eax
	mov edx, [ebp-4]
	xor ebx, ebx
	push 1
	xor ecx, ecx
	mov eax, aHold ; "hold"

loc_41FD59:
	call sub_48B724

loc_41FD5E:
	cmp dword [ebp-10h], 0
	jz loc_41FE5A
	mov eax, [ebp-8]
	mov eax, [eax+2Ch]
	mov [esi+8], eax
	mov eax, [ebp-10h]
	mov esp, ebp
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_41FD7C:
	mov eax, ecx
	call sub_41FEC0
	mov dl, al
	xor eax, eax
	mov al, [esi+0Dh]
	add eax, 6
	mov [ebp-14h], eax
	mov [esi+0Fh], dl
	xor edx, edx
	mov eax, esi
	mov dl, [esi+0Dh]
	add eax, 0Ch
	add edx, 6
	mov [ebp-0Ch], eax
	call sub_41FF60
	mov ebx, [ebp-14h]
	mov edi, [ecx+4]
	mov edx, [ebp-0Ch]
	mov eax, [ebp-8]
	call dword [edi+18h]
	mov edx, [ebp-14h]
	cmp eax, edx
	jnz loc_41FE0D
	cmp dword [dword_4DBAB8], 3
	jl loc_41FDEB
	xor eax, eax
	mov edx, [ebp-4]
	mov al, [ecx+0Dh]
	lea ebx, [esi+12h]
	push eax
	mov edi, [esi+8]
	xor ecx, ecx
	push 0
	mov cl, [esi+0Dh]
	test edi, edi
	jl loc_41FE06
	mov eax, aRsnd ; "rsnd"

loc_41FDE6:
	call sub_48B724

loc_41FDEB:
	mov dword [ebp-10h], 1
	mov eax, [ebp-8]
	mov eax, [eax+2Ch]
	mov [esi+8], eax
	mov eax, [ebp-10h]
	mov esp, ebp
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_41FE06:
	mov eax, aSent ; "sent"
	jmp loc_41FDE6

loc_41FE0D:
	cmp dword [dword_4DBAB8], 1
	jl loc_41FD5E
	xor eax, eax
	mov al, [ecx+0Dh]
	push eax
	mov ebx, [ebp-0Ch]
	mov ecx, edx
	push 1
	lea edx, [ebp-14h]
	mov eax, aWriteFailure ; "write failure"
	jmp loc_41FD59

loc_41FE34:
	cmp dword [dword_4DBAB8], 3
	jl loc_41FD5E
	xor eax, eax
	mov al, [ecx+0Dh]
	push eax
	mov edx, [ebp-4]
	xor ebx, ebx
	push 1
	xor ecx, ecx
	mov eax, aBusy ; "busy"
	jmp loc_41FD59

loc_41FE5A:
	mov dword [esi+8], 1
	mov eax, [ebp-10h]
	mov esp, ebp
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_41FD00 endp

sub_41FE70: ;SUBROUTINE
	push esi
	push edi
	push ebp
	mov esi, eax
	mov edi, ebx
	lea ebp, [eax+12h]
	mov eax, [edx+6Ch]
	call sub_489F48
	mov eax, [edx+30h]
	lea ebx, [eax+1]
	mov [edx+30h], ebx
	mov [esi+4], eax
	mov eax, [edx+6Ch]
	call sub_489F60
	mov dword [esi+8], 0FFFFFFFFh
	mov ebx, ecx
	mov dl, [esi+4]
	mov byte [esi+0Ch], 0FEh
	and dl, 7Fh
	mov eax, edi
	mov [esi+0Eh], dl
	mov edx, ebp
	mov [esi+0Dh], cl
	call sub_48A980
	pop ebp
	pop edi
	pop esi
	ret
;sub_41FE70 endp

sub_41FEC0: ;SUBROUTINE
	push ecx
	push edx
	sub esp, 4
	mov edx, eax
	add eax, 78h
	call sub_48BCC0
	mov [esp], eax
	cmp eax, 0FFFFFFFFh
	jz loc_41FEF9

loc_41FED7:
	dec eax
	mov [esp], eax
	mov eax, [edx]
	mov eax, [eax+24h]
	mov ecx, dword [dword_4DBAB8]
	mov [edx+2Ch], eax
	cmp ecx, 3
	jge loc_41FEFE
	mov al, [esp]
	and al, 7Fh
	add esp, 4
	pop edx
	pop ecx
	ret

loc_41FEF9:
	mov eax, [edx+74h]
	jmp loc_41FED7

loc_41FEFE:
	push ebx
	xor eax, eax
	mov al, [edx+0Dh]
	push eax
	xor ecx, ecx
	xor ebx, ebx
	push 0
	lea edx, [esp+0Ch]
	mov eax, aAckt ; "ACKt"
	call sub_48B724
	pop ebx
	mov al, [esp]
	and al, 7Fh
	add esp, 4
	pop edx
	pop ecx
	ret
;sub_41FEC0 endp

sub_41FF30: ;SUBROUTINE
	push ebx
	push ecx
	mov ecx, eax
	mov bl, [eax+4]
	mov bh, [eax+5]
	call sub_41FF60
	mov eax, [ecx+2]
	movsx edx, bx
	sar eax, 10h
	cmp edx, eax
	jnz loc_41FF54
	mov eax, 1
	pop ecx
	pop ebx
	ret

loc_41FF54:
	xor eax, eax
	pop ecx
	pop ebx
	ret
;sub_41FF30 endp

sub_41FF60: ;SUBROUTINE
	push ecx
	mov ecx, eax
	mov byte [eax+5], 0
	mov al, [eax+5]
	mov [ecx+4], al
	mov eax, ecx
	call sub_48EBE0
	mov edx, eax
	sar eax, 8
	mov [ecx+5], dl
	mov [ecx+4], al
	pop ecx
	ret
;sub_41FF60 endp

sub_41FF90: ;SUBROUTINE
	push ecx
	mov ecx, eax
	mov eax, ebx
	not eax
	and eax, ecx
	or eax, edx
	cmp eax, ecx
	jnb loc_41FFA2
	inc ebx
	add eax, ebx

loc_41FFA2:
	pop ecx
	ret
;sub_41FF90 endp

sub_420060: ;SUBROUTINE
	push ecx
	mov ecx, eax
	mov eax, edx
	mov edx, ebx
	mov ecx, [ecx+34h]
	mov ebx, eax
	mov eax, ecx
	call sub_490008
	pop ecx
	ret
;sub_420060 endp

sub_420080: ;SUBROUTINE
	push ecx
	mov ecx, eax
	mov eax, ebx
	mov ebx, edx
	mov ecx, [ecx+34h]
	mov edx, eax
	mov eax, ecx
	call sub_490478
	mov edx, eax
	test eax, eax
	jl loc_42009D
	mov eax, edx
	pop ecx
	ret

loc_42009D:
	neg edx
	mov eax, edx
	pop ecx
	ret
;sub_420080 endp

sub_4200B0: ;SUBROUTINE
	mov eax, [eax+34h]
	jmp sub_490308
;sub_4200B0 endp

sub_420F80: ;SUBROUTINE
	cmp edx, 4700h
	jz loc_420FA5
	cmp edx, 8
	jz sub_4231D0
	cmp edx, 5300h
	jz sub_4231D0
	test dl, 0FFh
	jnz loc_420FB0
	xor eax, eax
	ret

loc_420FA5:
	call sub_423430
	mov eax, 1
	ret

loc_420FB0:
	and edx, 0FFh
	jmp sub_423290
;sub_420F80 endp

;	Attributes: thunk

sub_420FC0: ;SUBROUTINE
	jmp sub_423490
;sub_420FC0 endp

sub_420FD0: ;SUBROUTINE
	push ebx
	push ecx
	sub esp, 4
	mov ecx, eax
	mov eax, dword [dword_513408+2]
	sar eax, 10h
	call sub_463DC0
	mov ebx, eax
	cwde
	cmp eax, 0FFFFFFFFh
	jz loc_421034
	test ecx, ecx
	jz loc_42102C
	test edx, edx
	jz loc_4211A2
	cmp ecx, 8
	jnz loc_421038

loc_420FFD:
	movsx eax, bx
	mov edx, ecx
	call sub_420F80
	test eax, eax
	jz loc_421027
	mov ah, 8
	mov edx, esp
	mov [esp+1], bl
	mov ebx, 4
	mov [esp], ah
	xor eax, eax
	mov [esp+2], cx
	call sub_464070

loc_421027:
	mov ecx, 1

loc_42102C:
	mov eax, ecx
	add esp, 4
	pop ecx
	pop ebx
	ret

loc_421034:
	xor ecx, ecx
	jmp loc_42102C

loc_421038:
	cmp ecx, 5300h
	jz loc_420FFD
	cmp ecx, 4700h
	jz loc_420FFD
	cmp ecx, 20h
	jl loc_421052
	cmp ecx, 22h
	jle loc_420FFD

loc_421052:
	cmp ecx, 26h
	jl loc_42105C
	cmp ecx, 3Bh
	jle loc_420FFD

loc_42105C:
	cmp ecx, 3Dh
	jz loc_420FFD
	cmp ecx, 3Fh
	jz loc_420FFD
	cmp ecx, 41h
	jl loc_421070
	cmp ecx, 7Dh
	jle loc_420FFD

loc_421070:
	cmp ecx, 91h
	jz loc_420FFD
	cmp ecx, 92h
	jz loc_420FFD
	cmp ecx, 0A1h
	jz loc_420FFD
	cmp ecx, 0B0h
	jz loc_420FFD
	cmp ecx, 0BFh
	jz loc_420FFD
	cmp ecx, 0C1h
	jz loc_420FFD
	cmp ecx, 0E1h
	jz loc_420FFD
	cmp ecx, 0C4h
	jz loc_420FFD
	cmp ecx, 0E4h
	jz loc_420FFD
	cmp ecx, 0C7h
	jz loc_420FFD
	cmp ecx, 0E7h
	jz loc_420FFD
	cmp ecx, 0C9h
	jz loc_420FFD
	cmp ecx, 0E9h
	jz loc_420FFD
	cmp ecx, 0CDh
	jz loc_420FFD
	cmp ecx, 0EDh
	jz loc_420FFD
	cmp ecx, 0D1h
	jz loc_420FFD
	cmp ecx, 0F1h
	jz loc_420FFD
	cmp ecx, 0D3h
	jz loc_420FFD
	cmp ecx, 0F3h
	jz loc_420FFD
	cmp ecx, 0D6h
	jz loc_420FFD
	cmp ecx, 0F6h
	jz loc_420FFD
	cmp ecx, 0DAh
	jz loc_420FFD
	cmp ecx, 0FAh
	jz loc_420FFD
	cmp ecx, 0DCh
	jz loc_420FFD
	cmp ecx, 0FCh
	jz loc_420FFD
	xor ecx, ecx
	mov eax, ecx
	add esp, 4
	pop ecx
	pop ebx
	ret

loc_4211A2:
	cmp ecx, 20h
	jge loc_420FFD
	cmp ecx, 8
	jz loc_420FFD
	cmp ecx, 5300h
	jz loc_420FFD
	cmp ecx, 4700h
	jz loc_420FFD
	xor ecx, ecx
	mov eax, ecx
	add esp, 4
	pop ecx
	pop ebx
	ret
;sub_420FD0 endp

sub_4211E0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 2Ch
	mov [esp+18h], eax
	cmp byte [byte_51345F], 1
	jz loc_4212AE
	mov dword [esp+20h], 2

loc_421202:
	xor ebx, ebx
	mov esi, [esp+20h]
	mov [esp+14h], ebx
	test esi, esi
	jle loc_4212A4
	mov edi, byte_512E84
	mov [esp+0Ch], ebx
	mov [esp+10h], ebx
	mov [esp+4], ebx
	mov [esp+8], edi

loc_421229:
	mov eax, [esp+14h]
	mov edi, [esp+4]
	call sub_4230A0
	mov edi, dword dword_51340C[edi]
	sar edi, 10h
	mov [esp+24h], eax
	cmp edi, 0FFFFFFFFh
	jz loc_42125E
	cmp dword [esp+18h], 0
	jz loc_42130F
	cmp word word_513448[edi*2], 0
	jz loc_4212BB

loc_42125E:
	mov eax, [esp+14h]
	call sub_423430

loc_421267:
	mov edi, [esp+4]
	mov ebp, [esp+8]
	mov eax, [esp+0Ch]
	mov edx, [esp+10h]
	mov ecx, [esp+14h]
	mov ebx, [esp+20h]
	add edi, 2
	add ebp, 9
	add eax, 4
	add edx, 10h
	inc ecx
	mov [esp+4], edi
	mov [esp+8], ebp
	mov [esp+0Ch], eax
	mov [esp+10h], edx
	mov [esp+14h], ecx
	cmp ecx, ebx
	jl loc_421229

loc_4212A4:
	add esp, 2Ch
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4212AE:
	mov dword [esp+20h], 8
	jmp loc_421202

loc_4212BB:
	cmp dword [esp+20h], 2
	jnz loc_421385
	mov ebx, [esp+10h]
	mov edx, 86h
	mov eax, [esp+8]

loc_4212D3:
	mov ebx, dword dword_4D4C04[ebx]
	call sub_47BDC0
	mov ebx, [esp+24h]
	mov edi, 0FFFFFFFFh
	mov esi, [ebx]
	xor eax, eax
	test esi, esi
	jle loc_421306
	mov esi, ebx
	mov ebx, [esp+24h]

loc_4212F5:
	cmp byte [esi+4], 0
	jz loc_4212FC
	inc edi

loc_4212FC:
	inc eax
	mov ebp, [ebx]
	add esi, 26h
	cmp eax, ebp
	jl loc_4212F5

loc_421306:
	cmp edi, 4
	jge loc_42139B

loc_42130F:
	xor edi, edi

loc_421311:
	mov eax, [esp+24h]
	cmp edi, [eax]
	jge loc_421267
	imul esi, edi, 26h
	add eax, 4
	add esi, eax
	imul eax, edi, 14h
	mov ebx, [esp+10h]
	mov [esp+1Ch], ebx
	mov ebx, [esp+0Ch]
	xor ebp, ebp
	mov [esp], ebx
	mov [esp+28h], eax

loc_42133D:
	cmp dword [esp+18h], 0
	jz loc_4213B5
	cmp dword [esp+20h], 2
	jnz loc_4213A3
	mov ebx, [esp+1Ch]
	mov edx, 0D6h
	mov ebx, dword dword_4D4C04[ebx]
	mov eax, esi
	add ebx, ebp

loc_42135E:
	call sub_47BDC0

loc_421363:
	mov ebx, [esp+28h]
	mov eax, [esp+24h]
	add esi, 26h
	inc edi
	add ebp, 0Fh
	add ebx, 14h
	mov ecx, [eax]
	mov [esp+28h], ebx
	cmp edi, ecx
	jge loc_421267
	jmp loc_42133D

loc_421385:
	mov ebx, [esp+0Ch]
	lea eax, [edi+edi*8]
	mov edx, 86h
	add eax, byte_512E84
	jmp loc_4212D3

loc_42139B:
	sub edi, 3
	jmp loc_421311

loc_4213A3:
	mov ebx, [esp]
	mov edx, 0D6h
	mov eax, esi
	mov ebx, dword dword_4D4C04[ebx]
	jmp loc_42135E

loc_4213B5:
	mov eax, [esp+20h]
	cmp eax, 2
	jnz loc_4213EB
	push eax
	mov eax, [esp+20h]
	mov ecx, [esp+2Ch]
	mov edx, 0FDh
	mov ax, word word_4D4C24[eax]
	push 3
	add eax, ecx
	mov ecx, 0Eh
	movsx ebx, ax
	mov eax, esi
	call sub_4054E0
	jmp loc_421363

loc_4213EB:
	push 2
	mov ebx, [esp+4]
	mov ecx, 0Eh
	mov edx, 0FDh
	mov eax, esi
	mov ebx, dword word_4D4C22[ebx]
	push 3
	sar ebx, 10h
	call sub_4054E0
	jmp loc_421363
;sub_4211E0 endp

;	Attributes: thunk

sub_421420: ;SUBROUTINE
	jmp sub_4234C0
;sub_421420 endp

sub_421430: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	sub esp, 20h
	cmp byte [byte_51345F], 1
	jnz loc_42147F
	mov ebx, 1
	mov esi, 25h
	mov ecx, 8
	xor edi, edi
	mov [esp+4], ebx
	mov [esp+8], esi
	mov [esp+0Ch], edi
	mov [esp+10h], edi
	mov [esp+14h], edi
	mov [esp+18h], edi
	mov [esp+1Ch], ebx
	mov [esp], ecx
	mov eax, esp
	call sub_423520
	add esp, 20h
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_42147F:
	push edx
	mov edx, 2
	mov ecx, 0Ah
	mov ebx, 25h
	mov eax, 7
	xor esi, esi
	mov [esp+4], edx
	mov [esp+8], ecx
	mov [esp+0Ch], ebx
	mov [esp+10h], esi
	mov [esp+14h], esi
	mov [esp+18h], esi
	mov edx, 1
	mov [esp+1Ch], eax
	mov [esp+20h], edx
	pop edx
	mov eax, esp
	call sub_423520
	add esp, 20h
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_421430 endp

sub_4214D0: ;SUBROUTINE
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 4
	mov edi, edx
	mov ebp, ebx
	mov [esp], edx
	cmp word [word_513458], 0
	jz loc_421534
	cmp byte [byte_51345F], 1
	jnz loc_421534
	mov esi, 4
	mov ecx, 1

loc_4214FB:
	mov eax, dword [dword_513408]
	sar eax, 10h
	cmp ecx, eax
	jge loc_421534
	mov edx, [esp]
	xor eax, eax
	mov al, [edx+1]
	mov eax, dword dword_51340C[eax*2]
	sar eax, 10h
	cmp ecx, eax
	jnz loc_421523

loc_42151D:
	inc ecx
	add esi, 4
	jmp loc_4214FB

loc_421523:
	mov ebx, ebp
	mov edx, edi
	mov eax, dword dword_513080[esi]
	call sub_464070
	jmp loc_42151D

loc_421534:
	mov edx, [esp]
	mov ecx, [esp]
	xor eax, eax
	mov edx, [edx]
	mov al, [ecx+1]
	sar edx, 10h
	mov ebx, 1
	call sub_420F80
	mov word [word_513434], bx
	add esp, 4
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret
;sub_4214D0 endp

;ForceFeedback
off_421560: dd dword_4E2718
	dd dword_4E2728
	dd dword_4E2738
	dd dword_4E2748
	dd dword_4E2758
	dd dword_4E2768
	dd dword_4E2778
	dd dword_4E2788
	dd dword_4E2798
	dd dword_4E2798
	dd dword_4E27A8
	dd dword_4E27B8
	dd dword_4E27C8
dword_421594: dd 0
	dd 4, 8, 14h, 18h, 1Ch, 0

sub_4215B0: ;SUBROUTINE
	test eax, eax
	jz loc_4215CA
	cmp eax, 1
	jz locret_4215C9
	cmp eax, 80070057h
	jz loc_4215C7
	cmp eax, 80070005h
	jnz loc_4215D0

loc_4215C7:
	xor eax, eax

locret_4215C9:
	ret

loc_4215CA:
	mov eax, 1
	ret

loc_4215D0:
	push ecx
	push ebx
	push edx
	mov ecx, aCNfs2seFront_7 ; "c:\\nfs2se\\frontend\\pc\\eaInput.c"
	mov ebx, 774h
	push aUnknownErrorAc ; "Unknown Error acquiring device %d\n"
	mov dword [dword_4DB1D8], ecx
	mov dword [dword_4DB1DC], ebx
	call sub_4840F0
	add esp, 8
	xor eax, eax
	pop ebx
	pop ecx
	ret
;sub_4215B0 endp

sub_421600: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	mov edx, dword [dword_4D4C44]
	xor edi, edi
	test edx, edx
	jz loc_42164C
	cmp al, 13h
	jz loc_421655
	cmp al, 11h
	jnb loc_42167B
	cmp al, 10h
	jnz loc_4216D0
	xor esi, esi
	xor ebx, ebx

loc_421626:
	mov ebp, dword dword_4E7348[esi]
	test ebp, ebp
	jz loc_421643
	push ebp
	mov edx, [ebp+0]
	call dword [edx+1Ch]
	mov edx, ebx
	call sub_4215B0
	test eax, eax
	jz loc_421643
	inc edi

loc_421643:
	inc ebx
	add esi, 4
	cmp ebx, 10h
	jl loc_421626

loc_42164C:
	mov eax, edi

loc_42164E:
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_421655:
	mov eax, 11h
	call sub_421600
	mov edx, eax
	mov eax, 12h
	call sub_421600
	add edx, eax
	mov eax, 10h
	call sub_421600
	add eax, edx
	jmp loc_42164E

loc_42167B:
	ja loc_42168F
	cmp dword [lpEventAttributes], 0
	jnz loc_4216B4
	mov eax, edi
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_42168F:
	cmp al, 12h
	jnz loc_4216D0
	mov ecx, dword [dword_4D4C4C]
	test ecx, ecx
	jz loc_42164C
	push ecx
	mov edx, [ecx]
	movsx ebx, al
	call dword [edx+1Ch]
	mov edx, ebx
	call sub_4215B0
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4216B4:
	movsx ebx, al
	mov eax, dword [lpEventAttributes]
	push eax
	mov edx, [eax]
	call dword [edx+1Ch]
	mov edx, ebx
	call sub_4215B0
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4216D0:
	cmp al, 13h
	jg loc_421700
	movsx ebx, al
	lea eax, 0[ebx*4]
	mov esi, dword dword_4E7348[eax]
	test esi, esi
	jz loc_42164C
	push esi
	mov edx, [esi]
	call dword [edx+1Ch]
	mov edx, ebx
	call sub_4215B0
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_421700:
	xor eax, eax
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_421600 endp

sub_421710: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 8
	mov [esp], al
	mov ebx, edx
	call sub_490AD0
	test eax, eax
	jz loc_42175B
	mov ah, [esp]
	cmp ah, 10h
	jge loc_421764
	mov esi, [esp-3]
	sar esi, 18h
	shl esi, 2
	mov edi, dword dword_4E7348[esi]
	test edi, edi
	jz loc_421788
	push ebx
	mov edi, [edi]
	call sub_490AD0
	push eax
	mov ebp, dword dword_4E7348[esi]
	push ebp
	call dword [edi+34h]
	test eax, eax
	jz loc_421788
	xor eax, eax

loc_42175B:
	add esp, 8
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_421764:
	jnz loc_421796
	xor ch, ch
	mov [esp+4], ch

loc_42176C:
	mov eax, [esp+1]
	mov edx, ebx
	sar eax, 18h
	call sub_421710
	inc dword [esp+4]
	cmp byte [esp+4], 10h
	jl loc_42176C
	lea eax, [eax+0]

loc_421788:
	mov eax, 1
	add esp, 8
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_421796:
	cmp ah, 11h
	jz loc_4217C7
	cmp ah, 12h
	jnz loc_421788
	mov eax, dword [dword_4D4C4C]
	push ebx
	mov esi, [eax]
	call sub_490AD0
	push eax
	mov edx, dword [dword_4D4C4C]
	push edx
	call dword [esi+34h]
	test eax, eax
	jz loc_421788
	xor eax, eax
	add esp, 8
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_4217C7:
	mov eax, dword [lpEventAttributes]
	push ebx
	mov esi, [eax]
	call sub_490AD0
	push eax
	mov ecx, dword [lpEventAttributes]
	push ecx
	call dword [esi+34h]
	test eax, eax
	jz loc_421788
	xor eax, eax
	add esp, 8
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_421710 endp

sub_4217F0: ;SUBROUTINE
	push ebx
	push esi
	push ebp
	sub esp, 4
	mov esi, [esp+14h]
	mov edx, dword [dword_4D4C5C]
	lea eax, 0[edx*4]
	sub eax, edx
	shl eax, 3
	sub eax, edx
	shl eax, 2
	xor dl, dl
	mov ebx, 50h
	mov byte byte_4E7391[eax], dl
	add eax, dword_4E7388
	lea edx, [esi+12Ch]
	add eax, 9
	call strncpy_
	mov edx, dword [dword_4D4C5C]
	lea eax, 0[edx*4]
	sub eax, edx
	shl eax, 3
	sub eax, edx
	lea edx, 0[eax*4]
	xor bl, bl
	xor eax, eax
	mov byte byte_4E73E0[edx], bl
	mov ax, [esi+24h]
	sar eax, 8
	and eax, 0FFh
	mov ecx, [esp+18h]
	cmp al, 4
	jb loc_4218A3
	ja loc_421896
	mov byte byte_4E7390[edx], 4

loc_421873:
	push 0
	lea eax, [esp+4]
	push eax
	add esi, 4
	push esi
	mov edx, [ecx]
	push ecx
	call dword [edx+0Ch]
	test eax, eax
	jz loc_4218C1
	mov eax, 1
	add esp, 4
	pop ebp
	pop esi
	pop ebx
	ret 8

loc_421896:
	cmp al, 6
	jnz loc_4218A3
	mov byte byte_4E7390[edx], 2
	jmp loc_421873

loc_4218A3:
	mov edx, dword [dword_4D4C5C]
	lea eax, 0[edx*4]
	sub eax, edx
	shl eax, 3
	sub eax, edx
	mov byte byte_4E7390[eax*4], 1
	jmp loc_421873

loc_4218C1:
	push dword_4C4EA0
	mov edx, [esp+4]
	mov eax, [esp+4]
	push edx
	mov eax, [eax]
	call dword [eax+2Ch]
	test eax, eax
	jnz loc_42191B
	mov eax, dword [dword_4D4C5C]
	shl eax, 2
	add eax, dword_4E7348
	push eax
	mov edx, [esp+4]
	push dword_4E27E8
	mov ecx, [esp+8]
	mov edx, [edx]
	push ecx
	call dword [edx]
	test eax, eax
	jnz loc_421935
	mov eax, dword [dword_4D4C58+1]
	mov edx, 9
	sar eax, 18h
	call sub_421710
	test eax, eax
	jnz loc_421953
	add esp, 4
	pop ebp
	pop esi
	pop ebx
	ret 8

loc_42191B:
	mov ebp, [esp]
	mov eax, [esp]
	push ebp
	mov eax, [eax]
	call dword [eax+8]
	mov eax, 1
	add esp, 4
	pop ebp
	pop esi
	pop ebx
	ret 8

loc_421935:
	push edi
	mov edi, [esp+4]
	mov eax, [esp+4]
	push edi
	mov eax, [eax]
	call dword [eax+8]
	mov eax, 1
	pop edi
	add esp, 4
	pop ebp
	pop esi
	pop ebx
	ret 8

loc_421953:
	mov ebx, [esp]
	mov eax, [esp]
	push ebx
	mov eax, [eax]
	call dword [eax+8]
	mov eax, 1
	add dword [dword_4D4C5C], eax
	add esp, 4
	pop ebp
	pop esi
	pop ebx
	ret 8
;sub_4217F0 endp

sub_421980: ;SUBROUTINE
	push esi
	push ebp
	cmp dword [dword_4D4C44], 0
	jz loc_421A1D
	push edx
	push ecx
	push ebx
	cmp dword [lpEventAttributes], 0
	jz loc_4219CD
	mov ebx, dword [hObject]
	test ebx, ebx
	jz loc_4219AD
	push ebx ; hObject
	call CloseHandle_wrap

loc_4219AD:
	push edi
	mov eax, dword [lpEventAttributes]
	push eax
	mov edx, [eax]
	call dword [edx+20h]
	mov eax, dword [lpEventAttributes]
	push eax
	mov edx, [eax]
	xor edi, edi
	call dword [edx+8]
	mov dword [lpEventAttributes], edi
	pop edi

loc_4219CD:
	mov ebp, dword [dword_4D4C4C]
	test ebp, ebp
	jnz loc_421A2E

loc_4219D7:
	xor ebx, ebx

loc_4219D9:
	mov edx, dword dword_4E7348[ebx]
	test edx, edx
	jz loc_4219FF
	mov eax, edx
	push eax
	mov edx, [edx]
	call dword [edx+20h]
	mov eax, dword dword_4E7348[ebx]
	push eax
	mov edx, [eax]
	call dword [edx+8]
	xor ecx, ecx
	mov dword dword_4E7348[ebx], ecx

loc_4219FF:
	add ebx, 4
	cmp ebx, 40h
	jnz loc_4219D9
	mov eax, dword [dword_4D4C44]
	push eax
	mov edx, [eax]
	xor ebx, ebx
	call dword [edx+8]
	mov dword [dword_4D4C44], ebx
	pop ebx
	pop ecx
	pop edx

loc_421A1D:
	xor esi, esi
	mov dword [dword_4D4C5C], esi
	mov dword [dword_4D4C58], esi
	pop ebp
	pop esi
	ret

loc_421A2E:
	push ebp
	mov edx, [ebp+0]
	call dword [edx+20h]
	mov eax, dword [dword_4D4C4C]
	push eax
	mov edx, [eax]
	call dword [edx+8]
	xor eax, eax
	mov dword [dword_4D4C4C], eax
	jmp loc_4219D7
;sub_421980 endp

sub_421A50: ;SUBROUTINE
	push esi
	push edi
	push ebp
	sub esp, 54h
	mov esi, edx
	mov [esp+50h], ebx
	mov ebp, ecx
	movsx ebx, al
	lea edi, 0[ebx*4]
	mov edx, dword dword_4E7348[edi]
	test edx, edx
	jnz loc_421A93
	mov ecx, [esp+74h]
	test ecx, ecx
	jnz loc_421A8F

loc_421A7A:
	test esi, esi
	jz loc_421A84
	mov dword [esi], 0

loc_421A84:
	xor eax, eax
	add esp, 54h
	pop ebp
	pop edi
	pop esi
	ret 14h

loc_421A8F:
	mov [ecx], edx
	jmp loc_421A7A

loc_421A93:
	mov eax, edx
	push eax
	mov edx, [edx]
	call dword [edx+64h]
	test eax, eax
	jz loc_421ABF
	cmp eax, 8007001Eh
	jz loc_421AAD
	cmp eax, 8007000Ch
	jnz loc_421A84

loc_421AAD:
	mov eax, ebx
	call sub_421600
	xor eax, eax
	add esp, 54h
	pop ebp
	pop edi
	pop esi
	ret 14h

loc_421ABF:
	mov eax, dword dword_4E7348[edi]
	mov edi, esp
	push edi
	push 50h
	mov edx, [eax]
	push eax
	call dword [edx+24h]
	test eax, eax
	jz loc_421AED
	cmp eax, 8007001Eh
	jnz loc_421A84
	mov eax, ebx
	call sub_421600
	xor eax, eax
	add esp, 54h
	pop ebp
	pop edi
	pop esi
	ret 14h

loc_421AED:
	mov ecx, [esp+50h]
	test ecx, ecx
	jz loc_421AFA
	mov eax, [esp]
	mov [ecx], eax

loc_421AFA:
	test ebp, ebp
	jz loc_421B05
	mov eax, [esp+4]
	mov [ebp+0], eax

loc_421B05:
	mov ebx, [esp+64h]
	test ebx, ebx
	jz loc_421B13
	mov eax, [esp+8]
	mov [ebx], eax

loc_421B13:
	mov edi, [esp+68h]
	test edi, edi
	jz loc_421B21
	mov eax, [esp+14h]
	mov [edi], eax

loc_421B21:
	mov ebp, [esp+6Ch]
	test ebp, ebp
	jz loc_421B30
	mov eax, [esp+18h]
	mov [ebp+0], eax

loc_421B30:
	cmp dword [esp+70h], 0
	jz loc_421B41
	mov edx, [esp+70h]
	mov eax, [esp+1Ch]
	mov [edx], eax

loc_421B41:
	mov edx, [esp+74h]
	test edx, edx
	jz loc_421B4F
	mov eax, [esp+20h]
	mov [edx], eax

loc_421B4F:
	test esi, esi
	jz loc_421B77
	mov dword [esi], 0
	xor eax, eax

loc_421B5B:
	test byte [esp+eax+30h], 80h
	jz loc_421B71
	mov edx, 1
	mov cl, al
	mov ebx, [esi]
	shl edx, cl
	or ebx, edx
	mov [esi], ebx

loc_421B71:
	inc eax
	cmp eax, 20h
	jl loc_421B5B

loc_421B77:
	mov eax, 1
	add esp, 54h
	pop ebp
	pop edi
	pop esi
	ret 14h
;sub_421A50 endp

sub_421B90: ;SUBROUTINE
	push esi
	push edi
	push ebp
	mov esi, [esp+20h]
	push esi
	mov edi, [esp+20h]
	push edi
	mov ebp, [esp+20h]
	push ebp
	mov esi, [esp+20h]
	push esi
	mov edi, [esp+20h]
	push edi
	movsx eax, al
	call sub_421A50
	test eax, eax
	jz loc_421BBD
	mov eax, 1

loc_421BBD:
	pop ebp
	pop edi
	pop esi
	ret 14h
;sub_421B90 endp

sub_421BD0: ;SUBROUTINE
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 18Ch
	mov [esp+188h], al
	mov ebp, edx
	mov [esp+180h], ebx
	mov ecx, 6
	lea edi, [esp+168h]
	mov esi, dword_421594
	rep movsd
	test edx, edx
	jnz loc_421C6D

loc_421C01:
	mov edx, [esp+180h]
	test edx, edx
	jz loc_421C12
	mov dword [edx], 0

loc_421C12:
	cmp byte [esp+188h], 10h
	jnz loc_421C75
	mov dword [esp+184h], 0Fh

loc_421C27:
	mov eax, [esp+181h]
	mov ebx, [esp+180h]
	mov edx, ebp
	sar eax, 18h
	call sub_421BD0
	mov eax, [esp+184h]
	dec eax
	mov [esp+184h], eax
	test eax, eax
	jg loc_421C27
	mov ebx, [esp+180h]
	mov edx, ebp
	xor eax, eax
	call sub_421BD0
	add esp, 18Ch
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret

loc_421C6D:
	mov dword [edx], 0
	jmp loc_421C01

loc_421C75:
	cmp dword [dword_4D4C44], 0
	jz loc_421CA5

loc_421C7E:
	mov edx, [esp+185h]
	sar edx, 18h
	lea ecx, 0[edx*4]
	cmp dword dword_4E7348[ecx], 0
	jnz loc_421CC0
	xor eax, eax
	add esp, 18Ch
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret

loc_421CA5:
	call sub_422530
	cmp dword [dword_4D4C44], 0
	jnz loc_421C7E

loc_421CB3:
	xor eax, eax
	add esp, 18Ch
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret

loc_421CC0:
	mov eax, edx
	call sub_421600
	lea eax, 0[edx*4]
	sub eax, edx
	shl eax, 3
	sub eax, edx
	shl eax, 2
	cmp dword dword_4E7388[eax], 0
	jz loc_421D62

loc_421CE5:
	test ebp, ebp
	jz loc_421D0B
	mov edx, [esp+185h]
	sar edx, 18h
	lea eax, 0[edx*4]
	sub eax, edx
	shl eax, 3
	sub eax, edx
	mov eax, dword dword_4E7388[eax*4]
	mov [ebp+0], eax

loc_421D0B:
	mov ecx, [esp+180h]
	test ecx, ecx
	jz loc_421D37
	mov edx, [esp+185h]
	sar edx, 18h
	lea eax, 0[edx*4]
	sub eax, edx
	shl eax, 3
	sub eax, edx
	mov eax, dword dword_4E738C[eax*4]
	mov [ecx], eax

loc_421D37:
	mov edx, [esp+185h]
	sar edx, 18h
	lea eax, 0[edx*4]
	sub eax, edx
	shl eax, 3
	sub eax, edx
	shl eax, 2
	add eax, dword_4E7388
	add esp, 18Ch
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret

loc_421D62:
	cmp dword dword_4E738C[eax], 0
	jnz loc_421CE5
	mov ebx, 2Ch
	mov eax, dword dword_4E7348[ecx]
	lea ecx, [esp+13Ch]
	mov [esp+13Ch], ebx
	push ecx
	mov edx, [eax]
	push eax
	call dword [edx+0Ch]
	test eax, eax
	jnz loc_421CB3
	test byte [esp+141h], 1
	jz loc_421DC0
	mov ecx, [esp+185h]
	mov eax, 1
	sar ecx, 18h
	mov esi, dword [dword_4D4C58]
	shl eax, cl
	or esi, eax
	mov dword [dword_4D4C58], esi

loc_421DC0:
	mov edi, 13Ch
	mov edx, [esp+14Ch]
	xor eax, eax
	xor ebx, ebx
	mov [esp+184h], eax
	mov [esp], edi
	test edx, edx
	jbe loc_421E47
	mov esi, 30h

loc_421DE3:
	cmp ebx, 20h
	jge loc_421E47
	push 1
	mov edi, [esp+189h]
	lea ecx, [esp+4]
	push esi
	sar edi, 18h
	push ecx
	mov eax, dword dword_4E7348[edi*4]
	push eax
	mov edx, [eax]
	call dword [edx+38h]
	test eax, eax
	jnz loc_421E33
	imul eax, edi, 5Ch
	mov cl, bl
	mov edi, 1
	mov edx, dword dword_4E7388[eax]
	shl edi, cl
	or edx, edi
	mov dword dword_4E7388[eax], edx
	test ebp, ebp
	jz loc_421E2C
	mov [ebp+0], edx

loc_421E2C:
	inc dword [esp+184h]

loc_421E33:
	mov eax, [esp+184h]
	mov edi, [esp+14Ch]
	inc esi
	inc ebx
	cmp eax, edi
	jb loc_421DE3

loc_421E47:
	mov eax, [esp+148h]
	xor ebp, ebp
	xor ebx, ebx
	mov [esp+184h], ebp
	test eax, eax
	jbe loc_421ED6
	xor esi, esi

loc_421E63:
	cmp ebx, 6
	jge loc_421ED6
	mov ebp, [esp+185h]
	push 1
	mov edx, [esp+esi+16Ch]
	sar ebp, 18h
	push edx
	lea edx, [esp+8]
	mov eax, dword dword_4E7348[ebp*4]
	push edx
	mov ecx, [eax]
	push eax
	call dword [ecx+38h]
	test eax, eax
	jnz loc_421EC0
	imul ebp, 5Ch
	mov eax, 1
	mov cl, bl
	shl eax, cl
	mov ecx, dword dword_4E738C[ebp]
	or ecx, eax
	mov edi, [esp+180h]
	mov dword dword_4E738C[ebp], ecx
	test edi, edi
	jz loc_421EB9
	mov [edi], ecx

loc_421EB9:
	inc dword [esp+184h]

loc_421EC0:
	mov eax, [esp+184h]
	mov edi, [esp+148h]
	add esi, 4
	inc ebx
	cmp eax, edi
	jb loc_421E63

loc_421ED6:
	mov edx, [esp+185h]
	sar edx, 18h
	lea eax, 0[edx*4]
	sub eax, edx
	shl eax, 3
	sub eax, edx
	shl eax, 2
	add eax, dword_4E7388
	add esp, 18Ch
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret
;sub_421BD0 endp

sub_421F10: ;SUBROUTINE
	cmp dword [dword_4D4C44], 0
	jz loc_421F7C
	cmp dword [dword_4D4C64], 0
	jnz loc_421F8D

loc_421F22:
	push edi
	push esi
	mov esi, 1
	mov edi, dword [dword_4D4C5C]
	mov dword [dword_4D4C64], esi
	test edi, edi
	jnz loc_421F61
	push edx
	push ecx
	push ebx
	push esi
	mov eax, dword [dword_4D4C44]
	push eax
	push sub_4217F0
	push 4
	mov edx, [eax]
	push eax
	xor ebx, ebx
	call dword [edx+10h]
	mov eax, 10h
	xor edx, edx
	call sub_421BD0
	pop ebx
	pop ecx
	pop edx

loc_421F61:
	cmp dword [dword_4D4C5C], 0
	jz loc_421F74
	mov eax, 10h
	call sub_421600

loc_421F74:
	mov eax, dword [dword_4D4C5C]
	pop esi
	pop edi
	ret

loc_421F7C:
	call sub_422530
	cmp dword [dword_4D4C44], 0
	jnz loc_421F22
	xor eax, eax
	ret

loc_421F8D:
	mov eax, dword [dword_4D4C5C]
	ret
;sub_421F10 endp

sub_421FA0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	mov dl, al
	cmp al, 13h
	jz loc_421FC5

loc_421FAA:
	cmp dl, 10h
	jnz loc_421FE5
	xor edx, edx

loc_421FB1:
	movsx eax, dl
	inc edx
	call sub_421FA0
	cmp edx, 10h
	jl loc_421FB1
	nop

loc_421FC0:
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_421FC5:
	mov eax, 11h
	call sub_421FA0
	mov eax, 12h
	call sub_421FA0
	mov eax, 10h
	call sub_421FA0
	jmp loc_421FAA

loc_421FE5:
	cmp dl, 11h
	jnz loc_421FFF
	mov esi, dword [lpEventAttributes]
	test esi, esi
	jz loc_421FC0
	push esi
	mov edx, [esi]
	call dword [edx+20h]
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_421FFF:
	cmp dl, 12h
	jnz loc_422019
	mov ebx, dword [dword_4D4C4C]
	test ebx, ebx
	jz loc_421FC0
	push ebx
	mov edx, [ebx]
	call dword [edx+20h]
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_422019:
	jnz loc_422030
	mov ecx, dword [dword_4D4C4C]
	test ecx, ecx
	jz loc_421FC0
	push ecx
	mov edx, [ecx]
	call dword [edx+20h]
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_422030:
	test dl, dl
	jl loc_421FC0
	cmp dl, 10h
	jge loc_421FC0
	movsx eax, dl
	shl eax, 2
	mov edx, dword dword_4E7348[eax]
	test edx, edx
	jz loc_421FC0
	mov eax, edx
	push eax
	mov edx, [edx]
	call dword [edx+20h]
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_421FA0 endp

sub_422060: ;SUBROUTINE
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 204h
	mov ebp, eax
	mov edi, edx
	mov esi, ebx
	push 0
	lea ecx, [esp+204h]
	push ecx
	lea ecx, [esp+8]
	mov edx, 20h
	push ecx
	mov eax, dword [lpEventAttributes]
	mov [esp+20Ch], edx
	push 10h
	mov edx, [eax]
	push eax
	call dword [edx+28h]
	mov edx, eax
	test eax, eax
	jnz loc_422122
	mov ecx, [esp+200h]
	test ecx, ecx
	jbe loc_4220E2
	mov ebx, ecx
	shl ebx, 4

loc_4220B2:
	mov ecx, [esp+eax]
	cmp ecx, 0Ch
	jnz loc_422187
	test byte [esp+eax+4], 80h
	jz loc_422178
	mov ch, byte [dword_4E8950]
	or ch, 1
	or dl, 1

loc_4220D5:
	mov byte [dword_4E8950], ch

loc_4220DB:
	add eax, 10h
	cmp eax, ebx
	jl loc_4220B2

loc_4220E2:
	test ebp, ebp
	jz loc_4220F0
	mov eax, dword [dword_4E8950]
	or eax, edx
	mov [ebp+0], eax

loc_4220F0:
	test edi, edi
	jz loc_4220FB
	mov eax, dword [dword_4E8948]
	mov [edi], eax

loc_4220FB:
	test esi, esi
	jz loc_422106
	mov eax, dword [dword_4E894C]
	mov [esi], eax

loc_422106:
	cmp dword [off_4DAC4C], 0
	jz loc_422117
	test edx, edx
	jnz loc_4222A4

loc_422117:
	add esp, 204h
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret

loc_422122:
	xor ebx, ebx
	mov dword [dword_4E8950], ebx
	test ebp, ebp
	jz loc_422131
	mov [ebp+0], ebx

loc_422131:
	test edi, edi
	jz loc_42213C
	mov eax, dword [dword_4E8948]
	mov [edi], eax

loc_42213C:
	test esi, esi
	jz loc_422147
	mov eax, dword [dword_4E894C]
	mov [esi], eax

loc_422147:
	cmp edx, 80040207h
	jb loc_422117
	jbe loc_422117
	cmp edx, 8007000Ch
	jb loc_422117
	jbe loc_422163
	cmp edx, 8007001Eh
	jnz loc_422117

loc_422163:
	mov eax, 11h
	call sub_421600
	add esp, 204h
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret

loc_422178:
	and dword [dword_4E8950], 0FEh
	jmp loc_4220DB

loc_422187:
	cmp ecx, 0Dh
	jnz loc_4221B3
	test byte [esp+eax+4], 80h
	jz loc_4221A4
	mov ch, byte [dword_4E8950]
	or ch, 2
	or dl, 2
	jmp loc_4220D5

loc_4221A4:
	and dword [dword_4E8950], 0FDh
	jmp loc_4220DB

loc_4221B3:
	cmp ecx, 0Eh
	jnz loc_4221DF
	test byte [esp+eax+4], 80h
	jz loc_4221D0
	mov ch, byte [dword_4E8950]
	or ch, 4
	or dl, 4
	jmp loc_4220D5

loc_4221D0:
	and dword [dword_4E8950], 0FBh
	jmp loc_4220DB

loc_4221DF:
	cmp ecx, 0Fh
	jnz loc_42220B
	test byte [esp+eax+4], 80h
	jz loc_4221FC
	mov ch, byte [dword_4E8950]
	or ch, 8
	or dl, 8
	jmp loc_4220D5

loc_4221FC:
	and dword [dword_4E8950], 0F7h
	jmp loc_4220DB

loc_42220B:
	test ecx, ecx
	jnz loc_422255
	mov ecx, [esp+eax+4]
	add dword [dword_4E8948], ecx
	mov ecx, dword [dword_4E8948]
	cmp ecx, dword [dword_4E8938]
	jge loc_422238
	mov ecx, dword [dword_4E8938]
	mov dword [dword_4E8948], ecx
	jmp loc_4220DB

loc_422238:
	cmp ecx, dword [dword_4E8940]
	jle loc_4220DB
	mov ecx, dword [dword_4E8940]
	mov dword [dword_4E8948], ecx
	jmp loc_4220DB

loc_422255:
	cmp ecx, 4
	jnz loc_4220DB
	mov ecx, [esp+eax+4]
	add dword [dword_4E894C], ecx
	mov ecx, dword [dword_4E894C]
	cmp ecx, dword [dword_4E893C]
	jge loc_422287
	mov ecx, dword [dword_4E893C]
	mov dword [dword_4E894C], ecx
	jmp loc_4220DB

loc_422287:
	cmp ecx, dword [dword_4E8944]
	jle loc_4220DB
	mov ecx, dword [dword_4E8944]
	mov dword [dword_4E894C], ecx
	jmp loc_4220DB

loc_4222A4:
	mov eax, dword [dword_4E8950]
	or eax, edx
	call dword [off_4DAC4C]
	add esp, 204h
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret
;sub_422060 endp

sub_4222C0: ;SUBROUTINE
	mov dword [dword_4E8938], eax
	mov dword [dword_4E893C], edx
	mov dword [dword_4E8940], ebx
	mov edx, dword [dword_4E894C]
	mov eax, dword [dword_4E8948]
	mov dword [dword_4E8944], ecx
	jmp sub_4222F0
;sub_4222C0 endp

sub_4222F0: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 4
	mov esi, eax
	mov ebx, edx
	push 0
	lea ecx, [esp+4]
	push ecx
	mov edx, 0FFFFFFFFh
	push 0
	mov eax, dword [lpEventAttributes]
	mov [esp+0Ch], edx
	push 10h
	mov edx, [eax]
	push eax
	call dword [edx+28h]
	mov ecx, dword [dword_4E8938]
	cmp esi, ecx
	jl loc_422356
	mov edi, dword [dword_4E8940]
	cmp esi, edi
	jle loc_42235E
	mov dword [dword_4E8948], edi

loc_422335:
	mov ebp, dword [dword_4E893C]
	cmp ebx, ebp
	jl loc_422366
	mov eax, dword [dword_4E8944]
	cmp ebx, eax
	jle loc_42236E
	mov dword [dword_4E894C], eax

loc_42234D:
	add esp, 4
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_422356:
	mov dword [dword_4E8948], ecx
	jmp loc_422335

loc_42235E:
	mov dword [dword_4E8948], esi
	jmp loc_422335

loc_422366:
	mov dword [dword_4E894C], ebp
	jmp loc_42234D

loc_42236E:
	mov dword [dword_4E894C], ebx
	add esp, 4
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_4222F0 endp

sub_422380: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	sub esp, 14h
	cmp dword [dword_4D4C44], 0
	jz loc_4223D7

loc_422391:
	mov ebx, dword [lpEventAttributes]
	test ebx, ebx
	jz loc_4223E9

loc_42239B:
	cmp dword [lpEventAttributes], 0
	jz loc_4223AE
	mov eax, 11h
	call sub_421600

loc_4223AE:
	mov ecx, 1E0h
	xor ebx, ebx
	xor edx, edx
	xor eax, eax
	mov dword [dword_4E8950], ebx
	mov ebx, 280h
	call sub_4222C0
	mov eax, 1

loc_4223CE:
	add esp, 14h
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4223D7:
	call sub_422530
	cmp dword [dword_4D4C44], 0
	jnz loc_422391
	xor eax, eax
	jmp loc_4223CE

loc_4223E9:
	push ebx
	push lpEventAttributes
	mov eax, dword [dword_4D4C44]
	push dword_4E27D8
	mov edx, [eax]
	push eax
	call dword [edx+0Ch]
	test eax, eax
	jz loc_42240E
	xor eax, eax
	add esp, 14h
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_42240E:
	push dword_4C4BC0
	mov eax, dword [lpEventAttributes]
	push eax
	mov edx, [eax]
	call dword [edx+2Ch]
	test eax, eax
	jz loc_42242D
	xor eax, eax
	add esp, 14h
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_42242D:
	mov edx, 5
	mov eax, 11h
	call sub_421710
	test eax, eax
	jz loc_4223CE
	push ebx ; lpName
	push ebx ; bInitialState
	push ebx ; bManualReset
	push ebx ; lpEventAttributes
	call CreateEventA_wrap
	mov dword [hObject], eax
	test eax, eax
	jz loc_4223CE
	push eax
	mov edx, dword [lpEventAttributes]
	push edx
	mov ecx, [edx]
	call dword [ecx+30h]
	test eax, eax
	jnz loc_42249F
	mov esi, 14h
	mov edi, 10h
	mov edx, 20h
	mov ecx, esp
	mov eax, dword [lpEventAttributes]
	mov [esp+8], ebx
	mov [esp+0Ch], ebx
	mov [esp], esi
	push ecx
	mov [esp+8], edi
	mov [esp+14h], edx
	push 1
	mov edx, [eax]
	push eax
	call dword [edx+18h]
	test eax, eax
	jz loc_4224AA

loc_42249F:
	xor eax, eax
	add esp, 14h
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4224AA:
	push 20h
	call sub_482360
	push sub_4224D0
	push 20h
	mov dword [dword_4D4C54], eax
	call sub_482270
	jmp loc_42239B
;sub_422380 endp

sub_4224D0: ;SUBROUTINE
	push ebp
	cmp dword [dword_4D4C54], 0
	jnz loc_4224F5

loc_4224DA:
	push 0 ; bShow
	call ShowCursor_wrap
	mov eax, 1
	pop ebp
	ret 18h

loc_4224F5:
	push edi
	push esi
	push ebx
	mov ecx, [esp+28h]
	push ecx
	mov ebx, [esp+28h]
	push ebx
	mov esi, [esp+28h]
	push esi
	mov edi, [esp+28h]
	push edi
	mov ebp, [esp+28h]
	push ebp
	mov eax, [esp+28h]
	push eax
	call dword [dword_4D4C54]
	pop ebx
	pop esi
	pop edi
	jmp loc_4224DA
;sub_4224D0 endp

sub_422530: ;SUBROUTINE
	push ecx
	push edx
	mov edx, dword [dword_4D4C44]
	test edx, edx
	jnz loc_4225A4
	xor eax, eax
	xor ecx, ecx

loc_422540:
	add eax, 5Ch
	mov dword dword_4E732C[eax], ecx
	mov dword dword_4E7330[eax], ecx
	mov byte byte_4E7334[eax], cl
	add edx, 4
	mov byte byte_4E7335[eax], cl
	mov dword dword_4E7344[edx], ecx
	cmp edx, 40h
	jnz loc_422540
	xor eax, eax

loc_42256B:
	add eax, 4
	xor ecx, ecx
	mov dword dword_4E88BC[eax], ecx
	cmp eax, 78h
	jnz loc_42256B
	push ecx
	push dword_4D4C44
	push 500h
	push ecx ; lpModuleName
	mov dword [dword_4D4C58], ecx
	mov dword [dword_4D4C5C], ecx
	call GetModuleHandleA_wrap
	push eax
	call DirectInputCreateA_wrap
	test eax, eax
	jnz loc_4225A7

loc_4225A4:
	pop edx
	pop ecx
	ret

loc_4225A7:
	push edi
	xor edi, edi
	mov dword [dword_4D4C44], edi
	pop edi
	pop edx
	pop ecx
	ret
;sub_422530 endp

sub_4225C0: ;SUBROUTINE
	push esi
	push edi
	push ebp
	sub esp, 10h
	mov esi, [esp+20h]
	mov ebp, [esp+2Ch]
	mov [esp+8], ax
	mov [esp+0Ch], dl
	xor edx, edx
	test ebx, ebx
	jz loc_422632
	mov edi, [ebx]
	cmp edi, 168h
	jle loc_4227ED
	mov dword [ebx], 168h

loc_4225F1:
	mov eax, [ebx]
	mov [esp], eax
	mov edi, [esp]
	shl eax, 2
	sub eax, edi
	shl eax, 3
	add eax, edi
	shl eax, 2
	mov [ebx], eax
	mov eax, [esp+6]
	sar eax, 10h
	mov [esp], eax
	mov edi, [esp]
	shl eax, 5
	add eax, edi
	shl eax, 2
	mov edi, dword dword_4E79C0[eax]
	cmp edi, [ebx]
	jz loc_422632
	mov ebx, [ebx]
	or dl, 40h
	mov dword dword_4E79C0[eax], ebx

loc_422632:
	test ecx, ecx
	jz loc_42266D
	mov eax, [ecx]
	cmp eax, 0FFFFFFh
	jnz loc_4227FC
	mov dword [ecx], 0FFFFFFFFh

loc_422649:
	mov ebx, [esp+6]
	sar ebx, 10h
	mov eax, ebx
	shl eax, 5
	add eax, ebx
	shl eax, 2
	mov edi, [ecx]
	cmp edi, dword dword_4E7950[eax]
	jz loc_42266D
	or dl, 1
	mov dword dword_4E7950[eax], edi

loc_42266D:
	test esi, esi
	jz loc_4226A3
	cmp dword [esi], 2710h
	jbe loc_42267F
	mov dword [esi], 2710h

loc_42267F:
	mov ecx, [esp+6]
	sar ecx, 10h
	mov eax, ecx
	shl eax, 5
	add eax, ecx
	shl eax, 2
	mov ebx, [esi]
	cmp ebx, dword dword_4E7958[eax]
	jz loc_4226A3
	or dl, 4
	mov dword dword_4E7958[eax], ebx

loc_4226A3:
	mov esi, [esp+24h]
	test esi, esi
	jz loc_422706
	mov ecx, [esp+6]
	sar ecx, 10h
	mov eax, ecx
	shl eax, 5
	add eax, ecx
	mov ebx, dword_4E7948
	shl eax, 2
	add ebx, eax
	mov edi, esi
	add ebx, 34h
	mov ecx, dword dword_4E7974[eax]
	mov esi, ebx
	mov [esp+4], eax
	xor eax, eax
	repe cmpsb
	jz loc_4226DF
	sbb eax, eax
	sbb eax, 0FFFFFFFFh

loc_4226DF:
	test eax, eax
	jz loc_422706
	mov ecx, [esp+4]
	mov esi, [esp+24h]
	mov edi, ebx
	mov ecx, dword dword_4E7974[ecx]
	or dh, 1
	push edi
	mov eax, ecx
	shr ecx, 2
	rep movsd
	mov cl, al
	and cl, 3
	rep movsb
	pop edi

loc_422706:
	mov eax, [esp+28h]
	test eax, eax
	jz loc_42273B
	mov bl, [eax]
	cmp bl, 20h
	jge loc_42273B
	movsx eax, bl
	cmp eax, 0FFFFFFFFh
	jnz loc_42282A
	mov ebx, eax

loc_422723:
	mov ecx, [esp+6]
	sar ecx, 10h
	mov eax, ecx
	shl eax, 5
	add eax, ecx
	or dl, 8
	mov dword dword_4E795C[eax*4], ebx

loc_42273B:
	test ebp, ebp
	jz loc_422798
	mov ecx, [esp+6]
	sar ecx, 10h
	mov eax, ecx
	shl eax, 5
	add eax, ecx
	shl eax, 2
	mov ebx, [ebp+0]
	cmp ebx, dword dword_4E79B0[eax]
	jz loc_422839

loc_42275F:
	mov ecx, [esp+6]
	sar ecx, 10h
	mov eax, ecx
	shl eax, 5
	add eax, ecx
	mov ecx, [ebp+0]
	mov dword dword_4E79B0[eax*4], ecx
	mov ecx, [ebp+4]
	mov dword dword_4E79B4[eax*4], ecx
	mov ecx, [ebp+8]
	mov dword dword_4E79B8[eax*4], ecx
	mov ecx, [ebp+0Ch]
	or dl, 80h
	mov dword dword_4E79BC[eax*4], ecx

loc_422798:
	test edx, edx
	jnz loc_42286B
	cmp byte [esp+0Ch], 1
	jnz loc_4227C7
	mov edx, [esp+6]
	sar edx, 10h
	mov eax, edx
	shl eax, 5
	add eax, edx
	mov eax, dword dword_4E79C8[eax*4]
	test eax, eax
	jnz loc_4227C7
	mov eax, edx
	call sub_4229B0

loc_4227C7:
	cmp byte [esp+0Ch], 3
	jnz loc_4227E2
	mov eax, [esp+6]
	sar eax, 10h
	mov eax, dword dword_4E88C0[eax*4]
	push eax
	mov edx, [eax]
	call dword [edx+28h]

loc_4227E2:
	xor eax, eax
	add esp, 10h
	pop ebp
	pop edi
	pop esi
	ret 10h

loc_4227ED:
	test edi, edi
	jge loc_4225F1
	mov [ebx], edx
	jmp loc_4225F1

loc_4227FC:
	cmp eax, 5DCh
	jbe loc_422809
	mov dword [ecx], 5DCh

loc_422809:
	mov ebx, [ecx]
	lea eax, 0[ebx*4]
	sub eax, ebx
	shl eax, 3
	add eax, ebx
	shl eax, 3
	mov ebx, eax
	shl eax, 2
	add eax, ebx
	mov [ecx], eax
	jmp loc_422649

loc_42282A:
	mov ebx, [esp+28h]
	movsx ebx, byte [ebx]
	add ebx, 30h
	jmp loc_422723

loc_422839:
	mov esi, [ebp+4]
	cmp esi, dword dword_4E79B4[eax]
	jnz loc_42275F
	mov edi, [ebp+8]
	cmp edi, dword dword_4E79B8[eax]
	jnz loc_42275F
	mov ecx, [ebp+0Ch]
	cmp ecx, dword dword_4E79BC[eax]
	jnz loc_42275F
	jmp loc_422798

loc_42286B:
	mov eax, [esp+6]
	sar eax, 10h
	push edx
	mov edx, eax
	mov ecx, dword dword_4E88C0[eax*4]
	shl eax, 5
	add eax, edx
	shl eax, 2
	add eax, dword_4E7948
	push eax
	mov ebx, [ecx]
	push ecx
	call dword [ebx+18h]
	mov bh, [esp+0Ch]
	cmp bh, 1
	jnz loc_4228C7

loc_422899:
	mov edx, [esp+6]
	sar edx, 10h
	mov eax, edx
	shl eax, 5
	add eax, edx
	mov eax, dword dword_4E79C8[eax*4]
	test eax, eax
	jnz loc_4228CE
	mov eax, edx
	call sub_4229B0

loc_4228B9:
	mov eax, 1
	add esp, 10h
	pop ebp
	pop edi
	pop esi
	ret 10h

loc_4228C7:
	cmp bh, 2
	jz loc_422899
	jmp loc_4228B9

loc_4228CE:
	cmp byte [esp+0Ch], 3
	jnz loc_4228B9
	mov eax, dword dword_4E88C0[edx*4]
	push eax
	mov edx, [eax]
	call dword [edx+28h]
	mov eax, 1
	add esp, 10h
	pop ebp
	pop edi
	pop esi
	ret 10h
;sub_4225C0 endp

sub_4228F0: ;SUBROUTINE
	push ecx
	push edx
	cwde
	mov eax, dword dword_4E88C0[eax*4]
	push eax
	mov edx, [eax]
	call dword [edx+2Ch]
	pop edx
	pop ecx
	ret
;sub_4228F0 endp

sub_422910: ;SUBROUTINE
	push edx
	push esi
	cmp al, 10h
	jnz loc_422929
	xor edx, edx

loc_422918:
	movsx eax, dl
	inc edx
	call sub_422910
	cmp edx, 10h
	jl loc_422918
	pop esi
	pop edx
	ret

loc_422929:
	push ecx
	push ebx
	movsx edx, al
	shl edx, 2
	cmp dword dword_4E7348[edx], 0
	jnz loc_422957

loc_42293A:
	xor edx, edx
	pop ebx
	pop ecx

loc_42293E:
	add edx, 84h
	xor esi, esi
	mov dword dword_4E7944[edx], esi
	cmp edx, 0F78h
	jnz loc_42293E
	pop esi
	pop edx
	ret

loc_422957:
	movsx ecx, al
	mov eax, 1
	mov ebx, dword [dword_4D4C58]
	shl eax, cl
	test eax, ebx
	jz loc_42293A
	push 2
	mov eax, dword dword_4E7348[edx]
	push eax
	mov edx, [eax]
	call dword [edx+58h]
	jmp loc_42293A
;sub_422910 endp

sub_422980: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	movsx ebx, ax
	mov eax, dword dword_4E88C0[ebx*4]
	push eax
	mov edx, [eax]
	call dword [edx+20h]
	mov eax, ebx
	shl eax, 5
	mov edx, ebx
	add eax, ebx
	xor edx, ebx
	mov dword dword_4E79C8[eax*4], edx
	pop edx
	pop ecx
	pop ebx
	ret
;sub_422980 endp

sub_4229B0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push 0
	movsx ebx, ax
	push 1
	mov eax, dword dword_4E88C0[ebx*4]
	push eax
	mov edx, [eax]
	call dword [edx+1Ch]
	mov ecx, eax
	mov eax, ebx
	shl eax, 5
	add eax, ebx
	shl eax, 2
	test ecx, ecx
	jnz loc_4229E5
	mov dword dword_4E79C8[eax], 1
	pop edx
	pop ecx
	pop ebx
	ret

loc_4229E5:
	xor edx, edx
	mov dword dword_4E79C8[eax], edx
	pop edx
	pop ecx
	pop ebx
	ret
;sub_4229B0 endp

off_422A00: dd loc_422BCA
	dd loc_422CCC ; jump table for switch statement
	dd loc_422CDB
	dd loc_422CEA
	dd loc_422CEA
	dd loc_422CEA
	dd loc_422CEA
	dd loc_422CEA
	dd loc_422D07
	dd loc_422D24
	dd loc_422D07
	dd loc_422D07
	dd loc_422D07

sub_422A34: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	mov bl, al
	cmp dword [dword_4D4C60], 1Eh
	jge loc_422C1D
	movsx eax, al
	cmp dword dword_4E7348[eax*4], 0
	jz loc_422C1D
	mov eax, 1
	movsx ecx, bl
	mov edi, dword [dword_4D4C58]
	shl eax, cl
	test eax, edi
	jz loc_422C1D
	mov ebp, [edx+34h]
	cmp ebp, 0FFFFFFh
	jnz loc_422C28
	mov ecx, 0FFFFFFFFh

loc_422A85:
	mov esi, dword [dword_4D4C60]
	mov eax, esi
	shl eax, 5
	add eax, esi
	mov dword dword_4E7950[eax*4], ecx
	mov ecx, [edx+38h]
	mov dword dword_4E7958[eax*4], ecx
	mov eax, [edx+3Ah]
	sar eax, 18h
	cmp eax, 0FFFFFFFFh
	jnz loc_422C45
	mov esi, eax

loc_422AB4:
	mov eax, dword [dword_4D4C60]
	mov ecx, eax
	shl ecx, 5
	add ecx, eax
	shl ecx, 2
	mov dword dword_4E795C[ecx], esi
	mov eax, [edx+40h]
	mov dword dword_4E7960[ecx], eax
	mov esi, [edx+44h]
	lea eax, 0[esi*4]
	sub eax, esi
	shl eax, 3
	add eax, esi
	shl eax, 2
	mov dword dword_4E79C0[ecx], eax
	cmp byte [edx+3Ch], 0
	jnz loc_422C53

loc_422AF6:
	mov ecx, dword [dword_4D4C60]
	mov eax, ecx
	shl eax, 5
	mov ebp, 1
	add eax, ecx
	xor esi, esi
	mov ecx, dword_4E7340
	mov dword dword_4E7964[eax*4], ebp
	mov dword [dword_4E7340], esi
	mov dword dword_4E7968[eax*4], ecx

loc_422B23:
	mov ecx, dword [dword_4D4C60]
	mov eax, ecx
	shl eax, 5
	add eax, ecx
	mov edi, dword_4E7948
	shl eax, 2
	lea esi, [edx+4]
	add edi, eax
	mov ecx, 30h
	add edi, 34h
	push edi
	mov eax, ecx
	shr ecx, 2
	rep movsd
	mov cl, al
	and cl, 3
	rep movsb
	pop edi
	mov ecx, dword [dword_4D4C60]
	mov eax, ecx
	shl eax, 5
	add eax, ecx
	shl eax, 2
	xor ecx, ecx
	mov ebp, 22h
	mov dword dword_4E7954[eax], ecx
	mov ecx, dword_4E7948
	mov edi, 34h
	add ecx, eax
	mov dword dword_4E7948[eax], edi
	lea esi, [ecx+edi]
	mov dword dword_4E794C[eax], ebp
	add ecx, 78h
	mov dword dword_4E7978[eax], esi
	xor edi, edi
	mov dword dword_4E796C[eax], ecx
	mov dword dword_4E79C4[eax], edi
	mov dword dword_4E7970[eax], edi
	mov dword dword_4E7978[eax], esi
	mov dword dword_4E79C8[eax], edi
	mov cl, [edx]
	cmp cl, 0Ch
	ja loc_422C1D
	and ecx, 0FFh ; switch 13 cases
	jmp off_422A00[ecx*4] ; switch jump

loc_422BCA:
	mov dword dword_4E7974[eax], 4 ; jumptable 00422BC3 case 0

loc_422BD4:
	movsx eax, bl
	mov esi, dword dword_4E7348[eax*4]
	mov eax, dword [dword_4D4C60]
	shl eax, 2
	push 0
	add eax, dword_4E88C0
	mov ecx, dword [dword_4D4C60]
	push eax
	mov eax, ecx
	shl eax, 5
	add eax, ecx
	shl eax, 2
	add eax, dword_4E7948
	push eax
	movsx eax, byte [edx]
	mov ebp, dword off_421560[eax*4]
	push ebp
	mov edi, [esi]
	push esi
	call dword [edi+48h]
	test eax, eax
	jz loc_422D33

loc_422C1D:
	mov eax, 0FFFFFFFFh
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_422C28:
	lea eax, 0[ebp*4]
	sub eax, ebp
	shl eax, 3
	add eax, ebp
	shl eax, 3
	mov ecx, eax
	shl eax, 2
	add ecx, eax
	jmp loc_422A85

loc_422C45:
	mov esi, [edx+3Ah]
	sar esi, 18h
	add esi, 30h
	jmp loc_422AB4

loc_422C53:
	movsx esi, bl
	lea eax, 0[esi*4]
	sub eax, esi
	shl eax, 3
	sub eax, esi
	test byte byte_4E7390[eax*4], 2
	jnz loc_422AF6
	cmp byte [edx+3Ch], 1
	jnz loc_422C9E
	mov esi, dword_4E7340
	mov edi, 4
	mov eax, 1
	mov dword dword_4E7968[ecx], esi
	mov dword [dword_4E7340], edi
	mov dword dword_4E7964[ecx], eax
	jmp loc_422B23

loc_422C9E:
	mov esi, dword_4E7340
	mov ebp, 4
	xor edi, edi
	mov eax, 2
	mov dword [dword_4E7340], edi
	mov dword dword_4E7968[ecx], esi
	mov dword [dword_4E7344], ebp
	mov dword dword_4E7964[ecx], eax
	jmp loc_422B23

loc_422CCC:
	mov dword dword_4E7974[eax], 8 ; jumptable 00422BC3 case 1
	jmp loc_422BD4

loc_422CDB:
	mov dword dword_4E7974[eax], 10h ; jumptable 00422BC3 case 2
	jmp loc_422BD4

loc_422CEA:
	mov ecx, dword [dword_4D4C60] ; jumptable 00422BC3 cases 3-7
	mov eax, ecx
	shl eax, 5
	add eax, ecx
	mov dword dword_4E7974[eax*4], 10h
	jmp loc_422BD4

loc_422D07:
	mov ecx, dword [dword_4D4C60] ; jumptable 00422BC3 cases 8,10-12
	mov eax, ecx
	shl eax, 5
	add eax, ecx
	mov dword dword_4E7974[eax*4], 18h
	jmp loc_422BD4

loc_422D24:
	mov dword dword_4E7974[eax], 30h ; jumptable 00422BC3 case 9
	jmp loc_422BD4

loc_422D33:
	mov ax, word [dword_4D4C60]
	cwde
	mov eax, dword dword_4E88C0[eax*4]
	push eax
	mov edx, [eax]
	call dword [edx+2Ch]
	mov eax, dword [dword_4D4C60]
	lea edx, [eax+1]
	mov dword [dword_4D4C60], edx
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_422A34 endp

sub_422D60: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 18h
	mov [esp+14h], al
	mov esi, edx
	cmp al, 10h
	jnz loc_422D8D
	xor ebx, ebx

loc_422D74:
	movsx eax, bl
	mov edx, esi
	inc ebx
	call sub_422D60
	cmp ebx, 10h
	jl loc_422D74

loc_422D84:
	add esp, 18h
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_422D8D:
	mov ecx, [esp+11h]
	mov eax, 1
	sar ecx, 18h
	mov edx, dword [dword_4D4C58]
	shl eax, cl
	test eax, edx
	jz loc_422E47

loc_422DA9:
	mov edi, 10h
	mov ebx, 14h
	xor ebp, ebp
	mov [esp+4], edi
	mov [esp+8], ebp
	mov [esp+0Ch], ebp
	mov [esp], ebx
	cmp esi, 64h
	jle loc_422E65
	mov dword [esp+10h], 2710h

loc_422DD5:
	mov esi, dword [dword_4D4C60]
	xor ebx, ebx
	test esi, esi
	jle loc_422DFC

loc_422DE1:
	movsx eax, bx
	mov eax, dword dword_4E88C0[eax*4]
	push eax
	mov esi, [eax]
	inc ebx
	call dword [esi+2Ch]
	cmp ebx, dword [dword_4D4C60]
	jl loc_422DE1
	mov eax, eax

loc_422DFC:
	mov ecx, esp
	mov eax, [esp+11h]
	push ecx
	sar eax, 18h
	push 7
	mov eax, dword dword_4E7348[eax*4]
	push eax
	mov ebx, [eax]
	call dword [ebx+18h]
	mov ebp, dword [dword_4D4C60]
	xor ebx, ebx
	test ebp, ebp
	jle loc_422D84

loc_422E25:
	movsx eax, bx
	mov eax, dword dword_4E88C0[eax*4]
	push eax
	mov esi, [eax]
	inc ebx
	call dword [esi+28h]
	cmp ebx, dword [dword_4D4C60]
	jl loc_422E25
	add esp, 18h
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_422E47:
	mov eax, [esp+11h]
	sar eax, 18h
	cmp dword dword_4E7348[eax*4], 0
	jnz loc_422DA9
	add esp, 18h
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_422E65:
	test esi, esi
	jl loc_422E83
	lea eax, 0[esi*4]
	sub eax, esi
	shl eax, 3
	add eax, esi
	shl eax, 2
	mov [esp+10h], eax
	jmp loc_422DD5

loc_422E83:
	mov [esp+10h], ebp
	jmp loc_422DD5
;sub_422D60 endp

sub_422E90: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	cmp al, 10h
	jnz loc_422EAC
	xor edx, edx

loc_422E99:
	movsx eax, dl
	inc edx
	call sub_422E90
	cmp edx, 10h
	jl loc_422E99
	nop

loc_422EA8:
	pop edx
	pop ecx
	pop ebx
	ret

loc_422EAC:
	movsx edx, al
	shl edx, 2
	cmp dword dword_4E7348[edx], 0
	jz loc_422EA8
	movsx ecx, al
	mov eax, 1
	mov ebx, dword [dword_4D4C58]
	shl eax, cl
	test eax, ebx
	jz loc_422EA8
	push 20h
	mov eax, dword dword_4E7348[edx]
	push eax
	mov edx, [eax]
	call dword [edx+58h]
	pop edx
	pop ecx
	pop ebx
	ret
;sub_422E90 endp

sub_422EF0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	cmp al, 10h
	jnz loc_422F19
	xor ecx, ecx

loc_422EFA:
	movsx edx, cl
	mov eax, edx
	call sub_422910
	mov eax, edx
	inc ecx
	call sub_422EF0
	cmp ecx, 10h
	jl loc_422EFA
	lea eax, [eax+0]

loc_422F14:
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_422F19:
	movsx edx, al
	lea ebx, 0[edx*4]
	cmp dword dword_4E7348[ebx], 0
	jz loc_422F14
	movsx ecx, al
	mov eax, 1
	mov esi, dword [dword_4D4C58]
	shl eax, cl
	test eax, esi
	jz loc_422F14
	mov eax, edx
	call sub_422910
	push 10h
	mov edx, dword dword_4E7348[ebx]
	push edx
	mov eax, [edx]
	call dword [eax+58h]
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_422EF0 endp

sub_422F60: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	cmp al, 10h
	jnz loc_422F7C
	xor edx, edx

loc_422F69:
	movsx eax, dl
	inc edx
	call sub_422F60
	cmp edx, 10h
	jl loc_422F69
	nop

loc_422F78:
	pop edx
	pop ecx
	pop ebx
	ret

loc_422F7C:
	movsx edx, al
	shl edx, 2
	cmp dword dword_4E7348[edx], 0
	jz loc_422F78
	movsx ecx, al
	mov eax, 1
	mov ebx, dword [dword_4D4C58]
	shl eax, cl
	test eax, ebx
	jz loc_422F78
	push 8
	mov eax, dword dword_4E7348[edx]
	push eax
	mov edx, [eax]
	call dword [edx+58h]
	pop edx
	pop ecx
	pop ebx
	ret
;sub_422F60 endp

sub_422FC0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	cmp al, 10h
	jnz loc_422FDC
	xor edx, edx

loc_422FC9:
	movsx eax, dl
	inc edx
	call sub_422FC0
	cmp edx, 10h
	jl loc_422FC9
	nop

loc_422FD8:
	pop edx
	pop ecx
	pop ebx
	ret

loc_422FDC:
	movsx edx, al
	shl edx, 2
	cmp dword dword_4E7348[edx], 0
	jz loc_422FD8
	movsx ecx, al
	mov eax, 1
	mov ebx, dword [dword_4D4C58]
	shl eax, cl
	test eax, ebx
	jz loc_422FD8
	push 4
	mov eax, dword dword_4E7348[edx]
	push eax
	mov edx, [eax]
	call dword [edx+58h]
	pop edx
	pop ecx
	pop ebx
	ret
;sub_422FC0 endp

sub_423020: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	cmp dword [dword_4D4C5C], 0
	jz loc_423076

loc_42302F:
	cmp dword [dword_4D4C58], 0
	jz loc_42306A
	xor esi, esi
	xor ebx, ebx

loc_42303C:
	mov edi, dword dword_4E7348[esi]
	test edi, edi
	jz loc_423061
	mov eax, 1
	mov cl, bl
	mov ebp, dword [dword_4D4C58]
	shl eax, cl
	test eax, ebp
	jz loc_423061
	push 1
	mov edx, [edi]
	push edi
	call dword [edx+58h]

loc_423061:
	inc ebx
	add esi, 4
	cmp ebx, 10h
	jl loc_42303C

loc_42306A:
	mov eax, dword [dword_4D4C58]
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_423076:
	call sub_421F10
	jmp loc_42302F
;sub_423020 endp

;	Attributes: thunk

sub_423080: ;SUBROUTINE
	jmp sub_422380
;sub_423080 endp

sub_4230A0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 0Ch
	mov edx, eax
	shl edx, 5
	add edx, eax
	shl edx, 2
	mov ebx, dword [dword_4D4C6C]
	add edx, eax
	mov ecx, [ebx]
	shl edx, 2
	cmp ecx, 1
	jnz loc_423162
	mov ebx, dword [dword_4D4C68]
	mov esi, [ebx+10h]
	mov edi, [edx+ebx+34h]
	add esi, ecx
	lea edx, [edi+esi]
	mov ecx, esi
	cmp edx, esi
	jle loc_4230E6
	mov ecx, [ebx]
	sub ecx, edi
	inc ecx

loc_4230E6:
	mov edx, eax
	shl edx, 5
	add edx, eax
	mov ebp, dword [dword_4D4C6C]
	shl edx, 2
	mov ebx, dword [dword_4D4C68]
	add edx, eax
	add ebp, 4
	shl edx, 2
	lea eax, [ebx+28h]
	mov [esp+4], edx
	add eax, edx
	mov ebx, ecx
	add eax, 18h
	mov edx, ebp
	add eax, edi
	call sub_48A980
	cmp ecx, esi
	jl loc_42312E

loc_42311F:
	mov eax, dword [dword_4D4C6C]
	add esp, 0Ch
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_42312E:
	mov eax, dword [dword_4D4C6C]
	add eax, 4
	lea edx, [eax+ecx]
	mov ebx, esi
	mov eax, dword [dword_4D4C68]
	mov esi, [esp+4]
	add eax, 28h
	add eax, esi
	sub ebx, ecx
	add eax, 18h
	call sub_48A980
	mov eax, dword [dword_4D4C6C]
	add esp, 0Ch
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_423162:
	mov eax, dword [dword_4D4C68]
	mov [esp+8], edx
	xor ebp, ebp
	xor ecx, ecx
	mov ebx, [edx+eax+28h]

loc_423173:
	mov esi, dword [dword_4D4C6C]
	cmp ebp, [esi]
	jge loc_42311F
	mov edi, dword [dword_4D4C68]
	mov edx, ebx
	mov eax, ebx
	sar edx, 1Fh
	idiv dword [edi+4]
	imul edx, 34h
	mov eax, [esp+8]
	mov [esp], edx
	lea edx, [edi+28h]
	add edx, eax
	mov edi, [esp]
	add edx, 0Ch
	add edx, edi
	add esi, 4
	add edx, 0Ch
	lea edi, [esi+ecx]
	inc ebp
	mov esi, edx
	inc ebx
	push edi

loc_4231B2:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_4231CA
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_4231B2

loc_4231CA:
	pop edi
	add ecx, 26h
	jmp loc_423173
;sub_4230A0 endp

sub_4231D0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	mov esi, dword [dword_4D4C68]
	mov edi, eax
	cmp dword [dword_4D4C70], 0
	jz loc_42326C
	shl eax, 5
	add eax, edi
	shl eax, 2
	add eax, edi
	lea ecx, [esi+28h]
	shl eax, 2
	add ecx, eax
	mov eax, [ecx+8]
	cmp eax, [ecx+4]
	jz loc_423211

loc_423204:
	imul edx, eax, 34h
	mov ebx, [ecx+edx+14h]
	cmp ebx, [ecx+edx+10h]
	jz loc_423270

loc_423211:
	lea edx, 0[eax*4]
	sub edx, eax
	shl edx, 2
	add edx, eax
	lea ebx, [ecx+0Ch]
	shl edx, 2
	add edx, ebx
	mov ebx, [edx+8]
	cmp ebx, [edx+4]
	jz loc_42326C
	dec ebx
	mov [edx+8], ebx
	test ebx, ebx
	jl loc_423282

loc_423237:
	mov [ecx+8], eax
	add edx, [edx+8]
	mov byte [edx+0Ch], 0
	mov edx, [esi+20h]
	mov dword [dword_4D4C68], esi
	test edx, edx
	jz loc_423255
	mov eax, edi

loc_423255:
	mov eax, 1
	mov esi, dword [dword_4D4C68]

loc_423260:
	mov dword [dword_4D4C68], esi
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_42326C:
	xor eax, eax
	jmp loc_423260

loc_423270:
	dec eax
	test eax, eax
	jl loc_42327C

loc_423275:
	cmp eax, [ecx+4]
	jnz loc_423204
	jmp loc_423211

loc_42327C:
	mov eax, [esi+4]
	dec eax
	jmp loc_423275

loc_423282:
	mov ebx, [esi]
	mov [edx+8], ebx
	jmp loc_423237
;sub_4231D0 endp

sub_423290: ;SUBROUTINE
	push ebx
	push ebp
	sub esp, 4
	mov ebx, eax
	mov [esp], dl
	cmp dword [dword_4D4C70], 0
	jz loc_423341
	push edi
	push esi
	push ecx
	mov ebp, eax
	shl ebp, 5
	add ebp, eax
	shl ebp, 2
	add ebp, eax
	mov esi, dword [dword_4D4C68]
	shl ebp, 2
	lea edi, [esi+ebp]
	mov edx, [edi+30h]
	lea ecx, 0[edx*4]
	sub ecx, edx
	lea eax, [esi+28h]
	shl ecx, 2
	add eax, ebp
	add ecx, edx
	add eax, 0Ch
	shl ecx, 2
	add ecx, eax
	mov eax, [ecx+8]
	lea edx, [eax+1]
	mov [ecx+8], edx
	mov dl, [esp+0Ch]
	mov [ecx+eax+0Ch], dl
	cmp dword [esi+0Ch], 1
	jnz loc_423345
	mov ebx, [esi]
	cmp ebx, [ecx+8]
	jge loc_423305
	mov dword [ecx+8], 0

loc_423305:
	mov esi, [ecx+4]
	cmp esi, [ecx+8]
	jnz loc_423327
	lea edi, [esi+1]
	mov eax, dword [dword_4D4C68]
	mov [ecx+4], edi
	mov edx, edi
	mov ebx, [eax]
	sar edx, 1Fh
	inc ebx
	mov eax, edi
	idiv ebx
	mov [ecx+4], edx

loc_423327:
	mov eax, [ecx+4]
	mov [ecx], eax

loc_42332C:
	add ecx, [ecx+8]
	mov eax, 1
	mov byte [ecx+0Ch], 0
	pop ecx
	pop esi
	pop edi

loc_42333B:
	add esp, 4
	pop ebp
	pop ebx
	ret

loc_423341:
	xor eax, eax
	jmp loc_42333B

loc_423345:
	mov edx, [esi]
	cmp edx, [ecx+8]
	jnz loc_42338D
	mov eax, [edi+30h]
	inc eax
	mov edx, eax
	mov [edi+30h], eax
	sar edx, 1Fh
	idiv dword [esi+4]
	mov eax, ebx
	mov [edi+30h], edx
	call sub_4233D0
	mov edi, dword [dword_4D4C68]
	lea esi, [edi+ebp]
	mov eax, [esi+30h]
	mov edx, [esi+2Ch]
	cmp eax, edx
	jnz loc_42338D
	lea ebp, [edx+1]
	mov edx, ebp
	mov eax, ebp
	mov [esi+2Ch], ebp
	sar edx, 1Fh
	mov ebp, [edi+4]
	idiv ebp
	mov [esi+2Ch], edx

loc_42338D:
	mov eax, dword [dword_4D4C68]
	cmp dword [eax+20h], 0
	jz loc_42339F
	mov eax, ebx

loc_42339F:
	mov eax, ebx
	shl eax, 5
	add eax, ebx
	shl eax, 2
	add eax, ebx
	mov edx, dword [dword_4D4C68]
	shl eax, 2
	add eax, edx
	mov edx, [eax+2Ch]
	mov [eax+28h], edx
	jmp loc_42332C
;sub_423290 endp

sub_4233D0: ;SUBROUTINE
	push ebx
	push ecx
	mov ecx, edx
	mov edx, eax
	shl eax, 5
	add eax, edx
	shl eax, 2
	add eax, edx
	mov ebx, dword [dword_4D4C68]
	shl eax, 2
	lea edx, [ebx+28h]
	lea ebx, [edx+eax]
	mov edx, ecx
	lea eax, 0[edx*4]
	sub eax, edx
	shl eax, 2
	add eax, edx
	lea edx, [ebx+0Ch]
	mov dword [edx+eax*4], 0
	mov dword [edx+eax*4+4], 0
	mov dword [edx+eax*4+8], 0
	mov byte [edx+eax*4+0Ch], 0
	pop ecx
	pop ebx
	ret
;sub_4233D0 endp

sub_423430: ;SUBROUTINE
	push ebx
	push esi
	mov ebx, eax
	mov esi, dword [dword_4D4C70]
	test esi, esi
	jz loc_423480
	push edx
	push ecx
	xor edx, edx
	xor ecx, ecx
	mov dword [dword_4D4C70], edx

loc_42344A:
	mov eax, dword [dword_4D4C68]
	cmp ecx, [eax+4]
	jl loc_423483
	mov ecx, ebx
	shl ecx, 5
	add ecx, ebx
	shl ecx, 2
	add ecx, ebx
	mov dword [eax+ecx*4+28h], 0
	mov dword [eax+ecx*4+2Ch], 0
	mov dword [eax+ecx*4+30h], 0
	mov dword [dword_4D4C70], esi
	pop ecx
	pop edx

loc_423480:
	pop esi
	pop ebx
	ret

loc_423483:
	mov edx, ecx
	mov eax, ebx
	call sub_4233D0
	inc ecx
	jmp loc_42344A
;sub_423430 endp

sub_423490: ;SUBROUTINE
	push edx
	xor edx, edx
	mov eax, dword [dword_4D4C68]
	cmp edx, [eax+8]
	jl loc_42349F
	pop edx
	ret

loc_42349F:
	mov eax, edx
	call sub_423430
	inc edx
	mov eax, dword [dword_4D4C68]
	cmp edx, [eax+8]
	jl loc_42349F
	pop edx
	ret
;sub_423490 endp

sub_4234C0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	xor edx, edx
	mov ecx, dword [dword_4D4C68]
	mov dword [dword_4D4C70], edx
	test ecx, ecx
	jnz loc_4234F3

loc_4234D6:
	mov ebx, dword [dword_4D4C6C]
	test ebx, ebx
	jnz loc_4234FC
	xor esi, esi
	mov dword [dword_4D4C68], esi
	mov dword [dword_4D4C6C], esi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4234F3:
	mov eax, ecx
	call sub_4848FC
	jmp loc_4234D6

loc_4234FC:
	mov eax, ebx
	call sub_4848FC
	xor esi, esi
	mov dword [dword_4D4C68], esi
	mov dword [dword_4D4C6C], esi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_4234C0 endp

sub_423520: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	mov ecx, eax
	cmp dword [dword_4D4C68], 0
	jnz loc_423632

loc_423535:
	mov edi, [ecx+8]
	mov ebp, [ecx+0Ch]
	mov esi, [ecx+4]
	test ebp, ebp
	jz loc_42354D
	cmp esi, 1
	jle loc_42365A
	add esi, ebp

loc_42354D:
	mov ebx, aCNfs2seFron_12 ; "c:\\nfs2se\\frontend\\pc\\editor.c"
	mov ebp, 74h
	mov edx, 10C8h
	mov eax, aEdit ; "edit"
	mov dword [dword_4DB1D8], ebx
	mov ebx, 20h
	mov dword [dword_4DB1DC], ebp
	call sub_484498
	mov dword [dword_4D4C68], eax
	test eax, eax
	jnz loc_4235A7
	push 10C8h
	mov eax, aCNfs2seFron_12 ; "c:\\nfs2se\\frontend\\pc\\editor.c"
	mov edx, 76h
	push aOutOfMemoryReq ; "Out of Memory, requested (%d)\n"
	mov dword [dword_4DB1D8], eax
	mov dword [dword_4DB1DC], edx
	call sub_4840F0
	add esp, 8

loc_4235A7:
	mov edx, 10C8h
	mov eax, dword [dword_4D4C68]
	mov ebx, 20h
	call sub_48A01C
	mov edx, dword [dword_4D4C68]
	mov eax, ecx
	add edx, 8
	call sub_48A980
	mov eax, dword [dword_4D4C68]
	mov ebx, aCNfs2seFron_12 ; "c:\\nfs2se\\frontend\\pc\\editor.c"
	mov edx, 180h
	mov [eax+4], esi
	mov dword [dword_4DB1D8], ebx
	mov [eax], edi
	mov esi, 80h
	mov ebx, 20h
	mov eax, aEdittext ; "edittext"
	mov dword [dword_4DB1DC], esi
	call sub_484498
	mov dword [dword_4D4C6C], eax
	test eax, eax
	jz loc_423661

loc_423608:
	mov edx, 180h
	mov eax, dword [dword_4D4C6C]
	call sub_48A01C
	mov eax, dword [dword_4D4C6C]
	mov edx, [ecx+4]
	mov [eax], edx
	mov dword [dword_4D4C70], 1
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_423632:
	mov ebx, aCNfs2seFron_12 ; "c:\\nfs2se\\frontend\\pc\\editor.c"
	mov esi, 5Fh
	push aEditorAlreadyO ; "Editor already open - "
	mov dword [dword_4DB1D8], ebx
	mov dword [dword_4DB1DC], esi
	call sub_4840F0
	add esp, 4
	jmp loc_423535

loc_42365A:
	add edi, ebp
	jmp loc_42354D

loc_423661:
	push 180h
	mov edi, aCNfs2seFron_12 ; "c:\\nfs2se\\frontend\\pc\\editor.c"
	mov ebp, 82h
	push aOutOfMemoryReq ; "Out of Memory, requested (%d)\n"
	mov dword [dword_4DB1D8], edi
	mov dword [dword_4DB1DC], ebp
	call sub_4840F0
	add esp, 8
	jmp loc_423608
;sub_423520 endp

sub_423690: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	sub esp, 900h
	mov edx, esp
	mov eax, a_num ; "*.num"
	xor ebx, ebx
	call sub_4099A0
	xor edx, edx
	call sub_401090
	mov edx, eax
	shl eax, 3
	mov ecx, esp
	add eax, edx
	add ecx, eax
	push ecx
	mov ebx, dword [dword_5134C0]
	push ebx
	push aSS_num ; "%s%s.num"
	lea eax, [esp+8D8h]
	push eax
	call sprintf_
	add esp, 10h
	cmp edx, 0FFFFFFFFh
	jnz loc_4236E5

loc_4236DB:
	add esp, 900h
	pop edx
	pop ecx
	pop ebx
	ret

loc_4236E5:
	push 2F7h
	push 1
	call sub_401AE0
	add esp, 8
	test eax, eax
	jz loc_4236DB
	lea eax, [esp+8CCh]
	call sub_4879AE
	mov eax, 2F8h
	mov edx, word_512F86
	call sub_402CD0
	mov eax, ecx
	call strcmp_
	test eax, eax
	jnz loc_4236DB
	push edi
	push esi
	mov esi, dword_4C9BA4
	mov edi, byte_512F5E
	push edi

loc_42372B:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_423743
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_42372B

loc_423743:
	pop edi
	pop esi
	pop edi
	add esp, 900h
	pop edx
	pop ecx
	pop ebx
	ret
;sub_423690 endp

sub_423750: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	sub esp, 0A74h
	mov eax, 2EAh
	mov edx, esp
	call sub_41B710
	mov ebx, eax
	mov eax, a_num ; "*.num"
	call sub_4099A0
	xor edx, edx
	call sub_401090
	cmp eax, 0FFFFFFFFh
	jz loc_4237B6
	test eax, eax
	jnz loc_423917
	mov ecx, 1
	mov ebx, 14h
	xor ah, ah
	mov edx, 2EBh
	mov [esp+9D4h], ah
	mov [esp+0A24h], ah
	lea eax, [esp+0A24h]
	call sub_402460
	test eax, eax
	jnz loc_4237C2

loc_4237B6:
	add esp, 0A74h
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4237C2:
	mov ecx, 2
	mov ebx, 8
	xor dh, dh
	lea eax, [esp+9D4h]
	mov [esp+9D4h], dh
	mov edx, 2E7h
	call sub_402460
	test eax, eax
	jz loc_4237B6
	lea eax, [esp+9D4h]
	push eax
	mov ecx, dword [dword_5134C0]
	push ecx
	push aSS_num ; "%s%s.num"
	lea eax, [esp+8E0h]
	push eax
	call sprintf_
	add esp, 10h
	lea eax, [esp+8D4h]
	call sub_488570
	test eax, eax
	jz loc_4238AC
	push 2F9h
	push 1
	call sub_401AE0
	add esp, 8
	test eax, eax
	jz loc_4237B6
	lea eax, [esp+8D4h]
	lea edx, [esp+0A24h]
	lea esi, [esp+0A24h]
	call sub_4879AE
	lea eax, [esp+8D4h]
	mov edi, byte_512F5E
	call sub_4239F0
	push edi

loc_423861:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_423879
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_423861

loc_423879:
	pop edi
	lea esi, [esp+9D4h]
	mov edi, word_512F86
	push edi

loc_423887:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_42389F
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_423887

loc_42389F:
	pop edi
	add esp, 0A74h
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4238AC:
	lea edx, [esp+0A24h]
	lea eax, [esp+8D4h]
	lea esi, [esp+0A24h]
	mov edi, byte_512F5E
	call sub_4239F0
	push edi

loc_4238CC:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_4238E4
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_4238CC

loc_4238E4:
	pop edi
	lea esi, [esp+9D4h]
	mov edi, word_512F86
	push edi

loc_4238F2:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_42390A
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_4238F2

loc_42390A:
	pop edi
	add esp, 0A74h
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_423917:
	mov edx, eax
	shl eax, 3
	mov ecx, esp
	add eax, edx
	add ecx, eax
	push ecx
	mov edx, dword [dword_5134C0]
	push edx
	push aSS_num ; "%s%s.num"
	lea eax, [esp+8E0h]
	push eax
	lea esi, [esp+0A34h]
	lea edx, [esp+0A34h]
	call sprintf_
	add esp, 10h
	lea eax, [esp+8D4h]
	mov edi, byte_512F5E
	call sub_4239B0
	push edi

loc_42395F:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_423977
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_42395F

loc_423977:
	pop edi
	mov edi, word_512F86
	mov esi, ecx
	push edi

loc_423980:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_423998
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_423980

loc_423998:
	pop edi
	add esp, 0A74h
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_423750 endp

sub_4239B0: ;SUBROUTINE
	push edi
	mov edi, edx
	xor edx, edx
	call sub_486F40
	mov edx, eax
	test eax, eax
	jnz loc_4239C2
	pop edi
	ret

loc_4239C2:
	push esi
	mov esi, eax
	push edi

loc_4239C6:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_4239DE
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_4239C6

loc_4239DE:
	pop edi
	mov eax, edx
	call sub_4848FC
	pop esi
	pop edi
	ret
;sub_4239B0 endp

sub_4239F0: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	mov esi, eax
	mov edi, edx
	sub ecx, ecx
	dec ecx
	xor eax, eax
	repne scasb
	not ecx
	dec ecx
	lea ebx, [ecx+1]
	mov eax, esi
	call sub_4875B0
	test eax, eax
	jz loc_423A15
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_423A15:
	mov eax, 2F3h
	call sub_402CD0
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_4239F0 endp

sub_423B70: ;SUBROUTINE
	mov eax, dword [dword_4E8960]
	ret
;sub_423B70 endp

sub_423B90: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	mov ebx, dword_4D4C80
	mov edx, dword_4D4C7C
	mov eax, dword_4D4C84
	call sub_422060
	cmp dword [dword_4E8AF8], 0
	jz loc_423BCC
	mov ecx, dword [dword_4D4C7C]
	cmp ecx, dword [dword_4E8B00]
	jnz loc_423BE4
	mov ebx, dword [dword_4D4C80]
	cmp ebx, dword [dword_4E8B04]
	jnz loc_423BE4

loc_423BCC:
	mov eax, dword [dword_4D4C7C]
	mov dword [dword_4E8B00], eax
	mov eax, dword [dword_4D4C80]
	mov dword [dword_4E8B04], eax
	pop edx
	pop ecx
	pop ebx
	ret

loc_423BE4:
	push 2
	call sub_497680
	call sub_49769C
	mov eax, dword [dword_4D4D24]
	call sub_4825A8
	mov eax, dword [dword_4D4D24]
	mov eax, [eax+20h]
	call sub_426B70
	mov eax, dword [dword_4D4C7C]
	mov edx, dword [dword_4D4C80]
	sub eax, 7
	call sub_4267C0
	call sub_4976B8
	jmp loc_423BCC
;sub_423B90 endp

sub_423C40: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push edi
	push ebp
	mov edx, dword [dword_4D4C78]
	test edx, edx
	jnz loc_423C7A

loc_423C4F:
	mov ebx, dword [dword_4E8AF8]
	test ebx, ebx
	jz loc_423C6A
	push esi
	mov eax, ebx
	xor esi, esi
	call sub_482DA0
	mov dword [dword_4E8AF8], esi
	pop esi

loc_423C6A:
	mov edi, dword [dword_4E8AFC]
	test edi, edi
	jnz loc_423C8B
	pop ebp
	pop edi
	pop edx
	pop ecx
	pop ebx
	ret

loc_423C7A:
	mov eax, edx
	xor ecx, ecx
	call sub_4848FC
	mov dword [dword_4D4C78], ecx
	jmp loc_423C4F

loc_423C8B:
	mov eax, edi
	xor ebp, ebp
	call sub_482DA0
	mov dword [dword_4E8AFC], ebp
	pop ebp
	pop edi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_423C40 endp

sub_423CA0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	mov ebx, dword [dword_4D4C7C]
	mov esi, dword [dword_4D4C80]
	mov di, word [word_4E8C06]
	mov ebp, eax
	xor eax, eax
	xor ecx, ecx

loc_423CBF:
	movsx edx, di
	cmp ecx, edx
	jge loc_423D79
	mov edx, dword dword_4E8AA6[eax]
	sar edx, 10h
	cmp esi, edx
	jg loc_423CDD

loc_423CD7:
	inc ecx
	add eax, 2
	jmp loc_423CBF

loc_423CDD:
	mov edx, dword (dword_4E8964+2)[eax]
	sar edx, 10h
	cmp esi, edx
	jge loc_423CD7
	mov edx, dword dword_4E8A56[eax]
	sar edx, 10h
	cmp ebx, edx
	jle loc_423CD7
	mov edx, dword dword_4E8A06[eax]
	sar edx, 10h
	cmp ebx, edx
	jge loc_423CD7
	mov dword [dword_4D4C7C], ebx
	mov dword [dword_4D4C80], esi
	mov word [word_4E8C06], di
	mov edx, [ebp+8]
	mov eax, dword dword_4E89B6[eax]
	sar edx, 10h
	sar eax, 10h
	cmp eax, edx
	jz loc_423D39
	mov eax, [ebp+eax*4+0Ch]
	cmp byte [eax], 2
	jnz loc_423D4A
	test byte [eax+8], 1
	jz loc_423D4A

loc_423D39:
	xor ecx, ecx
	mov ebx, dword [dword_4D4C7C]
	mov eax, ecx
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_423D4A:
	mov edx, 2Dh
	mov eax, 1
	call sub_4423F0
	mov ax, word (dword_4E89B6+2)[ecx*2]
	mov ecx, 1
	mov [ebp+0Ah], ax
	mov ebx, dword [dword_4D4C7C]
	mov eax, ecx
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_423D79:
	cmp word [ebp+0Ah], 64h
	jz loc_423D91
	mov eax, [ebp+8]
	sar eax, 10h
	mov word [ebp+0Ah], 64h
	mov dword [dword_4E8B08], eax

loc_423D91:
	mov dword [dword_4D4C7C], ebx
	mov dword [dword_4D4C80], esi
	mov word [word_4E8C06], di
	xor ecx, ecx
	mov ebx, dword [dword_4D4C7C]
	mov eax, ecx
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_423CA0 endp

sub_423DC0: ;SUBROUTINE
	push esi
	push ebp
	mov esi, dword [dword_4D4C80]
	cmp edx, esi
	jge loc_423DEA
	add edx, ecx
	cmp edx, esi
	jle loc_423DEA
	mov ebp, dword [dword_4D4C7C]
	cmp eax, ebp
	jge loc_423DEA
	add eax, ebx
	cmp eax, ebp
	jle loc_423DEA
	mov eax, 1
	pop ebp
	pop esi
	ret

loc_423DEA:
	xor eax, eax
	pop ebp
	pop esi
	ret
;sub_423DC0 endp

sub_423DF0: ;SUBROUTINE
	push ecx
	mov ecx, edx
	mov edx, dword [dword_4D4C80]
	cmp eax, edx
	jle loc_423E04
	mov eax, 0FFFFFFFFh
	pop ecx
	ret

loc_423E04:
	sub edx, eax
	dec edx
	mov eax, edx
	sar edx, 1Fh
	idiv ecx
	pop ecx
	ret
;sub_423DF0 endp

sub_423E10: ;SUBROUTINE
	push ebx
	push edx
	mov edx, [eax+8]
	sar edx, 10h
	mov edx, [eax+edx*4+0Ch]
	cmp byte [edx], 2
	jz loc_423E34

loc_423E21:
	mov edx, dword [dword_4D4C80]
	mov eax, dword [dword_4D4C7C]
	call sub_4222F0
	pop edx
	pop ebx
	ret

loc_423E34:
	mov eax, [edx]
	sar eax, 10h
	call sub_41B670
	add eax, 3
	mov dword [dword_4D4C7C], eax
	mov eax, [edx]
	sar eax, 10h
	call sub_41B650
	add eax, 0Dh
	mov bl, [edx+9]
	mov dword [dword_4D4C80], eax
	cmp bl, 0Dh
	jnz loc_423E73
	cmp byte [byte_512DA8], 0
	jz loc_423E73
	add dword [dword_4D4C7C], 9Fh

loc_423E73:
	test byte [edx+8], 10h
	jz loc_423E21
	add dword [dword_4D4C7C], 2Eh
	mov edx, dword [dword_4D4C80]
	mov eax, dword [dword_4D4C7C]
	call sub_4222F0
	pop edx
	pop ebx
	ret
;sub_423E10 endp

sub_423EA0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 104h
	mov ebp, eax
	cmp dword [dword_4D4C78], 0
	jz loc_423F92

loc_423EBB:
	mov edx, aPtr0 ; "ptr0"
	mov eax, dword [dword_4D4C78]
	call sub_482EB4
	mov edx, ebp
	mov ecx, eax
	call sub_426890
	mov ebx, dword [dword_4E8AF8]
	mov edi, [ecx+2]
	mov ecx, [ecx+4]
	sar edi, 10h
	sar ecx, 10h
	inc edi
	inc ecx
	test ebx, ebx
	jz loc_423EF2
	mov eax, ebx
	call sub_482DA0

loc_423EF2:
	lea edx, [ecx+0Ah]
	lea eax, [edi+0Ah]
	xor ebx, ebx
	call sub_482474
	mov esi, dword [dword_4E8AFC]
	mov dword [dword_4E8AF8], eax
	test esi, esi
	jz loc_423F15
	mov eax, esi
	call sub_482DA0

loc_423F15:
	lea edx, [ecx+0Ah]
	lea eax, [edi+0Ah]
	xor ebx, ebx
	call sub_482474
	mov dword [dword_4E8AFC], eax
	mov ebx, ebp
	xor edx, edx
	mov eax, dword [dword_4E8AF8]
	xor edi, edi
	call sub_4825A8
	mov [esp+100h], edi
	mov eax, [ebp+0Ch]
	mov word [word_4E8C06], dx
	test eax, eax
	jz loc_423F6E

loc_423F4C:
	mov edx, [ebx+0Ch]
	mov al, [edx]
	cmp al, 1
	jnb loc_423FC4

loc_423F55:
	mov edx, [esp+100h]
	mov ecx, [ebx+10h]
	inc edx
	add ebx, 4
	mov [esp+100h], edx
	test ecx, ecx
	jnz loc_423F4C

loc_423F6E:
	call sub_4824BC
	mov eax, ebp
	mov edi, sub_4242E0
	call sub_423E10
	mov dword [off_4DAC4C], edi
	add esp, 104h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_423F92:
	mov ecx, dword [dword_5134B4]
	push ecx
	push aSmouse_fsh ; "%smouse.fsh"
	push dword_4E8B0C
	call sprintf_
	add esp, 0Ch
	mov edx, 20h
	mov eax, dword_4E8B0C
	call sub_486F40
	mov dword [dword_4D4C78], eax
	jmp loc_423EBB

loc_423FC4:
	ja loc_424072
	test byte [edx+2], 1
	jnz loc_423F55
	mov eax, dword [byte_4E8C04]
	mov ecx, [esp+100h]
	sar eax, 10h
	add edx, 4
	mov word (dword_4E89B6+2)[eax*2], cx
	mov eax, dword [dword_4D40B8]
	call sub_482EB4
	mov ecx, eax
	cmp ebp, off_4D3CFC
	jnz loc_424230
	call sub_41A210

loc_424007:
	mov edx, [ecx+0Ch]
	shl edx, 4
	movsx edi, ax
	sar edx, 14h
	add edx, edi
	mov esi, edx
	mov edx, dword [byte_4E8C04]
	sar edx, 10h
	mov word (dword_4E8AA6+2)[edx*2], si
	add si, [ecx+6]
	add eax, esi
	mov word word_4E8968[edx*2], ax
	mov eax, [ecx+0Ch]
	shl eax, 14h
	sar eax, 14h
	mov word (dword_4E8A56+2)[edx*2], ax
	add ax, [ecx+4]
	mov di, word [word_4E8C06]
	mov word (dword_4E8A06+2)[edx*2], ax
	cmp di, 28h
	jge loc_423F55
	mov eax, edi
	inc eax
	mov word [word_4E8C06], ax
	jmp loc_423F55

loc_424072:
	cmp al, 2
	jnz loc_423F55
	mov eax, dword [byte_4E8C04]
	sar eax, 10h
	mov ecx, [esp+100h]
	mov word (dword_4E89B6+2)[eax*2], cx
	mov eax, [edx]
	sar eax, 10h
	mov edi, esp
	call sub_41B710
	mov esi, eax
	push edi

loc_4240A0:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_4240B8
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_4240A0

loc_4240B8:
	pop edi
	mov eax, [edx]
	sar eax, 10h
	call sub_41B650
	mov ecx, dword [byte_4E8C04]
	sar ecx, 10h
	mov word (dword_4E8AA6+2)[ecx*2], ax
	mov eax, [edx]
	sar eax, 10h
	call sub_41B6F0
	mov si, word (dword_4E8AA6+2)[ecx*2]
	mov ecx, eax
	mov eax, dword [byte_4E8C04]
	add ecx, esi
	sar eax, 10h
	add ecx, 0Ch
	mov word word_4E8968[eax*2], cx
	mov eax, [edx]
	sar eax, 10h
	call sub_41B6F0
	call sub_4056F0
	mov eax, [edx]
	sar eax, 10h
	call sub_41B690
	cmp eax, 1
	jnz loc_4241E6

loc_42411F:
	mov eax, [edx]
	sar eax, 10h
	call sub_41B670
	mov ecx, dword [byte_4E8C04]
	sar ecx, 10h
	add eax, 0Ch
	mov word (dword_4E8A06+2)[ecx*2], ax
	mov eax, esp
	call sub_482424
	mov cx, word (dword_4E8A06+2)[ecx*2]
	sub ecx, eax
	mov eax, dword [byte_4E8C04]
	sar eax, 10h
	sub ecx, 0Ch
	mov word (dword_4E8A56+2)[eax*2], cx

loc_424163:
	cmp byte [edx+9], 12h
	jnz loc_42417B
	mov eax, dword [byte_4E8C04]
	sar eax, 10h
	add word (dword_4E8A06+2)[eax*2], 12Ch

loc_42417B:
	cmp byte [edx+9], 0Dh
	jnz loc_424193
	mov eax, dword [byte_4E8C04]
	sar eax, 10h
	add word (dword_4E8A06+2)[eax*2], 0F0h

loc_424193:
	cmp dword [edx+0Ch], 0
	jz loc_4241B0
	test byte [edx+8], 8
	jnz loc_4241B0
	mov eax, dword [byte_4E8C04]
	sar eax, 10h
	add word (dword_4E8A06+2)[eax*2], 78h

loc_4241B0:
	cmp byte [edx+9], 5
	jnz loc_4241C7
	mov eax, dword [byte_4E8C04]
	sar eax, 10h
	add word (dword_4E8A06+2)[eax*2], 6Eh

loc_4241C7:
	mov ax, word [word_4E8C06]
	cmp ax, 28h
	jge loc_423F55
	mov edx, eax
	inc edx
	mov word [word_4E8C06], dx
	jmp loc_423F55

loc_4241E6:
	cmp eax, 4
	jz loc_42411F
	mov eax, [edx]
	sar eax, 10h
	call sub_41B670
	mov ecx, dword [byte_4E8C04]
	sar ecx, 10h
	mov word (dword_4E8A56+2)[ecx*2], ax
	mov eax, esp
	call sub_482424
	mov cx, word (dword_4E8A56+2)[ecx*2]
	add ecx, eax
	mov eax, dword [byte_4E8C04]
	sar eax, 10h
	mov word (dword_4E8A06+2)[eax*2], cx
	jmp loc_424163

loc_424230:
	xor eax, eax
	jmp loc_424007
;sub_423EA0 endp

sub_424240: ;SUBROUTINE
	push ebx
	push edx
	mov ebx, dword_4D4C80
	mov edx, dword_4D4C7C
	mov eax, dword_4D4C84
	call sub_422060
	cmp dword [dword_4D4C88], 0
	jnz loc_424264
	xor eax, eax
	pop edx
	pop ebx
	ret

loc_424264:
	push ecx
	xor ecx, ecx
	mov eax, 1
	mov dword [dword_4D4C88], ecx
	pop ecx
	pop edx
	pop ebx
	ret
;sub_424240 endp

sub_424280: ;SUBROUTINE
	push ebx
	push edx
	mov ebx, dword_4D4C80
	mov edx, dword_4D4C7C
	mov eax, dword_4D4C84
	call sub_422060
	cmp dword [dword_4D4C88], 0
	jnz loc_4242A4
	xor eax, eax
	pop edx
	pop ebx
	ret

loc_4242A4:
	push ecx
	xor ecx, ecx
	mov eax, 1
	mov dword [dword_4D4C88], ecx
	pop ecx
	pop edx
	pop ebx
	ret
;sub_424280 endp

sub_4242C0: ;SUBROUTINE
	mov dword [dword_4E8B00], eax
	mov dword [dword_4D4C7C], eax
	mov dword [dword_4E8B04], edx
	mov dword [dword_4D4C80], edx
	jmp sub_4222F0
;sub_4242C0 endp

sub_4242E0: ;SUBROUTINE
	inc dword [dword_4D4C88]
	ret
;sub_4242E0 endp

sub_4242F0: ;SUBROUTINE
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 0FCh
	mov edx, eax
	mov edi, esp
	mov esi, dword [dword_5134D8]
	push edi

loc_424306:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_42431E
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_424306

loc_42431E:
	pop edi
	mov edi, esp
	mov esi, edx
	push edi
	sub ecx, ecx
	dec ecx
	mov al, 0
	repne scasb
	dec edi

loc_42432C:
	mov al, [esi]
	mov [edi], al
	cmp al, 0
	jz loc_424344
	mov al, [esi+1]
	add esi, 2
	mov [edi+1], al
	add edi, 2
	cmp al, 0
	jnz loc_42432C

loc_424344:
	pop edi
	mov eax, esp
	call sub_488570
	test eax, eax
	jz loc_42454B
	push ebx
	call sub_486F28
	call sub_428730
	lea edx, [esp+4]
	lea eax, [esp+4]
	call sub_493728
	mov edx, 2000h
	mov eax, 80000h
	mov ebx, dword [dword_4DABE8]
	call sub_493718
	mov ebx, 40000h
	mov edx, 0FFFF0000h
	mov ecx, dword [dword_4DABE8]
	mov esi, eax
	mov edi, eax
	mov eax, 53430000h
	call sub_493E90
	lea edx, [esp+4]
	mov ebp, eax
	mov eax, esi
	call sub_493BB4
	mov eax, dword [dword_5637F4]
	mov dword [dword_4EB570], eax

loc_4243B6:
	mov eax, edi
	call sub_4246A0
	mov esi, eax
	test eax, eax
	jnz loc_4243DD
	mov eax, dword [dword_5637F4]
	mov ebx, dword [dword_4EB570]
	mov edx, eax
	mov eax, dword [dword_4DABCC]
	sub edx, ebx
	add eax, eax
	cmp edx, eax
	jle loc_4243B6

loc_4243DD:
	test esi, esi
	jnz loc_42457F

loc_4243E5:
	mov eax, aCNfs2seFron_10 ; "c:\\nfs2se\\frontend\\pc\\movilite.c"
	mov edx, 185h
	push aShowdctNoDctCh ; "SHOWDCT: No DCT chunks found!\n"
	mov dword [dword_4DB1D8], eax
	mov dword [dword_4DB1DC], edx
	call sub_4840F0
	add esp, 4

loc_424407:
	mov ebx, 0C8h
	mov edx, [esi+0Ch]
	mov eax, [esi+0Ah]
	sar edx, 10h
	sar eax, 10h
	xor ecx, ecx
	call sub_424970
	mov edx, 0Fh
	mov dword [dword_4EB580], ecx
	mov dword [dword_4EB560], ecx
	mov dword [dword_4EB558], ecx
	mov dword [dword_4EB550], ecx
	mov dword [dword_4EB55C], ecx
	push ecx
	mov eax, ebp
	mov ecx, 40000h
	call sub_495780
	mov dword [dword_4EB568], eax
	cmp eax, 2
	jle loc_42459D
	mov edx, 0FFFFFFFFh
	mov eax, 0Fh
	call sub_495854
	mov ecx, eax
	mov eax, dword [dword_5637F4]
	mov dword [dword_4EB570], eax
	xor ebx, ebx

loc_42447A:
	mov eax, ecx
	call sub_486040
	test eax, eax
	jnz loc_424598
	mov eax, dword [dword_4EB55C]
	cmp ebx, eax
	jnz loc_424598
	call sub_483EB0
	call sub_4958A0
	cmp eax, dword [dword_4EB580]
	jle loc_4244B7
	mov dword [dword_4EB580], eax
	mov eax, dword [dword_5637F4]
	mov dword [dword_4EB570], eax

loc_4244B7:
	test esi, esi
	jnz loc_4244C4
	mov eax, edi
	call sub_4246A0
	mov esi, eax

loc_4244C4:
	test esi, esi
	jz loc_424514
	cmp esi, 0FFFFFFFFh
	jz loc_424514
	mov edx, dword [dword_4EB580]
	mov eax, dword [dword_4EB560]
	sub eax, edx
	cmp eax, 1
	jge loc_424514
	mov eax, edx
	sub eax, dword [dword_4EB560]
	cmp eax, 2
	jge loc_42458D
	mov eax, esi
	call sub_4248D0
	call sub_424710

loc_4244FC:
	mov edx, esi
	mov eax, edi
	call sub_495500
	mov edx, dword [dword_4EB560]
	inc edx
	mov esi, ebx
	mov dword [dword_4EB560], edx

loc_424514:
	call sub_424DE0
	mov eax, dword [dword_5637F4]
	mov edx, dword [dword_4EB570]
	sub eax, edx
	mov edx, eax
	mov eax, dword [dword_4DABCC]
	add eax, eax
	cmp edx, eax
	jle loc_42447A
	mov eax, 1
	mov dword [dword_4EB55C], eax
	mov dword [dword_4EB550], eax
	jmp loc_42447A

loc_42454B:
	mov edx, aCNfs2seFron_10 ; "c:\\nfs2se\\frontend\\pc\\movilite.c"
	mov ecx, 16Bh
	push aMovieFileNotFo ; "MOVIE FILE NOT FOUND"
	mov dword [dword_4DB1D8], edx
	mov dword [dword_4DB1DC], ecx
	call sub_4840F0
	mov eax, 1
	add esp, 4
	add esp, 0FCh
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	ret

loc_42457F:
	cmp esi, 0FFFFFFFFh
	jz loc_4243E5
	jmp loc_424407

loc_42458D:
	inc dword [dword_4EB558]
	jmp loc_4244FC

loc_424598:
	call sub_495990

loc_42459D:
	xor eax, eax
	call sub_4833E7
	mov eax, dword [dword_5637F4]
	mov dword [dword_4EB570], eax
	cmp esi, 0FFFFFFFFh
	jz loc_424675

loc_4245B7:
	cmp dword [dword_4EB55C], 0
	jnz loc_424675
	mov eax, ebp
	call sub_4246E0
	test eax, eax
	jz loc_4245DD
	cmp eax, 0FFFFFFFFh
	jz loc_4245DD
	mov edx, eax
	mov eax, ebp
	call sub_495500

loc_4245DD:
	test esi, esi
	jnz loc_4245EA
	mov eax, edi
	call sub_4246A0
	mov esi, eax

loc_4245EA:
	test esi, esi
	jz loc_42463C
	cmp esi, 0FFFFFFFFh
	jz loc_42463C
	call sub_4833F3
	mov eax, dword [dword_4DABCC]
	mov edx, eax
	mov ecx, 0Fh
	sar edx, 1Fh
	idiv ecx
	call sub_4833E7
	mov eax, dword [dword_5637F4]
	mov dword [dword_4EB570], eax
	mov eax, esi
	mov edx, esi
	call sub_4248D0
	call sub_424710
	mov eax, edi
	call sub_495500
	mov ebx, dword [dword_4EB560]
	inc ebx
	xor esi, esi
	mov dword [dword_4EB560], ebx

loc_42463C:
	call sub_424DE0
	mov eax, dword [dword_5637F4]
	mov edx, dword [dword_4EB570]
	sub eax, edx
	mov edx, eax
	mov eax, dword [dword_4DABCC]
	add eax, eax
	cmp edx, eax
	jle loc_42466C
	mov ecx, 1
	mov dword [dword_4EB55C], ecx
	mov dword [dword_4EB550], ecx

loc_42466C:
	cmp esi, 0FFFFFFFFh
	jnz loc_4245B7

loc_424675:
	call sub_424890
	mov eax, edi
	call sub_4939AC
	call sub_4286B0
	call sub_486F28
	mov eax, dword [dword_4EB55C]
	pop ebx
	add esp, 0FCh
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	ret
;sub_4242F0 endp

sub_4246A0: ;SUBROUTINE
	push ecx
	push edx
	mov ecx, eax
	call sub_4246E0
	mov edx, eax
	cmp eax, 0FFFFFFFFh
	jz loc_4246BF
	test eax, eax
	jz loc_4246BF
	cmp dword [eax], 4443546Dh
	jnz loc_4246C4
	pop edx
	pop ecx
	ret

loc_4246BF:
	mov eax, edx
	pop edx
	pop ecx
	ret

loc_4246C4:
	mov edx, eax
	mov eax, ecx
	call sub_495500
	xor eax, eax
	pop edx
	pop ecx
	ret
;sub_4246A0 endp

sub_4246E0: ;SUBROUTINE
	push ecx
	push edx
	mov ecx, eax
	call sub_4953DC
	cmp eax, 0FFFFFFFFh
	jz loc_4246F2
	test eax, eax
	jz loc_4246F5

loc_4246F2:
	pop edx
	pop ecx
	ret

loc_4246F5:
	mov edx, eax
	mov eax, ecx
	call sub_49558C
	test eax, eax
	jz loc_4246F2
	mov eax, 0FFFFFFFFh
	pop edx
	pop ecx
	ret
;sub_4246E0 endp

sub_424710: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 24h
	mov eax, dword [dword_4EB54C]
	call sub_4825A8
	push 2
	call sub_497680
	call sub_49769C
	xor edx, edx
	mov ecx, dword [dword_4EB554]
	mov [esp], edx
	test ecx, ecx
	jle loc_424877
	mov ecx, dword_4E8D4C
	mov [esp+8], edx
	mov [esp+4], edx
	mov [esp+0Ch], ecx

loc_424755:
	mov ebp, dword [dword_4EB564]
	xor edi, edi
	test ebp, ebp
	jle loc_42483E
	mov eax, [esp+4]
	mov [esp+14h], eax
	mov eax, [esp+0Ch]
	mov ebp, [esp+0Ch]
	mov [esp+10h], eax
	add eax, 20h
	mov esi, [esp+8]
	mov [esp+20h], eax
	mov eax, [esp+0Ch]
	mov [esp+1Ch], edi
	add eax, 40h
	add ebp, 60h
	mov [esp+18h], eax

loc_424796:
	push 0
	mov edx, [esp+18h]
	mov eax, dword [dword_4EB56C]
	mov ecx, dword [dword_4EB578]
	mov ebx, dword [dword_4EB574]
	push eax
	mov eax, [esp+24h]
	neg edx
	neg eax
	call sub_492F98
	mov eax, dword [dword_4EB54C]
	mov eax, [eax+20h]
	push 0
	add eax, 10h
	push eax
	mov edx, dword dword_4E8C0C[esi]
	push edx
	call sub_49755C
	mov ecx, dword dword_4E8C0C[esi]
	push ecx
	add esi, 4
	mov ebx, [esp+14h]
	call sub_4975E8
	mov edx, [esp+18h]
	push ebp
	mov ecx, [esp+24h]
	mov eax, edi
	push edx
	shl eax, 7
	push ecx
	add eax, ebx
	add ebp, 80h
	push eax
	inc edi
	mov ebx, [esp+30h]
	call sub_497B24
	mov eax, [esp+18h]
	mov edx, [esp+1Ch]
	add ebx, 80h
	mov ecx, dword [dword_4EB564]
	mov [esp+20h], ebx
	add eax, 80h
	add edx, 40h
	mov [esp+18h], eax
	mov [esp+1Ch], edx
	cmp edi, ecx
	jl loc_424796

loc_42483E:
	mov ebx, [esp+0Ch]
	mov esi, [esp+8]
	mov edi, [esp+4]
	mov ebp, [esp]
	mov edx, dword [dword_4EB554]
	add ebx, 500h
	add esi, 28h
	add edi, 40h
	inc ebp
	mov [esp+0Ch], ebx
	mov [esp+8], esi
	mov [esp+4], edi
	mov [esp], ebp
	cmp ebp, edx
	jl loc_424755

loc_424877:
	call sub_4976B8
	add esp, 24h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_424710 endp

sub_424890: ;SUBROUTINE
	push ecx
	push edx
	mov eax, dword [dword_4EB574]
	call sub_4848FC
	mov eax, dword [dword_4EB57C]
	call sub_4848FC
	push 0
	call sub_4976C8
	call sub_4975B0
	mov eax, dword [dword_4EB54C]
	call sub_482DA0
	pop edx
	pop ecx
	ret
;sub_424890 endp

sub_4248D0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	mov ecx, eax
	mov edx, dword [dword_4EB57C]
	mov ebx, [eax+14h]
	add eax, 18h
	sar ebx, 10h
	call sub_492A1C
	mov eax, [ecx+12h]
	sar eax, 10h
	xor esi, esi
	call sub_4929D4
	mov edx, dword [dword_4EB578]
	xor ebp, ebp
	test edx, edx
	jle loc_42495D

loc_424905:
	mov ebx, dword [dword_4EB56C]
	xor ecx, ecx
	test ebx, ebx
	jle loc_424950

loc_424911:
	mov ebx, dword [dword_4EB578]
	mov edx, ecx
	imul edx, ebx
	add edx, ebp
	mov eax, edx
	sar edx, 1Fh
	sub eax, edx
	sar eax, 1
	mov edx, dword [dword_4EB574]
	shl eax, 2
	lea edi, [esi+esi]
	add edx, eax
	mov eax, dword [dword_4EB57C]
	add eax, edi
	add ecx, 10h
	call sub_492A40
	mov edi, dword [dword_4EB56C]
	add esi, eax
	cmp ecx, edi
	jl loc_424911

loc_424950:
	mov ecx, dword [dword_4EB578]
	add ebp, 10h
	cmp ebp, ecx
	jl loc_424905

loc_42495D:
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_4248D0 endp

sub_424970: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	mov ebp, esp
	sub esp, 3Ch
	and esp, 0FFFFFFF8h
	mov [esp+4], eax
	mov [esp+8], edx
	mov dword [dword_4EB578], eax
	mov dword [dword_4EB56C], edx
	mov edx, 280h
	lea esi, [eax+eax]
	sub edx, esi
	mov eax, edx
	sar edx, 1Fh
	sub eax, edx
	sar eax, 1
	mov edx, [esp+8]
	mov [esp+1Ch], eax
	mov eax, 1E0h
	add edx, edx
	sub eax, edx
	mov edx, eax
	sar edx, 1Fh
	sub eax, edx
	sar eax, 1
	mov edi, [esp+8]
	imul esi, edi
	mov ecx, 7Fh
	mov ebx, dword [dword_4DABE8]
	mov edx, aCNfs2seFron_10 ; "c:\\nfs2se\\frontend\\pc\\movilite.c"
	mov [esp], eax
	mov eax, aShowdct ; "SHOWDCT"
	mov dword [dword_4DB1D8], edx
	mov edx, esi
	mov dword [dword_4DB1DC], ecx
	call sub_484498
	mov edx, 80h
	mov ebx, dword [dword_4DABE8]
	mov dword [dword_4EB574], eax
	mov eax, aCNfs2seFron_10 ; "c:\\nfs2se\\frontend\\pc\\movilite.c"
	mov dword [dword_4DB1DC], edx
	mov dword [dword_4DB1D8], eax
	mov edx, esi
	mov eax, aShowdct ; "SHOWDCT"
	call sub_484498
	mov ebx, 10h
	mov edx, 40h
	mov ecx, dword [dword_4DABE8]
	mov dword [dword_4EB57C], eax
	mov eax, edx
	call sub_492820
	push 0
	mov dword [dword_4EB54C], eax
	call sub_4976C8
	call sub_4975B0
	mov edx, [esp+4]
	add edx, 3Fh
	mov eax, edx
	sar edx, 1Fh
	shl edx, 6
	sbb eax, edx
	sar eax, 6
	lea edx, [edi+3Fh]
	mov dword [dword_4EB564], eax
	mov eax, edx
	sar edx, 1Fh
	shl edx, 6
	sbb eax, edx
	sar eax, 6
	xor ecx, ecx
	mov [esp+18h], ecx
	mov dword [dword_4EB554], eax
	test eax, eax
	jle loc_424C86
	mov eax, [esp]
	mov [esp+14h], ecx
	mov [esp+0Ch], ecx
	mov [esp+10h], eax

loc_424A95:
	mov eax, dword [dword_4EB564]
	xor esi, esi
	test eax, eax
	jle loc_424C48
	mov eax, [esp+10h]
	mov [esp+20h], eax
	mov eax, [esp+1Ch]
	mov ebx, [esp+14h]
	add eax, 80h
	mov edi, [esp+0Ch]
	mov [esp+30h], eax

loc_424AC1:
	push 0
	push 0
	push 4
	push 40h
	push 40h
	add ebx, 80h
	call sub_497464
	xor ecx, ecx
	mov dword dword_4E8CD4[ebx], ecx
	mov dword dword_4E8CE0[ebx], ecx
	mov edx, [esp+1Ch]
	mov dword dword_4E8CE4[ebx], ecx
	mov dword dword_4E8C0C[edi], eax
	mov dword dword_4E8CE8[ebx], ecx
	mov eax, esi
	mov dword dword_4E8CF4[ebx], ecx
	shl eax, 7
	mov dword dword_4E8D00[ebx], ecx
	add eax, edx
	mov dword dword_4E8D08[ebx], ecx
	mov [esp+38h], eax
	mov dword dword_4E8D14[ebx], ecx
	fild dword [esp+38h]
	fstp dword [esp+28h]
	mov eax, [esp+28h]
	mov dword dword_4E8CCC[ebx], eax
	mov eax, [esp+20h]
	mov dword dword_4E8D20[ebx], ecx
	mov [esp+38h], eax
	mov dword dword_4E8D34[ebx], ecx
	fild dword [esp+38h]
	fstp dword [esp+34h]
	mov eax, [esp+34h]
	mov dword dword_4E8CD0[ebx], eax
	mov dword dword_4E8CD8[ebx], 3F800000h
	mov eax, [esp+30h]
	mov dword dword_4E8D40[ebx], ecx
	mov [esp+38h], eax
	mov dword dword_4E8D44[ebx], ecx
	fild dword [esp+38h]
	fstp dword [esp+24h]
	mov eax, [esp+24h]
	mov dword dword_4E8CEC[ebx], eax
	mov eax, [esp+34h]
	mov dword dword_4E8CF0[ebx], eax
	mov eax, 3F800000h
	mov dword dword_4E8CF8[ebx], eax
	mov dword dword_4E8D04[ebx], eax
	mov eax, [esp+24h]
	mov edx, 0FFFFFFFFh
	mov dword dword_4E8D0C[ebx], eax
	mov eax, [esp+20h]
	mov dword dword_4E8CDC[ebx], edx
	add eax, 80h
	mov dword dword_4E8CFC[ebx], edx
	mov [esp+38h], eax
	mov dword dword_4E8D1C[ebx], edx
	fild dword [esp+38h]
	fstp dword [esp+2Ch]
	mov eax, [esp+2Ch]
	mov dword dword_4E8D10[ebx], eax
	mov eax, 3F800000h
	add edi, 4
	mov dword dword_4E8D18[ebx], eax
	mov ecx, [esp+30h]
	mov dword dword_4E8D24[ebx], eax
	mov edx, eax
	mov dword dword_4E8D28[ebx], eax
	mov eax, [esp+28h]
	inc esi
	mov dword dword_4E8D2C[ebx], eax
	mov eax, [esp+2Ch]
	add ecx, 80h
	mov dword dword_4E8D30[ebx], eax
	mov eax, edx
	mov edx, 0FFFFFFFFh
	mov dword dword_4E8D38[ebx], eax
	mov [esp+30h], ecx
	mov dword dword_4E8D3C[ebx], edx
	mov edx, eax
	mov eax, dword [dword_4EB564]
	mov dword dword_4E8D48[ebx], edx
	cmp esi, eax
	jl loc_424AC1

loc_424C48:
	mov esi, [esp+10h]
	mov edi, [esp+14h]
	mov eax, [esp+0Ch]
	mov edx, [esp+18h]
	mov ecx, dword [dword_4EB554]
	add esi, 80h
	add edi, 500h
	add eax, 28h
	inc edx
	mov [esp+10h], esi
	mov [esp+14h], edi
	mov [esp+0Ch], eax
	mov [esp+18h], edx
	cmp edx, ecx
	jl loc_424A95

loc_424C86:
	mov eax, [esp+4]
	mov edx, eax
	mov ecx, 40h
	sar edx, 1Fh
	idiv ecx
	test edx, edx
	jle loc_424D2F
	cmp dword [dword_4EB554], 0
	jle loc_424D2F
	mov eax, [esp+4]
	mov ecx, [esp+1Ch]
	add eax, eax
	add eax, ecx
	lea edi, [eax-1]
	mov eax, dword [dword_4EB554]
	fld qword [dbl_4C9C1C]
	lea esi, 0[eax*4]
	fld qword [dbl_4C9C24]
	add esi, eax
	xor ebx, ebx
	shl esi, 8

loc_424CD9:
	mov eax, dword [dword_4EB564]
	mov [esp+38h], edi
	mov [esp+34h], edx
	add ebx, 500h
	fild dword [esp+34h]
	fild dword [esp+38h]
	fstp dword [esp+34h]
	shl eax, 7
	mov ecx, [esp+34h]
	fadd st0, st1
	mov dword dword_4E87EC[ebx+eax], ecx
	fmul st0, st2
	mov dword dword_4E880C[ebx+eax], ecx
	fstp dword [esp+34h]
	mov ecx, [esp+34h]
	mov dword dword_4E8804[ebx+eax], ecx
	mov dword dword_4E8824[ebx+eax], ecx
	cmp ebx, esi
	jl loc_424CD9
	fstp st0
	fstp st0

loc_424D2F:
	mov eax, [esp+8]
	mov edx, eax
	mov ecx, 40h
	sar edx, 1Fh
	idiv ecx
	test edx, edx
	jle loc_424DD1
	cmp dword [dword_4EB564], 0
	jle loc_424DD1
	fld qword [dbl_4C9C1C]
	mov edi, [esp+8]
	mov esi, [esp]
	fld qword [dbl_4C9C24]
	add edi, edi
	xor ebx, ebx
	add edi, esi
	mov esi, dword [dword_4EB564]
	dec edi
	shl esi, 7

loc_424D77:
	mov eax, dword [dword_4EB554]
	dec eax
	imul eax, 500h
	mov [esp+34h], edi
	mov [esp+38h], edx
	add ebx, 80h
	fild dword [esp+38h]
	fild dword [esp+34h]
	fstp dword [esp+34h]
	fadd st0, st1
	mov ecx, [esp+34h]
	fmul st0, st2
	mov dword dword_4E8D10[ebx+eax], ecx
	fstp dword [esp+34h]
	mov dword dword_4E8D30[ebx+eax], ecx
	mov ecx, [esp+34h]
	mov dword dword_4E8D28[ebx+eax], ecx
	mov dword dword_4E8D48[ebx+eax], ecx
	cmp ebx, esi
	jl loc_424D77
	fstp st0
	fstp st0

loc_424DD1:
	mov esp, ebp
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_424970 endp

sub_424DE0: ;SUBROUTINE
	call sub_405960
	test eax, eax
	jz locret_424E05
	cmp eax, 4800h
	jz locret_424E05
	cmp eax, 5000h
	jz locret_424E05
	cmp eax, 4B00h
	jz locret_424E05
	cmp eax, 4D00h
	jnz loc_424E06

locret_424E05:
	ret

loc_424E06:
	mov dword [dword_4EB55C], 1
	ret
;sub_424DE0 endp

off_424E20: dd aEsta
	dd aGsta ; "gsta"
	dd aFsta ; "fsta"
	dd aSsta ; "ssta"
	dd aIsta ; "ista"
	dd aWsta ; "wsta"
off_424E38: dd aPrh01
	dd aPrh02 ; "prh02"
	dd aPrh03 ; "prh03"
	dd aPrh04 ; "prh04"
	dd aPrh05 ; "prh05"
	dd aPrh06 ; "prh06"
	dd aPrh07 ; "prh07"
	dd aPrh08 ; "prh08"

sub_424E60: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 7Ch
	mov [esp+5Ch], eax
	mov ecx, dword [dword_512208]
	xor edx, edx
	xor edi, edi
	mov [esp+54h], edx
	cmp ecx, 1
	jl loc_424F08
	mov ax, word [dword_51220C]

loc_424E8A:
	cwde
	mov [esp+74h], eax
	imul eax, 684h
	mov edx, [esp+5Ch]
	add edx, eax
	mov eax, [edx+21Ch]
	mov eax, [eax]
	mov esi, [edx+280h]
	mov [esp+78h], edx
	cmp esi, 2
	jnz loc_424EFC
	cwde
	xor edx, edx
	mov [esp+6Ch], eax
	mov dl, byte [byte_512DBD]
	mov ebp, [esp+6Ch]
	lea eax, [edx+0Ch]
	cmp eax, ebp
	jle loc_424EFC
	cmp dword [dword_512204], 0
	jnz loc_424EFC
	cmp byte [byte_512DAA], 3
	jz loc_424EFC
	cmp byte [byte_512DD0], 1
	jz loc_424EFC
	cmp byte [byte_512DEB], 1
	jz loc_424EFC
	cmp byte [byte_512DAF], 1
	jz loc_424F0F

loc_424EFC:
	mov eax, edi
	add esp, 7Ch
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_424F08:
	xor eax, eax
	jmp loc_424E8A

loc_424F0F:
	mov edx, aCNfs2seFron_11 ; "c:\\nfs2se\\frontend\\pc\\prhstat.c"
	mov ecx, 3D6h
	mov ebx, 20h
	mov eax, aFilebufr ; "filebufr"
	mov dword [dword_4DB1D8], edx
	mov edx, 0C8h
	mov dword [dword_4DB1DC], ecx
	call sub_4844B0
	mov ebp, eax
	mov [esp+70h], eax
	test eax, eax
	jz loc_424EFC
	mov eax, dword [dword_51221C]
	mov edx, esp
	call sub_41A3A0
	movsx esi, ax
	lea ecx, [esp+58h]
	mov eax, esi
	lea ebx, [esp+54h]
	call sub_425F90
	lea edx, [esp+50h]
	mov eax, esp
	call sub_4877BC
	cmp dword [esp+50h], 0
	jz loc_42510C
	mov esi, aCNfs2seFron_11 ; "c:\\nfs2se\\frontend\\pc\\prhstat.c"
	mov edi, 3EDh
	mov edx, [esp+58h]
	mov eax, aPrhbuf ; "prhbuf"
	xor ebx, ebx
	mov dword [dword_4DB1D8], esi
	mov dword [dword_4DB1DC], edi
	call sub_4844B0
	mov ebx, [esp+58h]
	mov [esp+60h], eax
	mov [esp+64h], eax
	mov edx, eax
	mov eax, [esp+50h]
	call sub_487958
	mov eax, [esp+50h]
	call sub_487950
	mov eax, dword [dword_5121F8+2]
	sar eax, 10h
	call sub_41A000
	mov edx, eax
	mov eax, [esp+6Ch]
	add eax, eax
	mov ecx, eax
	shl ecx, 4
	movsx edx, dx
	sub ecx, eax
	lea eax, 0[edx*4]
	add eax, edx
	add eax, eax
	lea edx, [ecx+eax]
	lea eax, 0[edx*4]
	add eax, edx
	mov edx, [esp+60h]
	shl eax, 2
	lea edi, [ebp+14h]
	add edx, eax
	mov ecx, 0B4h
	mov esi, edx
	push edi
	mov eax, ecx
	shr ecx, 2
	rep movsd
	mov cl, al
	and cl, 3
	rep movsb
	pop edi
	mov eax, [esp+78h]
	mov eax, [eax+21Ch]
	mov ax, [eax]
	mov [ebp+0], ax
	mov ax, word [dword_5121FC]
	mov [ebp+2], ax
	mov eax, [esp+78h]
	mov ebx, esp
	mov [esp+68h], edx
	mov ax, [eax+27Ch]
	mov edx, [esp+74h]
	mov [ebp+4], ax
	mov eax, [esp+5Ch]
	call sub_41A040
	cwde
	mov edx, [esp+78h]
	shl eax, 2
	add eax, edx
	mov eax, [eax+238h]
	mov [ebp+8], eax
	mov ebx, esp
	mov eax, [edx+234h]
	mov edx, [esp+74h]
	mov [ebp+0Ch], eax
	mov eax, [esp+5Ch]
	call sub_41A0B0
	cwde
	mov ecx, [esp+78h]
	shl eax, 2
	add eax, ecx
	mov edi, [esp+68h]
	mov esi, ebp
	mov eax, [eax+258h]
	mov ecx, 0C8h
	mov [ebp+10h], eax
	push edi
	mov eax, ecx
	shr ecx, 2
	rep movsd
	mov cl, al
	and cl, 3
	rep movsb
	pop edi
	xor eax, eax
	mov edx, esp
	mov al, byte [byte_512DB0]
	call sub_425F90
	mov eax, [esp+60h]
	mov edx, [esp+60h]
	call sub_484D94
	mov ebx, eax
	mov eax, esp
	call sub_4875B0
	test ax, ax
	jnz loc_4250DF
	mov eax, 2F3h
	call sub_402CD0

loc_4250DF:
	mov ebx, [esp+64h]
	test ebx, ebx
	jz loc_4250EE
	mov eax, ebx
	call sub_4848FC

loc_4250EE:
	mov esi, [esp+70h]
	test esi, esi
	jz loc_4250FD
	mov eax, esi
	call sub_4848FC

loc_4250FD:
	mov eax, 1
	add esp, 7Ch
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_42510C:
	mov eax, esi
;	call sub_425DD0
	mov eax, edi
	add esp, 7Ch
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_424E60 endp

off_425120: dd loc_425542
	dd loc_42558C ; jump table for switch statement
	dd loc_425874
	dd loc_4258BB

sub_425130: ;SUBROUTINE
	push esi
	push edi
	push ebp
	mov ebp, esp
	sub esp, 0E4h
	and esp, 0FFFFFFF8h
	mov [esp+0B4h], eax
	mov [esp+0ACh], edx
	mov [esp+0D0h], bx
	mov [esp+0E0h], cx
	mov esi, 1
	xor edx, edx
	mov edi, 0F3h
	mov [esp+0CCh], dx

loc_425170:
	mov [esp+0D8h], esi
	fild word [esp+0D8h]
	fmul qword [dbl_4C9DCC]
	fsubr qword [dbl_4C9E24]
	fmul qword [dbl_4C9DD4]
	push 0FFAAAAAAh
	mov ebx, 273h
	call __CHP
	fistp dword [esp+0B4h]
	mov ecx, [esp+0B4h]
	mov eax, edi
	mov edx, ecx
	inc esi
	call sub_4967E0
	cmp si, 0Ah
	jle loc_425170
	mov esi, 1
	mov edi, 8Fh

loc_4251C7:
	mov [esp+0D8h], esi
	fild word [esp+0D8h]
	fmul qword [dbl_4C9DDC]
	fadd qword [dbl_4C9E2C]
	fmul qword [dbl_4C9DE4]
	push 0FFAAAAAAh
	mov edx, 1B0h
	call __CHP
	fistp dword [esp+0B4h]
	mov ebx, [esp+0B4h]
	mov ecx, edi
	mov eax, ebx
	inc esi
	call sub_4967E0
	cmp si, 0Ah
	jl loc_4251C7
	mov eax, 0FFFFFF50h
	mov ecx, 126h
	mov ebx, 5
	call sub_48266C
	push eax
	mov edx, 8Fh
	mov eax, 0F1h
	call sub_488620
	mov eax, 0FFFFFF50h
	mov ecx, 5
	mov ebx, 180h
	call sub_48266C
	push eax
	mov edx, 1B0h
	mov eax, 0F3h
	call sub_488620
	mov ah, byte [byte_512DFB]
	cmp ah, 2
	jnz loc_425415

loc_42526B:
	cmp word [esp+0E0h], 1
	jnz loc_42541E

loc_42527A:
	mov eax, [esp+0DEh]
	sar eax, 10h
	add eax, 0C4h
	call sub_41B710
	push eax
	push aS_5 ; "%s"
	lea eax, [esp+5Ch]
	push eax
	lea edi, [esp+60h]
	call sprintf_
	add esp, 0Ch
	mov dl, 20h
	lea esi, [esp+54h]
	sub ecx, ecx
	dec ecx
	xor eax, eax
	repne scasb
	not ecx
	dec ecx

loc_4252B5:
	mov al, [esi]
	cmp al, dl
	jz loc_4252CD
	cmp al, 0
	jz loc_4252CB
	inc esi
	mov al, [esi]
	cmp al, dl
	jz loc_4252CD
	inc esi
	cmp al, 0
	jnz loc_4252B5

loc_4252CB:
	sub esi, esi

loc_4252CD:
	mov edx, asc_4C9D9C ; " "
	lea eax, [esp+54h]
	call strtok_
	push eax
	push aS_5 ; "%s"
	lea eax, [esp+0Ch]
	push eax
	call sprintf_
	add esp, 0Ch
	mov ebx, 0A7h
	push 4
	mov ecx, 10h
	mov edx, 0C6h
	push 3
	lea eax, [esp+0Ch]
	inc esi
	call sub_4053A0
	push 4
	mov ecx, 10h
	mov ebx, 0A7h
	push 3
	mov edx, 0E0h
	mov eax, esi

loc_425320:
	call sub_4053A0
	mov eax, 0CEh
	call sub_41B710
	push eax
	lea eax, [esp+8]
	push eax
	call sprintf_
	add esp, 8
	push 4
	mov ecx, 12h
	mov ebx, 1B9h
	push 3
	mov edx, 0F3h
	lea eax, [esp+0Ch]
	call sub_4054E0
	mov eax, 0CDh
	call sub_41B710
	push eax
	lea eax, [esp+8]
	push eax
	call sprintf_
	add esp, 8
	push 4
	mov ecx, 12h
	mov ebx, 1B9h
	push 4
	mov edx, 273h
	lea eax, [esp+0Ch]
	call sub_4054E0
	mov eax, [esp+0DEh]
	sar eax, 10h
	add eax, 0C8h
	call sub_41B710
	push eax
	push aS_5 ; "%s"
	lea eax, [esp+0Ch]
	push eax
	call sprintf_
	add esp, 0Ch
	push 5
	push 3
	mov eax, 0CCh
	mov ecx, 12h
	call sub_41B650
	add eax, 19h
	mov edx, 0F3h
	movsx ebx, ax
	lea eax, [esp+0Ch]
	call sub_4054E0

loc_4253DD:
	mov eax, [esp+0CAh]
	sar eax, 10h
	imul eax, 14h
	add eax, [esp+0ACh]
	cmp dword [eax+8], 0
	jz loc_425479
	mov esi, [esp+0CCh]
	cmp si, 0Ah
	jge loc_425479
	mov edx, esi
	inc edx
	mov [esp+0CCh], dx
	jmp loc_4253DD

loc_425415:
	cmp ah, 1
	jz loc_42526B

loc_42541E:
	cmp byte [byte_512DFB], 4
	jnz loc_425436
	cmp word [esp+0E0h], 0
	jz loc_42527A

loc_425436:
	mov eax, [esp+0DEh]
	sar eax, 10h
	add eax, 0C4h
	call sub_41B710
	push eax
	push aS_5 ; "%s"
	lea eax, [esp+0Ch]
	push eax
	call sprintf_
	add esp, 0Ch
	push 4
	mov ecx, 10h
	mov ebx, 0A7h
	push 3
	mov edx, 0E0h
	lea eax, [esp+0Ch]
	jmp loc_425320

loc_425479:
	cmp word [esp+0CCh], 1
	jl loc_425571
	mov eax, [esp+0CEh]
	lea edx, [esp+54h]
	mov ebx, aCNfs2seFron_11 ; "c:\\nfs2se\\frontend\\pc\\prhstat.c"
	mov esi, 2D4h
	mov ecx, [esp+0CAh]
	sar eax, 10h
	mov edi, aCNfs2seFron_11 ; "c:\\nfs2se\\frontend\\pc\\prhstat.c"
	call sub_41B230
	sar ecx, 10h
	lea eax, [esp+54h]
	mov edx, [esp+0B4h]
	mov dword [dword_4DB1D8], ebx
	mov ebx, 20h
	mov [edx], eax
	mov eax, aPrhdumi ; "prhdumi"
	lea edx, 0[ecx*4]
	mov dword [dword_4DB1DC], esi
	call sub_484498
	mov ebx, 20h
	mov esi, eax
	mov eax, 2D5h
	lea edx, 0[ecx*8]
	mov dword [dword_4DB1DC], eax
	mov eax, aPrhfdumi ; "prhfdumi"
	mov dword [dword_4DB1D8], edi
	call sub_484498
	mov ebx, 2D6h
	mov [esp+0B8h], eax
	lea edx, [ecx+ecx]
	mov eax, aPrhrank ; "prhrank"
	mov dword [dword_4DB1DC], ebx
	mov ebx, 20h
	mov dword [dword_4DB1D8], edi
	call sub_484498
	mov edi, eax
	cmp word [esp+0E0h], 3 ; switch 4 cases
	jbe loc_42557B

loc_425542:
	mov ebx, [esp+0ACh] ; jumptable 00425585 default case
	xor edx, edx

loc_42554B:
	mov ecx, [esp+0CAh]
	movsx eax, dx
	sar ecx, 10h
	cmp eax, ecx
	jge loc_4255BE
	imul ecx, eax, 14h
	add ecx, ebx
	mov ecx, [ecx+2]
	sar ecx, 10h
	mov [esi+eax*4], ecx
	mov [edi+eax*2], dx
	inc edx
	jmp loc_42554B

loc_425571:
	xor edx, edx
	mov eax, edx
	mov esp, ebp
	pop ebp
	pop edi
	pop esi
	ret

loc_42557B:
	xor eax, eax
	mov ax, [esp+0E0h]
	jmp off_425120[eax*4] ; switch jump

loc_42558C:
	xor edx, edx ; jumptable 00425585 case 1

loc_42558E:
	mov ecx, [esp+0CAh]
	movsx eax, dx
	sar ecx, 10h
	cmp eax, ecx
	jge loc_4255BE
	imul ecx, eax, 14h
	add ecx, [esp+0ACh]
	lea ebx, 0[eax*4]
	add ebx, esi
	mov ecx, [ecx+8]
	mov [ebx], ecx
	mov [edi+eax*2], dx
	inc edx
	jmp loc_42558E

loc_4255BE:
	mov ebx, edi
	mov edx, esi
	mov eax, ecx
	call sub_41B2D0
	mov ebx, [esp+0E0h]
	test bx, bx
	jbe loc_425902
	cmp bx, 3
	jnz loc_425A69
	cmp byte [byte_512DFA], 1
	jnz loc_4259AF
	mov ecx, 471Ch

loc_4255F5:
	movsx eax, word [edi]
	mov [esp+0C8h], ecx
	fild dword [esi+eax*4]
	fild dword [esp+0C8h]
	fld1
	fdivrp st1, st0
	fstp dword [esp+0C4h]
	fmul dword [esp+0C4h]
	sub esp, 8
	fstp qword [esp]
	call floor_
	mov [esp+0C8h], ecx
	mov eax, [esp+0CAh]
	fild dword [esp+0C8h]
	sar eax, 10h
	fstp qword [esp+0A4h]
	movsx eax, word [edi+eax*2-2]
	fmul qword [esp+0A4h]
	fild dword [esi+eax*4]
	fmul dword [esp+0C4h]
	fxch st1
	call __CHP
	fistp dword [esp]
	sub esp, 8
	fstp qword [esp]
	call ceil_
	fmul qword [esp+0A4h]
	mov eax, [esp]
	call __CHP
	fistp dword [esp+0BCh]
	mov edx, [esp+0BCh]
	sub edx, eax
	mov eax, edx
	sar edx, 1Fh
	idiv ecx
	test eax, eax
	jnz loc_4259B9
	add [esp+0BCh], ecx

loc_4256A5:
	mov eax, [esp]
	mov [esp+0C4h], eax
	mov [esp+0C8h], ecx
	fild dword [esp+0C4h]
	fild dword [esp+0C8h]
	fld1
	fdivrp st1, st0
	fstp dword [esp+0C4h]
	fmul dword [esp+0C4h]
	sub esp, 8
	fstp qword [esp]
	push a5_0f ; "%5.0f"
	lea eax, [esp+60h]
	push eax
	call sprintf_
	add esp, 10h
	mov eax, [esp+0BCh]
	mov [esp+0C8h], eax
	fild dword [esp+0C8h]
	fmul dword [esp+0C4h]
	sub esp, 8
	fstp qword [esp]
	push a5_0f ; "%5.0f"
	lea eax, [esp+10h]
	push eax
	call sprintf_
	add esp, 10h

loc_425722:
	push 4
	mov ecx, 12h
	mov ebx, 1B0h
	push 1
	mov edx, 0ECh
	lea eax, [esp+5Ch]
	call sub_4054E0
	push 4
	mov ecx, 12h
	mov ebx, 86h
	push 1
	mov edx, 0ECh
	lea eax, [esp+0Ch]
	call sub_4054E0
	mov eax, [esp]
	mov edx, [esp+0BCh]
	sub edx, eax
	xor eax, eax
	mov [esp+0BCh], edx
	mov [esp+0DCh], ax

loc_425777:
	mov eax, [esp+0CAh]
	mov ecx, [esp+0DAh]
	sar eax, 10h
	sar ecx, 10h
	mov [esp+0C0h], eax
	cmp ecx, eax
	jge loc_425B97
	mov eax, [esp+0B8h]
	lea edx, 0[ecx*8]
	add edx, eax
	mov dword [edx], 0
	mov dword [edx+4], 0
	mov eax, [esp]
	mov ebx, [esi+ecx*4]
	sub ebx, eax
	mov eax, [esp+0BCh]
	mov [esi+ecx*4], ebx
	mov [esp+0C8h], eax
	fild dword [esi+ecx*4]
	fild dword [esp+0C8h]
	fdivp st1, st0
	fld qword [dbl_4C9E0C]
	fxch st1
	fmul st0, st1
	fstp qword [edx]
	fsub qword [edx]
	fadd qword [dbl_4C9E34]
	fstp qword [edx]
	mov eax, [edx+4]
	mov ebx, [edx]
	mov edx, [esp+0C0h]
	sub edx, ecx
	push eax
	dec edx
	push ebx
	mov [esp+0D0h], edx
	call floor_
	fild dword [esp+0C8h]
	fmul qword [dbl_4C9E14]
	fmul qword [dbl_4C9E1C]
	fxch st1
	call __CHP
	fistp dword [esp+0B0h]
	mov eax, [esp+0B0h]
	mov edx, 0C00h
	sub eax, 3
	fadd qword [dbl_4C9E3C]
	mov ecx, eax
	call __CHP
	fistp dword [esp+0B0h]
	mov ebx, [esp+0B0h]
	mov eax, aDot ; "dot "
	sub ebx, 3
	call sub_405B30
	inc word [esp+0DCh]
	jmp loc_425777

loc_425874:
	xor edx, edx ; jumptable 00425585 case 2

loc_425876:
	mov ecx, [esp+0CAh]
	movsx eax, dx
	sar ecx, 10h
	cmp eax, ecx
	jge loc_4255BE
	imul ecx, eax, 14h
	mov ebx, [esp+0ACh]
	add ebx, ecx
	lea ecx, 0[eax*4]
	mov [esp+0B0h], ebx
	lea ebx, [esi+ecx]
	mov ecx, [esp+0B0h]
	mov ecx, [ecx+0Ch]
	mov [ebx], ecx
	mov [edi+eax*2], dx
	inc edx
	jmp loc_425876

loc_4258BB:
	xor edx, edx ; jumptable 00425585 case 3

loc_4258BD:
	mov ecx, [esp+0CAh]
	movsx eax, dx
	sar ecx, 10h
	cmp eax, ecx
	jge loc_4255BE
	imul ecx, eax, 14h
	mov ebx, [esp+0ACh]
	add ebx, ecx
	lea ecx, 0[eax*4]
	mov [esp+0C4h], ebx
	lea ebx, [esi+ecx]
	mov ecx, [esp+0C4h]
	mov ecx, [ecx+10h]
	mov [ebx], ecx
	mov [edi+eax*2], dx
	inc edx
	jmp loc_4258BD

loc_425902:
	movsx eax, word [edi]
	mov eax, [esi+eax*4]
	mov [esp], eax
	mov eax, [esp+0CAh]
	sar eax, 10h
	movsx eax, word [edi+eax*2-2]
	mov eax, [esi+eax*4]
	mov ecx, [esp]
	mov [esp+0BCh], eax
	sub eax, ecx
	jnz loc_425967
	inc dword [esp+0BCh]

loc_425932:
	mov eax, [esp]
	push eax
	push aD_5 ; "%d"
	lea eax, [esp+5Ch]
	push eax
	call sprintf_
	add esp, 0Ch
	mov edx, [esp+0BCh]
	push edx
	push aD_5 ; "%d"
	lea eax, [esp+0Ch]
	push eax
	call sprintf_
	add esp, 0Ch
	jmp loc_425722

loc_425967:
	cmp eax, 2
	jle loc_42597D
	cmp eax, 5
	jge loc_42597D
	lea eax, [ecx+5]
	mov [esp+0BCh], eax
	jmp loc_425932

loc_42597D:
	cmp eax, 5
	jle loc_425996
	cmp eax, 0Ah
	jge loc_425996
	mov eax, [esp]
	add eax, 0Ah
	mov [esp+0BCh], eax
	jmp loc_425932

loc_425996:
	cmp eax, 0Ah
	jle loc_425932
	cmp eax, 14h
	jge loc_425932
	mov eax, [esp]
	add eax, 14h
	mov [esp+0BCh], eax
	jmp loc_425932

loc_4259AF:
	mov ecx, 7271h
	jmp loc_4255F5

loc_4259B9:
	cmp eax, 2
	jle loc_4259DD
	cmp eax, 5
	jg loc_4259DD
	lea eax, 0[ecx*4]
	mov edx, [esp]
	add eax, ecx
	add edx, eax
	mov [esp+0BCh], edx
	jmp loc_4256A5

loc_4259DD:
	cmp eax, 5
	jle loc_425A03
	cmp eax, 0Ah
	jg loc_425A03
	lea eax, 0[ecx*4]
	add eax, ecx
	mov edx, [esp]
	add eax, eax
	add edx, eax
	mov [esp+0BCh], edx
	jmp loc_4256A5

loc_425A03:
	cmp eax, 0Ah
	jle loc_4256A5
	mov [esp+0C4h], eax
	fild dword [esp+0C4h]
	fmul dword [flt_4C9DEC]
	sub esp, 8
	fstp qword [esp]
	call floor_
	fld1
	faddp st1, st0
	fmul qword [dbl_4C9DF4]
	mov [esp+0C8h], ecx
	mov eax, [esp]
	fild dword [esp+0C8h]
	fmulp st1, st0
	mov [esp+0C8h], eax
	fild dword [esp+0C8h]
	faddp st1, st0
	call __CHP
	fistp dword [esp+0BCh]
	jmp loc_4256A5

loc_425A69:
	movsx eax, word [edi]
	fild dword [esi+eax*4]
	fmul dword [flt_4C9DFC]
	sub esp, 8
	fstp qword [esp]
	call floor_
	mov eax, [esp+0CAh]
	sar eax, 10h
	movsx eax, word [edi+eax*2-2]
	fmul qword [dbl_4C9E04]
	fild dword [esi+eax*4]
	fmul dword [flt_4C9DFC]
	fxch st1
	call __CHP
	fistp dword [esp]
	sub esp, 8
	fstp qword [esp]
	call ceil_
	fmul qword [dbl_4C9E04]
	mov ecx, [esp]
	call __CHP
	fistp dword [esp+0BCh]
	mov edx, [esp+0BCh]
	sub edx, ecx
	mov eax, edx
	sar edx, 1Fh
	shl edx, 6
	sbb eax, edx
	sar eax, 6
	test eax, eax
	jnz loc_425B0B
	add dword [esp+0BCh], 40h

loc_425AEA:
	lea edx, [esp+54h]
	mov eax, [esp]
	call sub_41B150
	lea edx, [esp+4]
	mov eax, [esp+0BCh]
	call sub_41B150
	jmp loc_425722

loc_425B0B:
	cmp eax, 2
	jle loc_425B24
	cmp eax, 5
	jg loc_425B24
	lea eax, [ecx+140h]
	mov [esp+0BCh], eax
	jmp loc_425AEA

loc_425B24:
	cmp eax, 5
	jle loc_425B3F
	cmp eax, 0Ah
	jg loc_425B3F
	mov eax, [esp]
	add eax, 280h
	mov [esp+0BCh], eax
	jmp loc_425AEA

loc_425B3F:
	cmp eax, 0Ah
	jle loc_425AEA
	mov [esp+0C8h], eax
	fild dword [esp+0C8h]
	fmul dword [flt_4C9DEC]
	sub esp, 8
	fstp qword [esp]
	call floor_
	fld1
	faddp st1, st0
	fmul qword [dbl_4C9DF4]
	mov eax, [esp]
	fmul qword [dbl_4C9E04]
	mov [esp+0C8h], eax
	fild dword [esp+0C8h]
	faddp st1, st0
	call __CHP
	fistp dword [esp+0BCh]
	jmp loc_425AEA

loc_425B97:
	mov eax, [esp+0CCh]
	dec eax
	mov [esp+0D4h], ax
	test ax, ax
	jle loc_425CA8

loc_425BB0:
	mov ecx, [esp+0D2h]
	sar ecx, 10h
	mov eax, [esp+0B8h]
	lea edx, 0[ecx*8]
	add edx, eax
	push 0FFFFFF50h
	mov ebx, [edx-4]
	push ebx
	mov eax, [edx-8]
	push eax
	call floor_
	mov eax, [esp+0CEh]
	sar eax, 10h
	sub eax, ecx
	mov [esp+0CCh], eax
	fild dword [esp+0CCh]
	fmul qword [dbl_4C9E14]
	fmul qword [dbl_4C9E1C]
	fxch st1
	call __CHP
	mov ebx, [edx+4]
	fistp dword [esp+0B4h]
	push ebx
	mov ecx, eax
	mov eax, [edx]
	dec ecx
	push eax
	fadd qword [dbl_4C9E3C]
	mov [esp+0D4h], ecx
	call __CHP
	fistp dword [esp+0D0h]
	call floor_
	fild dword [esp+0CCh]
	fmul qword [dbl_4C9E14]
	fmul qword [dbl_4C9E1C]
	mov ecx, [esp+0B4h]
	fxch st1
	call __CHP
	mov ebx, [esp+0C8h]
	fistp dword [esp+0C8h]
	fadd qword [dbl_4C9E3C]
	mov edx, [esp+0C8h]
	call __CHP
	fistp dword [esp+0C8h]
	mov eax, [esp+0C8h]
	call sub_4967E0
	mov ecx, [esp+0D4h]
	dec ecx
	mov [esp+0D4h], cx
	test cx, cx
	jg loc_425BB0
	lea eax, [eax+0]

loc_425CA8:
	mov eax, edi
	mov edx, [esp+0B8h]
	call sub_4848FC
	test edx, edx
	jz loc_425CC1
	mov eax, edx
	call sub_4848FC

loc_425CC1:
	test esi, esi
	jz loc_425CCC
	mov eax, esi
	call sub_4848FC

loc_425CCC:
	mov edx, 1
	mov eax, edx
	mov esp, ebp
	pop ebp
	pop edi
	pop esi
	ret
;sub_425130 endp

sub_425CE0: ;SUBROUTINE
	push esi
	push edi
	push ebp
	sub esp, 5Ch
	mov edi, eax
	mov esi, ecx
	lea ecx, [esp+58h]
	xor edx, edx
	movsx ebp, bx
	mov [esp+54h], edx
	mov eax, ebp
	mov edx, esp
	lea ebx, [esp+54h]
	call sub_425F90
	lea edx, [esp+50h]
	mov eax, esp
	call sub_4877BC
	cmp dword [esp+50h], 0
	jnz loc_425D26
	mov eax, ebp
;	call sub_425DD0
	add esp, 5Ch
	pop ebp
	pop edi
	pop esi
	ret 4

loc_425D26:
	mov ebx, aCNfs2seFron_11 ; "c:\\nfs2se\\frontend\\pc\\prhstat.c"
	mov ebp, 229h
	mov edx, [esp+58h]
	mov eax, aPrhbuf ; "prhbuf"
	mov dword [dword_4DB1D8], ebx
	xor ebx, ebx
	mov dword [dword_4DB1DC], ebp
	call sub_484498
	mov ebx, [esp+58h]
	mov ebp, eax
	mov edx, eax
	mov eax, [esp+50h]
	call sub_487958
	mov eax, [esp+50h]
	call sub_487950
	mov eax, [esp+6Ah]
	sar eax, 10h
	call sub_41A000
	mov ecx, eax
	movsx eax, si
	add eax, eax
	mov ebx, eax
	shl ebx, 4
	movsx edx, cx
	sub ebx, eax
	lea eax, 0[edx*4]
	add eax, edx
	add eax, eax
	lea edx, [ebx+eax]
	lea eax, 0[edx*4]
	add eax, edx
	shl eax, 2
	mov ecx, 0C8h
	lea esi, [eax+ebp]
	push edi
	mov eax, ecx
	shr ecx, 2
	rep movsd
	mov cl, al
	and cl, 3
	rep movsb
	pop edi
	mov eax, ebp
	call sub_4848FC
	add esp, 5Ch
	pop ebp
	pop edi
	pop esi
	ret 4
;sub_425CE0 endp

sub_425F90: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 20h
	mov ebx, eax
	mov eax, edx
	mov ecx, 8
	mov edi, esp
	mov esi, off_424E38
	rep movsd
	cmp bx, 14h
	jl loc_426001
	cmp dword [dword_512228], 1
	jnz loc_425FE6
	movsx edx, bx
	push a_ssf_0 ; ".ssf"
	mov edi, [esp+edx*4-4Ch]

loc_425FC5:
	push edi
	mov ebp, dword [dword_5134DC]
	push ebp
	push aSbSS ; "%sb%s%s"

loc_425FD2:
	push eax
	call sprintf_
	add esp, 14h
	mov eax, ebx
	add esp, 20h
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_425FE6:
	movsx edx, bx
	push a_ssf_0 ; ".ssf"
	mov ecx, [esp+edx*4-4Ch]
	push ecx
	mov esi, dword [dword_5134DC]
	push esi
	push aSSS_0 ; "%s%s%s"
	jmp loc_425FD2

loc_426001:
	cmp dword [dword_512228], 1
	jnz loc_426018
	movsx edx, bx
	push a_stf_0 ; ".stf"
	mov edi, [esp+edx*4+4]
	jmp loc_425FC5

loc_426018:
	movsx edx, bx
	push a_stf_0 ; ".stf"
	mov ecx, [esp+edx*4+4]
	push ecx
	mov esi, dword [dword_5134DC]
	push esi
	push aSSS_0 ; "%s%s%s"
	push eax
	call sprintf_
	add esp, 14h
	mov eax, ebx
	add esp, 20h
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_425F90 endp

sub_426050: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 98h
	mov ebp, eax
	mov esi, dword_512F4C
	mov ebx, 14h
	lea edi, [esp+50h]
	xor eax, eax
	xor edx, edx
	xor ecx, ecx
	mov al, byte [byte_512DBF]
	mov [esp+6Ch], edx
	mov [esp+68h], ecx
	mov [esp+74h], ecx
	mov [esp+70h], esi
	mov edx, 1
	mov esi, off_424E20
	mov [esp+88h], ax
	xor ecx, ecx
	xor eax, eax
	mov [esp+7Ch], edx
	mov al, byte [byte_512DB8]
	mov [esp+80h], edx
	mov [esp+8Ch], ax
	xor eax, eax
	mov [esp+84h], cx
	mov al, byte [byte_512DB0]
	mov ecx, 6
	mov [esp+94h], ax
	mov ah, byte [byte_512DBC]
	rep movsd
	test ah, 1
	jnz loc_426520
	mov word [esp+78h], 7

loc_4260E9:
	xor edx, edx
	mov eax, [esp+86h]
	mov dl, byte [byte_512DBD]
	sar eax, 10h
	add edx, 0Ch
	cmp eax, edx
	jl loc_42610C
	xor eax, eax
	mov [esp+88h], ax

loc_42610C:
	mov edi, aCNfs2seFron_11 ; "c:\\nfs2se\\frontend\\pc\\prhstat.c"
	lea edx, 0[ebx*4]
	mov eax, 70h
	sub edx, ebx
	mov dword [dword_4DB1DC], eax
	shl edx, 2
	mov eax, aPrhdata ; "prhdata"
	sub edx, ebx
	mov ebx, 20h
	mov dword [dword_4DB1D8], edi
	call sub_4844B0
	mov edi, eax
	test eax, eax
	jz loc_42652C
	mov eax, [esp+78h]
	dec eax
	mov [esp+90h], eax

loc_426154:
	cmp dword [esp+6Ch], 0
	jnz loc_426774
	cmp word [esp+7Ch], 0
	jz loc_4261B0
	mov ecx, [esp+92h]
	mov edx, esp
	sar ecx, 10h
	xor ebx, ebx
	mov eax, ecx
	mov [esp+7Ch], ebx
	call sub_41B230
	mov eax, esp
	xor ebx, ebx
	mov [ebp+0], eax
	mov eax, ebp
	mov dword [dword_4D2098], ebx
	call sub_410E80
	push ebx
	mov eax, ecx
	mov edx, aRec6_1 ; "rec6"
	call sub_419FD0
	mov ebx, 1
	movsx ecx, ax
	xor eax, eax
	call sub_428140

loc_4261B0:
	cmp word [esp+80h], 0
	jz loc_426209
	mov ecx, [esp+86h]
	xor eax, eax
	mov ebx, [esp+92h]
	mov al, byte [byte_512DBA]
	mov si, word [dword_512228]
	mov dword [dword_512228], eax
	mov eax, [esp+8Ah]
	mov edx, [esp+70h]
	sar eax, 10h
	sar ecx, 10h
	push eax
	sar ebx, 10h
	mov eax, edi
	call sub_425CE0
	movsx eax, si
	xor esi, esi
	mov dword [dword_512228], eax
	mov [esp+80h], esi

loc_426209:
	call sub_4833C7
	mov esi, [esp+74h]
	mov edx, 400h
	xor ecx, ecx
	xor ebx, ebx
	add esi, eax
	call sub_428A20
	mov eax, [ebp+4]
	call sub_405B30
	xor eax, eax
	mov edx, 400h
	mov al, byte [byte_512DFB]
	xor ecx, ecx
	xor ebx, ebx
	mov eax, [esp+eax*4+50h]
	call sub_405B30
	mov dl, byte [byte_512DFB]
	mov [esp+74h], esi
	cmp dl, 5
	jnz loc_42656A
	cmp byte [byte_512DBA], 1
	jnz loc_42653D
	mov eax, 0Dh
	call sub_41B710
	push eax
	mov eax, [esp+8Eh]
	sar eax, 10h
	push eax
	mov eax, 2B8h
	call sub_41B710
	push eax
	push aSDS_0 ; "%s %d (%s)"

loc_426289:
	lea eax, [esp+10h]
	push eax
	call sprintf_
	add esp, 14h

loc_426296:
	push 2
	push 1
	mov eax, 2B8h
	call sub_41B650
	movsx ebx, ax
	mov eax, 2B8h
	call sub_41B670
	add eax, 1Eh
	mov ecx, 18h
	movsx edx, ax
	lea eax, [esp+8]
	call sub_4054E0
	mov eax, [esp+86h]
	sar eax, 10h
	call sub_41A420
	push eax
	push aS_5 ; "%s"
	lea eax, [esp+8]
	push eax
	call sprintf_
	add esp, 0Ch
	push 2
	push 1
	mov eax, 0CCh
	call sub_41B650
	add eax, 19h
	movsx ebx, ax
	mov eax, 2B8h
	call sub_41B670
	add eax, 1Eh
	mov ecx, 18h
	movsx edx, ax
	lea eax, [esp+8]
	call sub_4054E0
	mov ecx, [esp+82h]
	mov ebx, [esp+92h]
	mov edx, edi
	mov eax, ebp
	sar ecx, 10h
	sar ebx, 10h
	call sub_425130
	mov eax, ebp
	call sub_40FA90
	mov eax, dword [dword_4D4D24]
	mov edx, esi
	xor ecx, ecx
	mov eax, [eax+20h]
	xor ebx, ebx
	call sub_426B70
	mov eax, 12h
	call sub_4274F0
	cmp dword [dword_4D2310], 0
	jz loc_42637C
	mov eax, dword [dword_4D4C7C]
	mov edx, dword [dword_4D4C80]
	sub eax, 7
	call sub_4267C0

loc_42637C:
	call sub_4976B8
	mov eax, ebp
	call sub_423CA0
	call sub_405960
	mov esi, eax
	test ax, ax
	jz loc_426154
	mov edx, [esp+74h]
	cmp edx, [esp+68h]
	jle loc_426154
	add edx, 0Fh
	mov [esp+68h], edx
	cmp word [ebp+0Ah], 0
	jnz loc_4265DF
	cmp ax, 4B00h
	jnz loc_4265DF
	mov edx, [esp+94h]
	mov eax, 1
	sub edx, eax
	mov [esp+80h], eax
	mov [esp+94h], dx
	test dx, dx
	jl loc_4265CB

loc_4263EF:
	mov edx, 7Fh
	xor eax, eax
	mov ecx, 1
	call sub_4423F0
	xor ebx, ebx
	xor eax, eax
	mov [esp+7Ch], ecx
	call sub_403550
	xor edx, edx
	mov eax, 12h
	xor ecx, ecx
	call sub_4274F0

loc_42641B:
	mov ax, [ebp+0Ah]
	cmp ax, 1
	jnz loc_426642
	cmp si, 4B00h
	jnz loc_426642
	mov edx, [esp+8Ah]
	sar edx, 10h
	mov [esp+80h], eax
	mov eax, edx
	sar edx, 1Fh
	sub eax, edx
	sar eax, 1
	mov [esp+8Ch], ax
	cmp ax, 2
	jge loc_426466
	mov word [esp+8Ch], 8

loc_426466:
	mov edx, 7Fh
	xor eax, eax
	call sub_4423F0
	xor eax, eax
	call sub_403550

loc_426479:
	cmp word [ebp+0Ah], 2
	jnz loc_4266AE
	cmp si, 4B00h
	jnz loc_4266AE
	mov eax, [esp+88h]
	mov ecx, 1
	sub eax, ecx
	mov [esp+80h], ecx
	mov [esp+88h], ax
	test ax, ax
	jl loc_426695

loc_4264B5:
	mov edx, 7Fh
	xor eax, eax
	call sub_4423F0
	xor eax, eax
	call sub_403550

loc_4264C8:
	mov bx, [ebp+0Ah]
	cmp bx, 3
	jnz loc_426720
	cmp si, 4B00h
	jnz loc_426720
	mov ecx, [esp+84h]
	dec ecx
	mov [esp+84h], cx
	test cx, cx
	jl loc_426713

loc_4264FA:
	mov edx, 7Fh
	xor eax, eax
	call sub_4423F0
	xor eax, eax
	call sub_403550

loc_42650D:
	movsx edx, si
	mov eax, ebp
	call sub_410414
	mov [esp+6Ch], eax
	jmp loc_426154

loc_426520:
	mov word [esp+78h], 8
	jmp loc_4260E9

loc_42652C:
	mov eax, [esp+6Ch]
	add esp, 98h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_42653D:
	mov eax, [esp+8Ah]
	sar eax, 10h
	push eax
	mov eax, 2B8h
	call sub_41B710
	push eax
	push aSD_2 ; "%s %d"
	lea eax, [esp+0Ch]
	push eax
	call sprintf_
	add esp, 10h
	jmp loc_426296

loc_42656A:
	cmp byte [byte_512DBA], 1
	jnz loc_42659E
	mov eax, 0Dh
	call sub_41B710
	push eax
	mov eax, 2B8h
	call sub_41B710
	push eax
	mov eax, [esp+92h]
	sar eax, 10h
	push eax
	push aDSS ; "%d %s (%s)"
	jmp loc_426289

loc_42659E:
	mov eax, 2B8h
	call sub_41B710
	push eax
	mov eax, [esp+8Eh]
	sar eax, 10h
	push eax
	push aDS_1 ; "%d %s"
	lea eax, [esp+0Ch]
	push eax
	call sprintf_
	add esp, 10h
	jmp loc_426296

loc_4265CB:
	mov eax, [esp+90h]
	mov [esp+94h], ax
	jmp loc_4263EF

loc_4265DF:
	cmp word [ebp+0Ah], 0
	jnz loc_42641B
	cmp si, 4D00h
	jnz loc_426637

loc_4265F1:
	mov edx, [esp+94h]
	mov ecx, 1
	add edx, ecx
	mov eax, [esp+76h]
	mov [esp+94h], dx
	sar eax, 10h
	mov edx, [esp+92h]
	dec eax
	sar edx, 10h
	mov [esp+80h], ecx
	cmp edx, eax
	jle loc_4263EF
	xor ebx, ebx
	mov [esp+94h], bx
	jmp loc_4263EF

loc_426637:
	cmp si, 0Dh
	jz loc_4265F1
	jmp loc_42641B

loc_426642:
	cmp word [ebp+0Ah], 1
	jnz loc_426479
	cmp si, 4D00h
	jnz loc_42668A

loc_426654:
	mov ecx, [esp+8Ch]
	mov ebx, 1
	add ecx, ecx
	mov [esp+80h], ebx
	mov [esp+8Ch], cx
	cmp cx, 8
	jle loc_426466
	mov word [esp+8Ch], 2
	jmp loc_426466

loc_42668A:
	cmp si, 0Dh
	jz loc_426654
	jmp loc_426479

loc_426695:
	xor eax, eax
	mov al, byte [byte_512DBD]
	add eax, 0Bh
	mov [esp+88h], ax
	jmp loc_4264B5

loc_4266AE:
	cmp word [ebp+0Ah], 2
	jnz loc_4264C8
	cmp si, 4D00h
	jnz loc_426708

loc_4266C0:
	mov edx, [esp+88h]
	mov ecx, 1
	add edx, ecx
	xor eax, eax
	mov [esp+88h], dx
	mov al, byte [byte_512DBD]
	mov edx, [esp+86h]
	add eax, 0Ch
	sar edx, 10h
	mov [esp+80h], ecx
	cmp edx, eax
	jl loc_4264B5
	xor ebx, ebx
	mov [esp+88h], bx
	jmp loc_4264B5

loc_426708:
	cmp si, 0Dh
	jz loc_4266C0
	jmp loc_4264C8

loc_426713:
	mov [esp+84h], bx
	jmp loc_4264FA

loc_426720:
	cmp word [ebp+0Ah], 3
	jnz loc_42650D
	cmp si, 4D00h
	jnz loc_42675B

loc_426732:
	mov eax, [esp+84h]
	inc eax
	mov [esp+84h], ax
	cmp ax, 3
	jle loc_4264FA
	xor ebx, ebx
	mov [esp+84h], bx
	jmp loc_4264FA

loc_42675B:
	cmp si, 0Dh
	jz loc_426732
	movsx edx, si
	mov eax, ebp
	call sub_410414
	mov [esp+6Ch], eax
	jmp loc_426154

loc_426774:
	test edi, edi
	jz loc_42677F
	mov eax, edi
	call sub_4848FC

loc_42677F:
	xor eax, eax
	call sub_403550
	xor ecx, ecx
	xor ebx, ebx
	xor edx, edx
	mov eax, 12h
	call sub_4274F0
	xor ecx, ecx
	mov eax, [esp+6Ch]
	mov dword [dword_4D2098], ecx
	add esp, 98h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_426050 endp

dword_4267B0: dd 0
	dd 1, 2, 3

sub_4267C0: ;SUBROUTINE
	push ecx
	push esi
	push edi
	sub esp, 18h
	mov edi, esp
	mov esi, dword_4267B0
	mov ecx, dword [dword_4D4D30]
	movsd
	movsd
	movsd
	movsd
	test ecx, ecx
	jnz loc_4267E2
	add esp, 18h
	pop edi
	pop esi
	pop ecx
	ret

loc_4267E2:
	push ebx
	fild dword [dword_4EC4BC]
	mov ebx, 0FFFFFFFFh
	mov [esp+14h], eax
	mov [esp+18h], edx
	push ecx
	fild dword [esp+18h]
	fild dword [esp+1Ch]
	push 1
	mov dword [dword_4D4CFC], ebx
	mov dword [dword_4D4CDC], ebx
	mov dword [dword_4D4CBC], ebx
	mov dword [dword_4D4C9C], ebx
	fxch st1
	fstp dword [flt_4D4C8C]
	fstp dword [flt_4D4C90]
	fld dword [flt_4D4C8C]
	fld st0
	fld dword [flt_4D4C90]
	fxch st1
	fstp dword [flt_4D4CEC]
	fstp dword [flt_4D4CB0]
	fadd st0, st1
	fld dword [flt_4D4CB0]
	fxch st1
	fst dword [flt_4D4CAC]
	fxch st1
	faddp st2, st0
	fstp dword [flt_4D4CCC]
	fst dword [flt_4D4CD0]
	fstp dword [flt_4D4CF0]
	call sub_497738
	lea eax, [esp+4]
	push eax
	push flt_4D4C8C
	push 1
	call sub_497D6C
	pop ebx
	add esp, 18h
	pop edi
	pop esi
	pop ecx
	ret
;sub_4267C0 endp

sub_426890: ;SUBROUTINE
	push ecx
	push edi
	mov edi, eax
	mov ecx, dword [dword_4D2098]
	test ecx, ecx
	jz loc_4268A1
	pop edi
	pop ecx
	ret

loc_4268A1:
	push esi
	push ebx
	mov ebx, 1
	mov esi, 20h
	mov dword [dword_4D2098], ebx
	mov dword [dword_4EC4BC], esi
	call sub_4289F0
	mov eax, edx
	call sub_4284B0
	push ecx
	push ecx
	push 7
	push esi
	push esi
	mov ebx, esi
	call sub_497464
	mov dword [dword_4D4D30], eax
	mov edx, esi
	xor ecx, ecx
	mov eax, esi
	call sub_492820
	mov esi, eax
	call sub_4825A8
	cmp byte [byte_4DB25C], 8
	jnz loc_426949
	mov eax, 0FFh

loc_4268F8:
	call sub_482740
	mov eax, edi
	xor ebx, ebx
	xor edx, edx
	mov ecx, 1
	call sub_483460
	call sub_4824BC
	mov edx, 6Dh
	mov eax, [esi+20h]
	xor ebx, ebx
	call sub_49A118
	push 0
	mov ebx, eax
	add eax, 10h
	push eax
	mov edi, dword [dword_4D4D30]
	push edi
	call sub_49755C
	mov eax, ebx
	call sub_4848FC
	mov eax, esi
	call sub_482DA0
	pop ebx
	pop esi
	pop edi
	pop ecx
	ret

loc_426949:
	xor eax, eax
	jmp loc_4268F8
;sub_426890 endp

sub_426950: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 4
	mov edx, 0FFFFFFFFh
	xor edi, edi
	mov dword [dword_4D4CFC], edx
	mov dword [dword_4D4CDC], edx
	mov dword [dword_4D4CBC], edx
	mov dword [dword_4D4C9C], edx
	mov ebp, 1

loc_42697D:
	mov [esp], edi
	xor esi, esi
	fild dword [esp]
	fst dword [flt_4D4C8C]
	fld st0
	fadd dword [flt_4C9F10]
	fxch st1
	fstp dword [flt_4D4CEC]
	fst dword [flt_4D4CAC]
	fstp dword [flt_4D4CCC]

loc_4269A7:
	fld dword [flt_4D4C8C]
	mov eax, dword [dword_4D4D28]
	mov [esp], esi
	mov ebx, esi
	call __CHP
	fild dword [esp]
	fxch st1
	fistp dword [esp]
	fstp dword [flt_4D4C90]
	mov eax, [eax+20h]
	mov edx, dword [flt_4D4C90]
	mov dword [flt_4D4CB0], edx
	fld dword [flt_4D4CB0]
	fadd dword [flt_4C9F10]
	mov edx, [esp]
	fst dword [flt_4D4CD0]
	fstp dword [flt_4D4CF0]
	call sub_4850B0
	mov eax, dword [dword_4D4D28]
	mov eax, [eax+20h]
	push 0
	add eax, 10h
	push eax
	mov eax, dword [dword_4D4D2C]
	push eax
	call sub_49755C
	mov edx, dword [dword_4D4D2C]
	push edx
	push ebp
	call sub_497738
	push dword_4D4D0C
	push flt_4D4C8C
	push ebp
	add esi, 20h
	call sub_497D6C
	cmp esi, 1E0h
	jnz loc_4269A7
	add edi, 20h
	cmp edi, 280h
	jnz loc_42697D
	add esp, 4
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_426950 endp

sub_426A60: ;SUBROUTINE
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 0Ch
	mov edi, eax
	mov [esp+4], edx
	mov [esp], ebx
	push 0
	push 0
	push 4
	push 20h
	push 20h
	mov ebx, 10h
	call sub_497464
	mov edx, 20h
	mov ebp, eax
	xor ecx, ecx
	mov eax, edx
	call sub_492820
	mov ecx, 20h
	mov esi, eax
	call sub_4825A8
	xor ebx, ebx
	push 20h
	xor edx, edx
	mov eax, edi
	call sub_49A4A0
	fild word [edi+4]
	fild word [edi+6]
	mov edx, 0FFFFFFFFh
	mov eax, [esp+4]
	push 0
	mov edi, [esi+20h]
	mov dword [dword_4D4CFC], edx
	mov dword [dword_4D4CDC], edx
	mov dword [dword_4D4CBC], edx
	mov [esp+0Ch], eax
	mov dword [dword_4D4C9C], edx
	fild dword [esp+0Ch]
	add edi, 10h
	mov eax, [esp+4]
	fst dword [flt_4D4C8C]
	fld st0
	push edi
	mov [esp+10h], eax
	fstp dword [flt_4D4CEC]
	fild dword [esp+10h]
	push ebp
	fstp dword [flt_4D4C90]
	faddp st2, st0
	fld dword [flt_4D4C90]
	fxch st2
	fst dword [flt_4D4CAC]
	fxch st2
	fst dword [flt_4D4CB0]
	faddp st1, st0
	fxch st1
	fstp dword [flt_4D4CCC]
	fst dword [flt_4D4CD0]
	fstp dword [flt_4D4CF0]
	call sub_49755C
	push ebp
	push 1
	call sub_497738
	push dword_4D4D0C
	push flt_4D4C8C
	push 1
	call sub_497D6C
	mov eax, esi
	call sub_482DA0
	add esp, 0Ch
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret
;sub_426A60 endp

sub_426B70: ;SUBROUTINE
	cmp word [eax+4], 280h
	jnz loc_426B84
	cmp word [eax+6], 1E0h
	jz sub_426950

loc_426B84:
	push edx
	push ebx
	mov ebx, [eax+0Ch]
	mov edx, [eax+0Ch]
	shl ebx, 4
	shl edx, 14h
	sar ebx, 14h
	sar edx, 14h
	call sub_426A60
	pop ebx
	pop edx
	ret
;sub_426B70 endp

sub_426C50: ;SUBROUTINE
	push esi
	push edi
	push ebp
	mov ebp, esp
	sub esp, 2Ch
	and esp, 0FFFFFFF8h
	mov [esp+10h], eax
	mov [esp+20h], edx
	mov edi, ebx
	mov [esp+18h], ecx
	mov ebx, [ebp+14h]
	mov ecx, [ebp+18h]
	mov eax, [esp+20h]
	mov edx, 3B800000h
	inc eax
	mov [esp+4], edx
	mov [esp+14h], eax
	mov eax, dword [dword_4E54AC]
	mov [esp+8], edx
	cmp eax, 24h
	jz loc_426EB3
	mov edx, ecx
	mov eax, ecx
	sar edx, 1Fh
	sub eax, edx
	sar eax, 1
	mov [esp+1Ch], eax
	mov edx, ebx
	mov eax, ebx
	sar edx, 1Fh
	sub eax, edx
	sar eax, 1
	mov edx, dword [dword_4E54AC]
	mov esi, eax
	cmp edx, 10h
	jnz loc_426ECF
	mov edx, [esp+14h]
	mov [esp+20h], edx
	mov edx, [ebp+10h]
	mov eax, [esp+1Ch]
	add edx, 3
	add edi, 4

loc_426CD3:
	mov [ebp+10h], edx

loc_426CD6:
	mov [esp+24h], edi
	mov edx, [esp+20h]
	fild dword [esp+24h]
	mov edi, dword [dword_4E54AC]
	mov [esp+24h], edx
	fstp dword [esp+0Ch]
	fild dword [esp+24h]
	fstp dword [esp]
	cmp edi, 12h
	jnz loc_426D29
	cmp byte [ebp+20h], 45h
	jnz loc_426D0E
	fld dword [esp]
	fadd qword [dbl_4C9F00]
	fstp dword [esp]

loc_426D0E:
	mov dh, [ebp+20h]
	cmp dh, 41h
	jb loc_426D29
	cmp dh, 5Ah
	ja loc_426D29
	fld dword [esp+0Ch]
	fadd qword [dbl_4C9F00]
	fstp dword [esp+0Ch]

loc_426D29:
	fld dword [esp]
	fld st0
	fld dword [esp+0Ch]
	fld st0
	fxch st2
	fld qword [dbl_4C9F08]
	fxch st1
	fadd st0, st1
	fxch st3
	faddp st1, st0
	fld dword [esp+8]
	fmul st3, st0
	fld dword [esp+4]
	fmulp st2, st0
	mov [esp+24h], ebx
	mov [esp+28h], ecx
	fild dword [esp+28h]
	fild dword [esp+24h]
	faddp st6, st0
	faddp st3, st0
	fmulp st4, st0
	fxch st1
	fmul dword [esp+4]
	mov edx, [ebp+1Ch]
	mov ecx, [esp+10h]
	mov dword [dword_4D4CFC], edx
	mov dword [dword_4D4CDC], edx
	mov dword [dword_4D4CBC], edx
	mov dword [dword_4D4C9C], edx
	mov edx, [esp+18h]
	push ecx
	mov [esp+28h], edx
	push 1
	fild dword [esp+2Ch]
	fxch st3
	fstp dword [flt_4D4D04]
	fxch st1
	fstp dword [flt_4D4CC8]
	fld dword [flt_4D4D04]
	fld dword [flt_4D4CC8]
	fxch st3
	fstp dword [flt_4D4CEC]
	fxch st3
	fstp dword [flt_4D4CE4]
	fstp dword [flt_4D4D08]
	lea edi, [edx+esi]
	fld dword [flt_4D4CEC]
	fld dword [flt_4D4CE4]
	fld dword [flt_4D4D08]
	fxch st4
	fstp dword [flt_4D4CA4]
	fxch st2
	fstp dword [flt_4D4CA8]
	mov edx, [ebp+10h]
	fstp dword [flt_4D4C8C]
	mov [esp+2Ch], edi
	fstp dword [flt_4D4CC4]
	fstp dword [flt_4D4CE8]
	fild dword [esp+2Ch]
	fstp dword [flt_4D4CCC]
	mov [esp+2Ch], edx
	add eax, edx
	fild dword [esp+2Ch]
	mov edx, dword [flt_4D4CCC]
	mov dword [flt_4D4CAC], edx
	mov [esp+2Ch], eax
	fstp dword [flt_4D4CB0]
	fild dword [esp+2Ch]
	mov eax, dword [flt_4D4CB0]
	mov dword [flt_4D4C90], eax
	fst dword [flt_4D4CF0]
	fstp dword [flt_4D4CD0]
	call sub_497738
	push dword_4D4D0C
	push flt_4D4C8C
	push 1
	xor ebx, ebx
	call sub_497D6C
	mov ecx, 3F800000h
	mov edx, dword [dword_4E54AC]
	mov dword [flt_4D4D04], ebx
	mov dword [flt_4D4CC8], ebx
	mov dword [flt_4D4CA8], ebx
	mov dword [flt_4D4CA4], ebx
	mov dword [flt_4D4D08], ecx
	mov dword [flt_4D4CE8], ecx
	mov dword [flt_4D4CE4], ecx
	mov dword [flt_4D4CC4], ecx
	cmp edx, 24h
	jnz loc_426EA9
	inc esi

loc_426EA9:
	mov eax, esi
	mov esp, ebp
	pop ebp
	pop edi
	pop esi
	ret 14h

loc_426EB3:
	mov edx, [esp+14h]
	lea eax, [ecx-1]
	mov [esp+20h], edx
	mov edx, [ebp+10h]
	add edi, 3
	add edx, 4
	lea esi, [ebx-1]
	jmp loc_426CD3

loc_426ECF:
	cmp edx, 0Dh
	jnz loc_426EFD
	mov edx, ebx
	mov eax, ebx
	sar edx, 1Fh
	shl edx, 2
	sbb eax, edx
	sar eax, 2
	mov edx, ecx
	add esi, eax
	mov eax, ecx
	sar edx, 1Fh
	shl edx, 2
	sbb eax, edx
	sar eax, 2
	add eax, [esp+1Ch]
	jmp loc_426CD6

loc_426EFD:
	mov edx, [esp+14h]
	mov eax, ecx
	mov esi, ebx
	mov [esp+20h], edx
	jmp loc_426CD6
;sub_426C50 endp

sub_426F10: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 100h
	mov ebx, 20h
	mov edx, 100h
	xor ecx, ecx
	mov eax, edx
	call sub_492820
	mov dword [dword_4EC4A8], eax
	call sub_4825A8
	cmp byte [byte_4DB25C], 8
	jnz loc_4270F7
	mov eax, 0FFh

loc_426F4B:
	call sub_482740
	mov esi, dword [dword_5134B8]
	push esi
	xor edx, edx
	push aSswiss36a_ffn ; "%sswiss36a.ffn"
	lea eax, [esp+8]
	mov dword [dword_4EC4AC], edx
	push eax
	mov dword [dword_4EC0B0], edx
	mov dword [dword_4EC0B4], edx
	call sprintf_
	add esp, 0Ch
	mov edx, 20h
	mov eax, esp
	call sub_486F40
	mov esi, eax
	call sub_487060
	xor eax, eax
	call sub_48266C
	mov edx, eax
	mov eax, 0FFFFFFh
	mov ecx, 41h
	call sub_48266C
	call sub_486560
	xor dl, dl
	mov ebx, 0E0h
	mov [esp+1], dl

loc_426FB8:
	mov eax, esp
	mov edx, ebx
	mov [esp], cl
	call sub_427100
	mov edi, dword [dword_4EC0B4]
	inc ebx
	add edi, eax
	inc ecx
	mov dword [dword_4EC0B4], edi
	cmp ecx, 5Ah
	jle loc_426FB8
	mov dh, 20h
	mov eax, esp
	mov [esp], dh
	mov edx, 0FAh
	mov bl, 0D6h
	call sub_427100
	mov edx, 0FBh
	mov ebp, dword [dword_4EC0B4]
	mov [esp], bl
	add ebp, eax
	mov eax, esp
	mov dword [dword_4EC0B4], ebp
	call sub_427100
	mov edx, dword [dword_4EC0B4]
	add edx, eax
	mov eax, esi
	mov dword [dword_4EC0B4], edx
	call sub_4848FC
	mov ecx, dword [dword_5134B8]
	push ecx
	push aSswiss18_ffn_0 ; "%sswiss18.ffn"
	lea eax, [esp+8]
	push eax
	call sprintf_
	add esp, 0Ch
	mov edx, 20h
	mov eax, esp
	call sub_486F40
	mov esi, eax
	call sub_487060
	xor eax, eax
	xor bh, bh
	call sub_48266C
	mov edx, eax
	mov eax, 0FFFFFFh
	mov ecx, 20h
	call sub_48266C
	call sub_486560
	mov [esp+1], bh
	xor ebx, ebx

loc_42706F:
	mov eax, esp
	mov edx, ebx
	mov [esp], cl
	call sub_427100
	mov edi, dword [dword_4EC0B4]
	inc ebx
	add edi, eax
	inc ecx
	mov dword [dword_4EC0B4], edi
	cmp ecx, 100h
	jl loc_42706F
	call sub_4824BC
	mov ecx, 1
	mov eax, dword [dword_4EC4A8]
	mov edx, 6Dh
	xor ebx, ebx
	mov eax, [eax+20h]
	call sub_49A118
	push 0
	mov dword [dword_4EC0AC], eax
	add eax, 10h
	push eax
	mov eax, dword [dword_4EC4AC]
	mov ebp, dword dword_4EC4B0[eax*4]
	push ebp
	call sub_49755C
	mov eax, dword [dword_4EC0AC]
	call sub_4848FC
	mov eax, dword [dword_4EC4A8]
	call sub_482DA0
	mov eax, esi
	call sub_4848FC
	add esp, 100h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4270F7:
	xor eax, eax
	jmp loc_426F4B
;sub_426F10 endp

sub_427100: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	mov edi, eax
	mov esi, edx
	mov edx, 1
	call sub_4823E0
	mov byte byte_4EC3AC[esi], al
	xor eax, eax
	mov edx, dword [dword_4EC0B4]
	mov al, byte byte_4EC3AC[esi]
	add eax, edx
	cmp eax, 0FFh
	jle loc_4271C4
	mov eax, dword [dword_4EC0B0]
	mov ebx, dword [dword_4EC0B0]
	xor ecx, ecx
	add eax, 66h
	add ebx, 33h
	mov dword [dword_4EC0B4], ecx
	mov dword [dword_4EC0B0], ebx
	cmp eax, 0FFh
	jle loc_4271C4
	mov edx, 6Dh
	mov eax, dword [dword_4EC4A8]
	mov dword [dword_4EC0B0], ecx
	xor ebx, ebx
	mov ecx, 1
	mov eax, [eax+20h]
	xor ebp, ebp
	call sub_49A118
	push ebp
	mov dword [dword_4EC0AC], eax
	add eax, 10h
	push eax
	mov eax, dword [dword_4EC4AC]
	mov edx, dword dword_4EC4B0[eax*4]
	push edx
	call sub_49755C
	mov eax, dword [dword_4EC0AC]
	call sub_4848FC
	mov ecx, dword [dword_4EC4AC]
	inc ecx
	mov ah, byte [byte_4DB25C]
	mov dword [dword_4EC4AC], ecx
	cmp ah, 8
	jnz loc_427206
	mov eax, 0FFh

loc_4271BF:
	call sub_482740

loc_4271C4:
	mov al, byte [dword_4EC4AC]
	mov byte byte_4EC0B8[esi], al
	mov al, byte [dword_4EC0B4]
	mov ebx, dword [dword_4EC0B0]
	mov byte byte_4EC2B0[esi], al
	mov al, byte [dword_4EC0B0]
	mov edx, dword [dword_4EC0B4]
	mov byte byte_4EC1B4[esi], al
	mov eax, edi
	call sub_486A30
	xor eax, eax
	mov al, byte byte_4EC3AC[esi]
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_427206:
	xor eax, eax
	jmp loc_4271BF
;sub_427100 endp

sub_427210: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	mov esi, 0FAh
	mov ebp, 1
	xor edi, edi

loc_427222:
	push 2
	call sub_497680
	call sub_49769C
	push esi
	push ebp
	mov ebx, 20h
	mov ecx, edi
	push 0FFh
	mov edx, edi
	mov eax, ebp
	call sub_427C70
	push esi
	mov ebx, 20h
	push ebp
	mov ecx, edi
	mov edx, edi
	push 0FFh
	mov eax, edi
	sub esi, 0Ah
	call sub_427C70
	call sub_4976B8
	cmp esi, 14h
	jge loc_427222
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_427210 endp

sub_427280: ;SUBROUTINE
	push esi
	push edi
	push ebp
	sub esp, 0Ch
	mov ebp, eax
	mov edi, edx
	mov [esp+4], ebx
	mov [esp], ecx
	mov esi, eax
	mov eax, edx
	sar edx, 1Fh
	sub eax, edx
	sar eax, 1
	mov [esp+8], eax
	cmp ebp, eax
	jl loc_42730A

loc_4272A4:
	push 2
	call sub_497680
	call sub_49769C
	push esi
	mov ebx, [esp+8]
	push ebx
	mov eax, 1
	mov ecx, edi
	push ebp
	xor edx, edx
	mov ebx, 20h
	call sub_427C70
	push 0FFFFFFFFh
	mov ecx, 20h
	xor ebx, ebx
	xor edx, edx
	xor eax, eax
	call sub_427B30
	cmp dword [esp], 0
	jz loc_4272F3
	mov eax, dword [byte_4D3ECC]
	xor edx, edx
	sar eax, 10h
	call sub_4276F0

loc_4272F3:
	call sub_4976B8
	mov ecx, [esp+8]
	sub esi, 0Ah
	cmp esi, ecx
	jge loc_4272A4

loc_42730A:
	add esp, 0Ch
	pop ebp
	pop edi
	pop esi
	ret
;sub_427280 endp

sub_427320: ;SUBROUTINE
	push esi
	push edi
	push ebp
	sub esp, 8
	mov edi, eax
	mov ebp, edx
	mov [esp], ebx
	mov [esp+4], ecx
	mov esi, eax
	cmp eax, 0FFh
	jg loc_4273A1

loc_42733A:
	push 2
	call sub_497680
	call sub_49769C
	push esi
	mov edx, [esp+4]
	push edx
	mov ebx, 20h
	mov eax, 1
	push ebp
	mov ecx, edi
	xor edx, edx
	call sub_427C70
	push 0FFFFFFFFh
	mov ecx, 20h
	xor ebx, ebx
	xor edx, edx
	xor eax, eax
	call sub_427B30
	cmp dword [esp+4], 0
	jz loc_42738A
	mov eax, dword [byte_4D3ECC]
	xor edx, edx
	sar eax, 10h
	call sub_4276F0

loc_42738A:
	add esi, 0Ah
	call sub_4976B8
	cmp esi, 0FFh
	jle loc_42733A

loc_4273A1:
	add esp, 8
	pop ebp
	pop edi
	pop esi
	ret
;sub_427320 endp

sub_4273B0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	mov edi, eax
	mov eax, 1Fh
	call sub_486550
	test eax, eax
	jz loc_427408
	mov ebp, 20h
	xor esi, esi

loc_4273CD:
	push 2
	call sub_497680
	call sub_49769C
	xor ebx, ebx
	push 0FFFFFFFFh
	mov ecx, ebp
	mov edx, esi
	mov eax, edi
	call sub_427B30
	sub esi, 0Ch
	call sub_4976B8
	cmp esi, 0FFFFFEBBh
	jg loc_4273CD
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_427408:
	mov esi, 20h
	xor ebp, ebp

loc_42740F:
	push 2
	mov ebx, ebp
	call sub_497680
	call sub_49769C
	push 0FFFFFFFFh
	mov ecx, esi
	mov edx, ebp
	mov eax, edi
	call sub_427B30
	dec esi
	call sub_4976B8
	test esi, esi
	jge loc_42740F
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_4273B0 endp

sub_427450: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	mov edi, eax
	push 0
	push 4
	call sub_497738
	mov eax, 1Fh
	call sub_486550
	test eax, eax
	jz loc_4274B1
	mov esi, 0FFFFFEC8h
	xor ebp, ebp

loc_427477:
	push 2
	mov ebx, ebp
	call sub_497680
	call sub_49769C
	push 0FFFFFFFFh
	mov ecx, 20h
	mov edx, esi
	mov eax, edi
	call sub_427B30
	add esi, 0Ch
	call sub_4976B8
	test esi, esi
	jle loc_427477
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4274B1:
	xor esi, esi
	xor ebp, ebp

loc_4274B5:
	push 2
	mov ebx, ebp
	call sub_497680
	call sub_49769C
	push 0FFFFFFFFh
	mov ecx, esi
	mov edx, ebp
	mov eax, edi
	call sub_427B30
	inc esi
	call sub_4976B8
	cmp esi, 20h
	jle loc_4274B5
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_427450 endp

sub_4274F0: ;SUBROUTINE
	push esi
	push edi
	push ebp
	mov ebp, esp
	sub esp, 0Ch
	and esp, 0FFFFFFF8h
	mov edi, ebx
	mov esi, ecx
	cmp edx, dword [dword_4D4E64]
	jle loc_427695

loc_42750B:
	sub edx, dword [dword_4D4E64]
	cmp edx, 28h
	jle loc_42752D
	mov ebx, dword [dword_4D4E60]
	cmp ebx, 400h
	jge loc_42752D
	lea edx, [ebx+eax]
	mov dword [dword_4D4E60], edx

loc_42752D:
	mov ebx, dword [dword_4D4E60]
	mov eax, ebx
	lea ecx, [eax+100h]
	shl ch, 7
	sbb edx, edx
	add ch, ch
	sbb ecx, ecx
	xor eax, ecx
	and eax, 0FFh
	sub eax, ecx
	mov eax, dword dword_4DB6B4[eax*4]
	xor eax, edx
	sub eax, edx
	mov edx, eax
	sar edx, 1Fh
	shl edx, 9
	sbb eax, edx
	sar eax, 9
	mov ecx, eax
	cmp dword [dword_4D4E60], 400h
	jl loc_4276A8
	mov edx, 0FFh
	mov ecx, 80h

loc_427581:
	mov ebx, dword [dword_4D4E60]
	cmp ebx, 100h
	jle loc_4275A6
	cmp ebx, 300h
	jge loc_4275A6
	mov eax, edx
	sar edx, 1Fh
	shl edx, 2
	sbb eax, edx
	sar eax, 2
	mov edx, eax

loc_4275A6:
	mov eax, edx
	mov [esp], edi
	mov [esp+4], ecx
	mov [esp+8], esi
	fild dword [esp]
	fild dword [esp+4]
	fild dword [esp+8]
	shl eax, 10h
	mov esi, dword [dword_4D4E44]
	sub eax, 1000000h
	fadd qword [dbl_4C9ED0]
	push esi
	fstp dword [flt_4D4CB0]
	push 1
	fld dword [flt_4D4CB0]
	mov [esp+0Ch], eax
	fxch st2
	fadd dword [flt_4C9EC8]
	fxch st2
	fstp dword [flt_4D4C90]
	mov ebx, [esp+0Ch]
	fld st1
	mov eax, edx
	fld dword [flt_4D4C90]
	shl eax, 8
	fxch st1
	fsub st0, st2
	fxch st3
	faddp st2, st0
	fadd dword [flt_4C9ED8]
	fxch st2
	fstp dword [flt_4D4CEC]
	fstp dword [flt_4D4CCC]
	fstp dword [flt_4D4CF0]
	add eax, ebx
	fld dword [flt_4D4CEC]
	fld dword [flt_4D4CCC]
	fld dword [flt_4D4CF0]
	fxch st2
	fstp dword [flt_4D4C8C]
	fstp dword [flt_4D4CAC]
	add eax, edx
	fstp dword [flt_4D4CD0]
	mov dword [dword_4D4CFC], eax
	mov dword [dword_4D4CDC], eax
	mov dword [dword_4D4CBC], eax
	mov dword [dword_4D4C9C], eax
	call sub_497738
	push dword_4D4D0C
	push flt_4D4C8C
	push 1
	call sub_497D6C
	cmp dword [dword_4D4E60], 400h
	jge loc_4276E3
	mov eax, 1
	mov esp, ebp
	pop ebp
	pop edi
	pop esi
	ret

loc_427695:
	xor ebx, ebx
	mov dword [dword_4D4E64], edx
	mov dword [dword_4D4E60], ebx
	jmp loc_42750B

loc_4276A8:
	cmp ebx, 100h
	jge loc_4276C6

loc_4276B0:
	mov edx, ebx
	mov eax, 0FFh
	and edx, 0FFh
	sub eax, edx
	mov edx, eax
	jmp loc_427581

loc_4276C6:
	cmp ebx, 200h
	jle loc_4276D6
	cmp ebx, 300h
	jl loc_4276B0

loc_4276D6:
	mov edx, ebx
	and edx, 0FFh
	jmp loc_427581

loc_4276E3:
	xor eax, eax
	mov esp, ebp
	pop ebp
	pop edi
	pop esi
	ret
;sub_4274F0 endp

sub_4276F0: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 0Ch
	mov ebp, dword [dword_4D4E4C]
	mov edi, eax
	cmp byte [byte_512DA9], 1
	jnz loc_4278A4

loc_42770D:
	cmp edi, dword [dword_4D4E50]
	jz loc_42771A
	mov ebp, 400h

loc_42771A:
	cmp edx, dword [dword_4D4E54]
	jg loc_4278B1

loc_427726:
	xor eax, eax
	mov al, byte [byte_512DA9]
	mov dword [dword_4D4E54], edx
	mov dword [dword_4D4E58], eax
	xor eax, eax
	mov dword [dword_4D4E50], edi
	mov al, byte [byte_512DAA]
	xor ebp, ebp
	mov dword [dword_4D4E5C], eax

loc_42774C:
	sub edx, dword [dword_4D4E54]
	cmp edx, 28h
	jg loc_4278E0

loc_42775B:
	lea eax, [edi+1]
	xor esi, esi
	xor ebx, ebx
	mov [esp+4], eax

loc_427766:
	mov eax, dword dword_4EB58C[ebx]
	mov dword [dword_4D4E4C], ebp
	test eax, eax
	jz loc_427871
	cmp edi, 0FFFFFFFFh
	jz loc_4278F4
	cmp esi, [esp+4]
	jnz loc_4278F4

loc_42778D:
	cmp ebp, 400h
	jl loc_42792D
	mov edx, 0FFh
	mov ecx, 40h

loc_4277A3:
	mov eax, edx
	shl eax, 10h
	sub eax, 1000000h
	mov [esp], eax
	mov eax, edx
	shl eax, 8
	mov [esp+8], eax
	mov eax, [esp]
	add eax, [esp+8]
	add eax, edx
	mov dword [dword_4D4E4C], ebp
	mov dword [dword_4D4CFC], eax
	mov dword [dword_4D4CDC], eax
	mov dword [dword_4D4CBC], eax
	mov dword [dword_4D4C9C], eax

loc_4277DC:
	fld dword [flt_4C9EC0]
	fld st0
	fild dword dword_4EB58C[ebx]
	mov [esp+8], ecx
	fstp dword [flt_4D4CB0]
	mov eax, dword dword_4EB5A4[ebx]
	fild dword [esp+8]
	mov edx, dword [flt_4D4CB0]
	mov dword [flt_4D4C90], edx
	push eax
	fld dword [flt_4D4C90]
	fxch st2
	fsub st0, st1
	push 1
	fstp dword [flt_4D4CEC]
	faddp st2, st0
	fadd dword [flt_4C9EC4]
	fld dword [flt_4D4CEC]
	fxch st2
	fstp dword [flt_4D4CCC]
	fstp dword [flt_4D4CF0]
	fld dword [flt_4D4CCC]
	fld dword [flt_4D4CF0]
	fxch st2
	fstp dword [flt_4D4C8C]
	fstp dword [flt_4D4CAC]
	fstp dword [flt_4D4CD0]
	call sub_497738
	push dword_4D4D0C
	push flt_4D4C8C
	push 1
	call sub_497D6C

loc_427871:
	mov ebp, dword [dword_4D4E4C]
	inc esi
	add ebx, 4
	cmp esi, 6
	jl loc_427766
	cmp ebp, 400h
	jge loc_4279CC
	mov eax, 1
	mov dword [dword_4D4E4C], ebp
	add esp, 0Ch
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_4278A4:
	xor ecx, ecx
	mov dword [dword_4EB59C], ecx
	jmp loc_42770D

loc_4278B1:
	xor eax, eax
	mov ecx, dword [dword_4D4E58]
	mov al, byte [byte_512DA9]
	cmp eax, ecx
	jnz loc_427726
	xor eax, ecx
	mov ebx, dword [dword_4D4E5C]
	mov al, byte [byte_512DAA]
	cmp eax, ebx
	jnz loc_427726
	jmp loc_42774C

loc_4278E0:
	cmp ebp, 400h
	jge loc_42775B
	add ebp, 0Ah
	jmp loc_42775B

loc_4278F4:
	test esi, esi
	jnz loc_427900
	test edi, edi
	jz loc_42778D

loc_427900:
	mov ecx, 0FF815412h
	mov dword [dword_4D4E4C], ebp
	mov dword [dword_4D4CDC], ecx
	mov dword [dword_4D4CBC], ecx
	mov dword [dword_4D4C9C], ecx
	mov dword [dword_4D4CFC], ecx
	mov ecx, 40h
	jmp loc_4277DC

loc_42792D:
	mov eax, ebp
	mov dword [dword_4D4E4C], ebp
	lea ecx, [eax+100h]
	shl ch, 7
	sbb edx, edx
	add ch, ch
	sbb ecx, ecx
	xor eax, ecx
	and eax, 0FFh
	sub eax, ecx
	mov eax, dword dword_4DB6B4[eax*4]
	xor eax, edx
	sub eax, edx
	mov edx, eax
	sar edx, 1Fh
	shl edx, 0Ah
	sbb eax, edx
	sar eax, 0Ah
	mov ebp, dword [dword_4D4E4C]
	mov ecx, eax
	cmp ebp, 100h
	jge loc_4279B2

loc_427975:
	mov edx, ebp
	mov eax, 0FFh
	and edx, 0FFh
	sub eax, edx
	mov edx, eax

loc_427986:
	cmp ebp, 100h
	jle loc_4277A3
	cmp ebp, 300h
	jge loc_4277A3
	mov eax, edx
	sar edx, 1Fh
	shl edx, 2
	sbb eax, edx
	sar eax, 2
	mov edx, eax
	jmp loc_4277A3

loc_4279B2:
	cmp ebp, 200h
	jl loc_4279C2
	cmp ebp, 300h
	jl loc_427975

loc_4279C2:
	mov edx, ebp
	and edx, 0FFh
	jmp loc_427986

loc_4279CC:
	xor eax, eax
	mov dword [dword_4D4E4C], ebp
	add esp, 0Ch
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_4276F0 endp

sub_4279E0: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 1Ch
	mov [esp+10h], eax
	mov [esp+0Ch], edx
	mov edx, 0FFFFFFFFh
	mov ebp, 14h
	xor edi, edi
	mov dword [dword_4D4CFC], edx
	mov dword [dword_4D4CDC], edx
	mov dword [dword_4D4CBC], edx
	mov dword [dword_4D4C9C], edx
	mov [esp+8], edi
	mov [esp+4], ebp
	mov [esp], edi

loc_427A1F:
	mov edi, [esp]
	mov edx, [esp+8]
	mov ebp, [esp+4]
	xor esi, esi
	imul ebx, edx, 14h

loc_427A2F:
	mov eax, [esp+10h]
	mov [esp+14h], edi
	mov [esp+18h], esi
	mov ecx, dword dword_4EB5BC[ebx]
	fild dword [esp+14h]
	fild dword [esp+18h]
	mov [esp+18h], eax
	push ecx
	fild dword [esp+1Ch]
	mov eax, [esp+10h]
	push 1
	mov [esp+20h], eax
	faddp st2, st0
	fild dword [esp+20h]
	fxch st2
	fst dword [flt_4D4CEC]
	fstp dword [flt_4D4C8C]
	faddp st1, st0
	fld dword [flt_4D4C8C]
	fxch st1
	fst dword [flt_4D4CB0]
	fstp dword [flt_4D4C90]
	fadd dword [flt_4C9EB4]
	fld dword [flt_4D4C90]
	fxch st1
	fst dword [flt_4D4CCC]
	fxch st1
	fadd dword [flt_4C9EB4]
	fxch st1
	fstp dword [flt_4D4CAC]
	fst dword [flt_4D4CF0]
	fstp dword [flt_4D4CD0]
	call sub_497738
	push dword_4D4D0C
	push flt_4D4C8C
	push 1
	call sub_497D6C
	mov eax, dword dword_4EB684[ebx]
	push eax
	push 1
	call sub_497738
	push dword_4D4D0C
	push flt_4D4C8C
	push 1
	add ebx, 4
	add esi, 20h
	call sub_497D6C
	cmp ebx, ebp
	jnz loc_427A2F
	mov ecx, [esp]
	mov ebx, [esp+8]
	mov edx, [esp+4]
	add ecx, 20h
	inc ebx
	add edx, 14h
	mov [esp], ecx
	mov [esp+8], ebx
	mov [esp+4], edx
	cmp ebx, 0Ah
	jl loc_427A1F
	add esp, 1Ch
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret
;sub_4279E0 endp

sub_427B30: ;SUBROUTINE
	push esi
	push edi
	push ebp
	sub esp, 28h
	mov esi, eax
	mov [esp+8], edx
	mov [esp], ebx
	mov [esp+10h], ecx
	mov ebx, [esp+38h]
	mov dword [dword_4D4CFC], ebx
	mov dword [dword_4D4CDC], ebx
	mov dword [dword_4D4CBC], ebx
	mov dword [dword_4D4C9C], ebx
	lea ebx, 0[eax*4]
	add ebx, eax
	shl ebx, 4
	mov esi, ebx
	shl ebx, 4
	sub ebx, esi
	mov [esp+0Ch], ebx
	add ebx, 3Ch
	xor ebp, ebp
	mov [esp+18h], ebx
	mov ebx, ecx
	imul ebx, ebp
	mov [esp+4], ecx
	mov [esp+14h], ebx

loc_427B8C:
	mov ebx, [esp+14h]
	mov [esp+1Ch], ebx
	mov ebx, [esp+8]
	mov [esp+20h], ebx
	mov ebx, [esp+10h]
	mov [esp+24h], ebx
	imul ebx, ebp, 3Ch
	mov ecx, [esp+0Ch]
	mov esi, [esp]
	fild dword [esp+1Ch]
	fild dword [esp+20h]
	faddp st1, st0
	fild dword [esp+24h]
	fxch st1
	fst dword [flt_4D4CEC]
	fst dword [flt_4D4C8C]
	faddp st1, st0
	mov edi, [esp+18h]
	fst dword [flt_4D4CCC]
	fstp dword [flt_4D4CAC]
	add ebx, ecx

loc_427BDE:
	mov [esp+24h], esi
	mov eax, dword dword_4EB74C[ebx]
	fild dword [esp+24h]
	fstp dword [flt_4D4CB0]
	push eax
	fld dword [flt_4D4CB0]
	fld st0
	push 1
	fadd dword [flt_4C9EB0]
	fxch st1
	fstp dword [flt_4D4C90]
	fst dword [flt_4D4CF0]
	fstp dword [flt_4D4CD0]
	call sub_497738
	push dword_4D4D0C
	push flt_4D4C8C
	push 1
	add ebx, 4
	add esi, 20h
	call sub_497D6C
	cmp ebx, edi
	jnz loc_427BDE
	mov ebx, [esp+4]
	mov ecx, [esp+14h]
	mov edx, [esp+18h]
	inc ebp
	add ecx, ebx
	add edx, 3Ch
	mov [esp+14h], ecx
	mov [esp+18h], edx
	cmp ebp, 14h
	jl loc_427B8C
	add esp, 28h
	pop ebp
	pop edi
	pop esi
	ret 4
;sub_427B30 endp

sub_427C70: ;SUBROUTINE
	push esi
	push edi
	push ebp
	sub esp, 40h
	mov esi, eax
	mov [esp], edx
	mov [esp+0Ch], ebx
	mov ebp, ecx
	lea ebx, 0[eax*4]
	add ebx, eax
	shl ebx, 4
	mov esi, ebx
	shl ebx, 4
	sub ebx, esi
	mov esi, 0F0h
	mov [esp+8], ebx
	mov [esp+24h], esi
	mov esi, [esp+8]
	add esi, 3Ch
	mov [esp+18h], esi
	mov esi, [esp+0Ch]
	xor edx, edx
	mov [esp+4], esi
	imul esi, edx
	mov edi, 0Ch
	mov [esp+30h], edx
	mov [esp+20h], edx
	mov ebx, [esp+58h]
	mov [esp+28h], edi
	add ebx, ebx
	mov eax, 0E4h
	sub ebx, 0F7h
	mov [esp+1Ch], eax
	mov [esp+14h], ebx
	mov [esp+10h], ebx
	mov [esp+2Ch], esi

loc_427CEB:
	mov ecx, [esp+58h]
	cmp ecx, 0FFFFFFFFh
	jz loc_427E8E
	cmp dword [esp+54h], 0
	jz loc_427EAB
	mov ebx, [esp+10h]
	add ebx, [esp+24h]

loc_427D0B:
	cmp ebx, ebp
	jge loc_427D11
	mov ebx, ebp

loc_427D11:
	mov eax, [esp+50h]
	cmp ebx, eax
	jle loc_427D1B
	mov ebx, eax

loc_427D1B:
	mov esi, ebx
	shl esi, 10h
	lea edi, [esi-1000000h]
	mov esi, ebx
	shl esi, 8
	add esi, edi
	add esi, ebx
	mov edx, [esp+54h]
	mov dword [dword_4D4CFC], esi
	mov dword [dword_4D4C9C], esi
	test edx, edx
	jz loc_427EB8
	mov ebx, [esp+14h]
	add ebx, [esp+1Ch]

loc_427D4F:
	cmp ebx, ebp
	jge loc_427D55
	mov ebx, ebp

loc_427D55:
	mov edi, [esp+50h]
	cmp ebx, edi
	jle loc_427D5F
	mov ebx, edi

loc_427D5F:
	mov esi, ebx
	shl esi, 10h
	lea edi, [esi-1000000h]
	mov esi, ebx
	shl esi, 8
	add esi, edi
	add esi, ebx
	mov dword [dword_4D4CDC], esi
	mov dword [dword_4D4CBC], esi

loc_427D7F:
	mov ebx, [esp+2Ch]
	mov [esp+34h], ebx
	mov ebx, [esp]
	mov [esp+38h], ebx
	mov ebx, [esp+0Ch]
	mov esi, [esp+30h]
	mov [esp+3Ch], ebx
	imul ebx, esi, 3Ch
	fild dword [esp+34h]
	fild dword [esp+38h]
	faddp st1, st0
	fild dword [esp+3Ch]
	fxch st1
	fst dword [flt_4D4CEC]
	fst dword [flt_4D4C8C]
	faddp st1, st0
	mov edi, [esp+8]
	fst dword [flt_4D4CCC]
	fstp dword [flt_4D4CAC]
	add ebx, edi
	xor esi, esi
	mov edi, [esp+18h]

loc_427DD3:
	mov [esp+3Ch], esi
	mov eax, dword dword_4EB74C[ebx]
	fild dword [esp+3Ch]
	fstp dword [flt_4D4CB0]
	push eax
	fld dword [flt_4D4CB0]
	fld st0
	push 1
	fadd dword [flt_4C9EAC]
	fxch st1
	fstp dword [flt_4D4C90]
	fst dword [flt_4D4CF0]
	fstp dword [flt_4D4CD0]
	call sub_497738
	push dword_4D4D0C
	push flt_4D4C8C
	push 1
	add ebx, 4
	add esi, 20h
	call sub_497D6C
	cmp ebx, edi
	jnz loc_427DD3
	mov ebx, [esp+28h]
	mov edx, [esp+20h]
	mov ecx, [esp+24h]
	mov esi, [esp+1Ch]
	mov edi, [esp+18h]
	mov eax, [esp+2Ch]
	add ebx, 0Ch
	add edx, 0Ch
	sub ecx, 0Ch
	sub esi, 0Ch
	add edi, 3Ch
	mov [esp+28h], ebx
	mov [esp+20h], edx
	mov [esp+24h], ecx
	mov [esp+1Ch], esi
	mov [esp+18h], edi
	mov ebx, [esp+4]
	mov edx, [esp+30h]
	add eax, ebx
	inc edx
	mov [esp+2Ch], eax
	mov [esp+30h], edx
	cmp edx, 14h
	jl loc_427CEB
	add esp, 40h
	pop ebp
	pop edi
	pop esi
	ret 0Ch

loc_427E8E:
	mov dword [dword_4D4CDC], ecx
	mov dword [dword_4D4CBC], ecx
	mov dword [dword_4D4C9C], ecx
	mov dword [dword_4D4CFC], ecx
	jmp loc_427D7F

loc_427EAB:
	mov ebx, [esp+10h]
	add ebx, [esp+20h]
	jmp loc_427D0B

loc_427EB8:
	mov ebx, [esp+14h]
	add ebx, [esp+28h]
	jmp loc_427D4F
;sub_427C70 endp

sub_427ED0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 2Ch
	mov [esp], eax
	mov ebx, 20h
	xor ecx, ecx
	mov edx, ebx
	mov eax, ebx
	call sub_492820
	mov ebx, 20h
	mov edx, 0A0h
	mov [esp+28h], eax
	xor ecx, ecx
	mov eax, 180h
	call sub_492820
	mov [esp+4], eax
	call sub_4825A8
	xor ebx, ebx
	xor eax, eax
	xor edx, edx
	call sub_482740
	mov eax, [esp]
	mov ecx, 14h
	call sub_40CD70
	xor edx, edx
	mov [esp+0Ch], ecx
	mov [esp+18h], edx
	mov [esp+14h], edx

loc_427F35:
	imul esi, [esp+18h], 14h
	mov eax, [esp+0Ch]
	mov ebp, [esp+14h]
	mov [esp+24h], eax
	xor edi, edi

loc_427F48:
	mov eax, [esp+28h]
	mov ebx, edi
	mov edx, ebp
	mov eax, [eax+20h]
	mov ecx, 1
	call sub_4850B0
	mov eax, [esp+28h]
	mov edx, 6Dh
	xor ebx, ebx
	mov eax, [eax+20h]
	call sub_49A118
	push 0
	mov ebx, eax
	add eax, 10h
	push eax
	mov eax, dword dword_4EB5BC[esi]
	push eax
	add esi, 4
	add edi, 20h
	call sub_49755C
	mov eax, ebx
	mov edx, [esp+24h]
	call sub_4848FC
	cmp esi, edx
	jnz loc_427F48
	mov ebx, [esp+14h]
	mov esi, [esp+18h]
	mov ecx, [esp+0Ch]
	add ebx, 20h
	inc esi
	add ecx, 14h
	mov [esp+14h], ebx
	mov [esp+18h], esi
	mov [esp+0Ch], ecx
	cmp esi, 0Ah
	jl loc_427F35
	mov eax, [esp+4]
	mov ebx, 10h
	mov edx, 0A0h
	call sub_482DA0
	mov eax, [esp+28h]
	xor ecx, ecx
	call sub_482DA0
	mov eax, 180h
	xor ebp, ebp
	call sub_492820
	mov [esp+4], eax
	call sub_4825A8
	xor ebx, ebx
	xor eax, eax
	xor edx, edx
	call sub_482740
	mov eax, [esp]
	mov [esp+1Ch], ebp
	call sub_40CD70
	mov eax, 14h
	mov [esp+10h], ebp
	mov [esp+8], eax

loc_428019:
	mov ecx, [esp+1Ch]
	mov eax, [esp+8]
	mov ebp, [esp+10h]
	xor edi, edi
	mov [esp+20h], eax
	imul esi, ecx, 14h

loc_42802E:
	mov eax, dword [dword_4D4D28]
	mov ebx, edi
	mov edx, ebp
	mov eax, [eax+20h]
	call sub_4850B0
	mov eax, dword [dword_4D4D28]
	mov eax, [eax+20h]
	call sub_428440
	mov eax, dword [dword_4D4D28]
	mov eax, [eax+20h]
	push 0
	add eax, 10h
	push eax
	mov ebx, dword dword_4EB684[esi]
	push ebx
	add esi, 4
	call sub_49755C
	mov eax, [esp+20h]
	add edi, 20h
	cmp esi, eax
	jnz loc_42802E
	mov ecx, [esp+10h]
	mov ebx, [esp+1Ch]
	mov edx, [esp+8]
	add ecx, 20h
	inc ebx
	add edx, 14h
	mov [esp+10h], ecx
	mov [esp+1Ch], ebx
	mov [esp+8], edx
	cmp ebx, 0Ah
	jl loc_428019
	mov eax, [esp+4]
	call sub_482DA0
	add esp, 2Ch
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_427ED0 endp

sub_4280B0: ;SUBROUTINE
	push esi
	push edi
	push ebp
	sub esp, 4
	mov esi, edx
	mov [esp], ebx
	mov ebp, ecx
	mov ebx, 20h
	mov edx, 100h
	xor ecx, ecx
	mov eax, edx
	call sub_492820
	mov edi, eax
	call sub_4825A8
	xor eax, eax
	mov edx, [esp]
	call sub_482740
	test edx, edx
	jnz loc_42812A
	mov ebx, [esp+14h]
	mov edx, ebp
	mov eax, esi
	call sub_486C60

loc_4280F2:
	call sub_4824BC
	mov edx, 0C8h
	mov eax, [edi+20h]
	call sub_4283A0
	mov eax, [edi+20h]
	push 0
	add eax, 10h
	push eax
	mov ecx, dword [dword_4D4E44]
	push ecx
	call sub_49755C
	mov eax, edi
	call sub_482DA0
	add esp, 4
	pop ebp
	pop edi
	pop esi
	ret 4

loc_42812A:
	mov eax, esi
	call sub_486D10
	jmp loc_4280F2
;sub_4280B0 endp

sub_428140: ;SUBROUTINE
	push esi
	push edi
	push ebp
	mov ebp, edx
	mov edi, ecx
	mov ebx, 20h
	mov edx, 100h
	xor ecx, ecx
	mov eax, edx
	call sub_492820
	mov ecx, [esp+10h]
	mov edx, 1900h
	mov esi, eax
	call sub_4825A8
	xor eax, eax
	mov ebx, edi
	call sub_482740
	mov eax, ebp
	call sub_405B30
	call sub_4824BC
	mov edx, 0C8h
	mov eax, [esi+20h]
	call sub_4283A0
	mov eax, [esi+20h]
	push 0
	add eax, 10h
	push eax
	mov edx, dword [dword_4D4E44]
	push edx
	call sub_49755C
	mov eax, esi
	call sub_482DA0
	pop ebp
	pop edi
	pop esi
	ret 4
;sub_428140 endp

sub_4281B0: ;SUBROUTINE
	push edi
	push ebp
	sub esp, 4
	mov ebp, edx
	mov [esp], ecx
	lea edi, 0[eax*4]
	mov eax, [esp+10h]
	mov dword dword_4EB58C[edi], eax
	test eax, eax
	jnz loc_4281D7
	add esp, 4
	pop ebp
	pop edi
	ret 4

loc_4281D7:
	push esi
	mov ebx, 10h
	mov edx, 80h
	xor ecx, ecx
	mov eax, edx
	call sub_492820
	mov ebx, [esp+4]
	mov edx, 2500h
	mov esi, eax
	call sub_4825A8
	xor eax, eax
	xor ecx, ecx
	call sub_482740
	sub ebx, 1FEh
	mov eax, ebp
	call sub_405B30
	call sub_4824BC
	mov eax, [esi+20h]
	call sub_428440
	mov eax, [esi+20h]
	push 0
	add eax, 10h
	push eax
	mov ecx, dword dword_4EB5A4[edi]
	push ecx
	call sub_49755C
	mov eax, esi
	call sub_482DA0
	pop esi
	add esp, 4
	pop ebp
	pop edi
	ret 4
;sub_4281B0 endp

sub_428250: ;SUBROUTINE
	push esi
	push edi
	push ebp
	sub esp, 18h
	mov esi, eax
	mov edi, edx
	mov edx, dword dword_4EB584[edx*4]
	cmp eax, edx
	jnz loc_42827D
	mov eax, dword [dword_4D231C]
	cmp edx, [eax+20h]
	jz loc_42827D
	mov eax, dword [dword_4D2320]
	cmp edx, [eax+20h]
	jnz loc_42838E

loc_42827D:
	push ecx
	push ebx
	mov ebx, 10h
	mov edx, 1E0h
	mov eax, 280h
	xor ecx, ecx
	mov dword dword_4EB584[edi*4], esi
	call sub_492820
	mov [esp+8], eax
	call sub_4825A8
	cmp byte [byte_4DB25C], 8
	jnz loc_428395
	mov eax, 0FFh

loc_4282B7:
	call sub_482740
	mov eax, esi
	call sub_483470
	call sub_4824BC
	mov eax, [esp+8]
	call sub_4825A8
	lea eax, 0[edi*4]
	add eax, edi
	xor esi, esi
	shl eax, 4
	mov [esp+18h], esi
	mov esi, eax
	shl eax, 4
	sub eax, esi
	xor edi, edi
	mov [esp+0Ch], eax
	add eax, 3Ch
	mov [esp+10h], edi
	mov [esp+14h], eax

loc_4282FB:
	imul esi, [esp+18h], 3Ch
	mov edx, [esp+0Ch]
	mov ebp, [esp+10h]
	xor edi, edi
	mov eax, [esp+14h]
	add esi, edx
	mov [esp+1Ch], eax

loc_428314:
	mov eax, dword [dword_4D4D28]
	mov ebx, edi
	mov edx, ebp
	mov eax, [eax+20h]
	call sub_4850B0
	mov eax, dword [dword_4D4D28]
	mov eax, [eax+20h]
	call sub_428440
	mov eax, dword [dword_4D4D28]
	mov eax, [eax+20h]
	push 0
	add eax, 10h
	push eax
	mov ecx, dword dword_4EB74C[esi]
	add esi, 4
	push ecx
	add edi, 20h
	mov ebx, [esp+28h]
	call sub_49755C
	cmp esi, ebx
	jnz loc_428314
	mov edi, [esp+10h]
	mov ebp, [esp+18h]
	mov esi, [esp+14h]
	add edi, 20h
	inc ebp
	add esi, 3Ch
	mov [esp+10h], edi
	mov [esp+18h], ebp
	mov [esp+14h], esi
	cmp ebp, 14h
	jl loc_4282FB
	mov eax, [esp+8]
	call sub_482DA0
	pop ebx
	pop ecx

loc_42838E:
	add esp, 18h
	pop ebp
	pop edi
	pop esi
	ret

loc_428395:
	xor eax, eax
	jmp loc_4282B7
;sub_428250 endp

sub_4283A0: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 10h
	mov [esp+8], edx
	lea ecx, [eax+10h]
	mov ebx, [eax+2]
	mov eax, [eax+4]
	sar ebx, 10h
	sar eax, 10h
	imul ebx, eax
	mov [esp+0Ch], ebx
	mov edx, ecx
	mov esi, [esp+0Ch]
	xor ebx, ebx
	test esi, esi
	jle loc_428429

loc_4283CE:
	mov eax, [ecx]
	mov esi, eax
	mov ebp, eax
	shr esi, 18h
	mov edi, eax
	and esi, 0FFh
	shr ebp, 13h
	mov [esp], esi
	mov esi, eax
	shr edi, 3
	shr esi, 0Bh
	and ebp, 1Fh
	and esi, 1Fh
	and edi, 1Fh
	mov [esp+4], esi
	mov esi, ebp
	mov eax, [esp+4]
	shl esi, 0Ah
	shl eax, 5
	mov ebp, [esp+8]
	or eax, esi
	mov esi, [esp]
	or eax, edi
	cmp esi, ebp
	jge loc_428432
	mov word [edx], 0

loc_42841A:
	mov edi, [esp+0Ch]
	add ecx, 4
	inc ebx
	add edx, 2
	cmp ebx, edi
	jl loc_4283CE

loc_428429:
	add esp, 10h
	pop ebp
	pop edi
	pop esi
	pop ecx
	pop ebx
	ret

loc_428432:
	or ah, 80h
	mov [edx], ax
	jmp loc_42841A
;sub_4283A0 endp

sub_428440: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	mov edx, eax
	mov ecx, [edx+2]
	mov ebp, [edx+4]
	sar ecx, 10h
	sar ebp, 10h
	imul ebp, ecx
	add eax, 10h
	xor ecx, ecx
	test ebp, ebp
	jle loc_42849A

loc_428460:
	mov dx, [eax]
	and edx, 0FFFFh
	mov esi, edx
	mov ebx, edx
	mov edi, edx
	sar esi, 0Bh
	sar ebx, 5
	and esi, 1Fh
	and ebx, 3Fh
	mov edx, esi
	sar ebx, 1
	shl edx, 0Ah
	shl ebx, 5
	and edi, 1Fh
	or edx, ebx
	or dx, di
	jnz loc_4284A1

loc_42848F:
	mov [eax], dx
	inc ecx
	add eax, 2
	cmp ecx, ebp
	jl loc_428460

loc_42849A:
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4284A1:
	or dh, 80h
	jmp loc_42848F
;sub_428440 endp

sub_4284B0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 4
	mov [esp], eax
	mov ebp, 3Ch
	xor edx, edx
	xor edi, edi
	mov dword [dword_4EB588], edx
	mov dword [dword_4EB584], edx

loc_4284D1:
	mov esi, ebp
	imul ebx, edi, 3Ch

loc_4284D6:
	push 0
	push 0
	push 3
	push 20h
	push 20h
	call sub_497464
	push 0
	push 0
	push 3
	push 20h
	add ebx, 4
	push 20h
	mov dword dword_4EB748[ebx], eax
	call sub_497464
	mov dword dword_4EBBF8[ebx], eax
	cmp ebx, esi
	jnz loc_4284D6
	inc edi
	add ebp, 3Ch
	cmp edi, 14h
	jl loc_4284D1
	push 0
	push 0
	push 7
	push 100h
	push 100h
	call sub_497464
	push 0
	push 0
	push 7
	push 100h
	push 100h
	mov dword [dword_4EC4B0], eax
	call sub_497464
	push 0
	push 0
	push 7
	push 100h
	push 100h
	mov ebx, [esp+14h]
	mov dword [dword_4EC4B4], eax
	call sub_497464
	mov dword [dword_4EC4B8], eax
	call sub_426F10
	cmp ebx, dword_4D2E78
	jz loc_42867B
	cmp ebx, dword_4D2944
	jz loc_42867B
	cmp ebx, dword_4D2870
	jz loc_42867B
	cmp ebx, off_4D3D90
	jz loc_42867B
	cmp ebx, off_4D3CFC
	jz loc_42867B
	cmp ebx, off_4D3DB8
	jz loc_42867B
	cmp ebx, dword_4D28C4
	jz loc_42867B
	cmp ebx, off_4D3C50
	jz loc_42867B
	cmp ebx, off_4D3BE4
	jz loc_42867B
	cmp ebx, off_4D3B74
	jz loc_42867B
	cmp ebx, off_4D3B08
	jz loc_42867B
	cmp ebx, dword_4D2824
	jz loc_42867B
	mov ebp, 14h
	xor edi, edi

loc_428603:
	mov esi, ebp
	imul ebx, edi, 14h

loc_428608:
	push 0
	push 0
	push 7
	push 20h
	push 20h
	call sub_497464
	push 0
	push 0
	push 3
	push 20h
	add ebx, 4
	push 20h
	mov dword dword_4EB5B8[ebx], eax
	call sub_497464
	mov dword dword_4EB680[ebx], eax
	cmp ebx, esi
	jnz loc_428608
	inc edi
	add ebp, 14h
	cmp edi, 0Ah
	jl loc_428603
	xor ebx, esi
	mov esi, 80h
	xor edi, edi

loc_42864D:
	push edi
	push edi
	push 3
	push esi
	push esi
	add ebx, 4
	call sub_497464
	mov dword dword_4EB5A0[ebx], eax
	cmp ebx, 18h
	jnz loc_42864D
	push 0
	push 2
	call sub_497738
	add esp, 4
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_42867B:
	push 0
	push 0
	push 3
	push 100h
	push 100h
	call sub_497464
	mov dword [dword_4D4E44], eax
	push 0
	push 2
	call sub_497738
	add esp, 4
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_4284B0 endp

sub_4286B0: ;SUBROUTINE
	push ecx
	push edx
	sub esp, 4
	call sub_4287C0
	mov eax, 0FF000000h
	call sub_48266C
	call sub_482740
	call sub_4976B8
	call sub_4289F0
	finit
	wait
	fstcw word [dword_4EC4C4]
	wait
	mov eax, dword [dword_4EC4C4]
	mov dword [dword_4EC4C0], eax
	and eax, 0FFFFFCFFh
	mov dword [dword_4EC4C4], eax
	fldcw word [dword_4EC4C4]
	wait
	call sub_4287C0
	mov eax, 0FF000000h
	call sub_48266C
	call sub_482740
	mov eax, dword [dword_4D4D20]
	mov [esp], eax
	mov edx, [esp]
	push edx
	push 65h
	call sub_497738
	add esp, 4
	pop edx
	pop ecx
	ret
;sub_4286B0 endp

sub_428730: ;SUBROUTINE
	push ecx
	push edx
	call sub_4287C0
	call sub_4976B8
	call sub_4287C0
	mov eax, 0FF000000h
	call sub_48266C
	call sub_482740
	finit
	wait
	fldcw word [dword_4EC4C0]
	wait
	pop edx
	pop ecx
	ret
;sub_428730 endp

sub_428770: ;SUBROUTINE
	push ecx
	push edx
	mov eax, dword [dword_4D4D24]
	mov eax, [eax+20h]
	call sub_426B70
	cmp dword [dword_4D2310], 0
	jnz loc_428797
	call sub_4976B8
	pop edx
	pop ecx
	ret

loc_428797:
	mov eax, dword [dword_4D4C7C]
	mov edx, dword [dword_4D4C80]
	sub eax, 7
	call sub_4267C0
	call sub_4976B8
	pop edx
	pop ecx
	ret
;sub_428770 endp

sub_4287C0: ;SUBROUTINE
	push ecx
	push edx
	mov eax, dword [dword_4D4D24]
	call sub_4825A8
	push 0
	call sub_4976C8
	push 2
	call sub_497680
	call sub_49769C
	pop edx
	pop ecx
	ret
;sub_4287C0 endp

sub_4287F0: ;SUBROUTINE
	push edx
	finit
	wait
	fldcw word [dword_4EC4C0]
	wait
	xor edx, edx
	mov eax, dword [dword_4D4D28]
	mov dword [dword_4D4D1C], edx
	call sub_482DA0
	mov eax, dword [dword_4D4D24]
	call sub_482DA0
	mov dword [dword_4D4D28], edx
	mov dword [dword_4D4D24], edx
	pop edx
	ret
;sub_4287F0 endp

sub_428830: ;SUBROUTINE
	push ebx
	push ecx
	mov ebx, edx
	mov dword [dword_4D4D1C], 1
	test eax, eax
	jnz loc_4288F0

loc_428846:
	push 2
	call sub_497680
	test ebx, ebx
	jz loc_428858
	call sub_49769C

loc_428858:
	push 1
	call sub_497680
	test ebx, ebx
	jnz loc_4288FA

loc_428868:
	mov ecx, 20h
	mov ebx, 10h
	mov edx, 1E0h
	mov eax, 280h
	call sub_492820
	mov ecx, 20h
	mov dword [dword_4D4D24], eax
	call sub_4825A8
	mov eax, 0FF000000h
	mov ebx, 10h
	call sub_48266C
	call sub_482740
	mov edx, ecx
	mov eax, ecx
	call sub_492820
	mov dword [dword_4D4D28], eax
	call sub_4825A8
	mov eax, 0FF000000h
	call sub_48266C
	call sub_482740
	finit
	wait
	fstcw word [dword_4EC4C4]
	wait
	mov eax, dword [dword_4EC4C4]
	mov dword [dword_4EC4C0], eax
	and eax, 0FFFFFCFFh
	mov dword [dword_4EC4C4], eax
	fldcw word [dword_4EC4C4]
	wait
	pop ecx
	pop ebx
	ret

loc_4288F0:
	call sub_4289F0
	jmp loc_428846

loc_4288FA:
	call sub_49769C
	jmp loc_428868
;sub_428830 endp

sub_428910: ;SUBROUTINE
	push ecx
	push edx
	sub esp, 4
	test eax, eax
	jz loc_42895A
	fld dword [dword_4D4D20]
	fadd dword [flt_4C9E74]
	fstp dword [dword_4D4D20]
	cmp dword [dword_4D4D20], 3F800000h
	jge loc_428941
	mov dword [dword_4D4D20], 40133333h

loc_428941:
	mov eax, dword [dword_4D4D20]
	mov [esp], eax
	mov edx, [esp]
	push edx
	push 65h
	call sub_497738
	add esp, 4
	pop edx
	pop ecx
	ret

loc_42895A:
	fld dword [dword_4D4D20]
	fadd dword [flt_4C9E6C]
	fst dword [dword_4D4D20]
	fcomp dword [flt_4C9E70]
	fnstsw ax
	sahf
	jbe loc_428941
	mov dword [dword_4D4D20], 3F800000h
	jmp loc_428941
;sub_428910 endp

sub_428990: ;SUBROUTINE
	push ecx
	push edx
	sub esp, 4
	fld dword [dword_4D4D20]
	fcomp dword [flt_4C9E50]
	fnstsw ax
	sahf
	ja loc_4289D5
	cmp dword [dword_4D4D20], 3F800000h
	jge loc_4289BC
	mov dword [dword_4D4D20], 3F800000h

loc_4289BC:
	mov eax, dword [dword_4D4D20]
	mov [esp], eax
	mov edx, [esp]
	push edx
	push 65h
	call sub_497738
	add esp, 4
	pop edx
	pop ecx
	ret

loc_4289D5:
	mov dword [dword_4D4D20], 40133333h
	jmp loc_4289BC
;sub_428990 endp

sub_4289F0: ;SUBROUTINE
	push ecx
	push edx
	call sub_4975B0
	push 0
	push 0
	push 4
	push 20h
	push 20h
	call sub_497464
	xor edx, edx
	mov dword [dword_4D4D2C], eax
	mov dword [dword_4D4D30], edx
	pop edx
	pop ecx
	ret
;sub_4289F0 endp

sub_428A20: ;SUBROUTINE
	cmp dword [dword_4D4D1C], 0
	jnz sub_4287C0
	ret
;sub_428A20 endp

sub_428A30: ;SUBROUTINE
	push ebx
	mov ebx, eax
	mov ah, byte [byte_4D4E84]
	test ah, ah
	jnz loc_428A46
	jz loc_428A6B
	mov eax, 1
	pop ebx
	ret

loc_428A46:
	push edx
	push ecx
	call sub_4972BC
	test ebx, ebx
	jz loc_428A61
	call sub_480BA0

loc_428A61:
	xor dh, dh
	mov byte [byte_4D4E84], dh
	pop ecx
	pop edx

loc_428A6B:
	xor eax, eax
	pop ebx
	ret
;sub_428A30 endp

sub_428A70: ;SUBROUTINE
	push ebx
	push edx
	push esi
	mov esi, eax
	cmp byte [byte_4D4E84], 0
	jnz loc_428AA3
	cmp dword [dword_4DB6A0], 0
	jz loc_428AAE

loc_428A87:
	test esi, esi
	jnz loc_428ABA
	mov ebx, 1

loc_428A90:
	mov edx, 1E0h
	mov eax, 280h
	call sub_480C60
	test eax, eax
	jnz loc_428ABE

loc_428AA3:
	xor eax, eax
	mov al, byte [byte_4D4E84]
	pop esi
	pop edx
	pop ebx
	ret

loc_428AAE:
	call sub_489EF8
	mov dword [dword_4DB6A0], eax
	jmp loc_428A87

loc_428ABA:
	xor ebx, ebx
	jmp loc_428A90

loc_428ABE:
	push ecx
	push off_4D4E68
	push 13h
	call sub_497738
	push esi
	push 12h
	call sub_497738
	cmp byte [byte_4D4E85], 0
	jnz loc_428B0A
	mov eax, sub_428B30
	mov dh, 1
	call atexit_
	mov byte [byte_4D4E85], dh

loc_428B0A:
	mov byte [byte_4D4E84], 1
	mov dword [dword_4DAC04], sub_428B40
	pop ecx
	xor eax, eax
	mov al, byte [byte_4D4E84]
	pop esi
	pop edx
	pop ebx
	ret
;sub_428A70 endp

sub_428B30: ;SUBROUTINE
	mov eax, 1
	jmp sub_428A30
;sub_428B30 endp

sub_428B40: ;SUBROUTINE
	push edx
	mov eax, 1
	xor edx, edx
	call sub_428A30
	mov dword [dword_4DAC04], edx
	pop edx
	ret
;sub_428B40 endp

sub_428C40: ;SUBROUTINE
	xor eax, eax
	jmp sub_483EB0
;sub_428C40 endp

sub_428C60: ;SUBROUTINE
	push ecx
	push esi
	push edi
	push ebp
	mov ecx, eax
	cmp dword [dword_4DB1F8], 0
	jz loc_428D7F

loc_428C73:
	test ecx, ecx
	jnz loc_428DA7
	mov ecx, 280h

loc_428C80:
	test edx, edx
	jnz loc_428DBA
	mov edx, 1E0h

loc_428C8D:
	test ebx, ebx
	jnz loc_428DCD

loc_428C95:
	mov ebx, 10h

loc_428C9A:
	mov eax, ecx
	call sub_49AFA0
	cmp dword [dword_4DAB5C], 0
	jnz loc_428CE0
	test byte [dword_4DAB88], 1
	jnz loc_428DE4
	mov eax, 1

loc_428CC6:
	call sub_428A70
	mov eax, sub_428E20
	mov edx, sub_428E10
	call atexit_
	mov dword [dword_4DAC04], edx

loc_428CE0:
	mov ecx, dword [dword_4DB2A4]
	test ecx, ecx
	jz loc_428CF1
	mov eax, ecx
	call sub_49B24C

loc_428CF1:
	mov ebx, dword [dword_4DB2A8]
	test ebx, ebx
	jz loc_428D02
	mov eax, ebx
	call sub_49B24C

loc_428D02:
	xor esi, esi
	mov ebp, dword [dword_4DB2DC]
	mov dword [dword_4DB2A4], esi
	mov dword [dword_4DB2A8], esi
	test ebp, ebp
	jz loc_428D21
	mov eax, ebp
	call sub_49B24C

loc_428D21:
	mov eax, dword [dword_4DB2E0]
	test eax, eax
	jz loc_428D2F
	call sub_49B24C

loc_428D2F:
	xor edx, edx
	mov ebx, dword [dword_4DABD4]
	mov dword [dword_4DB2DC], edx
	mov dword [dword_4DB2E0], edx
	test ebx, ebx
	jz loc_428D54
	mov eax, ebx
	call sub_482DA0
	mov dword [dword_4DABD4], edx

loc_428D54:
	mov edi, 1
	mov ebx, dword_4DB278
	xor edx, edx
	mov eax, edi
	mov dword [dword_4DAB5C], edi
	call sub_49AE90
	cmp edi, dword [dword_4DAB8C]
	jl loc_428DEB
	mov eax, 1
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret

loc_428D7F:
	mov edi, aCNfs2seGame3_2 ; "c:\\nfs2se\\game\\3rash\\initgrf.c"
	mov ebp, 2Ch
	push aInitgraphicsIn ; "initgraphics - INITMEMMAN REQUIRED BEFO"...
	mov dword [dword_4DB1D8], edi
	mov dword [dword_4DB1DC], ebp
	call sub_4840F0
	add esp, 4
	jmp loc_428C73

loc_428DA7:
	cmp ecx, 0FFFFFFFFh
	jnz loc_428C80
	mov ecx, 400h
	jmp loc_428C80

loc_428DBA:
	cmp edx, 0FFFFFFFFh
	jnz loc_428C8D
	mov edx, 300h
	jmp loc_428C8D

loc_428DCD:
	cmp ebx, 0FFFFFFFFh
	jz loc_428C95
	cmp ebx, 0Fh
	jnz loc_428C9A
	jmp loc_428C95

loc_428DE4:
	xor eax, eax
	jmp loc_428CC6

loc_428DEB:
	mov ebx, dword_4DB2B0
	mov eax, 2
	xor edx, edx
	call sub_49AE90
	mov eax, 1
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret
;sub_428C60 endp

sub_428E10: ;SUBROUTINE
	call sub_428E20
	xor eax, eax
	ret
;sub_428E10 endp

sub_428E20: ;SUBROUTINE
	cmp dword [dword_4DAB5C], 0
	jnz loc_428E2A
	ret

loc_428E2A:
	push ecx
	xor eax, eax
	call sub_49AE1C
	mov eax, 1
	xor ecx, ecx
	call sub_428A30
	mov dword [dword_4DAB5C], ecx
	mov dword [dword_4DAC04], ecx
	pop ecx
	ret
;sub_428E20 endp

sub_428E50: ;SUBROUTINE
	push ecx
	push edx
	push 1E0h
	push 280h
	push 0
	push 0
	call sub_497714
	call sub_4976B8
	pop edx
	pop ecx
	ret
;sub_428E50 endp

sub_428E80: ;SUBROUTINE
	push ecx
	push edx
	xor edx, edx
	push edx
	mov dword [dword_4EC638], edx
	mov dword [dword_4EC63C], edx
	call sub_4976C8
	push 2
	call sub_497680
	pop edx
	pop ecx
	ret
;sub_428E80 endp

sub_428EB0: ;SUBROUTINE
	mov dword [dword_4EC648], 1
	ret
;sub_428EB0 endp

sub_428F20: ;SUBROUTINE
	push ecx
	push edx
	xor eax, eax
	mov al, byte [byte_4EF3EE]
	mov edx, eax
	xor eax, eax
	shl edx, 10h
	mov al, byte [byte_4EF3ED]
	or edx, 0FF000000h
	shl eax, 8
	or edx, eax
	xor eax, eax
	mov al, byte [byte_4EF3EC]
	or eax, edx
	push eax
	push 4
	call sub_497738
	pop edx
	pop ecx
	ret
;sub_428F20 endp

sub_428F60: ;SUBROUTINE
	push ebx
	push ecx
	cmp dword [dword_512208], 1
	jnz loc_428F9A
	xor ecx, ecx
	mov dword [dword_4EC644], ecx

loc_428F73:
	mov eax, dword [dword_51224C]
	mov ebx, 1
	call sub_4466B0
	mov eax, dword [dword_512244]
	mov dword [dword_4EC648], ebx
	mov dword [dword_4EC640], eax
	call sub_42A170
	pop ecx
	pop ebx
	ret

loc_428F9A:
	mov eax, dword [dword_512240]
	mov dword [dword_4EC644], eax
	jmp loc_428F73
;sub_428F60 endp

sub_428FB0: ;SUBROUTINE
	inc dword [dword_4EC64C]
	ret
;sub_428FB0 endp

sub_428FC0: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	mov esi, eax
	mov ebx, edx
	call sub_42A2A0
	push 2
	call sub_497680
	test esi, esi
	jnz loc_428FFB

loc_428FDC:
	push 2
	call sub_497680
	call sub_42D820
	call sub_49769C
	pop esi
	pop ecx
	pop ebx
	ret

loc_428FFB:
	call sub_4976B8
	jmp loc_428FDC
;sub_428FC0 endp

sub_429010: ;SUBROUTINE
	push ecx
	push edx
	push esi
	push edi
	mov edx, eax
	mov ecx, [eax]
	test ecx, ecx
	jnz loc_429093

loc_429020:
	mov esi, [edx]
	cmp esi, 1
	jnz loc_42909A
	mov eax, esi

loc_42902D:
	call sub_429170

loc_429032:
	mov edi, [edx]
	cmp edi, 1
	jnz loc_42909E
	xor ecx, ecx
	mov dword [dword_4EC63C], ecx
	mov dword [dword_4EC638], ecx

loc_429047:
	mov eax, edx
	call sub_42A010
	mov esi, [edx]
	cmp esi, 1
	jnz loc_42912F
	mov eax, esi

loc_42905B:
	mov ecx, dword [dword_51222C]
	xor eax, ecx
	mov dword [dword_4D4E88], eax
	mov eax, [esp+14h]
	call sub_42A3C0
	cmp dword [edx], 0
	jnz loc_42908C
	cmp dword [dword_540F28], 0
	jnz loc_42908C
	cmp dword [dword_5222D0], 0
	jz loc_429136

loc_42908C:
	pop edi
	pop esi
	pop edx
	pop ecx
	ret 8

loc_429093:
	cmp ecx, 1
	jz loc_429020
	jmp loc_429032

loc_42909A:
	xor eax, eax
	jmp loc_42902D

loc_42909E:
	cmp edi, 3
	jnz loc_42911E
	cmp dword [dword_512208], 1
	jnz loc_429103
	cmp dword [dword_511FE0], 0
	jz loc_4290D4
	mov eax, [edx+4]
	test eax, eax
	jnz loc_4290D4
	mov dword [dword_4EC638], eax
	mov dword [dword_4EC63C], 45h
	jmp loc_429047

loc_4290D4:
	cmp dword [dword_511FE4], 0
	jz loc_429047
	cmp dword [edx+4], 1
	jnz loc_429047
	mov edi, 135h
	xor esi, esi
	mov dword [dword_4EC63C], edi
	mov dword [dword_4EC638], esi
	jmp loc_429047

loc_429103:
	mov edi, 13Eh
	mov esi, 214h
	mov dword [dword_4EC63C], edi
	mov dword [dword_4EC638], esi
	jmp loc_429047

loc_42911E:
	xor eax, eax
	mov dword [dword_4EC63C], eax
	mov dword [dword_4EC638], eax
	jmp loc_429047

loc_42912F:
	xor eax, eax
	jmp loc_42905B

loc_429136:
	mov eax, [edx+4]
	call sub_47B930
	pop edi
	pop esi
	pop edx
	pop ecx
	ret 8
;sub_429010 endp

off_429150: dd loc_42918D
	dd loc_429FD1 ; jump table for switch statement
	dd loc_429FD1
	dd loc_429FD1
	dd loc_4296CC
	dd loc_429530
	dd loc_429FD1
	dd loc_4291CB

sub_429170: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	mov ecx, eax
	mov eax, dword [dword_5117B0]
	cmp eax, 7 ; switch 8 cases
	ja loc_429FD1 ; jumptable 00429186 default case
	jmp off_429150[eax*4] ; switch jump

loc_42918D:
	mov eax, dword [dword_5117C4] ; jumptable 00429186 case 0
	cmp eax, 224h
	jle loc_429336
	cmp eax, 247h
	jge loc_429336
	mov eax, 0FF3E3E3Eh

loc_4291AD:
	call sub_42CF10
	test ecx, ecx
	jz loc_429328

loc_4291BA:
	mov eax, 13h
	call sub_42CEB0

loc_4291C4:
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4291CB:
	test ecx, ecx ; jumptable 00429186 case 7
	jnz loc_4291BA
	mov edx, dword [dword_5117C4]
	cmp edx, 55Fh
	jle loc_4291E9
	cmp edx, 5F5h
	jl loc_4292B1

loc_4291E9:
	mov ebx, dword [dword_5117C4]
	cmp ebx, 546h
	jle loc_429203
	cmp ebx, 60Eh
	jl loc_4292C2

loc_429203:
	mov edi, dword [dword_5117C4]
	cmp edi, 52Dh
	jle loc_42921D
	cmp edi, 627h
	jl loc_4292D3

loc_42921D:
	mov eax, dword [dword_5117C4]
	cmp eax, 514h
	jle loc_429234
	cmp eax, 640h
	jl loc_4292E4

loc_429234:
	mov ecx, dword [dword_5117C4]
	cmp ecx, 4FBh
	jle loc_42924E
	cmp ecx, 659h
	jl loc_4292F5

loc_42924E:
	mov esi, dword [dword_5117C4]
	cmp esi, 4E2h
	jle loc_429268
	cmp esi, 672h
	jl loc_429306

loc_429268:
	mov ebp, dword [dword_5117C4]
	cmp ebp, 4C9h
	jle loc_429282
	cmp ebp, 68Bh
	jl loc_429317

loc_429282:
	mov edx, dword [dword_5117C4]
	cmp edx, 4B5h
	jle loc_429328
	cmp edx, 6D6h
	jge loc_429328
	mov eax, 1
	call sub_42CEB0
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4292B1:
	mov eax, 9
	call sub_42CEB0
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4292C2:
	mov eax, 8
	call sub_42CEB0
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4292D3:
	mov eax, 7
	call sub_42CEB0
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4292E4:
	mov eax, 6
	call sub_42CEB0
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_4292F5:
	mov eax, 4
	call sub_42CEB0
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429306:
	mov eax, 3
	call sub_42CEB0
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429317:
	mov eax, 2
	call sub_42CEB0
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429328:
	xor eax, eax
	call sub_42CEB0
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429336:
	mov ebx, dword [dword_5117C4]
	cmp ebx, 223h
	jle loc_429350
	cmp ebx, 248h
	jl loc_4294A4

loc_429350:
	mov edi, dword [dword_5117C4]
	cmp edi, 221h
	jle loc_42936A
	cmp edi, 249h
	jl loc_4294AE

loc_42936A:
	mov eax, dword [dword_5117C4]
	cmp eax, 21Ch
	jle loc_429381
	cmp eax, 24Eh
	jl loc_4294B8

loc_429381:
	mov ebx, dword [dword_5117C4]
	cmp ebx, 212h
	jle loc_42939B
	cmp ebx, 258h
	jl loc_4294C2

loc_42939B:
	mov edi, dword [dword_5117C4]
	cmp edi, 208h
	jle loc_4293B5
	cmp edi, 262h
	jl loc_4294CC

loc_4293B5:
	mov eax, dword [dword_5117C4]
	cmp eax, 203h
	jle loc_4293CC
	cmp eax, 267h
	jl loc_4294D6

loc_4293CC:
	mov ebx, dword [dword_5117C4]
	cmp ebx, 1FEh
	jle loc_4293E6
	cmp ebx, 26Ch
	jl loc_4294E0

loc_4293E6:
	mov edi, dword [dword_5117C4]
	cmp edi, 1FCh
	jle loc_429400
	cmp edi, 273h
	jl loc_4294EA

loc_429400:
	mov eax, dword [dword_5117C4]
	cmp eax, 1F9h
	jle loc_429417
	cmp eax, 271h
	jl loc_4294F4

loc_429417:
	mov ebx, dword [dword_5117C4]
	cmp ebx, 1F4h
	jle loc_429431
	cmp ebx, 276h
	jl loc_4294FE

loc_429431:
	mov edi, dword [dword_5117C4]
	cmp edi, 1EFh
	jle loc_42944B
	cmp edi, 280h
	jl loc_429508

loc_42944B:
	mov eax, dword [dword_5117C4]
	cmp eax, 1EAh
	jle loc_429462
	cmp eax, 285h
	jl loc_429512

loc_429462:
	mov ebx, dword [dword_5117C4]
	cmp ebx, 1E5h
	jle loc_42947C
	cmp ebx, 28Fh
	jl loc_42951C

loc_42947C:
	mov edi, dword [dword_5117C4]
	cmp edi, 1E0h
	jle loc_429526
	cmp edi, 28Ah
	jge loc_429526
	mov eax, 0FF060606h
	jmp loc_4291AD

loc_4294A4:
	mov eax, 0FF3D3D3Dh
	jmp loc_4291AD

loc_4294AE:
	mov eax, 0FF3C3C3Ch
	jmp loc_4291AD

loc_4294B8:
	mov eax, 0FF3B3B3Bh
	jmp loc_4291AD

loc_4294C2:
	mov eax, 0FF383838h
	jmp loc_4291AD

loc_4294CC:
	mov eax, 0FF2E2E2Eh
	jmp loc_4291AD

loc_4294D6:
	mov eax, 0FF282828h
	jmp loc_4291AD

loc_4294E0:
	mov eax, 0FF202020h
	jmp loc_4291AD

loc_4294EA:
	mov eax, 0FF181818h
	jmp loc_4291AD

loc_4294F4:
	mov eax, 0FF101010h
	jmp loc_4291AD

loc_4294FE:
	mov eax, 0FF0E0E0Eh
	jmp loc_4291AD

loc_429508:
	mov eax, 0FF0D0D0Dh
	jmp loc_4291AD

loc_429512:
	mov eax, 0FF0C0C0Ch
	jmp loc_4291AD

loc_42951C:
	mov eax, 0FF080808h
	jmp loc_4291AD

loc_429526:
	mov eax, 0FF000204h
	jmp loc_4291AD

loc_429530:
	mov ebx, dword [dword_5117C4] ; jumptable 00429186 case 5
	cmp ebx, 5FDh
	jle loc_42956B
	cmp ebx, 6ABh
	jge loc_42956B
	mov eax, 0FF25282Ch

loc_42954B:
	xor edx, edx
	call sub_42CF00
	test ecx, ecx
	jz loc_4291C4
	mov eax, 13h
	call sub_42CEB0
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_42956B:
	mov edi, dword [dword_5117C4]
	cmp edi, 5FCh
	jle loc_429585
	cmp edi, 6ACh
	jl loc_429668

loc_429585:
	mov eax, dword [dword_5117C4]
	cmp eax, 5FBh
	jle loc_42959C
	cmp eax, 6ADh
	jl loc_429672

loc_42959C:
	mov ebx, dword [dword_5117C4]
	cmp ebx, 5FAh
	jle loc_4295B6
	cmp ebx, 6AEh
	jl loc_42967C

loc_4295B6:
	mov edi, dword [dword_5117C4]
	cmp edi, 5F9h
	jle loc_4295D0
	cmp edi, 6AFh
	jl loc_429686

loc_4295D0:
	mov eax, dword [dword_5117C4]
	cmp eax, 5F8h
	jle loc_4295E7
	cmp eax, 6B0h
	jl loc_429690

loc_4295E7:
	mov ebx, dword [dword_5117C4]
	cmp ebx, 5F7h
	jle loc_429601
	cmp ebx, 6B1h
	jl loc_42969A

loc_429601:
	mov edi, dword [dword_5117C4]
	cmp edi, 5F6h
	jle loc_42961B
	cmp edi, 6B2h
	jl loc_4296A4

loc_42961B:
	mov eax, dword [dword_5117C4]
	cmp eax, 5F5h
	jle loc_429632
	cmp eax, 6B3h
	jl loc_4296AE

loc_429632:
	mov ebx, dword [dword_5117C4]
	cmp ebx, 5F4h
	jle loc_429648
	cmp ebx, 6B4h
	jl loc_4296B8

loc_429648:
	mov edi, dword [dword_5117C4]
	cmp edi, 5F3h
	jle loc_4296C2
	cmp edi, 6B5h
	jge loc_4296C2
	mov eax, 0FF75787Ch
	jmp loc_42954B

loc_429668:
	mov eax, 0FF2D3034h
	jmp loc_42954B

loc_429672:
	mov eax, 0FF35383Ch
	jmp loc_42954B

loc_42967C:
	mov eax, 0FF3D4044h
	jmp loc_42954B

loc_429686:
	mov eax, 0FF45484Ch
	jmp loc_42954B

loc_429690:
	mov eax, 0FF4D5054h
	jmp loc_42954B

loc_42969A:
	mov eax, 0FF55585Ch
	jmp loc_42954B

loc_4296A4:
	mov eax, 0FF5D6064h
	jmp loc_42954B

loc_4296AE:
	mov eax, 0FF65686Ch
	jmp loc_42954B

loc_4296B8:
	mov eax, 0FF6D7074h
	jmp loc_42954B

loc_4296C2:
	mov eax, 0FF7D8084h
	jmp loc_42954B

loc_4296CC:
	mov eax, dword [dword_5117C4] ; jumptable 00429186 case 4
	cmp eax, 25Dh
	jle loc_4296E3
	cmp eax, 2F1h
	jl loc_429BC8

loc_4296E3:
	mov ecx, dword [dword_5117C4]
	cmp ecx, 25Bh
	jle loc_4296FD
	cmp ecx, 2F2h
	jl loc_429BDE

loc_4296FD:
	mov esi, dword [dword_5117C4]
	cmp esi, 258h
	jle loc_429717
	cmp esi, 2F3h
	jl loc_429BF4

loc_429717:
	mov ebp, dword [dword_5117C4]
	cmp ebp, 256h
	jle loc_429731
	cmp ebp, 2F4h
	jl loc_429C0A

loc_429731:
	mov edx, dword [dword_5117C4]
	cmp edx, 253h
	jle loc_42974B
	cmp edx, 2F5h
	jl loc_429C20

loc_42974B:
	mov ebx, dword [dword_5117C4]
	cmp ebx, 251h
	jle loc_429765
	cmp ebx, 2F6h
	jl loc_429C36

loc_429765:
	mov edi, dword [dword_5117C4]
	cmp edi, 24Eh
	jle loc_42977F
	cmp edi, 2F7h
	jl loc_429C4C

loc_42977F:
	mov eax, dword [dword_5117C4]
	cmp eax, 24Ch
	jle loc_429796
	cmp eax, 2F8h
	jl loc_429C62

loc_429796:
	mov ecx, dword [dword_5117C4]
	cmp ecx, 249h
	jle loc_4297B0
	cmp ecx, 2F9h
	jl loc_429C78

loc_4297B0:
	mov esi, dword [dword_5117C4]
	cmp esi, 247h
	jle loc_4297CA
	cmp esi, 2FAh
	jl loc_429C8E

loc_4297CA:
	mov ebp, dword [dword_5117C4]
	cmp ebp, 244h
	jle loc_4297E4
	cmp ebp, 2FBh
	jl loc_429CA4

loc_4297E4:
	mov edx, dword [dword_5117C4]
	cmp edx, 242h
	jle loc_4297FE
	cmp edx, 2FCh
	jl loc_429CBA

loc_4297FE:
	mov ebx, dword [dword_5117C4]
	cmp ebx, 23Fh
	jle loc_429818
	cmp ebx, 2FDh
	jl loc_429CD0

loc_429818:
	mov edi, dword [dword_5117C4]
	cmp edi, 509h
	jle loc_429832
	cmp edi, 53Dh
	jl loc_429CE6

loc_429832:
	mov eax, dword [dword_5117C4]
	cmp eax, 508h
	jle loc_429849
	cmp eax, 53Eh
	jl loc_429CFC

loc_429849:
	mov ecx, dword [dword_5117C4]
	cmp ecx, 507h
	jle loc_429863
	cmp ecx, 53Fh
	jl loc_429D12

loc_429863:
	mov esi, dword [dword_5117C4]
	cmp esi, 506h
	jle loc_42987D
	cmp esi, 540h
	jl loc_429D28

loc_42987D:
	mov ebp, dword [dword_5117C4]
	cmp ebp, 505h
	jle loc_429897
	cmp ebp, 541h
	jl loc_429D3E

loc_429897:
	mov edx, dword [dword_5117C4]
	cmp edx, 504h
	jle loc_4298B1
	cmp edx, 542h
	jl loc_429D54

loc_4298B1:
	mov ebx, dword [dword_5117C4]
	cmp ebx, 503h
	jle loc_4298CB
	cmp ebx, 543h
	jl loc_429D6A

loc_4298CB:
	mov edi, dword [dword_5117C4]
	cmp edi, 502h
	jle loc_4298E5
	cmp edi, 544h
	jl loc_429D80

loc_4298E5:
	mov eax, dword [dword_5117C4]
	cmp eax, 501h
	jle loc_4298FC
	cmp eax, 545h
	jl loc_429D96

loc_4298FC:
	mov ecx, dword [dword_5117C4]
	cmp ecx, 500h
	jle loc_429916
	cmp ecx, 546h
	jl loc_429DAC

loc_429916:
	mov esi, dword [dword_5117C4]
	cmp esi, 426h
	jle loc_429930
	cmp esi, 556h
	jl loc_429DC2

loc_429930:
	mov ebp, dword [dword_5117C4]
	cmp ebp, 425h
	jle loc_42994A
	cmp ebp, 557h
	jl loc_429DD8

loc_42994A:
	mov edx, dword [dword_5117C4]
	cmp edx, 424h
	jle loc_429964
	cmp edx, 558h
	jl loc_429DEE

loc_429964:
	mov ebx, dword [dword_5117C4]
	cmp ebx, 423h
	jle loc_42997E
	cmp ebx, 559h
	jl loc_429E04

loc_42997E:
	mov edi, dword [dword_5117C4]
	cmp edi, 422h
	jle loc_429998
	cmp edi, 55Ah
	jl loc_429E1A

loc_429998:
	mov eax, dword [dword_5117C4]
	cmp eax, 421h
	jle loc_4299AF
	cmp eax, 55Bh
	jl loc_429E30

loc_4299AF:
	mov ecx, dword [dword_5117C4]
	cmp ecx, 420h
	jle loc_4299C9
	cmp ecx, 55Ch
	jl loc_429E46

loc_4299C9:
	mov esi, dword [dword_5117C4]
	cmp esi, 41Fh
	jle loc_4299E3
	cmp esi, 55Dh
	jl loc_429E5C

loc_4299E3:
	mov ebp, dword [dword_5117C4]
	cmp ebp, 41Eh
	jle loc_4299FD
	cmp ebp, 55Eh
	jl loc_429E72

loc_4299FD:
	mov edx, dword [dword_5117C4]
	cmp edx, 41Dh
	jle loc_429A17
	cmp edx, 55Fh
	jl loc_429E88

loc_429A17:
	mov ebx, dword [dword_5117C4]
	cmp ebx, 41Ch
	jle loc_429A31
	cmp ebx, 560h
	jl loc_429E9E

loc_429A31:
	mov edi, dword [dword_5117C4]
	cmp edi, 41Bh
	jle loc_429A4B
	cmp edi, 561h
	jl loc_429EB4

loc_429A4B:
	mov eax, dword [dword_5117C4]
	cmp eax, 41Ah
	jle loc_429A62
	cmp eax, 562h
	jl loc_429EC7

loc_429A62:
	mov ecx, dword [dword_5117C4]
	cmp ecx, 419h
	jle loc_429A7C
	cmp ecx, 563h
	jl loc_429EDA

loc_429A7C:
	mov esi, dword [dword_5117C4]
	cmp esi, 418h
	jle loc_429A96
	cmp esi, 563h
	jl loc_429EED

loc_429A96:
	mov ebp, dword [dword_5117C4]
	cmp ebp, 417h
	jle loc_429AB0
	cmp ebp, 564h
	jl loc_429F00

loc_429AB0:
	mov edx, dword [dword_5117C4]
	cmp edx, 416h
	jle loc_429ACA
	cmp edx, 565h
	jl loc_429F13

loc_429ACA:
	mov ebx, dword [dword_5117C4]
	cmp ebx, 415h
	jle loc_429AE4
	cmp ebx, 566h
	jl loc_429F26

loc_429AE4:
	mov edi, dword [dword_5117C4]
	cmp edi, 414h
	jle loc_429AFE
	cmp edi, 567h
	jl loc_429F39

loc_429AFE:
	mov eax, dword [dword_5117C4]
	cmp eax, 413h
	jle loc_429B15
	cmp eax, 568h
	jl loc_429F4C

loc_429B15:
	mov ecx, dword [dword_5117C4]
	cmp ecx, 412h
	jle loc_429B2F
	cmp ecx, 569h
	jl loc_429F5F

loc_429B2F:
	mov esi, dword [dword_5117C4]
	cmp esi, 411h
	jle loc_429B49
	cmp esi, 56Ah
	jl loc_429F72

loc_429B49:
	mov ebp, dword [dword_5117C4]
	cmp ebp, 410h
	jle loc_429B63
	cmp ebp, 56Bh
	jl loc_429F85

loc_429B63:
	mov edx, dword [dword_5117C4]
	cmp edx, 40Fh
	jle loc_429B7D
	cmp edx, 56Ch
	jl loc_429F98

loc_429B7D:
	mov ebx, dword [dword_5117C4]
	cmp ebx, 40Eh
	jle loc_429B97
	cmp ebx, 56Dh
	jl loc_429FAB

loc_429B97:
	mov edi, dword [dword_5117C4]
	cmp edi, 40Dh
	jle loc_429FBE
	cmp edi, 56Eh
	jge loc_429FBE
	mov eax, 0FF838283h
	xor edx, edx
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429BC8:
	mov edx, 0Eh
	mov eax, 0FF828490h
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429BDE:
	mov edx, 0Dh
	mov eax, 0FF82848Fh
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429BF4:
	mov edx, 0Ch
	mov eax, 0FF82848Eh
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429C0A:
	mov edx, 0Bh
	mov eax, 0FF82848Dh
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429C20:
	mov edx, 0Ah
	mov eax, 0FF82848Ch
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429C36:
	mov edx, 9
	mov eax, 0FF82848Bh
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429C4C:
	mov edx, 8
	mov eax, 0FF82848Ah
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429C62:
	mov edx, 7
	mov eax, 0FF828489h
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429C78:
	mov edx, 6
	mov eax, 0FF828488h
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429C8E:
	mov edx, 4
	mov eax, 0FF828487h
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429CA4:
	mov edx, 3
	mov eax, 0FF828486h
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429CBA:
	mov edx, 2
	mov eax, 0FF828485h
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429CD0:
	mov edx, 1
	mov eax, 0FF828484h
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429CE6:
	mov edx, 0Ah
	mov eax, 0FFA82906h
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429CFC:
	mov edx, 0Ah
	mov eax, 0FF982506h
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429D12:
	mov edx, 0Ah
	mov eax, 0FF882106h
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429D28:
	mov edx, 0Ah
	mov eax, 0FF781D06h
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429D3E:
	mov edx, 0Ah
	mov eax, 0FF681906h
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429D54:
	mov edx, 0Ah
	mov eax, 0FF581506h
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429D6A:
	mov edx, 0Ah
	mov eax, 0FF481106h
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429D80:
	mov edx, 0Ah
	mov eax, 0FF380D06h
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429D96:
	mov edx, 0Ah
	mov eax, 0FF280906h
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429DAC:
	mov edx, 0Ah
	mov eax, 0FF180506h
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429DC2:
	mov edx, 0Bh
	mov eax, 0FF030303h
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429DD8:
	mov edx, 0Ah
	mov eax, 0FF030303h
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429DEE:
	mov edx, 9
	mov eax, 0FF030303h
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429E04:
	mov edx, 8
	mov eax, 0FF030303h
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429E1A:
	mov edx, 7
	mov eax, 0FF030303h
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429E30:
	mov edx, 6
	mov eax, 0FF030303h
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429E46:
	mov edx, 5
	mov eax, 0FF030303h
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429E5C:
	mov edx, 4
	mov eax, 0FF030303h
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429E72:
	mov edx, 3
	mov eax, 0FF030303h
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429E88:
	mov edx, 2
	mov eax, 0FF030303h
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429E9E:
	mov edx, 1
	mov eax, 0FF030303h
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429EB4:
	mov eax, 0FF030303h
	xor edx, edx
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429EC7:
	mov eax, 0FF070707h
	xor edx, edx
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429EDA:
	mov eax, 0FF131313h
	xor edx, edx
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429EED:
	mov eax, 0FF1F1F1Fh
	xor edx, edx
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429F00:
	mov eax, 0FF2B2B2Bh
	xor edx, edx
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429F13:
	mov eax, 0FF373737h
	xor edx, edx
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429F26:
	mov eax, 0FF434343h
	xor edx, edx
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429F39:
	mov eax, 0FF4F4F4Fh
	xor edx, edx
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429F4C:
	mov eax, 0FF5B5B5Bh
	xor edx, edx
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429F5F:
	mov eax, 0FF676767h
	xor edx, edx
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429F72:
	mov eax, 0FF737373h
	xor edx, edx
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429F85:
	mov eax, 0FF7F7F7Fh
	xor edx, edx
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429F98:
	mov eax, 0FF818081h
	xor edx, edx
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429FAB:
	mov eax, 0FF828182h
	xor edx, edx
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429FBE:
	mov eax, 0FF848284h
	xor edx, edx
	call sub_42CF00
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_429FD1:
	test ecx, ecx ; jumptable 00429186 default case
	jnz loc_4291BA
	xor eax, eax
	call sub_42CEB0
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_429170 endp

sub_429FF0: ;SUBROUTINE
	push ecx
	push edx
	push 1E0h
	push 280h
	push 0
	push 0
	call sub_497714
	pop edx
	pop ecx
	ret
;sub_429FF0 endp

sub_42A010: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push ebp
	mov edx, eax
	xor eax, eax
	call sub_44B660
	test eax, eax
	jnz loc_42A02B
	cmp dword [edx], 0
	jz loc_42A0D4

loc_42A02B:
	mov ecx, [edx+4]
	mov eax, [edx]
	mov ebx, [edx+68h]
	shl ecx, 5
	shl eax, 3
	add ecx, word_4EC588
	mov esi, [edx+6Ch]
	add eax, ecx
	or ebx, esi
	jz loc_42A141
	mov ecx, [edx+68h]
	movsx ebx, word [eax]
	add ebx, ecx
	mov ecx, [eax]
	sar ecx, 10h
	add ecx, esi
	mov dword [dword_4EC664], ecx
	mov ecx, [eax+2]
	sar ecx, 10h
	mov dword [dword_4EC658], ebx
	lea edx, [ebx+ecx]

loc_42A070:
	mov dword [dword_4EC65C], edx
	mov edx, [eax+4]
	mov eax, dword [dword_4EC664]
	sar edx, 10h
	add eax, edx
	mov dword [dword_4EC668], eax
	mov eax, dword [dword_4EC668]
	mov dword [dword_4EC650], eax

loc_42A092:
	mov eax, dword [dword_4EC63C]
	add eax, dword [dword_4EC668]
	mov ebp, dword [dword_4EC65C]
	push eax
	mov eax, dword [dword_4EC638]
	add eax, ebp
	mov edx, dword [dword_4EC664]
	push eax
	mov eax, dword [dword_4EC63C]
	add eax, edx
	mov ecx, dword [dword_4EC658]
	push eax
	mov eax, dword [dword_4EC638]
	add eax, ecx
	push eax
	call sub_497714
	pop ebp
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_42A0D4:
	push edi
	call sub_477700
	mov bl, byte [byte_4EC66C]
	movsx edi, word [eax]
	mov cl, bl
	mov edx, edi
	mov esi, [eax]
	sar edx, cl
	sar esi, 10h
	mov dword [dword_4EC658], edx
	mov dl, byte [byte_4EC66D]
	mov ebp, esi
	mov cl, dl
	sar ebp, cl
	mov ecx, [eax+2]
	mov eax, [eax+4]
	sar ecx, 10h
	sar eax, 10h
	add edi, ecx
	mov cl, bl
	add eax, esi
	sar edi, cl
	mov cl, dl
	mov dword [dword_4EC664], ebp
	sar eax, cl
	mov dword [dword_4EC65C], edi
	mov dword [dword_4EC668], eax
	call sub_4776C0
	mov cl, byte [byte_4EC66D]
	sar eax, cl
	mov dword [dword_4EC650], eax
	pop edi
	jmp loc_42A092

loc_42A141:
	movsx edx, word [eax]
	mov dword [dword_4EC658], edx
	mov edx, [eax]
	mov ecx, [eax+2]
	sar edx, 10h
	sar ecx, 10h
	mov dword [dword_4EC664], edx
	mov edx, dword [dword_4EC658]
	add edx, ecx
	jmp loc_42A070
;sub_42A010 endp

sub_42A170: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	cmp dword [dword_512208], 1
	jnz loc_42A1E7
	push 0F0h
	push 280h
	xor ecx, ecx
	xor ebx, ebx
	push 0F0h
	xor edx, edx
	xor eax, eax
	call sub_42A210
	push 0
	push 0

loc_42A19C:
	mov eax, 1
	xor ecx, ecx
	push 0
	xor ebx, ebx
	xor edx, edx
	call sub_42A210
	push 1E0h
	push 280h
	mov eax, 2
	xor ecx, ecx
	push 0
	xor ebx, ebx
	xor edx, edx
	call sub_42A210
	push 87h
	push 6Ch
	mov eax, 3
	xor ecx, ecx
	push 0
	xor ebx, ebx
	xor edx, edx
	call sub_42A210
	pop edx
	pop ecx
	pop ebx
	ret

loc_42A1E7:
	push 1E0h
	push 280h
	xor ecx, ecx
	xor ebx, ebx
	push 0
	xor edx, edx
	xor eax, eax
	call sub_42A210
	push 46h
	push 96h
	jmp loc_42A19C
;sub_42A170 endp

sub_42A210: ;SUBROUTINE
	mov word word_4EC588[eax*8], dx
	mov word word_4EC58A[eax*8], bx
	mov word word_4EC5A8[eax*8], cx
	mov edx, [esp+8]
	mov word word_4EC58C[eax*8], dx
	mov edx, [esp+0Ch]
	mov word word_4EC58E[eax*8], dx
	mov edx, [esp+4]
	mov word word_4EC5AA[eax*8], dx
	mov edx, [esp+8]
	mov word word_4EC5AC[eax*8], dx
	mov edx, [esp+0Ch]
	mov word word_4EC5AE[eax*8], dx
	ret 0Ch
;sub_42A210 endp

sub_42A270: ;SUBROUTINE
	push esi
	shl eax, 5
	add eax, word_4EC588
	movsx esi, word [eax]
	mov [edx], esi
	mov edx, [eax]
	sar edx, 10h
	mov [ebx], edx
	mov edx, [eax+2]
	sar edx, 10h
	mov [ecx], edx
	mov eax, [eax+4]
	mov edx, [esp+8]
	sar eax, 10h
	mov [edx], eax
	pop esi
	ret 4
;sub_42A270 endp

sub_42A2A0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	mov eax, dword [dword_4EC640]
	mov dl, byte byte_4D524C[eax*2]
	mov byte [byte_4EC66C], dl
	mov al, byte byte_4D524D[eax*2]
	mov edx, dword [dword_512208]
	mov byte [byte_4EC66D], al
	cmp edx, 1
	jnz loc_42A315
	mov eax, dword [dword_4EC644]
	mov cl, byte [byte_4EC66C]
	mov edx, dword dword_4D5234[eax*8]
	sar edx, cl
	mov word [word_4EC5AC], dx
	mov dl, byte [byte_4EC66D]
	inc dl
	mov eax, dword dword_4D5238[eax*8]
	mov cl, dl
	mov byte [byte_4EC66D], dl
	sar eax, cl
	xor edx, edx
	mov word [word_4EC5AE], ax
	mov word [word_4EC5A8], dx
	mov word [word_4EC5AA], ax

loc_42A315:
	mov eax, dword [dword_4EC644]
	mov cl, byte [byte_4EC66C]
	xor ebx, ebx
	mov edx, dword dword_4D5234[eax*8]
	mov eax, dword dword_4D5238[eax*8]
	sar edx, cl
	mov cl, byte [byte_4EC66D]
	mov word [word_4EC58C], dx
	mov bl, cl
	xor edx, edx
	sar eax, cl
	mov dl, byte [byte_4EC66C]
	mov word [word_4EC58E], ax
	mov eax, dword [dword_4EC644]
	call sub_434DA0
	pop edx
	pop ecx
	pop ebx
	ret
;sub_42A2A0 endp

sub_42A360: ;SUBROUTINE
	mov eax, 1
	ret
;sub_42A360 endp

sub_42A370: ;SUBROUTINE
	mov eax, dword [dword_4EC644]
	ret
;sub_42A370 endp

;	Attributes: thunk

sub_42A380: ;SUBROUTINE
	jmp sub_438110
;sub_42A380 endp

sub_42A390: ;SUBROUTINE
	xor eax, eax
	ret
;sub_42A390 endp

sub_42A3A0: ;SUBROUTINE
	cmp dword [dword_512248], 0
	jnz loc_42A3B4
	mov eax, 1
	mov dword [dword_512248], eax
	ret

loc_42A3B4:
	xor eax, eax
	mov dword [dword_512248], eax
	ret
;sub_42A3A0 endp

sub_42A3C0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	mov ebx, eax
	push 0
	push 2
	call sub_497738
	call sub_42A3F0
	test ebx, ebx
	jz loc_42A3EC

loc_42A3D8:
	mov edx, [ebx+4]
	mov eax, ebx
	call dword dword_4EC500[edx*4]
	mov ebx, [ebx]
	test ebx, ebx
	jnz loc_42A3D8
	mov eax, eax

loc_42A3EC:
	pop edx
	pop ecx
	pop ebx
	ret
;sub_42A3C0 endp

sub_42A3F0: ;SUBROUTINE
	push ebx
	push edx
	push esi
	mov edx, sub_42B6B0
	mov ebx, sub_42B970
	mov esi, sub_42BBA0
	mov dword [dword_4EC524], edx
	mov dword [dword_4EC528], ebx
	mov dword [dword_4EC52C], esi
	mov dword [dword_4EC520], edx
	pop esi
	pop edx
	pop ebx
	ret
;sub_42A3F0 endp

nullsub_9: ;SUBROUTINE
	ret
;nullsub_9 endp

sub_42A5B0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	sub esp, 8
	mov esi, eax
	mov edx, dword [dword_4EC660]
	xor ecx, ecx
	test edx, edx
	jle loc_42A5E6
	xor ebx, ebx

loc_42A5C8:
	mov edx, 0Ch
	mov eax, esp
	call sub_46FEA0
	test eax, eax
	jnz loc_42A60B

loc_42A5D8:
	mov edi, dword [dword_4EC660]
	inc ecx
	add ebx, 4
	cmp ecx, edi
	jl loc_42A5C8

loc_42A5E6:
	cmp dword [esi], 0
	jnz loc_42A631
	mov ecx, 0A0000h

loc_42A5F0:
	mov edx, 0Ch
	lea eax, [esp+4]
	call sub_46FEA0
	test eax, eax
	jnz loc_42A638
	add esp, 8
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_42A60B:
	mov eax, [esp]
	mov dword [eax+4], 17h
	mov edx, [esp]
	mov al, byte byte_4EC5E8[ecx]
	mov [edx+8], al
	mov edx, [esp]
	mov eax, dword dword_4EC5F8[ebx]
	call sub_471390
	jmp loc_42A5D8

loc_42A631:
	mov ecx, 40000h
	jmp loc_42A5F0

loc_42A638:
	mov eax, [esp+4]
	mov dword [eax+4], 19h
	mov eax, [esp+4]
	mov byte [eax+8], 1
	mov eax, ecx
	mov edx, [esp+4]
	call sub_4713C0
	call sub_471390
	add esp, 8
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_42A5B0 endp

nullsub_10: ;SUBROUTINE
	ret
;nullsub_10 endp

sub_42A680: ;SUBROUTINE
	push ecx
	push edx
	mov edx, [eax+0Ch]
	cmp edx, 8
	jb loc_42A6B4
	ja loc_42A69E
	mov ecx, [eax+8]
	cmp ecx, 1
	jnz loc_42A6B0
	push ecx

loc_42A695:
	call grChromakeyMode
	pop edx
	pop ecx
	ret

loc_42A69E:
	cmp edx, 0Bh
	jnz loc_42A6B4
	mov edx, [eax+8]
	push edx
	call grChromakeyValue
	pop edx
	pop ecx
	ret

loc_42A6B0:
	push 0
	jmp loc_42A695

loc_42A6B4:
	push esi
	push ebx
	mov ebx, [eax+0Ch]
	push ebx
	mov esi, [eax+8]
	push esi
	call sub_497738
	pop ebx
	pop esi
	pop edx
	pop ecx
	ret
;sub_42A680 endp

sub_42A6D0: ;SUBROUTINE
	mov al, [eax+8]
	and eax, 0FFh
	shl eax, 0Ah
	add eax, dword_545944
	cmp eax, dword [dword_4D4E8C]
	jnz loc_42CD29
	ret

loc_42CD29:
	push edx
	push ecx
	push eax
	push 0
	push 0
	mov dword [dword_4D4E8C], eax
	call sub_49755C
	pop ecx
	pop edx
	ret
;sub_42A6D0 endp

sub_42A6F0: ;SUBROUTINE
	push ebx
	push edx
	push esi
	mov edx, sub_42B6B0
	mov ebx, sub_42B970
	mov esi, sub_42BBA0
	mov dword [dword_4EC524], edx
	mov dword [dword_4EC528], ebx
	mov dword [dword_4EC52C], esi
	mov dword [dword_4EC520], edx
	pop esi
	pop edx
	pop ebx
	ret
;sub_42A6F0 endp

sub_42A700: ;SUBROUTINE
	mov al, [eax+8]
	and eax, 0FFh
	mov dword [dword_4EC654], eax
	ret
;sub_42A700 endp

sub_42A710: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	cmp word [eax+8], 1
	jz loc_42A75B
	cmp word [eax+0Ah], 0
	jl loc_42A787
	mov edx, [eax+0Eh]
	mov ecx, dword [dword_4EC63C]
	sar edx, 10h
	add edx, ecx
	push edx
	mov edx, [eax+0Ch]
	mov ebx, dword [dword_4EC638]
	sar edx, 10h
	add edx, ebx
	push edx
	mov edx, [eax+0Ah]
	sar edx, 10h
	mov eax, [eax+8]
	add edx, ecx
	sar eax, 10h
	push edx
	add eax, ebx
	push eax
	call sub_497714
	pop edx
	pop ecx
	pop ebx
	ret

loc_42A75B:
	mov edx, [eax+0Eh]
	sar edx, 10h
	push edx
	mov edx, [eax+0Ch]
	sar edx, 10h
	push edx
	mov edx, [eax+0Ah]
	sar edx, 10h
	mov eax, [eax+8]
	push edx
	sar eax, 10h
	push eax
	call sub_497714
	call sub_49769C
	pop edx
	pop ecx
	pop ebx
	ret

loc_42A787:
	mov eax, dword [dword_4EC63C]
	add eax, dword [dword_4EC668]
	mov edx, dword [dword_4EC65C]
	push eax
	mov eax, dword [dword_4EC638]
	add eax, edx
	mov ecx, dword [dword_4EC664]
	push eax
	mov eax, dword [dword_4EC63C]
	add eax, ecx
	mov ebx, dword [dword_4EC658]
	push eax
	mov eax, dword [dword_4EC638]
	add eax, ebx
	push eax
	call sub_497714
	pop edx
	pop ecx
	pop ebx
	ret
;sub_42A710 endp

sub_42A7D0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push ebp
	sub esp, 8
	mov edx, [eax+6]
	mov ecx, dword [dword_4EC638]
	sar edx, 10h
	add edx, ecx
	mov [esp], edx
	mov edx, [eax+8]
	mov ebx, dword [dword_4EC63C]
	sar edx, 10h
	add edx, ebx
	mov [esp+4], edx
	xor edx, edx
	mov dl, [eax+10h]
	mov ecx, edx
	xor edx, edx
	mov dl, [eax+11h]
	shl ecx, 18h
	shl edx, 10h
	or ecx, edx
	xor edx, edx
	mov esi, dword [dword_4EC638]
	mov dl, [eax+12h]
	mov ebp, dword [dword_4D4EB0]
	shl edx, 8
	fild dword [esp]
	or ecx, edx
	xor edx, edx
	fstp dword [flt_4D51F4]
	mov dl, [eax+13h]
	fild dword [esp+4]
	or ecx, edx
	fstp dword [flt_4D51F8]
	mov dword [dword_4D5204], ecx
	mov edx, [eax+0Ah]
	mov dword [dword_4D5224], ecx
	sar edx, 10h
	mov eax, [eax+0Ch]
	add edx, esi
	sar eax, 10h
	mov [esp+4], edx
	add eax, ebx
	fild dword [esp+4]
	mov [esp+4], eax
	fstp dword [flt_4D5214]
	fild dword [esp+4]
	fstp dword [flt_4D5218]
	test ebp, ebp
	jnz loc_42A894

loc_42A87B:
	push flt_4D5214
	push flt_4D51F4
	call sub_498EE0
	add esp, 8
	pop ebp
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_42A894:
	xor eax, eax
	push eax
	push 1
	mov dword [dword_4D4EB0], eax
	call sub_497738
	jmp loc_42A87B
;sub_42A7D0 endp

sub_42A8B0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 4
	mov edx, eax
	mov eax, [eax+8]
	mov ecx, dword [dword_4EC638]
	sar eax, 10h
	add eax, ecx
	mov [esp], eax
	mov eax, [edx+0Ah]
	mov ebx, dword [dword_4EC63C]
	sar eax, 10h
	fild dword [esp]
	add eax, ebx
	fstp dword [flt_4D51B4]
	mov [esp], eax
	xor eax, eax
	fild dword [esp]
	mov al, [edx+8]
	fstp dword [flt_4D51B8]
	call sub_49B2E0
	mov esi, dword [dword_4EC638]
	mov edi, dword [dword_4EC63C]
	mov ebp, dword [dword_4D4EB0]
	mov dword [dword_4D51C4], eax
	mov ecx, [edx+0Ch]
	mov dword [dword_4D51E4], eax
	sar ecx, 10h
	mov edx, [edx+0Eh]
	add ecx, esi
	sar edx, 10h
	mov [esp], ecx
	add edx, edi
	fild dword [esp]
	mov [esp], edx
	fstp dword [flt_4D51D4]
	fild dword [esp]
	fstp dword [flt_4D51D8]
	test ebp, ebp
	jnz loc_42A95B

loc_42A941:
	push flt_4D51D4
	push flt_4D51B4
	call sub_498EE0
	add esp, 4
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_42A95B:
	xor eax, eax
	push eax
	push 1
	mov dword [dword_4D4EB0], eax
	call sub_497738
	jmp loc_42A941
;sub_42A8B0 endp

nullsub_11: ;SUBROUTINE
	ret
;nullsub_11 endp

sub_42A980: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 4
	xor ecx, ecx
	xor edx, edx
	mov cl, [eax+28h]
	mov dl, [eax+29h]
	shl ecx, 18h
	shl edx, 10h
	or ecx, edx
	xor edx, edx
	mov dl, [eax+2Ah]
	shl edx, 8
	or ecx, edx
	xor edx, edx
	mov ebx, [eax+0Ch]
	mov dl, [eax+2Bh]
	mov esi, [eax+10h]
	or ecx, edx
	mov edx, dword [dword_4EC638]
	mov dword [dword_4D5144], ecx
	mov ecx, [eax+8]
	mov edi, [eax+14h]
	add edx, ecx
	mov ebp, [eax+18h]
	mov [esp], edx
	mov ecx, [eax+1Ch]
	mov edx, dword [dword_4EC63C]
	fild dword [esp]
	add edx, ebx
	fstp dword [flt_4D5134]
	mov [esp], edx
	mov ebx, [eax+20h]
	mov edx, dword [dword_4EC638]
	fild dword [esp]
	add edx, esi
	fstp dword [flt_4D5138]
	mov [esp], edx
	mov esi, [eax+24h]
	fild dword [esp]
	mov edx, dword [dword_4EC63C]
	mov eax, dword [dword_4D5144]
	fstp dword [flt_4D5154]
	mov dword [dword_4D5164], eax
	mov dword [dword_4D5184], eax
	add edx, edi
	mov dword [dword_4D51A4], eax
	mov [esp], edx
	mov edx, dword [dword_4EC638]
	mov edi, dword [dword_4D4EB0]
	add edx, ebp
	fild dword [esp]
	mov [esp], edx
	mov edx, dword [dword_4EC63C]
	fstp dword [flt_4D5158]
	add edx, ecx
	fild dword [esp]
	mov [esp], edx
	mov edx, dword [dword_4EC638]
	fstp dword [flt_4D5174]
	add edx, ebx
	fild dword [esp]
	mov [esp], edx
	mov edx, dword [dword_4EC63C]
	fstp dword [flt_4D5178]
	add edx, esi
	fild dword [esp]
	mov [esp], edx
	fstp dword [flt_4D5194]
	fild dword [esp]
	fstp dword [flt_4D5198]
	test edi, edi
	jnz loc_42AAAC

loc_42AA88:
	push flt_4D5194
	push flt_4D5174
	push flt_4D5154
	push flt_4D5134
	call sub_497B24
	add esp, 4
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_42AAAC:
	xor ebp, ebp
	push ebp
	push 1
	mov dword [dword_4D4EB0], ebp
	call sub_497738
	jmp loc_42AA88
;sub_42A980 endp

sub_42AAC0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 4
	mov edx, eax
	xor eax, eax
	mov al, [edx+28h]
	call sub_49B2E0
	mov ecx, dword [dword_4EC638]
	mov dword [dword_4D50C4], eax
	mov dword [dword_4D50E4], eax
	mov dword [dword_4D5104], eax
	mov dword [dword_4D5124], eax
	mov ebx, [edx+8]
	mov esi, [edx+0Ch]
	mov edi, [edx+10h]
	mov ebp, [edx+14h]
	add ecx, ebx
	mov eax, dword [dword_4D4EB0]
	mov [esp], ecx
	mov ebx, [edx+18h]
	mov ecx, dword [dword_4EC63C]
	fild dword [esp]
	add ecx, esi
	fstp dword [flt_4D50B4]
	mov [esp], ecx
	mov esi, [edx+1Ch]
	mov ecx, dword [dword_4EC638]
	fild dword [esp]
	add ecx, edi
	fstp dword [flt_4D50B8]
	mov [esp], ecx
	mov edi, [edx+20h]
	mov ecx, dword [dword_4EC63C]
	fild dword [esp]
	add ecx, ebp
	fstp dword [flt_4D50D4]
	mov [esp], ecx
	mov ecx, dword [dword_4EC638]
	mov ebp, [edx+24h]
	add ecx, ebx
	fild dword [esp]
	mov [esp], ecx
	mov ecx, dword [dword_4EC63C]
	fstp dword [flt_4D50D8]
	add ecx, esi
	fild dword [esp]
	mov [esp], ecx
	mov ecx, dword [dword_4EC638]
	fstp dword [flt_4D50F4]
	add ecx, edi
	fild dword [esp]
	mov [esp], ecx
	mov ecx, dword [dword_4EC63C]
	fstp dword [flt_4D50F8]
	add ecx, ebp
	fild dword [esp]
	mov [esp], ecx
	fstp dword [flt_4D5114]
	fild dword [esp]
	fstp dword [flt_4D5118]
	test eax, eax
	jnz loc_42ABCE

loc_42ABAA:
	push flt_4D5114
	push flt_4D50F4
	push flt_4D50D4
	push flt_4D50B4
	call sub_497B24
	add esp, 4
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_42ABCE:
	xor edx, edx
	push edx
	push 1
	mov dword [dword_4D4EB0], edx
	call sub_497738
	jmp loc_42ABAA
;sub_42AAC0 endp

sub_42ABF0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	sub esp, 10h
	mov ecx, dword [dword_4EC638]
	mov edx, [eax+8]
	mov ebx, [eax+0Ch]
	add ecx, edx
	mov edx, dword [dword_4EC63C]
	add edx, ebx
	mov esi, [eax+14h]
	mov [esp+0Ch], edx
	mov ebx, [eax+10h]
	add esi, edx
	mov edx, [eax+20h]
	mov [esp+8], ecx
	add ebx, ecx
	mov ecx, [edx]
	fild word [ecx+4]
	fld1
	fdivrp st1, st0
	fild dword [eax+18h]
	fild dword [eax+1Ch]
	fild dword [eax+14h]
	fild dword [eax+10h]
	faddp st3, st0
	faddp st1, st0
	fild word [ecx+6]
	fld1
	fxch st3
	fmul st0, st4
	fxch st3
	fdivrp st1, st0
	fxch st1
	fmul st0, st1
	fild dword [eax+1Ch]
	fld qword [dbl_4C9F74]
	fild dword [eax+18h]
	fadd st0, st1
	fxch st2
	faddp st1, st0
	fxch st5
	fmulp st1, st0
	fxch st2
	fmulp st4, st0
	fild dword [esp+8]
	fst dword [flt_4D5034]
	fstp dword [flt_4D5094]
	fild dword [esp+0Ch]
	fstp dword [flt_4D5038]
	mov [esp+0Ch], esi
	mov ecx, dword [flt_4D5038]
	mov dword [dword_4D5058], ecx
	fild dword [esp+0Ch]
	mov esi, dword [dword_4D4EB0]
	mov [esp+0Ch], ebx
	fstp dword [flt_4D5078]
	mov eax, [eax+24h]
	fild dword [esp+0Ch]
	fstp dword [flt_4D5054]
	mov ecx, dword [flt_4D5078]
	mov dword [dword_4D5098], ecx
	mov dword [dword_4D50A4], eax
	mov dword [dword_4D5084], eax
	mov dword [dword_4D5064], eax
	mov dword [dword_4D5044], eax
	mov eax, dword [flt_4D5054]
	mov dword [dword_4D5074], eax
	mov eax, [edx+14h]
	fxch st2
	fstp dword [flt_4D506C]
	fxch st1
	fstp dword [flt_4D5090]
	fld dword [flt_4D506C]
	fld dword [flt_4D5090]
	fxch st2
	fstp dword [flt_4D504C]
	fxch st2
	fst dword [flt_4D5050]
	fld dword [flt_4D504C]
	fxch st3
	fstp dword [flt_4D508C]
	fxch st1
	fstp dword [flt_4D50B0]
	fstp dword [flt_4D5070]
	fstp dword [flt_4D50AC]
	cmp eax, esi
	jnz loc_42AD52

loc_42AD30:
	push flt_4D5094
	push dword_4D5074
	push flt_4D5054
	push flt_4D5034
	call sub_497B24
	add esp, 10h
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_42AD52:
	push eax
	push 1
	mov dword [dword_4D4EB0], eax
	call sub_497738
	jmp loc_42AD30
;sub_42ABF0 endp

sub_42AD80: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	sub esp, 10h
	mov ecx, dword [dword_4EC638]
	mov edx, [eax+8]
	mov ebx, [eax+0Ch]
	add ecx, edx
	mov edx, dword [dword_4EC63C]
	mov esi, [eax+14h]
	add edx, ebx
	mov ebx, [eax+10h]
	mov [esp+8], ecx
	add ebx, ecx
	mov ecx, [eax+20h]
	mov [esp+0Ch], edx
	add esi, edx
	mov edx, [ecx]
	fild word [edx+4]
	fld1
	fdivrp st1, st0
	fild dword [eax+18h]
	fild dword [eax+1Ch]
	fild dword [eax+14h]
	fild dword [eax+10h]
	faddp st3, st0
	faddp st1, st0
	fild word [edx+6]
	fld1
	fxch st3
	fmul st0, st4
	fxch st3
	fdivrp st1, st0
	fxch st1
	fmul st0, st1
	fild dword [eax+1Ch]
	fld qword [dbl_4C9F6C]
	fild dword [eax+18h]
	fadd st0, st1
	fxch st2
	faddp st1, st0
	fxch st5
	fmulp st1, st0
	fxch st2
	fmulp st4, st0
	fild dword [esp+8]
	fst dword [flt_4D4FB4]
	fstp dword [flt_4D5014]
	fild dword [esp+0Ch]
	fstp dword [flt_4D4FB8]
	mov [esp+0Ch], esi
	mov eax, dword [flt_4D4FB8]
	mov dword [dword_4D4FD8], eax
	fild dword [esp+0Ch]
	mov esi, dword [dword_4D4EB0]
	mov [esp+0Ch], ebx
	fstp dword [flt_4D4FF8]
	fild dword [esp+0Ch]
	fstp dword [flt_4D4FD4]
	mov eax, dword [flt_4D4FF8]
	mov dword [dword_4D5018], eax
	mov eax, [ecx+14h]
	mov edx, dword [flt_4D4FD4]
	mov dword [dword_4D4FF4], edx
	fxch st2
	fstp dword [flt_4D4FEC]
	fxch st1
	fstp dword [flt_4D5010]
	fld dword [flt_4D4FEC]
	fld dword [flt_4D5010]
	fxch st2
	fstp dword [flt_4D4FCC]
	fxch st2
	fst dword [flt_4D4FD0]
	fld dword [flt_4D4FCC]
	fxch st3
	fstp dword [flt_4D500C]
	fxch st1
	fstp dword [flt_4D5030]
	fstp dword [flt_4D4FF0]
	fstp dword [flt_4D502C]
	cmp eax, esi
	jnz loc_42AEC9

loc_42AEA7:
	push flt_4D5014
	push dword_4D4FF4
	push flt_4D4FD4
	push flt_4D4FB4
	call sub_497B24
	add esp, 10h
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_42AEC9:
	push eax
	push 1
	mov dword [dword_4D4EB0], eax
	call sub_497738
	jmp loc_42AEA7
;sub_42AD80 endp

off_42AEE0: dd loc_42B099
	dd loc_42B122
	dd loc_42B12D
	dd loc_42B122
off_42AEF0: dd loc_42B0D6
	dd loc_42B13A
	dd loc_42B150
	dd loc_42B13A

sub_42AF00: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 2Ch
	mov ecx, [eax+0Ch]
	mov edx, eax
	add ecx, 10h
	mov ebp, [eax+10h]
	mov [esp+24h], ecx
	mov ecx, [eax+14h]
	mov bx, [eax+0Ah]
	add ecx, 10h
	add ebp, 10h
	mov [esp+28h], ecx
	cmp bx, 3
	jnz loc_42AF71
	cmp dword [dword_4D4E88], 0
	jz loc_42B0EC
	mov eax, [esp+28h]
	fld dword [eax+4]
	fsub dword [ebp+4]
	mov eax, [esp+24h]
	fld dword [eax]
	fsub dword [ebp+0]
	fmulp st1, st0
	fld dword [eax+4]
	fsub dword [ebp+4]
	mov eax, [esp+28h]
	fld dword [eax]
	fsub dword [ebp+0]
	fmulp st1, st0
	fsubp st1, st0
	fldz
	fcompp
	fnstsw ax
	sahf
	ja loc_42B0E2

loc_42AF71:
	mov esi, [esp+24h]
	mov edi, esp
	lea esi, [esi+18h]
	movsd
	movsd
	lea edi, [esp+8]
	lea esi, [ebp+18h]
	movsd
	movsd
	mov esi, [esp+28h]
	lea edi, [esp+10h]
	lea esi, [esi+18h]
	mov eax, [esp+24h]
	movsd
	movsd
	mov eax, [eax+10h]
	mov [esp+18h], eax
	mov eax, [ebp+10h]
	mov [esp+1Ch], eax
	mov eax, [esp+28h]
	mov eax, [eax+10h]
	mov [esp+20h], eax
	mov eax, [esp+18h]
	mov ecx, [esp+24h]
	or eax, 0FF000000h
	mov [ecx+10h], eax
	or byte [ebp+13h], 0FFh
	mov eax, [esp+28h]
	or byte [eax+13h], 0FFh
	mov eax, [edx+1Ch]
	mov edi, ecx
	mov esi, [eax+4]
	lea edi, [edi+18h]
	lea esi, dword dword_4D4E90[esi*8]
	movsd
	movsd
	mov esi, [eax+8]
	lea edi, [ebp+18h]
	lea esi, dword dword_4D4E90[esi*8]
	movsd
	movsd
	mov edi, [esp+28h]
	mov esi, [eax+0Ch]
	lea edi, [edi+18h]
	lea esi, dword dword_4D4E90[esi*8]
	movsd
	movsd
	mov eax, [edx+1Ch]
	mov ebx, dword [dword_4D4EB0]
	mov edx, [eax+14h]
	cmp edx, ebx
	jz loc_42B020
	push edx
	push 1
	mov dword [dword_4D4EB0], edx
	call sub_497738

loc_42B020:
	mov ebx, [esp+28h]
	mov eax, [esp+24h]
	mov edi, [esp+24h]
	mov edx, ebp
	mov esi, esp
	call sub_432670
	lea edi, [edi+18h]
	movsd
	movsd
	lea esi, [esp+8]
	lea edi, [ebp+18h]
	movsd
	movsd
	mov edi, [esp+28h]
	lea esi, [esp+10h]
	lea edi, [edi+18h]
	mov eax, [esp+18h]
	mov edx, [esp+24h]
	movsd
	movsd
	mov [edx+10h], eax
	mov eax, [esp+1Ch]
	mov edx, [esp+28h]
	mov [ebp+10h], eax
	mov eax, [esp+20h]
	mov [edx+10h], eax
	mov eax, dword [dword_500F5C]
	mov edi, dword [dword_4D4EB0]
	mov edx, [eax+14h]
	cmp edx, edi
	jz loc_42B08E
	push edx
	push 1
	mov dword [dword_4D4EB0], edx
	call sub_497738

loc_42B08E:
	mov eax, 0Ch
	jmp off_42AEE0[eax]

loc_42B099:
	push 0
	push 0
	push 5

loc_42B09F:
	push 1

loc_42B0A1:
	call grAlphaBlendFunction
	push 0
	push 0
	push 0
	mov ebx, [esp+34h]
	call grTexClampMode
	mov eax, [esp+24h]
	mov edx, ebp
	call sub_432670
	push 1
	push 1
	push 0
	call grTexClampMode
	xor eax, eax
	jmp off_42AEF0[eax]

loc_42B0D6:
	push eax
	push eax
	push 5
	push 1
	call grAlphaBlendFunction

loc_42B0E2:
	add esp, 2Ch
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_42B0EC:
	mov eax, [esp+28h]
	fld dword [eax+4]
	fsub dword [ebp+4]
	mov eax, [esp+24h]
	fld dword [eax]
	fsub dword [ebp+0]
	fmulp st1, st0
	fld dword [eax+4]
	fsub dword [ebp+4]
	mov eax, [esp+28h]
	fld dword [eax]
	fsub dword [ebp+0]
	fmulp st1, st0
	fsubp st1, st0
	fldz
	fcompp
	fnstsw ax
	sahf
	jb loc_42B0E2
	jmp loc_42AF71

loc_42B122:
	push 0
	push 0
	push 4
	jmp loc_42B09F

loc_42B12D:
	push 0
	push 0
	push 5
	push 0
	jmp loc_42B0A1

loc_42B13A:
	push eax
	push eax
	push 4
	push 1
	call grAlphaBlendFunction
	add esp, 2Ch
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_42B150:
	push eax
	push eax
	push 5
	push eax
	call grAlphaBlendFunction
	add esp, 2Ch
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_42AF00 endp

sub_42B170: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push ebp
	sub esp, 8
	mov ecx, eax
	mov edx, [eax+0Ch]
	mov ebp, [eax+10h]
	mov ebx, [eax+14h]
	add edx, 10h
	add ebp, 10h
	mov [esp+4], edx
	mov dx, [eax+0Ah]
	add ebx, 10h
	cmp dx, 3
	jnz loc_42B1D3
	cmp dword [dword_4D4E88], 0
	jz loc_42B2D2
	fld dword [ebx+4]
	fsub dword [ebp+4]
	mov eax, [esp+4]
	fld dword [eax]
	fsub dword [ebp+0]
	fmulp st1, st0
	fld dword [eax+4]
	fsub dword [ebp+4]
	fld dword [ebx]
	fsub dword [ebp+0]
	fmulp st1, st0
	fsubp st1, st0
	fldz
	fcompp
	fnstsw ax
	sahf
	ja loc_42B2CA

loc_42B1D3:
	push edi
	push esi
	mov eax, [ecx+1Ch]
	mov edi, [esp+0Ch]
	mov esi, [eax+4]
	lea edi, [edi+18h]
	lea esi, dword dword_4D4E90[esi*8]
	movsd
	movsd
	mov esi, [eax+8]
	lea edi, [ebp+18h]
	lea esi, dword dword_4D4E90[esi*8]
	movsd
	movsd
	mov esi, [eax+0Ch]
	lea edi, [ebx+18h]
	lea esi, dword dword_4D4E90[esi*8]
	movsd
	movsd
	mov edx, [ecx+20h]
	shr edx, 4
	mov eax, edx
	and eax, 7
	mov esi, eax
	shl esi, 4
	shl eax, 3
	add eax, esi
	add eax, 32h
	mov esi, eax
	mov edi, eax
	shl esi, 10h
	shl edi, 8
	or esi, 0FF000000h
	or edi, esi
	mov esi, edi
	or esi, eax
	mov eax, [esp+0Ch]
	shr edx, 3
	mov [eax+10h], esi
	mov eax, edx
	and eax, 7
	mov esi, eax
	shl esi, 4
	shl eax, 3
	add eax, esi
	add eax, 32h
	mov esi, eax
	shl esi, 10h
	or esi, 0FF000000h
	mov [esp+8], esi
	mov esi, eax
	mov edi, [esp+8]
	shl esi, 8
	or esi, edi
	or esi, eax
	mov eax, edx
	shr eax, 3
	and eax, 7
	mov edx, eax
	shl edx, 4
	shl eax, 3
	add eax, edx
	add eax, 32h
	mov [ebp+10h], esi
	mov esi, eax
	mov edx, eax
	shl esi, 10h
	shl edx, 8
	or esi, 0FF000000h
	or edx, esi
	or edx, eax
	mov [ebx+10h], edx
	mov eax, [ecx+1Ch]
	mov ecx, dword [dword_4D4EB0]
	mov edx, [eax+14h]
	cmp edx, ecx
	jz loc_42B2BD
	push edx
	push 1
	mov dword [dword_4D4EB0], edx
	call sub_497738

loc_42B2BD:
	mov eax, [esp+0Ch]
	mov edx, ebp
	call sub_432670
	pop esi
	pop edi

loc_42B2CA:
	add esp, 8
	pop ebp
	pop edx
	pop ecx
	pop ebx
	ret

loc_42B2D2:
	fld dword [ebx+4]
	fsub dword [ebp+4]
	mov eax, [esp+4]
	fld dword [eax]
	fsub dword [ebp+0]
	fmulp st1, st0
	fld dword [eax+4]
	fsub dword [ebp+4]
	fld dword [ebx]
	fsub dword [ebp+0]
	fmulp st1, st0
	fsubp st1, st0
	fldz
	fcompp
	fnstsw ax
	sahf
	jb loc_42B2CA
	jmp loc_42B1D3
;sub_42B170 endp

off_42B300: dd loc_42B579
	dd loc_42B66C
	dd loc_42B677
	dd loc_42B66C
off_42B310: dd loc_42B5BA
	dd loc_42B684
	dd loc_42B69A
	dd loc_42B684

sub_42B320: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 58h
	mov edx, eax
	mov eax, [eax+0Ch]
	add eax, 10h
	mov [esp+4Ch], eax
	mov eax, [edx+10h]
	add eax, 10h
	mov ebp, [edx+14h]
	mov [esp+50h], eax
	mov eax, [edx+18h]
	mov bx, [edx+0Ah]
	add eax, 10h
	add ebp, 10h
	mov [esp+54h], eax
	cmp bx, 3
	jnz loc_42B3FD
	cmp dword [dword_4D4E88], 0
	jz loc_42B5D0
	mov eax, [esp+4Ch]
	fld dword [eax+4]
	fsub dword [ebp+4]
	call __CHP
	fistp dword [esp+28h]
	mov eax, [esp+28h]
	mov [esp+28h], eax
	mov eax, [esp+50h]
	fild dword [esp+28h]
	fld dword [eax]
	fsub dword [ebp+0]
	fxch st1
	fstp dword [esp+44h]
	fmul dword [esp+44h]
	mov eax, [esp+4Ch]
	fld dword [eax]
	fsub dword [ebp+0]
	call __CHP
	fistp dword [esp+28h]
	mov eax, [esp+28h]
	mov [esp+28h], eax
	fild dword [esp+28h]
	mov eax, [esp+50h]
	fstp dword [esp+3Ch]
	fld dword [eax+4]
	fsub dword [ebp+4]
	fmul dword [esp+3Ch]
	fsubp st1, st0
	fldz
	fcompp
	fnstsw ax
	sahf
	jb loc_42B3FD
	mov eax, [esp+54h]
	fld dword [eax+4]
	fsub dword [ebp+4]
	fmul dword [esp+3Ch]
	fld dword [eax]
	fsub dword [ebp+0]
	fmul dword [esp+44h]
	fsubrp st1, st0
	fldz
	fcompp
	fnstsw ax
	sahf
	jb loc_42B5C6

loc_42B3FD:
	mov esi, [esp+4Ch]
	mov edi, esp
	lea esi, [esi+18h]
	movsd
	movsd
	mov esi, [esp+50h]
	lea edi, [esp+8]
	lea esi, [esi+18h]
	movsd
	movsd
	lea edi, [esp+10h]
	lea esi, [ebp+18h]
	movsd
	movsd
	mov esi, [esp+54h]
	lea edi, [esp+18h]
	lea esi, [esi+18h]
	mov eax, [esp+4Ch]
	movsd
	movsd
	mov eax, [eax+10h]
	mov [esp+2Ch], eax
	mov eax, [esp+50h]
	mov eax, [eax+10h]
	mov [esp+34h], eax
	mov eax, [ebp+10h]
	mov [esp+30h], eax
	mov eax, [esp+54h]
	mov eax, [eax+10h]
	mov [esp+38h], eax
	mov eax, [esp+2Ch]
	mov esi, [esp+4Ch]
	or eax, 0FF000000h
	mov [esi+10h], eax
	mov eax, [esp+50h]
	or byte [eax+13h], 0FFh
	mov bh, [ebp+13h]
	or bh, 0FFh
	mov eax, [esp+54h]
	mov [ebp+13h], bh
	or byte [eax+13h], 0FFh
	mov eax, [edx+1Ch]
	mov edi, [esp+4Ch]
	mov esi, [eax+4]
	lea edi, [edi+18h]
	lea esi, dword dword_4D4E90[esi*8]
	movsd
	movsd
	mov edi, [esp+50h]
	mov esi, [eax+8]
	lea edi, [edi+18h]
	lea esi, dword dword_4D4E90[esi*8]
	movsd
	movsd
	mov esi, [eax+0Ch]
	lea edi, [ebp+18h]
	lea esi, dword dword_4D4E90[esi*8]
	movsd
	movsd
	mov edi, [esp+54h]
	mov esi, [eax+10h]
	lea edi, [edi+18h]
	lea esi, dword dword_4D4E90[esi*8]
	movsd
	movsd
	mov eax, [edx+1Ch]
	mov ebx, dword [dword_4D4EB0]
	mov eax, [eax+14h]
	cmp eax, ebx
	jz loc_42B4E5
	push eax
	push 1
	mov dword [dword_4D4EB0], eax
	call sub_497738

loc_42B4E5:
	mov ecx, [esp+54h]
	mov edx, [esp+50h]
	mov eax, [esp+4Ch]
	mov edi, [esp+4Ch]
	mov ebx, ebp
	mov esi, esp
	call sub_432580
	lea edi, [edi+18h]
	movsd
	movsd
	mov edi, [esp+50h]
	lea esi, [esp+8]
	lea edi, [edi+18h]
	movsd
	movsd
	lea esi, [esp+10h]
	lea edi, [ebp+18h]
	movsd
	movsd
	mov edi, [esp+54h]
	lea esi, [esp+18h]
	lea edi, [edi+18h]
	mov eax, [esp+2Ch]
	mov edx, [esp+4Ch]
	movsd
	movsd
	mov [edx+10h], eax
	mov edx, [esp+50h]
	mov eax, [esp+34h]
	mov [edx+10h], eax
	mov eax, [esp+30h]
	mov edx, [esp+54h]
	mov [ebp+10h], eax
	mov eax, [esp+38h]
	mov [edx+10h], eax
	mov eax, dword [dword_500F5C]
	mov esi, dword [dword_4D4EB0]
	mov eax, [eax+14h]
	cmp eax, esi
	jz loc_42B56E
	push eax
	push 1
	mov dword [dword_4D4EB0], eax
	call sub_497738

loc_42B56E:
	mov eax, 0Ch
	jmp off_42B300[eax]

loc_42B579:
	push 0
	push 0
	push 5

loc_42B57F:
	push 1

loc_42B581:
	call grAlphaBlendFunction
	push 0
	push 0
	push 0
	mov ebx, ebp
	call grTexClampMode
	mov ecx, [esp+54h]
	mov edx, [esp+50h]
	mov eax, [esp+4Ch]
	call sub_432580
	push 1
	push 1
	push 0
	call grTexClampMode
	xor eax, eax
	jmp off_42B310[eax]

loc_42B5BA:
	push eax
	push eax
	push 5
	push 1
	call grAlphaBlendFunction

loc_42B5C6:
	add esp, 58h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_42B5D0:
	mov eax, [esp+4Ch]
	fld dword [eax+4]
	fsub dword [ebp+4]
	call __CHP
	fistp dword [esp+20h]
	mov eax, [esp+20h]
	mov [esp+28h], eax
	mov eax, [esp+50h]
	fild dword [esp+28h]
	fld dword [eax]
	fsub dword [ebp+0]
	fxch st1
	fstp dword [esp+40h]
	fmul dword [esp+40h]
	mov eax, [esp+4Ch]
	fld dword [eax]
	fsub dword [ebp+0]
	call __CHP
	fistp dword [esp+24h]
	mov eax, [esp+24h]
	mov [esp+28h], eax
	fild dword [esp+28h]
	mov eax, [esp+50h]
	fstp dword [esp+48h]
	fld dword [eax+4]
	fsub dword [ebp+4]
	fmul dword [esp+48h]
	fsubp st1, st0
	fldz
	fcompp
	fnstsw ax
	sahf
	jnb loc_42B3FD
	mov eax, [esp+54h]
	fld dword [eax+4]
	fsub dword [ebp+4]
	fmul dword [esp+48h]
	fld dword [eax]
	fsub dword [ebp+0]
	fmul dword [esp+40h]
	fsubrp st1, st0
	fldz
	fcompp
	fnstsw ax
	sahf
	jnb loc_42B5C6
	jmp loc_42B3FD

loc_42B66C:
	push 0
	push 0
	push 4
	jmp loc_42B57F

loc_42B677:
	push 0
	push 0
	push 5
	push 0
	jmp loc_42B581

loc_42B684:
	push eax
	push eax
	push 4
	push 1
	call grAlphaBlendFunction
	add esp, 58h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_42B69A:
	push eax
	push eax
	push 5
	push eax
	call grAlphaBlendFunction
	add esp, 58h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_42B320 endp

sub_42B6B0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push ebp
	sub esp, 24h
	mov ecx, eax
	mov eax, [eax+0Ch]
	mov ebx, [ecx+14h]
	mov ebp, [ecx+18h]
	add eax, 10h
	mov dx, [ecx+0Ah]
	mov [esp+1Ch], eax
	mov eax, [ecx+10h]
	add ebx, 10h
	add eax, 10h
	add ebp, 10h
	mov [esp+18h], eax
	cmp dx, 3
	jnz loc_42B781
	cmp dword [dword_4D4E88], 0
	jz loc_42B8D1
	mov eax, [esp+1Ch]
	fld dword [eax+4]
	fsub dword [ebx+4]
	call __CHP
	fistp dword [esp+20h]
	mov eax, [esp+20h]
	mov [esp+20h], eax
	mov eax, [esp+18h]
	fild dword [esp+20h]
	fld dword [eax]
	fsub dword [ebx]
	fxch st1
	fstp dword [esp+10h]
	fmul dword [esp+10h]
	mov eax, [esp+1Ch]
	fld dword [eax]
	fsub dword [ebx]
	call __CHP
	fistp dword [esp+20h]
	mov eax, [esp+20h]
	mov [esp+20h], eax
	fild dword [esp+20h]
	mov eax, [esp+18h]
	fstp dword [esp+0Ch]
	fld dword [eax+4]
	fsub dword [ebx+4]
	fmul dword [esp+0Ch]
	fsubp st1, st0
	fldz
	fcompp
	fnstsw ax
	sahf
	jb loc_42B781
	fld dword [ebp+4]
	fsub dword [ebx+4]
	fmul dword [esp+0Ch]
	fld dword [ebp+0]
	fsub dword [ebx]
	fmul dword [esp+10h]
	fsubrp st1, st0
	fldz
	fcompp
	fnstsw ax
	sahf
	jb loc_42B8C9

loc_42B781:
	push edi
	push esi
	mov eax, [ecx+1Ch]
	mov edi, [esp+24h]
	mov esi, [eax+4]
	lea edi, [edi+18h]
	lea esi, dword dword_4D4E90[esi*8]
	movsd
	movsd
	mov edi, [esp+20h]
	mov esi, [eax+8]
	lea edi, [edi+18h]
	lea esi, dword dword_4D4E90[esi*8]
	movsd
	movsd
	mov esi, [eax+0Ch]
	lea edi, [ebx+18h]
	lea esi, dword dword_4D4E90[esi*8]
	movsd
	movsd
	mov esi, [eax+10h]
	lea edi, [ebp+18h]
	lea esi, dword dword_4D4E90[esi*8]
	movsd
	movsd
	mov edx, [ecx+20h]
	shr edx, 4
	mov eax, edx
	and eax, 7
	mov esi, eax
	shl esi, 4
	shl eax, 3
	add eax, esi
	add eax, 32h
	mov esi, eax
	mov edi, eax
	shl esi, 10h
	shl edi, 8
	or esi, 0FF000000h
	or edi, esi
	mov esi, edi
	or esi, eax
	mov eax, [esp+24h]
	shr edx, 3
	mov [eax+10h], esi
	mov eax, edx
	and eax, 7
	mov esi, eax
	shl esi, 4
	shl eax, 3
	add eax, esi
	add eax, 32h
	mov esi, eax
	shl esi, 10h
	or esi, 0FF000000h
	mov [esp+28h], esi
	mov esi, eax
	mov edi, [esp+28h]
	shl esi, 8
	or edi, esi
	mov esi, edi
	or esi, eax
	mov eax, [esp+20h]
	shr edx, 3
	mov [eax+10h], esi
	mov eax, edx
	and eax, 7
	mov esi, eax
	shl esi, 4
	shl eax, 3
	add eax, esi
	add eax, 32h
	mov esi, eax
	shl esi, 10h
	or esi, 0FF000000h
	mov [esp+28h], esi
	mov esi, eax
	mov edi, [esp+28h]
	shl esi, 8
	or esi, edi
	or esi, eax
	mov eax, edx
	shr eax, 3
	and eax, 7
	mov edx, eax
	shl edx, 4
	shl eax, 3
	add eax, edx
	add eax, 32h
	mov [ebx+10h], esi
	mov edx, eax
	mov esi, eax
	shl edx, 10h
	shl esi, 8
	or edx, 0FF000000h
	or edx, esi
	or edx, eax
	mov [ebp+10h], edx
	mov eax, [ecx+1Ch]
	mov ecx, dword [dword_4D4EB0]
	mov edx, [eax+14h]
	cmp edx, ecx
	jz loc_42B8B8
	push edx
	push 1
	mov dword [dword_4D4EB0], edx
	call sub_497738

loc_42B8B8:
	mov edx, [esp+20h]
	mov eax, [esp+24h]
	mov ecx, ebp
	call sub_432580
	pop esi
	pop edi

loc_42B8C9:
	add esp, 24h
	pop ebp
	pop edx
	pop ecx
	pop ebx
	ret

loc_42B8D1:
	mov eax, [esp+1Ch]
	fld dword [eax+4]
	fsub dword [ebx+4]
	call __CHP
	fistp dword [esp]
	mov eax, [esp]
	mov [esp+20h], eax
	mov eax, [esp+18h]
	fild dword [esp+20h]
	fld dword [eax]
	fsub dword [ebx]
	fxch st1
	fstp dword [esp+14h]
	fmul dword [esp+14h]
	mov eax, [esp+1Ch]
	fld dword [eax]
	fsub dword [ebx]
	call __CHP
	fistp dword [esp+4]
	mov eax, [esp+4]
	mov [esp+20h], eax
	fild dword [esp+20h]
	mov eax, [esp+18h]
	fstp dword [esp+8]
	fld dword [eax+4]
	fsub dword [ebx+4]
	fmul dword [esp+8]
	fsubp st1, st0
	fldz
	fcompp
	fnstsw ax
	sahf
	jnb loc_42B781
	fld dword [ebp+4]
	fsub dword [ebx+4]
	fmul dword [esp+8]
	fld dword [ebp+0]
	fsub dword [ebx]
	fmul dword [esp+14h]
	fsubrp st1, st0
	fldz
	fcompp
	fnstsw ax
	sahf
	jnb loc_42B8C9
	jmp loc_42B781
;sub_42B6B0 endp

sub_42B970: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push ebp
	sub esp, 24h
	mov edx, eax
	mov eax, [eax+0Ch]
	mov ebx, [edx+14h]
	mov ebp, [edx+18h]
	add eax, 10h
	mov cx, [edx+0Ah]
	mov [esp+1Ch], eax
	mov eax, [edx+10h]
	add ebx, 10h
	add eax, 10h
	add ebp, 10h
	mov [esp+18h], eax
	cmp cx, 3
	jnz loc_42BA41
	cmp dword [dword_4D4E88], 0
	jz loc_42BADF
	mov eax, [esp+1Ch]
	fld dword [eax+4]
	fsub dword [ebx+4]
	call __CHP
	fistp dword [esp+20h]
	mov eax, [esp+20h]
	mov [esp+20h], eax
	mov eax, [esp+18h]
	fild dword [esp+20h]
	fld dword [eax]
	fsub dword [ebx]
	fxch st1
	fstp dword [esp+14h]
	fmul dword [esp+14h]
	mov eax, [esp+1Ch]
	fld dword [eax]
	fsub dword [ebx]
	call __CHP
	fistp dword [esp+20h]
	mov eax, [esp+20h]
	mov [esp+20h], eax
	fild dword [esp+20h]
	mov eax, [esp+18h]
	fstp dword [esp+10h]
	fld dword [eax+4]
	fsub dword [ebx+4]
	fmul dword [esp+10h]
	fsubp st1, st0
	fldz
	fcompp
	fnstsw ax
	sahf
	jb loc_42BA41
	fld dword [ebp+4]
	fsub dword [ebx+4]
	fmul dword [esp+10h]
	fld dword [ebp+0]
	fsub dword [ebx]
	fmul dword [esp+14h]
	fsubrp st1, st0
	fldz
	fcompp
	fnstsw ax
	sahf
	jb loc_42BAD7

loc_42BA41:
	push edi
	push esi
	mov eax, [edx+1Ch]
	mov edi, [esp+24h]
	mov esi, [eax+4]
	lea edi, [edi+18h]
	lea esi, dword dword_4D4E90[esi*8]
	movsd
	movsd
	mov edi, [esp+20h]
	mov esi, [eax+8]
	lea edi, [edi+18h]
	lea esi, dword dword_4D4E90[esi*8]
	movsd
	movsd
	mov esi, [eax+0Ch]
	lea edi, [ebx+18h]
	lea esi, dword dword_4D4E90[esi*8]
	movsd
	movsd
	mov esi, [eax+10h]
	lea edi, [ebp+18h]
	lea esi, dword dword_4D4E90[esi*8]
	movsd
	movsd
	mov esi, [edx+20h]
	test esi, esi
	jz loc_42BAA7
	mov eax, esi
	mov esi, [esp+24h]
	mov [esi+10h], eax
	mov esi, [esp+20h]
	mov [esi+10h], eax
	mov [ebx+10h], eax
	mov [ebp+10h], eax

loc_42BAA7:
	mov eax, [edx+1Ch]
	mov edi, dword [dword_4D4EB0]
	mov edx, [eax+14h]
	cmp edx, edi
	jz loc_42BAC6
	push edx
	push 1
	mov dword [dword_4D4EB0], edx
	call sub_497738

loc_42BAC6:
	mov edx, [esp+20h]
	mov eax, [esp+24h]
	mov ecx, ebp
	call sub_432580
	pop esi
	pop edi

loc_42BAD7:
	add esp, 24h
	pop ebp
	pop edx
	pop ecx
	pop ebx
	ret

loc_42BADF:
	mov eax, [esp+1Ch]
	fld dword [eax+4]
	fsub dword [ebx+4]
	call __CHP
	fistp dword [esp]
	mov eax, [esp]
	mov [esp+20h], eax
	mov eax, [esp+18h]
	fild dword [esp+20h]
	fld dword [eax]
	fsub dword [ebx]
	fxch st1
	fstp dword [esp+0Ch]
	fmul dword [esp+0Ch]
	mov eax, [esp+1Ch]
	fld dword [eax]
	fsub dword [ebx]
	call __CHP
	fistp dword [esp+4]
	mov eax, [esp+4]
	mov [esp+20h], eax
	fild dword [esp+20h]
	mov eax, [esp+18h]
	fstp dword [esp+8]
	fld dword [eax+4]
	fsub dword [ebx+4]
	fmul dword [esp+8]
	fsubp st1, st0
	fldz
	fcompp
	fnstsw ax
	sahf
	jnb loc_42BA41
	fld dword [ebp+4]
	fsub dword [ebx+4]
	fmul dword [esp+8]
	fld dword [ebp+0]
	fsub dword [ebx]
	fmul dword [esp+0Ch]
	fsubrp st1, st0
	fldz
	fcompp
	fnstsw ax
	sahf
	jnb loc_42BAD7
	jmp loc_42BA41
;sub_42B970 endp

off_42BB80: dd loc_42BC3F
	dd loc_42BC8E
	dd loc_42BC95
	dd loc_42BC8E
off_42BB90: dd loc_42BC63
	dd loc_42BC9F
	dd loc_42BCB5
	dd loc_42BC9F

sub_42BBA0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 8
	mov edx, [eax+0Ch]
	add edx, 10h
	mov [esp+4], edx
	mov edx, [eax+18h]
	add edx, 10h
	mov [esp], edx
	mov edx, [eax+1Ch]
	mov edi, [esp+4]
	mov esi, [edx+4]
	lea edi, [edi+18h]
	lea esi, dword dword_4D4E90[esi*8]
	mov ebp, [eax+10h]
	mov ebx, [eax+14h]
	movsd
	movsd
	mov esi, [edx+8]
	lea edi, [ebp+28h]
	lea esi, dword dword_4D4E90[esi*8]
	movsd
	movsd
	mov esi, [edx+0Ch]
	lea edi, [ebx+28h]
	lea esi, dword dword_4D4E90[esi*8]
	movsd
	movsd
	mov edi, [esp]
	mov esi, [edx+10h]
	lea edi, [edi+18h]
	lea esi, dword dword_4D4E90[esi*8]
	movsd
	movsd
	add ebp, 10h
	mov edx, [eax+20h]
	add ebx, 10h
	test edx, edx
	jnz loc_42BC79

loc_42BC15:
	mov eax, [eax+1Ch]
	mov ecx, dword [dword_4D4EB0]
	mov edx, [eax+14h]
	cmp edx, ecx
	jz loc_42BC34
	push edx
	push 1
	mov dword [dword_4D4EB0], edx
	call sub_497738

loc_42BC34:
	mov eax, 4
	jmp off_42BB80[eax]

loc_42BC3F:
	push 0
	push 0
	push 5

loc_42BC45:
	push 1

loc_42BC47:
	call grAlphaBlendFunction
	mov ecx, [esp]
	mov eax, [esp+4]
	mov edx, ebp
	call sub_432580
	xor eax, eax
	jmp off_42BB90[eax]

loc_42BC63:
	push eax
	push eax
	push 5
	push 1
	call grAlphaBlendFunction
	add esp, 8
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_42BC79:
	mov esi, [esp+4]
	mov [esi+10h], edx
	mov [ebp+10h], edx
	mov esi, [esp]
	mov [ebx+10h], edx
	mov [esi+10h], edx
	jmp loc_42BC15

loc_42BC8E:
	push 0
	push 0
	push eax
	jmp loc_42BC45

loc_42BC95:
	push 0
	push 0
	push 5
	push 0
	jmp loc_42BC47

loc_42BC9F:
	push eax
	push eax
	push 4
	push 1
	call grAlphaBlendFunction
	add esp, 8
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_42BCB5:
	push eax
	push eax
	push 5
	push eax
	call grAlphaBlendFunction
	add esp, 8
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_42BBA0 endp

sub_42BCD0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 14h
	mov ebp, eax
	fld dword [ebp+3Ch]
	mov edx, flt_4D4F34
	mov ecx, flt_4D4F54
	mov ebx, flt_4D4F74
	mov esi, flt_4D4F94
	mov eax, dword [dword_4EC638]
	fstp dword [flt_4D4FA0]
	mov edi, [ebp+8]
	fld dword [flt_4D4FA0]
	mov [esp+0Ch], edx
	mov [esp+4], ecx
	mov [esp+8], ebx
	mov [esp], esi
	fstp dword [flt_4D4F80]
	add eax, edi
	fld dword [flt_4D4F80]
	mov [esp+10h], eax
	fstp dword [flt_4D4F60]
	mov edx, [ebp+0Ch]
	mov ecx, [ebp+10h]
	mov ebx, [ebp+14h]
	mov esi, [ebp+18h]
	mov edi, [ebp+1Ch]
	fild dword [esp+10h]
	fld dword [flt_4D4F60]
	mov eax, dword [dword_4EC63C]
	fxch st1
	fstp dword [flt_4D4F34]
	add eax, edx
	fstp dword [flt_4D4F40]
	mov [esp+10h], eax
	mov edx, [ebp+20h]
	mov eax, dword [dword_4EC638]
	fild dword [esp+10h]
	add eax, ecx
	fstp dword [flt_4D4F38]
	mov [esp+10h], eax
	mov ecx, [ebp+24h]
	mov eax, dword [dword_4EC63C]
	fild dword [esp+10h]
	add eax, ebx
	fstp dword [flt_4D4F54]
	mov [esp+10h], eax
	mov eax, dword [dword_4EC638]
	fild dword [esp+10h]
	add eax, esi
	fstp dword [flt_4D4F58]
	mov [esp+10h], eax
	mov esi, flt_4D4F34
	fild dword [esp+10h]
	mov eax, dword [dword_4EC63C]
	fstp dword [flt_4D4F74]
	add eax, edi
	mov edi, flt_4D4F34
	mov [esp+10h], eax
	mov eax, dword [dword_4EC638]
	fild dword [esp+10h]
	add eax, edx
	fstp dword [flt_4D4F78]
	mov [esp+10h], eax
	mov eax, dword [dword_4EC63C]
	add edi, 14h
	add eax, ecx
	fild dword [esp+10h]
	mov [esp+10h], eax
	fstp dword [flt_4D4F94]
	fild dword [esp+10h]
	fstp dword [flt_4D4F98]
	mov eax, [esi+0Ch]
	mov ecx, dword [dword_4F1E04]
	test eax, 80000000h
	jnz loc_42BE62
	cmp eax, ecx
	jge loc_42BE62
	mov eax, [esi+4]
	mov ebx, 0
	mov ecx, dword [dword_4F1E10]
	mov edx, dword [dword_4F1E0C]
	test eax, 80000000h
	jnz loc_42BE36
	cmp eax, ecx
	jl loc_42BE36
	cmp eax, edx
	jle loc_42BE3A
	or ebx, 4
	jmp loc_42BE3A

loc_42BE36:
	or ebx, 8
	nop

loc_42BE3A:
	mov eax, [esi]
	nop
	mov ecx, dword [dword_4F1E08]
	mov edx, dword [dword_4F1E18]
	test eax, 80000000h
	jnz loc_42BE5D
	cmp eax, ecx
	jl loc_42BE5D
	cmp eax, edx
	jle loc_42BE67
	or ebx, 2
	jmp loc_42BE67

loc_42BE5D:
	or ebx, 1
	jmp loc_42BE67

loc_42BE62:
	mov ebx, 10h

loc_42BE67:
	mov [edi], bl
	mov edi, flt_4D4F54
	mov esi, flt_4D4F54
	add edi, 14h
	mov eax, [esi+0Ch]
	mov ecx, dword [dword_4F1E04]
	test eax, 80000000h
	jnz loc_42BEDE
	cmp eax, ecx
	jge loc_42BEDE
	mov eax, [esi+4]
	mov ebx, 0
	mov ecx, dword [dword_4F1E10]
	mov edx, dword [dword_4F1E0C]
	test eax, 80000000h
	jnz loc_42BEB2
	cmp eax, ecx
	jl loc_42BEB2
	cmp eax, edx
	jle loc_42BEB6
	or ebx, 4
	jmp loc_42BEB6

loc_42BEB2:
	or ebx, 8
	nop

loc_42BEB6:
	mov eax, [esi]
	nop
	mov ecx, dword [dword_4F1E08]
	mov edx, dword [dword_4F1E18]
	test eax, 80000000h
	jnz loc_42BED9
	cmp eax, ecx
	jl loc_42BED9
	cmp eax, edx
	jle loc_42BEE3
	or ebx, 2
	jmp loc_42BEE3

loc_42BED9:
	or ebx, 1
	jmp loc_42BEE3

loc_42BEDE:
	mov ebx, 10h

loc_42BEE3:
	mov [edi], bl
	mov edi, flt_4D4F74
	mov esi, flt_4D4F74
	add edi, 14h
	mov eax, [esi+0Ch]
	mov ecx, dword [dword_4F1E04]
	test eax, 80000000h
	jnz loc_42BF5A
	cmp eax, ecx
	jge loc_42BF5A
	mov eax, [esi+4]
	mov ebx, 0
	mov ecx, dword [dword_4F1E10]
	mov edx, dword [dword_4F1E0C]
	test eax, 80000000h
	jnz loc_42BF2E
	cmp eax, ecx
	jl loc_42BF2E
	cmp eax, edx
	jle loc_42BF32
	or ebx, 4
	jmp loc_42BF32

loc_42BF2E:
	or ebx, 8
	nop

loc_42BF32:
	mov eax, [esi]
	nop
	mov ecx, dword [dword_4F1E08]
	mov edx, dword [dword_4F1E18]
	test eax, 80000000h
	jnz loc_42BF55
	cmp eax, ecx
	jl loc_42BF55
	cmp eax, edx
	jle loc_42BF5F
	or ebx, 2
	jmp loc_42BF5F

loc_42BF55:
	or ebx, 1
	jmp loc_42BF5F

loc_42BF5A:
	mov ebx, 10h

loc_42BF5F:
	mov [edi], bl
	mov edi, flt_4D4F94
	mov esi, flt_4D4F94
	add edi, 14h
	mov eax, [esi+0Ch]
	mov ecx, dword [dword_4F1E04]
	test eax, 80000000h
	jnz loc_42BFD6
	cmp eax, ecx
	jge loc_42BFD6
	mov eax, [esi+4]
	mov ebx, 0
	mov ecx, dword [dword_4F1E10]
	mov edx, dword [dword_4F1E0C]
	test eax, 80000000h
	jnz loc_42BFAA
	cmp eax, ecx
	jl loc_42BFAA
	cmp eax, edx
	jle loc_42BFAE
	or ebx, 4
	jmp loc_42BFAE

loc_42BFAA:
	or ebx, 8
	nop

loc_42BFAE:
	mov eax, [esi]
	nop
	mov ecx, dword [dword_4F1E08]
	mov edx, dword [dword_4F1E18]
	test eax, 80000000h
	jnz loc_42BFD1
	cmp eax, ecx
	jl loc_42BFD1
	cmp eax, edx
	jle loc_42BFDB
	or ebx, 2
	jmp loc_42BFDB

loc_42BFD1:
	or ebx, 1
	jmp loc_42BFDB

loc_42BFD6:
	mov ebx, 10h

loc_42BFDB:
	mov [edi], bl
	xor eax, eax
	movzx edi, byte [ebp+29h]
	mov al, [ebp+28h]
	shl edi, 10h
	shl eax, 18h
	or edi, eax
	xor eax, eax
	mov al, [ebp+2Ah]
	shl eax, 8
	or edi, eax
	xor eax, eax
	mov al, [ebp+2Bh]
	or edi, eax
	xor eax, eax
	mov al, [ebp+2Ch]
	mov dword [dword_4D4F44], edi
	mov edi, eax
	xor eax, eax
	mov al, [ebp+2Dh]
	shl edi, 18h
	shl eax, 10h
	or edi, eax
	xor eax, eax
	mov al, [ebp+2Eh]
	shl eax, 8
	or eax, edi
	movzx edi, byte [ebp+2Fh]
	or eax, edi
	mov dword [dword_4D4F64], eax
	xor eax, eax
	movzx edi, byte [ebp+30h]
	mov al, [ebp+31h]
	shl edi, 18h
	shl eax, 10h
	or edi, eax
	xor eax, eax
	mov al, [ebp+32h]
	shl eax, 8
	or edi, eax
	xor eax, eax
	mov al, [ebp+33h]
	or edi, eax
	mov dword [dword_4D4F84], edi
	xor eax, eax
	mov al, [ebp+34h]
	mov edi, eax
	xor eax, eax
	mov al, [ebp+35h]
	shl edi, 18h
	shl eax, 10h
	or edi, eax
	xor eax, eax
	mov al, [ebp+36h]
	shl eax, 8
	or edi, eax
	xor eax, eax
	mov al, [ebp+37h]
	or edi, eax
	mov ebx, dword [dword_4D4EB0]
	mov dword [dword_4D4FA4], edi
	test ebx, ebx
	jnz loc_42C0AE

loc_42C08B:
	mov edi, [esp]
	push edi
	mov ebp, [esp+0Ch]
	push ebp
	mov eax, [esp+0Ch]
	push eax
	mov edx, [esp+18h]
	push edx
	call sub_497B24
	add esp, 14h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_42C0AE:
	xor esi, esi
	push esi
	push 1
	mov dword [dword_4D4EB0], esi
	call sub_497738
	jmp loc_42C08B
;sub_42BCD0 endp

sub_42C0D0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 14h
	mov ebp, eax
	fld dword [ebp+3Ch]
	mov edx, flt_4D4F34
	mov ecx, flt_4D4F54
	mov ebx, flt_4D4F74
	mov esi, flt_4D4F94
	mov eax, dword [dword_4EC638]
	fstp dword [flt_4D4FA0]
	mov edi, [ebp+8]
	fld dword [flt_4D4FA0]
	mov [esp+0Ch], edx
	mov [esp+4], ecx
	mov [esp+8], ebx
	mov [esp], esi
	fstp dword [flt_4D4F80]
	add eax, edi
	fld dword [flt_4D4F80]
	mov [esp+10h], eax
	fstp dword [flt_4D4F60]
	mov edx, [ebp+0Ch]
	mov ecx, [ebp+10h]
	mov ebx, [ebp+14h]
	mov esi, [ebp+18h]
	mov edi, [ebp+1Ch]
	fild dword [esp+10h]
	fld dword [flt_4D4F60]
	mov eax, dword [dword_4EC63C]
	fxch st1
	fstp dword [flt_4D4F34]
	add eax, edx
	fstp dword [flt_4D4F40]
	mov [esp+10h], eax
	mov edx, [ebp+20h]
	mov eax, dword [dword_4EC638]
	fild dword [esp+10h]
	add eax, ecx
	fstp dword [flt_4D4F38]
	mov [esp+10h], eax
	mov ecx, [ebp+24h]
	mov eax, dword [dword_4EC63C]
	fild dword [esp+10h]
	add eax, ebx
	fstp dword [flt_4D4F54]
	mov [esp+10h], eax
	mov eax, dword [dword_4EC638]
	fild dword [esp+10h]
	add eax, esi
	fstp dword [flt_4D4F58]
	mov [esp+10h], eax
	mov esi, flt_4D4F34
	fild dword [esp+10h]
	mov eax, dword [dword_4EC63C]
	fstp dword [flt_4D4F74]
	add eax, edi
	mov edi, flt_4D4F34
	mov [esp+10h], eax
	mov eax, dword [dword_4EC638]
	fild dword [esp+10h]
	add eax, edx
	fstp dword [flt_4D4F78]
	mov [esp+10h], eax
	mov eax, dword [dword_4EC63C]
	add edi, 14h
	add eax, ecx
	fild dword [esp+10h]
	mov [esp+10h], eax
	fstp dword [flt_4D4F94]
	fild dword [esp+10h]
	fstp dword [flt_4D4F98]
	mov eax, [esi+0Ch]
	mov ecx, dword [dword_4F1E04]
	test eax, 80000000h
	jnz loc_42C262
	cmp eax, ecx
	jge loc_42C262
	mov eax, [esi+4]
	mov ebx, 0
	mov ecx, dword [dword_4F1E10]
	mov edx, dword [dword_4F1E0C]
	test eax, 80000000h
	jnz loc_42C236
	cmp eax, ecx
	jl loc_42C236
	cmp eax, edx
	jle loc_42C23A
	or ebx, 4
	jmp loc_42C23A

loc_42C236:
	or ebx, 8
	nop

loc_42C23A:
	mov eax, [esi]
	nop
	mov ecx, dword [dword_4F1E08]
	mov edx, dword [dword_4F1E18]
	test eax, 80000000h
	jnz loc_42C25D
	cmp eax, ecx
	jl loc_42C25D
	cmp eax, edx
	jle loc_42C267
	or ebx, 2
	jmp loc_42C267

loc_42C25D:
	or ebx, 1
	jmp loc_42C267

loc_42C262:
	mov ebx, 10h

loc_42C267:
	mov [edi], bl
	mov edi, flt_4D4F54
	mov esi, flt_4D4F54
	add edi, 14h
	mov eax, [esi+0Ch]
	mov ecx, dword [dword_4F1E04]
	test eax, 80000000h
	jnz loc_42C2DE
	cmp eax, ecx
	jge loc_42C2DE
	mov eax, [esi+4]
	mov ebx, 0
	mov ecx, dword [dword_4F1E10]
	mov edx, dword [dword_4F1E0C]
	test eax, 80000000h
	jnz loc_42C2B2
	cmp eax, ecx
	jl loc_42C2B2
	cmp eax, edx
	jle loc_42C2B6
	or ebx, 4
	jmp loc_42C2B6

loc_42C2B2:
	or ebx, 8
	nop

loc_42C2B6:
	mov eax, [esi]
	nop
	mov ecx, dword [dword_4F1E08]
	mov edx, dword [dword_4F1E18]
	test eax, 80000000h
	jnz loc_42C2D9
	cmp eax, ecx
	jl loc_42C2D9
	cmp eax, edx
	jle loc_42C2E3
	or ebx, 2
	jmp loc_42C2E3

loc_42C2D9:
	or ebx, 1
	jmp loc_42C2E3

loc_42C2DE:
	mov ebx, 10h

loc_42C2E3:
	mov [edi], bl
	mov edi, flt_4D4F74
	mov esi, flt_4D4F74
	add edi, 14h
	mov eax, [esi+0Ch]
	mov ecx, dword [dword_4F1E04]
	test eax, 80000000h
	jnz loc_42C35A
	cmp eax, ecx
	jge loc_42C35A
	mov eax, [esi+4]
	mov ebx, 0
	mov ecx, dword [dword_4F1E10]
	mov edx, dword [dword_4F1E0C]
	test eax, 80000000h
	jnz loc_42C32E
	cmp eax, ecx
	jl loc_42C32E
	cmp eax, edx
	jle loc_42C332
	or ebx, 4
	jmp loc_42C332

loc_42C32E:
	or ebx, 8
	nop

loc_42C332:
	mov eax, [esi]
	nop
	mov ecx, dword [dword_4F1E08]
	mov edx, dword [dword_4F1E18]
	test eax, 80000000h
	jnz loc_42C355
	cmp eax, ecx
	jl loc_42C355
	cmp eax, edx
	jle loc_42C35F
	or ebx, 2
	jmp loc_42C35F

loc_42C355:
	or ebx, 1
	jmp loc_42C35F

loc_42C35A:
	mov ebx, 10h

loc_42C35F:
	mov [edi], bl
	mov edi, flt_4D4F94
	mov esi, flt_4D4F94
	add edi, 14h
	mov eax, [esi+0Ch]
	mov ecx, dword [dword_4F1E04]
	test eax, 80000000h
	jnz loc_42C3D6
	cmp eax, ecx
	jge loc_42C3D6
	mov eax, [esi+4]
	mov ebx, 0
	mov ecx, dword [dword_4F1E10]
	mov edx, dword [dword_4F1E0C]
	test eax, 80000000h
	jnz loc_42C3AA
	cmp eax, ecx
	jl loc_42C3AA
	cmp eax, edx
	jle loc_42C3AE
	or ebx, 4
	jmp loc_42C3AE

loc_42C3AA:
	or ebx, 8
	nop

loc_42C3AE:
	mov eax, [esi]
	nop
	mov ecx, dword [dword_4F1E08]
	mov edx, dword [dword_4F1E18]
	test eax, 80000000h
	jnz loc_42C3D1
	cmp eax, ecx
	jl loc_42C3D1
	cmp eax, edx
	jle loc_42C3DB
	or ebx, 2
	jmp loc_42C3DB

loc_42C3D1:
	or ebx, 1
	jmp loc_42C3DB

loc_42C3D6:
	mov ebx, 10h

loc_42C3DB:
	mov [edi], bl
	xor eax, eax
	movzx edi, byte [ebp+28h]
	mov al, [ebp+29h]
	shl edi, 18h
	shl eax, 10h
	or edi, eax
	xor eax, eax
	mov al, [ebp+2Ah]
	shl eax, 8
	or eax, edi
	movzx edi, byte [ebp+2Bh]
	or eax, edi
	mov dword [dword_4D4F44], eax
	xor eax, eax
	movzx edi, byte [ebp+2Ch]
	mov al, [ebp+2Dh]
	shl edi, 18h
	shl eax, 10h
	or eax, edi
	movzx edi, byte [ebp+2Eh]
	shl edi, 8
	or edi, eax
	xor eax, eax
	mov al, [ebp+2Fh]
	or edi, eax
	mov dword [dword_4D4F64], edi
	xor eax, eax
	movzx edi, byte [ebp+30h]
	mov al, [ebp+31h]
	shl edi, 18h
	shl eax, 10h
	or edi, eax
	xor eax, eax
	mov al, [ebp+32h]
	shl eax, 8
	or edi, eax
	xor eax, eax
	mov al, [ebp+33h]
	or edi, eax
	mov dword [dword_4D4F84], edi
	xor eax, eax
	movzx edi, byte [ebp+34h]
	mov al, [ebp+35h]
	shl edi, 18h
	shl eax, 10h
	or edi, eax
	xor eax, eax
	mov al, [ebp+36h]
	shl eax, 8
	or edi, eax
	xor eax, eax
	mov al, [ebp+37h]
	or edi, eax
	mov ebx, dword [dword_4D4EB0]
	mov dword [dword_4D4FA4], edi
	test ebx, ebx
	jnz loc_42C4A2

loc_42C484:
	mov ecx, [esp]
	mov ebx, [esp+8]
	mov edx, [esp+4]
	mov eax, [esp+0Ch]
	call sub_430B80
	add esp, 14h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_42C4A2:
	xor esi, esi
	push esi
	push 1
	mov dword [dword_4D4EB0], esi
	call sub_497738
	jmp loc_42C484
;sub_42C0D0 endp

sub_42C4C0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 14h
	mov ebp, eax
	fld dword [ebp+34h]
	mov edx, flt_4D4EB4
	mov ecx, flt_4D4ED4
	mov ebx, flt_4D4EF4
	mov esi, flt_4D4F14
	mov eax, dword [dword_4EC638]
	fstp dword [flt_4D4F20]
	mov edi, [ebp+8]
	fld dword [flt_4D4F20]
	mov [esp+8], edx
	mov [esp+0Ch], ecx
	mov [esp], ebx
	mov [esp+4], esi
	fstp dword [flt_4D4F00]
	add eax, edi
	fld dword [flt_4D4F00]
	mov [esp+10h], eax
	fstp dword [flt_4D4EE0]
	mov edx, [ebp+0Ch]
	mov ecx, [ebp+10h]
	mov ebx, [ebp+14h]
	mov esi, [ebp+18h]
	mov edi, [ebp+1Ch]
	fild dword [esp+10h]
	fld dword [flt_4D4EE0]
	mov eax, dword [dword_4EC63C]
	fxch st1
	fstp dword [flt_4D4EB4]
	add eax, edx
	fstp dword [flt_4D4EC0]
	mov [esp+10h], eax
	mov edx, [ebp+20h]
	mov eax, dword [dword_4EC638]
	fild dword [esp+10h]
	add eax, ecx
	fstp dword [flt_4D4EB8]
	mov [esp+10h], eax
	mov ecx, [ebp+24h]
	mov eax, dword [dword_4EC63C]
	fild dword [esp+10h]
	add eax, ebx
	fstp dword [flt_4D4ED4]
	mov [esp+10h], eax
	mov eax, dword [dword_4EC638]
	fild dword [esp+10h]
	add eax, esi
	fstp dword [flt_4D4ED8]
	mov [esp+10h], eax
	mov eax, dword [dword_4EC63C]
	fild dword [esp+10h]
	add eax, edi
	fstp dword [flt_4D4EF4]
	mov [esp+10h], eax
	mov eax, dword [dword_4EC638]
	mov edi, dword_4D4ECC
	add eax, edx
	fild dword [esp+10h]
	mov [esp+10h], eax
	mov eax, dword [dword_4EC63C]
	fstp dword [flt_4D4EF8]
	add eax, ecx
	fild dword [esp+10h]
	mov [esp+10h], eax
	mov eax, [ebp+28h]
	fstp dword [flt_4D4F14]
	mov esi, [eax+4]
	fild dword [esp+10h]
	lea esi, dword dword_4D4E90[esi*8]
	fstp dword [flt_4D4F18]
	movsd
	movsd
	mov esi, [eax+8]
	mov edi, dword_4D4EEC
	lea esi, dword dword_4D4E90[esi*8]
	movsd
	movsd
	mov esi, [eax+0Ch]
	mov edi, dword_4D4F0C
	lea esi, dword dword_4D4E90[esi*8]
	movsd
	movsd
	mov esi, [eax+10h]
	mov edi, dword_4D4F2C
	lea esi, dword dword_4D4E90[esi*8]
	movsd
	movsd
	mov edi, flt_4D4EB4
	mov esi, flt_4D4EB4
	add edi, 14h
	mov eax, [esi+0Ch]
	mov ecx, dword [dword_4F1E04]
	test eax, 80000000h
	jnz loc_42C699
	cmp eax, ecx
	jge loc_42C699
	mov eax, [esi+4]
	mov ebx, 0
	mov ecx, dword [dword_4F1E10]
	mov edx, dword [dword_4F1E0C]
	test eax, 80000000h
	jnz loc_42C66D
	cmp eax, ecx
	jl loc_42C66D
	cmp eax, edx
	jle loc_42C671
	or ebx, 4
	jmp loc_42C671

loc_42C66D:
	or ebx, 8
	nop

loc_42C671:
	mov eax, [esi]
	nop
	mov ecx, dword [dword_4F1E08]
	mov edx, dword [dword_4F1E18]
	test eax, 80000000h
	jnz loc_42C694
	cmp eax, ecx
	jl loc_42C694
	cmp eax, edx
	jle loc_42C69E
	or ebx, 2
	jmp loc_42C69E

loc_42C694:
	or ebx, 1
	jmp loc_42C69E

loc_42C699:
	mov ebx, 10h

loc_42C69E:
	mov [edi], bl
	mov edi, flt_4D4ED4
	mov esi, flt_4D4ED4
	add edi, 14h
	mov eax, [esi+0Ch]
	mov ecx, dword [dword_4F1E04]
	test eax, 80000000h
	jnz loc_42C715
	cmp eax, ecx
	jge loc_42C715
	mov eax, [esi+4]
	mov ebx, 0
	mov ecx, dword [dword_4F1E10]
	mov edx, dword [dword_4F1E0C]
	test eax, 80000000h
	jnz loc_42C6E9
	cmp eax, ecx
	jl loc_42C6E9
	cmp eax, edx
	jle loc_42C6ED
	or ebx, 4
	jmp loc_42C6ED

loc_42C6E9:
	or ebx, 8
	nop

loc_42C6ED:
	mov eax, [esi]
	nop
	mov ecx, dword [dword_4F1E08]
	mov edx, dword [dword_4F1E18]
	test eax, 80000000h
	jnz loc_42C710
	cmp eax, ecx
	jl loc_42C710
	cmp eax, edx
	jle loc_42C71A
	or ebx, 2
	jmp loc_42C71A

loc_42C710:
	or ebx, 1
	jmp loc_42C71A

loc_42C715:
	mov ebx, 10h

loc_42C71A:
	mov [edi], bl
	mov edi, flt_4D4EF4
	mov esi, flt_4D4EF4
	add edi, 14h
	mov eax, [esi+0Ch]
	mov ecx, dword [dword_4F1E04]
	test eax, 80000000h
	jnz loc_42C791
	cmp eax, ecx
	jge loc_42C791
	mov eax, [esi+4]
	mov ebx, 0
	mov ecx, dword [dword_4F1E10]
	mov edx, dword [dword_4F1E0C]
	test eax, 80000000h
	jnz loc_42C765
	cmp eax, ecx
	jl loc_42C765
	cmp eax, edx
	jle loc_42C769
	or ebx, 4
	jmp loc_42C769

loc_42C765:
	or ebx, 8
	nop

loc_42C769:
	mov eax, [esi]
	nop
	mov ecx, dword [dword_4F1E08]
	mov edx, dword [dword_4F1E18]
	test eax, 80000000h
	jnz loc_42C78C
	cmp eax, ecx
	jl loc_42C78C
	cmp eax, edx
	jle loc_42C796
	or ebx, 2
	jmp loc_42C796

loc_42C78C:
	or ebx, 1
	jmp loc_42C796

loc_42C791:
	mov ebx, 10h

loc_42C796:
	mov [edi], bl
	mov edi, flt_4D4F14
	mov esi, flt_4D4F14
	add edi, 14h
	mov eax, [esi+0Ch]
	mov ecx, dword [dword_4F1E04]
	test eax, 80000000h
	jnz loc_42C80D
	cmp eax, ecx
	jge loc_42C80D
	mov eax, [esi+4]
	mov ebx, 0
	mov ecx, dword [dword_4F1E10]
	mov edx, dword [dword_4F1E0C]
	test eax, 80000000h
	jnz loc_42C7E1
	cmp eax, ecx
	jl loc_42C7E1
	cmp eax, edx
	jle loc_42C7E5
	or ebx, 4
	jmp loc_42C7E5

loc_42C7E1:
	or ebx, 8
	nop

loc_42C7E5:
	mov eax, [esi]
	nop
	mov ecx, dword [dword_4F1E08]
	mov edx, dword [dword_4F1E18]
	test eax, 80000000h
	jnz loc_42C808
	cmp eax, ecx
	jl loc_42C808
	cmp eax, edx
	jle loc_42C812
	or ebx, 2
	jmp loc_42C812

loc_42C808:
	or ebx, 1
	jmp loc_42C812

loc_42C80D:
	mov ebx, 10h

loc_42C812:
	mov [edi], bl
	xor eax, eax
	mov al, [ebp+2Ch]
	mov esi, eax
	xor eax, eax
	mov al, [ebp+2Dh]
	shl esi, 18h
	shl eax, 10h
	or esi, eax
	xor eax, eax
	mov al, [ebp+2Eh]
	shl eax, 8
	or esi, eax
	xor eax, eax
	mov al, [ebp+2Fh]
	or esi, eax
	mov ebx, dword [dword_4D4EB0]
	mov dword [dword_4D4F24], esi
	mov dword [dword_4D4F04], esi
	mov eax, [ebp+28h]
	mov dword [dword_4D4EE4], esi
	mov dword [dword_4D4EC4], esi
	mov esi, [eax+14h]
	cmp esi, ebx
	jnz loc_42C87F

loc_42C861:
	mov ecx, [esp+4]
	mov ebx, [esp]
	mov edx, [esp+0Ch]
	mov eax, [esp+8]
	call sub_432580
	add esp, 14h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_42C87F:
	push esi
	push 1
	mov dword [dword_4D4EB0], esi
	call sub_497738
	jmp loc_42C861
;sub_42C4C0 endp

off_42C890: dd loc_42CC5C
	dd loc_42CCB6
	dd loc_42CCBD
	dd loc_42CCB6
off_42C8A0: dd loc_42CC86
	dd loc_42CCC7
	dd loc_42CCDD
	dd loc_42CCC7

sub_42C8B0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 14h
	mov ebp, eax
	fld dword [ebp+34h]
	mov edx, flt_4D4EB4
	mov ecx, flt_4D4ED4
	mov ebx, flt_4D4EF4
	mov esi, flt_4D4F14
	mov eax, dword [dword_4EC638]
	fstp dword [flt_4D4F20]
	mov edi, [ebp+8]
	fld dword [flt_4D4F20]
	mov [esp+8], edx
	mov [esp+0Ch], ecx
	mov [esp], ebx
	mov [esp+4], esi
	fstp dword [flt_4D4F00]
	add eax, edi
	fld dword [flt_4D4F00]
	mov [esp+10h], eax
	fstp dword [flt_4D4EE0]
	mov edx, [ebp+0Ch]
	mov ecx, [ebp+10h]
	mov ebx, [ebp+14h]
	mov esi, [ebp+18h]
	mov edi, [ebp+1Ch]
	fild dword [esp+10h]
	fld dword [flt_4D4EE0]
	mov eax, dword [dword_4EC63C]
	fxch st1
	fstp dword [flt_4D4EB4]
	add eax, edx
	fstp dword [flt_4D4EC0]
	mov [esp+10h], eax
	mov edx, [ebp+20h]
	mov eax, dword [dword_4EC638]
	fild dword [esp+10h]
	add eax, ecx
	fstp dword [flt_4D4EB8]
	mov [esp+10h], eax
	mov ecx, [ebp+24h]
	mov eax, dword [dword_4EC63C]
	fild dword [esp+10h]
	add eax, ebx
	fstp dword [flt_4D4ED4]
	mov [esp+10h], eax
	mov eax, dword [dword_4EC638]
	fild dword [esp+10h]
	add eax, esi
	fstp dword [flt_4D4ED8]
	mov [esp+10h], eax
	mov eax, dword [dword_4EC63C]
	fild dword [esp+10h]
	add eax, edi
	fstp dword [flt_4D4EF4]
	mov [esp+10h], eax
	mov eax, dword [dword_4EC638]
	mov edi, dword_4D4ECC
	add eax, edx
	fild dword [esp+10h]
	mov [esp+10h], eax
	mov eax, dword [dword_4EC63C]
	fstp dword [flt_4D4EF8]
	add eax, ecx
	fild dword [esp+10h]
	mov [esp+10h], eax
	mov eax, [ebp+28h]
	fstp dword [flt_4D4F14]
	mov esi, [eax+4]
	fild dword [esp+10h]
	lea esi, dword dword_4D4E90[esi*8]
	fstp dword [flt_4D4F18]
	movsd
	movsd
	mov esi, [eax+8]
	mov edi, dword_4D4EEC
	lea esi, dword dword_4D4E90[esi*8]
	movsd
	movsd
	mov esi, [eax+0Ch]
	mov edi, dword_4D4F0C
	lea esi, dword dword_4D4E90[esi*8]
	movsd
	movsd
	mov esi, [eax+10h]
	mov edi, dword_4D4F2C
	lea esi, dword dword_4D4E90[esi*8]
	movsd
	movsd
	mov edi, flt_4D4EB4
	mov esi, flt_4D4EB4
	add edi, 14h
	mov eax, [esi+0Ch]
	mov ecx, dword [dword_4F1E04]
	test eax, 80000000h
	jnz loc_42CA89
	cmp eax, ecx
	jge loc_42CA89
	mov eax, [esi+4]
	mov ebx, 0
	mov ecx, dword [dword_4F1E10]
	mov edx, dword [dword_4F1E0C]
	test eax, 80000000h
	jnz loc_42CA5D
	cmp eax, ecx
	jl loc_42CA5D
	cmp eax, edx
	jle loc_42CA61
	or ebx, 4
	jmp loc_42CA61

loc_42CA5D:
	or ebx, 8
	nop

loc_42CA61:
	mov eax, [esi]
	nop
	mov ecx, dword [dword_4F1E08]
	mov edx, dword [dword_4F1E18]
	test eax, 80000000h
	jnz loc_42CA84
	cmp eax, ecx
	jl loc_42CA84
	cmp eax, edx
	jle loc_42CA8E
	or ebx, 2
	jmp loc_42CA8E

loc_42CA84:
	or ebx, 1
	jmp loc_42CA8E

loc_42CA89:
	mov ebx, 10h

loc_42CA8E:
	mov [edi], bl
	mov edi, flt_4D4ED4
	mov esi, flt_4D4ED4
	add edi, 14h
	mov eax, [esi+0Ch]
	mov ecx, dword [dword_4F1E04]
	test eax, 80000000h
	jnz loc_42CB05
	cmp eax, ecx
	jge loc_42CB05
	mov eax, [esi+4]
	mov ebx, 0
	mov ecx, dword [dword_4F1E10]
	mov edx, dword [dword_4F1E0C]
	test eax, 80000000h
	jnz loc_42CAD9
	cmp eax, ecx
	jl loc_42CAD9
	cmp eax, edx
	jle loc_42CADD
	or ebx, 4
	jmp loc_42CADD

loc_42CAD9:
	or ebx, 8
	nop

loc_42CADD:
	mov eax, [esi]
	nop
	mov ecx, dword [dword_4F1E08]
	mov edx, dword [dword_4F1E18]
	test eax, 80000000h
	jnz loc_42CB00
	cmp eax, ecx
	jl loc_42CB00
	cmp eax, edx
	jle loc_42CB0A
	or ebx, 2
	jmp loc_42CB0A

loc_42CB00:
	or ebx, 1
	jmp loc_42CB0A

loc_42CB05:
	mov ebx, 10h

loc_42CB0A:
	mov [edi], bl
	mov edi, flt_4D4EF4
	mov esi, flt_4D4EF4
	add edi, 14h
	mov eax, [esi+0Ch]
	mov ecx, dword [dword_4F1E04]
	test eax, 80000000h
	jnz loc_42CB81
	cmp eax, ecx
	jge loc_42CB81
	mov eax, [esi+4]
	mov ebx, 0
	mov ecx, dword [dword_4F1E10]
	mov edx, dword [dword_4F1E0C]
	test eax, 80000000h
	jnz loc_42CB55
	cmp eax, ecx
	jl loc_42CB55
	cmp eax, edx
	jle loc_42CB59
	or ebx, 4
	jmp loc_42CB59

loc_42CB55:
	or ebx, 8
	nop

loc_42CB59:
	mov eax, [esi]
	nop
	mov ecx, dword [dword_4F1E08]
	mov edx, dword [dword_4F1E18]
	test eax, 80000000h
	jnz loc_42CB7C
	cmp eax, ecx
	jl loc_42CB7C
	cmp eax, edx
	jle loc_42CB86
	or ebx, 2
	jmp loc_42CB86

loc_42CB7C:
	or ebx, 1
	jmp loc_42CB86

loc_42CB81:
	mov ebx, 10h

loc_42CB86:
	mov [edi], bl
	mov edi, flt_4D4F14
	mov esi, flt_4D4F14
	add edi, 14h
	mov eax, [esi+0Ch]
	mov ecx, dword [dword_4F1E04]
	test eax, 80000000h
	jnz loc_42CBFD
	cmp eax, ecx
	jge loc_42CBFD
	mov eax, [esi+4]
	mov ebx, 0
	mov ecx, dword [dword_4F1E10]
	mov edx, dword [dword_4F1E0C]
	test eax, 80000000h
	jnz loc_42CBD1
	cmp eax, ecx
	jl loc_42CBD1
	cmp eax, edx
	jle loc_42CBD5
	or ebx, 4
	jmp loc_42CBD5

loc_42CBD1:
	or ebx, 8
	nop

loc_42CBD5:
	mov eax, [esi]
	nop
	mov ecx, dword [dword_4F1E08]
	mov edx, dword [dword_4F1E18]
	test eax, 80000000h
	jnz loc_42CBF8
	cmp eax, ecx
	jl loc_42CBF8
	cmp eax, edx
	jle loc_42CC02
	or ebx, 2
	jmp loc_42CC02

loc_42CBF8:
	or ebx, 1
	jmp loc_42CC02

loc_42CBFD:
	mov ebx, 10h

loc_42CC02:
	mov [edi], bl
	xor eax, eax
	mov al, [ebp+2Ch]
	mov esi, eax
	xor eax, eax
	mov al, [ebp+2Dh]
	shl esi, 18h
	shl eax, 10h
	or esi, eax
	xor eax, eax
	mov al, [ebp+2Eh]
	shl eax, 8
	or esi, eax
	xor eax, eax
	mov al, [ebp+2Fh]
	or esi, eax
	mov ebx, dword [dword_4D4EB0]
	mov dword [dword_4D4F24], esi
	mov dword [dword_4D4F04], esi
	mov eax, [ebp+28h]
	mov dword [dword_4D4EE4], esi
	mov dword [dword_4D4EC4], esi
	mov esi, [eax+14h]
	cmp esi, ebx
	jnz loc_42CC9C
	mov eax, 4
	jmp off_42C890[eax]

loc_42CC5C:
	push 0
	push 0
	push 5

loc_42CC62:
	push 1

loc_42CC64:
	call grAlphaBlendFunction
	mov ecx, [esp+4]
	mov ebx, [esp]
	mov edx, [esp+0Ch]
	mov eax, [esp+8]
	call sub_432580
	xor eax, eax
	jmp off_42C8A0[eax]

loc_42CC86:
	push eax
	push eax
	push 5
	push 1
	call grAlphaBlendFunction
	add esp, 14h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_42CC9C:
	push esi
	push 1
	mov dword [dword_4D4EB0], esi
	call sub_497738
	mov eax, 4
	jmp off_42C890[eax]

loc_42CCB6:
	push 0
	push 0
	push eax
	jmp loc_42CC62

loc_42CCBD:
	push 0
	push 0
	push 5
	push 0
	jmp loc_42CC64

loc_42CCC7:
	push eax
	push eax
	push 4
	push 1
	call grAlphaBlendFunction
	add esp, 14h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_42CCDD:
	push eax
	push eax
	push 5
	push eax
	call grAlphaBlendFunction
	add esp, 14h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_42C8B0 endp

off_42CD40: dd loc_42CD90
	dd loc_42CDB4 ; jump table for switch statement
	dd loc_42CDD8
	dd loc_42CDB4
	dd loc_42CDFC
	dd loc_42CE44
	dd loc_42CE20
	dd loc_42CE68
	dd loc_42CE8C

sub_42CD64: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	mov ebx, eax
	mov edx, 0FFFFFFFFh
	push 2
	xor ecx, ecx
	mov dword [dword_4D5258], edx
	mov dword [dword_4D525C], ecx
	call grFogMode
	cmp ebx, 8 ; switch 9 cases
	ja loc_42CDB4 ; jumptable 0042CD89 default case
	jmp off_42CD40[ebx*4] ; switch jump

loc_42CD90:
	mov eax, 0FF000204h ; jumptable 0042CD89 case 0
	call sub_42CF10
	push 3CE56042h
	push 3C03126Fh
	call sub_42CF30
	xor eax, eax
	call sub_42CEB0
	pop edx
	pop ecx
	pop ebx
	ret

loc_42CDB4:
	mov eax, 0FF848284h ; jumptable 0042CD89 default case
	call sub_42CF10
	push 3CBC6A7Fh
	push 3B449BA6h
	call sub_42CF30
	xor eax, eax
	call sub_42CEB0
	pop edx
	pop ecx
	pop ebx
	ret

loc_42CDD8:
	mov eax, 0FFCC6134h ; jumptable 0042CD89 case 2
	call sub_42CF10
	push 3CB43958h
	push 3B03126Fh
	call sub_42CF30
	xor eax, eax
	call sub_42CEB0
	pop edx
	pop ecx
	pop ebx
	ret

loc_42CDFC:
	mov eax, 0FF848284h ; jumptable 0042CD89 case 4
	call sub_42CF10
	push 3CB43958h
	push 3B03126Fh
	call sub_42CF30
	xor eax, eax
	call sub_42CEB0
	pop edx
	pop ecx
	pop ebx
	ret

loc_42CE20:
	mov eax, 0FFBDBD86h ; jumptable 0042CD89 case 6
	call sub_42CF10
	push 3CB43958h
	push 3B03126Fh
	call sub_42CF30
	xor eax, eax
	call sub_42CEB0
	pop edx
	pop ecx
	pop ebx
	ret

loc_42CE44:
	mov eax, 0FF7D8084h ; jumptable 0042CD89 case 5
	call sub_42CF10
	push 3CBC6A7Fh
	push 3B449BA6h
	call sub_42CF30
	xor eax, eax
	call sub_42CEB0
	pop edx
	pop ecx
	pop ebx
	ret

loc_42CE68:
	mov eax, 0FF848284h ; jumptable 0042CD89 case 7
	call sub_42CF10
	push 3CCCCCCDh
	push 3BA3D70Ah
	call sub_42CF30
	xor eax, eax
	call sub_42CEB0
	pop edx
	pop ecx
	pop ebx
	ret

loc_42CE8C:
	mov eax, 0FF000204h ; jumptable 0042CD89 case 8
	call sub_42CF10
	push 3CBC6A7Fh
	push 3B449BA6h
	call sub_42CF30
	xor eax, eax
	call sub_42CEB0
	pop edx
	pop ecx
	pop ebx
	ret
;sub_42CD64 endp

sub_42CEB0: ;SUBROUTINE
	cmp eax, dword [dword_4D5258]
	jz locret_42CEDA
	mov dword [dword_4D5258], eax
	cmp eax, 14h
	jl loc_42CEDB
	mov eax, 13h

loc_42CEC7:
	push edx
	push ecx
	shl eax, 6
	add eax, dword_4EC670
	push eax
	call grFogTable
	pop ecx
	pop edx

locret_42CEDA:
	ret

loc_42CEDB:
	test eax, eax
	jge loc_42CEC7
	xor eax, eax
	push edx
	push ecx
	shl eax, 6
	add eax, dword_4EC670
	push eax
	call grFogTable
	pop ecx
	pop edx
	ret
;sub_42CEB0 endp

sub_42CF00: ;SUBROUTINE
	call sub_42CF10
	mov eax, edx
	jmp sub_42CEB0
;sub_42CF00 endp

sub_42CF10: ;SUBROUTINE
	cmp eax, dword [dword_4D525C]
	jnz loc_42CF19
	ret

loc_42CF19:
	push edx
	push ecx
	push eax
	mov dword [dword_4D525C], eax
	call grFogColorValue
	pop ecx
	pop edx
	ret
;sub_42CF10 endp

sub_42CF30: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	sub esp, 8
	mov ebx, [esp+1Ch]
	fld dword [esp+20h]
	mov [esp+4], ebx
	fsub dword [esp+1Ch]
	mov ebx, dword_4EC670
	fmul dword [flt_4CA018]
	lea esi, [ebx+500h]
	fstp dword [esp]

loc_42CF5B:
	push dword [esp+4]
	push ebx
	call guFogGenerateExp
	fld dword [esp]
	fadd dword [esp+4]
	add ebx, 40h
	fstp dword [esp+4]
	cmp ebx, esi
	jnz loc_42CF5B
	add esp, 8
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret 8
;sub_42CF30 endp

sub_42CF90: ;SUBROUTINE
	mov eax, dword [dword_4D525C]
	ret
;sub_42CF90 endp

dword_42CFA0: dd 0

sub_42CFB0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 80h
	cmp dword [dword_4EF3E8], 0
	jz loc_42D6B9
	cmp dword [dword_51221C], 7
	jnz loc_42D6C6
	mov edx, 1

loc_42CFDB:
	push dword_4EF438
	mov ecx, dword_4ECB70
	mov ebx, dword_4EEBFC
	mov esi, 1D40h
	mov [esp+70h], edx
	mov edx, 0A9h
	mov edi, 0Ch
	call sub_42D730
	mov [esp+5Ch], esi
	mov [esp+54h], edi
	xor ebx, ebx
	mov eax, 30h
	mov [esp+64h], ebx
	mov [esp+60h], ebx
	mov [esp+58h], eax

loc_42D01D:
	imul ebp, [esp+64h], 30h
	mov eax, [esp+54h]
	add eax, 9Ch
	mov [esp+74h], eax
	mov eax, [esp+60h]
	mov [esp+70h], eax
	mov eax, [esp+58h]
	add eax, 270h
	mov [esp+78h], eax
	mov eax, [esp+5Ch]
	mov [esp+68h], eax

loc_42D04C:
	mov esi, [esp+70h]
	mov edi, esp
	lea esi, dword dword_4EF438[esi]
	movsd
	movsd
	movsd
	mov esi, [esp+70h]
	lea edi, [esp+0Ch]
	lea esi, dword dword_4EF4D4[esi]
	movsd
	movsd
	movsd
	mov esi, [esp+74h]
	lea edi, [esp+18h]
	lea esi, dword dword_4EF438[esi]
	movsd
	movsd
	movsd
	mov esi, [esp+74h]
	lea edi, [esp+24h]
	lea esi, dword dword_4EF39C[esi]
	movsd
	movsd
	movsd
	cmp dword [esp+8], 0
	jl loc_42D6CD

loc_42D099:
	cmp dword [esp+14h], 0
	jle loc_42D6F3

loc_42D0A4:
	mov edx, 0E4h
	lea eax, [esp+30h]
	call sub_46FD30
	test eax, eax
	jz loc_42D640
	mov edi, [esp+30h]
	mov ecx, 0Ch
	lea esi, dword dword_4ECB70[ebp]
	lea edi, [edi+24h]
	rep movsd
	mov edi, [esp+30h]
	mov ecx, 0Ch
	lea esi, dword dword_4ECDE0[ebp]
	lea edi, [edi+54h]
	rep movsd
	mov edi, [esp+30h]
	mov esi, [esp+78h]
	mov ecx, 0Ch
	lea edi, [edi+84h]
	lea esi, dword dword_4ECB70[esi]
	rep movsd
	mov edi, [esp+30h]
	mov esi, [esp+78h]
	mov ecx, 0Ch
	lea edi, [edi+0B4h]
	lea esi, dword dword_4EC900[esi]
	rep movsd
	mov esi, [esp+30h]
	mov edi, [esp+8]
	add esi, 34h
	test edi, edi
	jnz loc_42D12F
	mov dword [esp+8], 1

loc_42D12F:
	mov eax, [esp+8]
	mov [esp+7Ch], eax
	lea edx, [esp+38h]
	fild dword [esp+7Ch]
	lea eax, [esp+34h]
	fstp dword [esp+34h]
	mov ebx, [eax]
	mov ecx, ebx
	shr ebx, 0Fh
	and ecx, 0FF800000h
	and ebx, 0FFh
	fld dword [eax]
	mov ebx, dword dword_4F19E4[ebx*4]
	sub ebx, ecx
	mov dword [dword_4F1E14], ebx
	fmul dword [dword_4F1E14]
	fsubr dword [flt_4D52AC]
	fmul dword [dword_4F1E14]
	fld st0
	fmul dword [eax]
	fsubr dword [flt_4D52AC]
	fmulp st1, st0
	fstp dword [edx]
	lea ecx, [esp+38h]
	mov eax, esp
	mov ebx, esi
	lea edi, [esi+14h]
	fld dword [dword_4D5294]
	fmul dword [ecx]
	fld dword [flt_4D5298]
	fmul dword [ecx]
	fld dword [flt_4D52B0]
	fmul dword [ecx]
	fild dword [eax+4]
	fild dword [eax]
	fxch st1
	fmulp st3, st0
	fmulp st3, st0
	fld dword [flt_4D52A0]
	faddp st2, st0
	fld dword [flt_4D529C]
	faddp st3, st0
	fstp dword [ebx+0Ch]
	fstp dword [ebx+4]
	fstp dword [ebx]
	mov eax, [esi+0Ch]
	mov ecx, dword [dword_4F1E04]
	test eax, 80000000h
	jnz loc_42D239
	cmp eax, ecx
	jge loc_42D239
	mov eax, [esi+4]
	mov ebx, 0
	mov ecx, dword [dword_4F1E10]
	mov edx, dword [dword_4F1E0C]
	test eax, 80000000h
	jnz loc_42D20D
	cmp eax, ecx
	jl loc_42D20D
	cmp eax, edx
	jle loc_42D211
	or ebx, 4
	jmp loc_42D211

loc_42D20D:
	or ebx, 8
	nop

loc_42D211:
	mov eax, [esi]
	nop
	mov ecx, dword [dword_4F1E08]
	mov edx, dword [dword_4F1E18]
	test eax, 80000000h
	jnz loc_42D234
	cmp eax, ecx
	jl loc_42D234
	cmp eax, edx
	jle loc_42D23E
	or ebx, 2
	jmp loc_42D23E

loc_42D234:
	or ebx, 1
	jmp loc_42D23E

loc_42D239:
	mov ebx, 10h

loc_42D23E:
	mov [edi], bl
	mov esi, [esp+30h]
	mov edx, [esp+14h]
	add esi, 64h
	test edx, edx
	jnz loc_42D257
	mov dword [esp+14h], 1

loc_42D257:
	mov eax, [esp+14h]
	mov [esp+7Ch], eax
	lea edx, [esp+40h]
	fild dword [esp+7Ch]
	lea eax, [esp+3Ch]
	fstp dword [esp+3Ch]
	mov ebx, [eax]
	mov ecx, ebx
	shr ebx, 0Fh
	and ecx, 0FF800000h
	and ebx, 0FFh
	fld dword [eax]
	mov ebx, dword dword_4F19E4[ebx*4]
	sub ebx, ecx
	mov dword [dword_4F1E14], ebx
	fmul dword [dword_4F1E14]
	fsubr dword [flt_4D52AC]
	fmul dword [dword_4F1E14]
	fld st0
	fmul dword [eax]
	fsubr dword [flt_4D52AC]
	fmulp st1, st0
	fstp dword [edx]
	lea ecx, [esp+40h]
	lea eax, [esp+0Ch]
	mov ebx, esi
	lea edi, [esi+14h]
	fld dword [dword_4D5294]
	fmul dword [ecx]
	fld dword [flt_4D5298]
	fmul dword [ecx]
	fld dword [flt_4D52B0]
	fmul dword [ecx]
	fild dword [eax+4]
	fild dword [eax]
	fxch st1
	fmulp st3, st0
	fmulp st3, st0
	fld dword [flt_4D52A0]
	faddp st2, st0
	fld dword [flt_4D529C]
	faddp st3, st0
	fstp dword [ebx+0Ch]
	fstp dword [ebx+4]
	fstp dword [ebx]
	mov eax, [esi+0Ch]
	mov ecx, dword [dword_4F1E04]
	test eax, 80000000h
	jnz loc_42D363
	cmp eax, ecx
	jge loc_42D363
	mov eax, [esi+4]
	mov ebx, 0
	mov ecx, dword [dword_4F1E10]
	mov edx, dword [dword_4F1E0C]
	test eax, 80000000h
	jnz loc_42D337
	cmp eax, ecx
	jl loc_42D337
	cmp eax, edx
	jle loc_42D33B
	or ebx, 4
	jmp loc_42D33B

loc_42D337:
	or ebx, 8
	nop

loc_42D33B:
	mov eax, [esi]
	nop
	mov ecx, dword [dword_4F1E08]
	mov edx, dword [dword_4F1E18]
	test eax, 80000000h
	jnz loc_42D35E
	cmp eax, ecx
	jl loc_42D35E
	cmp eax, edx
	jle loc_42D368
	or ebx, 2
	jmp loc_42D368

loc_42D35E:
	or ebx, 1
	jmp loc_42D368

loc_42D363:
	mov ebx, 10h

loc_42D368:
	mov [edi], bl
	mov esi, [esp+30h]
	mov ebx, [esp+20h]
	add esi, 94h
	test ebx, ebx
	jnz loc_42D384
	mov dword [esp+20h], 1

loc_42D384:
	mov eax, [esp+20h]
	mov [esp+7Ch], eax
	lea edx, [esp+48h]
	fild dword [esp+7Ch]
	lea eax, [esp+44h]
	fstp dword [esp+44h]
	mov ebx, [eax]
	mov ecx, ebx
	shr ebx, 0Fh
	and ecx, 0FF800000h
	and ebx, 0FFh
	fld dword [eax]
	mov ebx, dword dword_4F19E4[ebx*4]
	sub ebx, ecx
	mov dword [dword_4F1E14], ebx
	fmul dword [dword_4F1E14]
	fsubr dword [flt_4D52AC]
	fmul dword [dword_4F1E14]
	fld st0
	fmul dword [eax]
	fsubr dword [flt_4D52AC]
	fmulp st1, st0
	fstp dword [edx]
	lea ecx, [esp+48h]
	lea eax, [esp+18h]
	mov ebx, esi
	lea edi, [esi+14h]
	fld dword [dword_4D5294]
	fmul dword [ecx]
	fld dword [flt_4D5298]
	fmul dword [ecx]
	fld dword [flt_4D52B0]
	fmul dword [ecx]
	fild dword [eax+4]
	fild dword [eax]
	fxch st1
	fmulp st3, st0
	fmulp st3, st0
	fld dword [flt_4D52A0]
	faddp st2, st0
	fld dword [flt_4D529C]
	faddp st3, st0
	fstp dword [ebx+0Ch]
	fstp dword [ebx+4]
	fstp dword [ebx]
	mov eax, [esi+0Ch]
	mov ecx, dword [dword_4F1E04]
	test eax, 80000000h
	jnz loc_42D490
	cmp eax, ecx
	jge loc_42D490
	mov eax, [esi+4]
	mov ebx, 0
	mov ecx, dword [dword_4F1E10]
	mov edx, dword [dword_4F1E0C]
	test eax, 80000000h
	jnz loc_42D464
	cmp eax, ecx
	jl loc_42D464
	cmp eax, edx
	jle loc_42D468
	or ebx, 4
	jmp loc_42D468

loc_42D464:
	or ebx, 8
	nop

loc_42D468:
	mov eax, [esi]
	nop
	mov ecx, dword [dword_4F1E08]
	mov edx, dword [dword_4F1E18]
	test eax, 80000000h
	jnz loc_42D48B
	cmp eax, ecx
	jl loc_42D48B
	cmp eax, edx
	jle loc_42D495
	or ebx, 2
	jmp loc_42D495

loc_42D48B:
	or ebx, 1
	jmp loc_42D495

loc_42D490:
	mov ebx, 10h

loc_42D495:
	mov [edi], bl
	mov esi, [esp+30h]
	mov eax, [esp+2Ch]
	add esi, 0C4h
	test eax, eax
	jnz loc_42D4B1
	mov dword [esp+2Ch], 1

loc_42D4B1:
	mov eax, [esp+2Ch]
	mov [esp+7Ch], eax
	lea edx, [esp+50h]
	fild dword [esp+7Ch]
	lea eax, [esp+4Ch]
	fstp dword [esp+4Ch]
	mov ebx, [eax]
	mov ecx, ebx
	shr ebx, 0Fh
	and ecx, 0FF800000h
	and ebx, 0FFh
	fld dword [eax]
	mov ebx, dword dword_4F19E4[ebx*4]
	sub ebx, ecx
	mov dword [dword_4F1E14], ebx
	fmul dword [dword_4F1E14]
	fsubr dword [flt_4D52AC]
	fmul dword [dword_4F1E14]
	fld st0
	fmul dword [eax]
	fsubr dword [flt_4D52AC]
	fmulp st1, st0
	fstp dword [edx]
	lea ecx, [esp+50h]
	lea eax, [esp+24h]
	mov ebx, esi
	lea edi, [esi+14h]
	fld dword [dword_4D5294]
	fmul dword [ecx]
	fld dword [flt_4D5298]
	fmul dword [ecx]
	fld dword [flt_4D52B0]
	fmul dword [ecx]
	fild dword [eax+4]
	fild dword [eax]
	fxch st1
	fmulp st3, st0
	fmulp st3, st0
	fld dword [flt_4D52A0]
	faddp st2, st0
	fld dword [flt_4D529C]
	faddp st3, st0
	fstp dword [ebx+0Ch]
	fstp dword [ebx+4]
	fstp dword [ebx]
	mov eax, [esi+0Ch]
	mov ecx, dword [dword_4F1E04]
	test eax, 80000000h
	jnz loc_42D5BD
	cmp eax, ecx
	jge loc_42D5BD
	mov eax, [esi+4]
	mov ebx, 0
	mov ecx, dword [dword_4F1E10]
	mov edx, dword [dword_4F1E0C]
	test eax, 80000000h
	jnz loc_42D591
	cmp eax, ecx
	jl loc_42D591
	cmp eax, edx
	jle loc_42D595
	or ebx, 4
	jmp loc_42D595

loc_42D591:
	or ebx, 8
	nop

loc_42D595:
	mov eax, [esi]
	nop
	mov ecx, dword [dword_4F1E08]
	mov edx, dword [dword_4F1E18]
	test eax, 80000000h
	jnz loc_42D5B8
	cmp eax, ecx
	jl loc_42D5B8
	cmp eax, edx
	jle loc_42D5C2
	or ebx, 2
	jmp loc_42D5C2

loc_42D5B8:
	or ebx, 1
	jmp loc_42D5C2

loc_42D5BD:
	mov ebx, 10h

loc_42D5C2:
	mov [edi], bl
	cmp dword [esp+6Ch], 0
	jz loc_42D719
	mov eax, 0Ah

loc_42D5D4:
	mov edx, [esp+30h]
	mov [edx+4], eax
	mov eax, [esp+30h]
	mov ebx, [esp+6Ch]
	mov dword [eax+1Ch], dword_4EFC24
	test ebx, ebx
	jz loc_42D723
	mov eax, 7FFFFFFFh

loc_42D5F7:
	mov edx, [esp+30h]
	mov [edx+20h], eax
	mov eax, [esp+30h]
	mov word [eax+0Ah], 2
	mov eax, [esp+30h]
	mov word [eax+8], 2
	mov eax, [esp+30h]
	lea edx, [eax+24h]
	mov [eax+0Ch], edx
	mov eax, [esp+30h]
	lea edx, [eax+54h]
	mov [eax+10h], edx
	mov eax, [esp+30h]
	lea edx, [eax+84h]
	mov [eax+14h], edx
	mov eax, [esp+30h]
	lea edx, [eax+0B4h]
	mov [eax+18h], edx

loc_42D640:
	mov edi, [esp+70h]
	mov eax, [esp+78h]
	mov esi, [esp+74h]
	mov edx, [esp+68h]
	add ebp, 270h
	add edi, 9Ch
	add eax, 270h
	add esi, 9Ch
	mov [esp+70h], edi
	mov [esp+78h], eax
	mov [esp+74h], esi
	cmp ebp, edx
	jnz loc_42D04C
	mov ebx, [esp+54h]
	mov esi, [esp+60h]
	mov edi, [esp+58h]
	mov ebp, [esp+64h]
	mov ecx, [esp+5Ch]
	add ebx, 0Ch
	add esi, 0Ch
	add edi, 30h
	inc ebp
	add ecx, 30h
	mov [esp+54h], ebx
	mov [esp+60h], esi
	mov [esp+58h], edi
	mov [esp+64h], ebp
	mov [esp+5Ch], ecx
	cmp ebp, 0Ch
	jl loc_42D01D

loc_42D6B9:
	add esp, 80h
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_42D6C6:
	xor edx, edx
	jmp loc_42CFDB

loc_42D6CD:
	cmp dword [esp+14h], 0
	jge loc_42D099
	cmp dword [esp+20h], 0
	jge loc_42D099
	cmp dword [esp+2Ch], 0
	jl loc_42D640
	jmp loc_42D099

loc_42D6F3:
	cmp dword [esp+8], 0
	jg loc_42D0A4
	cmp dword [esp+2Ch], 0
	jg loc_42D0A4
	cmp dword [esp+20h], 0
	jg loc_42D0A4
	jmp loc_42D640

loc_42D719:
	mov eax, 0Bh
	jmp loc_42D5D4

loc_42D723:
	mov eax, 0FFFFFFFFh
	jmp loc_42D5F7
;sub_42CFB0 endp

sub_42D730: ;SUBROUTINE
	push esi
	push edi
	push ebp
	mov ebp, esp
	sub esp, 40h
	and esp, 0FFFFFFF8h
	mov edi, [ebp+10h]
	mov [esp+30h], eax
	mov [esp+34h], edx
	mov [esp+38h], ebx
	mov esi, ecx
	mov edx, [esp+30h]
	xor eax, eax
	fld qword [dbl_4CA22C]

loc_42D758:
	fild dword [edx+44h]
	fmul st0, st1
	inc eax
	add edx, 4
	fstp dword [esp+eax*4-4]
	cmp eax, 9
	jl loc_42D758
	fstp st0
	xor edx, edx
	mov ecx, [esp+34h]
	mov [esp+3Ch], edx
	test ecx, ecx
	jle loc_42D804

loc_42D77E:
	lea ecx, [esp+24h]
	mov ebx, esp
	mov edx, [esp+38h]
	mov eax, 1
	call sub_49C46C
	fld dword [esp+24h]
	fmul qword [dbl_4CA234]
	call __CHP
	fistp dword [esi]
	mov eax, [esi]
	mov [edi], eax
	fld dword [esp+28h]
	fmul qword [dbl_4CA234]
	call __CHP
	fistp dword [esi+4]
	mov eax, [esi+4]
	mov [edi+4], eax
	fld dword [esp+2Ch]
	fmul qword [dbl_4CA234]
	add esi, 30h
	add edi, 0Ch
	mov ebx, [esp+38h]
	mov edx, [esp+34h]
	call __CHP
	fistp dword [esi-28h]
	mov eax, [esi-28h]
	add ebx, 0Ch
	mov [edi-4], eax
	mov eax, [esp+3Ch]
	mov [esp+38h], ebx
	inc eax
	mov word [esi-24h], 0
	mov [esp+3Ch], eax
	cmp eax, edx
	jl loc_42D77E
	nop

loc_42D804:
	mov esp, ebp
	pop ebp
	pop edi
	pop esi
	ret 4
;sub_42D730 endp

sub_42D810: ;SUBROUTINE
	mov eax, dword [dword_540F48]
	mov dword [dword_4D5270], eax
	ret
;sub_42D810 endp

sub_42D820: ;SUBROUTINE
	push ebx
	push edx
	sub esp, 18h
	test byte [byte_512219], 2
	jz loc_42D84C
	mov edx, dword [dword_51221C]
	test edx, edx
	jz loc_42D84C
	cmp edx, 8
	jz loc_42D84C
	mov ebx, dword [dword_4D5270]
	mov eax, dword [dword_540F48]
	cmp eax, ebx
	jnz loc_42D852

loc_42D84C:
	add esp, 18h
	pop edx
	pop ebx
	ret

loc_42D852:
	push ecx
	mov dword [dword_4D5270], eax
	xor eax, eax
	mov al, byte [byte_4EF3F2]
	mov [esp+10h], eax
	xor eax, eax
	mov al, byte [byte_4EF3F1]
	mov [esp+14h], eax
	xor eax, eax
	mov al, byte [byte_4EF3F0]
	mov [esp+18h], eax
	lea eax, [esp+0Ch]
	lea ecx, [esp+4]
	push eax
	lea eax, [esp+0Ch]
	mov edx, [esp+18h]
	push eax
	mov ebx, [esp+20h]
	mov eax, [esp+18h]
	call sub_458200
	lea eax, [esp+18h]
	push eax
	lea eax, [esp+18h]
	push eax
	mov al, [esp+0Ch]
	add al, 4
	lea ecx, [esp+18h]
	mov ebx, [esp+14h]
	mov edx, [esp+10h]
	and eax, 0FFh
	call sub_457FA8
	mov al, [esp+10h]
	mov byte [byte_4EF3F2], al
	mov byte [byte_4EF3EE], al
	mov al, [esp+14h]
	mov byte [byte_4EF3F1], al
	mov byte [byte_4EF3ED], al
	mov al, [esp+18h]
	mov byte [byte_4EF3F0], al
	mov byte [byte_4EF3EC], al
	xor eax, eax
	mov al, [esp+10h]
	mov ecx, eax
	xor eax, eax
	shl ecx, 10h
	mov al, [esp+14h]
	or ecx, 0FF000000h
	shl eax, 8
	or ecx, eax
	xor eax, eax
	mov al, [esp+18h]
	or eax, ecx
	push eax
	push 4
	call sub_497738
	pop ecx
	add esp, 18h
	pop edx
	pop ebx
	ret
;sub_42D820 endp

sub_42D920: ;SUBROUTINE
	mov eax, dword [dword_540F48]
	mov dword [dword_4D5270], eax
	ret
;sub_42D920 endp

sub_42D930: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	mov ebp, esp
	sub esp, 0Ch
	and esp, 0FFFFFFF8h
	mov edx, 0FC180000h
	xor edi, edi
	mov [esp], edx

loc_42D948:
	mov ecx, 0FC180000h
	mov esi, [esp]
	mov edx, edi
	mov ebx, edi
	add edx, dword_4EEBFC

loc_42D95A:
	mov [esp+4], ecx
	mov [esp+8], esi
	fild dword [esp+4]
	fmul qword [dbl_4CA224]
	fild dword [esp+8]
	fmul qword [dbl_4CA224]
	mov eax, edx
	add ebx, 9Ch
	add edx, 9Ch
	add ecx, 960000h
	fxch st1
	fstp dword flt_4EEB60[ebx]
	fstp dword flt_4EEB68[ebx]
	call sub_42D9D0
	cmp ecx, 3B60000h
	jnz loc_42D95A
	add word [esp+2], 96h
	mov ecx, [esp]
	add edi, 0Ch
	cmp ecx, 3B60000h
	jnz loc_42D948
	mov esp, ebp
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_42D930 endp

sub_42D9D0: ;SUBROUTINE
	push ecx
	push edx
	sub esp, 0Ch
	mov edx, eax
	mov eax, [eax]
	xor ecx, ecx
	mov [esp], eax
	mov [esp+4], ecx
	mov eax, [edx+8]
	mov [esp+8], eax
	mov eax, esp
	call sub_49C264
	fmul qword [dbl_4CA214]
	fmul qword [dbl_4CA21C]
	sub esp, 4
	fstp dword [esp]
	call sub_49C2C4
	fmul dword [flt_4D5264]
	fadd dword [flt_4D5260]
	fstp dword [edx+4]
	add esp, 0Ch
	pop edx
	pop ecx
	ret
;sub_42D9D0 endp

sub_42DA20: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	sub esp, 120h
	xor ah, ah
	mov dl, 1
	mov byte [byte_4EFC40], ah
	mov byte [byte_4EFC42], dl
	mov byte [byte_4EFC44], dl
	mov byte [byte_4EFC43], dl
	mov byte [byte_4EFC45], dl
	mov byte [byte_4EFC48], ah
	mov eax, dword [dword_51221C]
	mov byte [byte_4EFC46], dl
	mov byte [byte_4EFC47], dl
	mov al, byte byte_4EFC40[eax]
	mov edx, dword [dword_513480]
	push edx
	and eax, 0FFh
	push aSsky_fsh ; "%ssky.fsh"
	mov dword [dword_4EF3E8], eax
	lea eax, [esp+8]
	push eax
	call sprintf_
	add esp, 0Ch
	xor edx, edx
	mov eax, esp
	call sub_486F40
	mov ecx, dword [dword_51221C]
	push ecx
	push aCldD ; "CLD%d"
	mov esi, eax
	lea eax, [esp+108h]
	push eax
	xor ebx, ebx
	lea edx, [esp+10Ch]
	call sprintf_
	add esp, 0Ch
	mov ecx, dword_4EFC24
	mov eax, esi
	call sub_4352C0
	mov eax, esi
	call sub_438140
	mov eax, esi
	call sub_4848FC
	call sub_42D930
	add esp, 120h
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_42DA20 endp

sub_42DAF0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push edi
	push ebp
	sub esp, 434h
	mov [esp+414h], esi
	mov edi, eax
	mov edx, 107AEh
	mov ecx, dword [dword_51221C]
	mov [esp+410h], edx
	test ecx, ecx
	jz loc_42DC5F
	mov eax, 1

loc_42DB23:
	mov [esp+420h], eax
	mov eax, edi
	call sub_42E510
	call sub_42E4C0
	cmp dword [edi], 1
	jz loc_42DC66

loc_42DB3F:
	mov esi, dword [dword_4EEB40]
	test esi, esi
	jnz loc_42DB58
	mov eax, edi
	call sub_42E280
	test eax, eax
	jz loc_42DD37

loc_42DB58:
	mov edx, 40h
	lea eax, [esp+418h]
	call sub_46FD30
	test eax, eax
	jz loc_42DC30
	mov eax, dword [dword_5127B0]
	mov [esp+3B8h], eax
	mov eax, dword [dword_5127B4]
	mov [esp+3BCh], eax
	mov eax, dword [dword_5127A8]
	mov [esp+3C0h], eax
	mov eax, [esp+3BCh]
	mov [esp+3C4h], eax
	mov eax, [esp+3C0h]
	mov [esp+3C8h], eax
	mov eax, dword [byte_5127BC]
	mov [esp+3CCh], eax
	mov eax, [esp+3B8h]
	mov [esp+3D0h], eax
	mov eax, [esp+3CCh]
	push 0
	mov [esp+3D8h], eax
	mov eax, dword [dword_42CFA0]
	push eax
	push eax
	push eax
	push eax
	mov esi, [esp+3E8h]
	push esi
	mov edi, [esp+3E8h]
	push edi
	mov ebp, [esp+3E8h]
	push ebp
	mov eax, [esp+3E8h]
	push eax
	mov edx, [esp+3E8h]
	push edx
	mov ecx, [esp+3E8h]
	push ecx
	mov ebx, [esp+3E8h]
	push ebx
	mov esi, [esp+3E8h]
	push esi

loc_42DC24:
	mov eax, [esp+44Ch]
	call sub_42E580

loc_42DC30:
	lea esi, [esp+400h]
	call sub_42E460
	mov edi, [esp+414h]
	lea esi, [esp+400h]
	movsd
	movsd
	mov eax, [esp+414h]
	add esp, 434h
	pop ebp
	pop edi
	pop edx
	pop ecx
	pop ebx
	ret

loc_42DC5F:
	xor eax, eax
	jmp loc_42DB23

loc_42DC66:
	mov eax, [edi+4]
	call sub_449A20
	test eax, eax
	jz loc_42DB3F
	call sub_42CF90
	mov edx, 40h
	mov ecx, eax
	lea eax, [esp+418h]
	call sub_46FD30
	test eax, eax
	jz loc_42DC30
	mov eax, dword [dword_5127B0]
	mov [esp+3D8h], eax
	mov eax, dword [dword_5127B4]
	mov [esp+3DCh], eax
	mov eax, dword [dword_5127A8]
	push 0
	mov [esp+3E4h], eax
	mov eax, [esp+3E0h]
	push ecx
	mov [esp+3ECh], eax
	mov eax, [esp+3E8h]
	push ecx
	mov [esp+3F4h], eax
	mov eax, dword [byte_5127BC]
	push ecx
	mov [esp+3FCh], eax
	mov eax, [esp+3E8h]
	push ecx
	mov [esp+404h], eax
	mov eax, [esp+400h]
	push eax
	mov ebp, [esp+408h]
	push ebp
	push eax
	mov edx, [esp+408h]
	push edx
	mov ecx, [esp+408h]
	push ecx
	mov ebx, [esp+408h]
	push ebx
	mov esi, [esp+408h]
	push esi
	mov edi, [esp+408h]
	push edi
	mov [esp+428h], eax
	jmp loc_42DC24

loc_42DD37:
	cmp dword [dword_4EEBE8], 0
	jnz loc_42DC30
	mov edx, 0CCh
	lea eax, [esp+41Ch]
	call sub_46FEA0
	test eax, eax
	jz loc_42DC30
	mov ecx, [esp+41Ch]
	mov edx, 11h
	mov ebx, dword [dword_5127AC]
	mov eax, edi
	call sub_45B840
	mov edx, 0CCh
	lea eax, [esp+408h]
	call sub_46FEA0
	test eax, eax
	jz loc_42DC30
	mov ecx, [esp+408h]
	mov edx, 11h
	mov ebx, dword [dword_5127B8]
	mov eax, edi
	call sub_45B840
	lea edx, [esp+2A8h]
	mov eax, [esp+41Ch]
	call sub_42E660
	lea edx, [esp+110h]
	mov eax, [esp+408h]
	call sub_42E660
	push esi
	mov ecx, dword_4EEB48
	lea ebx, [esp+2ACh]
	push 11h
	lea edx, [esp+118h]
	lea eax, [esp+90h]
	call sub_45B5A0
	push esi
	mov ecx, dword_4EEB4C
	lea ebx, [esp+2ACh]
	push 11h
	lea edx, [esp+118h]
	lea eax, [esp+228h]
	call sub_45B5A0
	push 1
	mov ecx, dword_4EEB98
	lea ebx, [esp+2ACh]
	push 11h
	lea edx, [esp+118h]
	lea eax, [esp+8]
	call sub_45B5A0
	push 1
	mov ecx, dword_4EEB98
	lea ebx, [esp+2B4h]
	push 11h
	lea edx, [esp+120h]
	lea eax, [esp+1A0h]
	call sub_45B5A0
	mov esi, [esp+408h]
	mov ecx, dword [dword_4EEBEC]
	xor eax, eax
	sar ecx, 2
	lea edx, [esi+0Ch]
	mov ebp, 1
	xor ebx, ebx

loc_42DE71:
	mov [esp+eax+330h], ebx
	mov [esp+eax+374h], ebx
	cmp ecx, [esi+8]
	jle loc_42E1A0
	cmp ecx, [edx+8]
	jle loc_42E1A0

loc_42DE91:
	add edx, 0Ch
	add eax, 4
	add esi, 0Ch
	cmp eax, 40h
	jnz loc_42DE71
	xor ebp, ebp
	xor ecx, ecx
	xor ebx, ebx
	xor esi, esi

loc_42DEA7:
	cmp esi, [esp+ebp+374h]
	jz loc_42DF40
	mov edx, 40h
	lea eax, [esp+418h]
	call sub_46FD30
	test eax, eax
	jz loc_42DF40
	cmp esi, dword [dword_4EEBDC]
	jz loc_42E1B3
	cmp ebx, 7
	jle loc_42E1B3
	push esi
	mov eax, dword byte_4EF3F4[ebp]
	push eax
	mov edx, dword dword_4EF3F8[ebp]
	push edx
	mov eax, dword [byte_4EF3F0]
	push eax
	push eax
	mov eax, [esp+ecx+0A0h]
	push eax
	mov edx, [esp+ecx+0A0h]
	push edx
	mov eax, [esp+ecx+0B0h]
	push eax
	mov edx, [esp+ecx+0B0h]
	push edx
	mov eax, [esp+ecx+2D8h]
	push eax
	mov edx, [esp+ecx+2D8h]
	push edx
	mov eax, [esp+ecx+2D8h]
	push eax
	mov edx, [esp+ecx+2D8h]

loc_42DF33:
	push edx
	mov eax, [esp+44Ch]
	call sub_42E580

loc_42DF40:
	add ecx, 8
	inc ebx
	add ebp, 4
	cmp ebx, 10h
	jl loc_42DEA7
	cmp dword [edi], 1
	jnz loc_42E20E

loc_42DF59:
	xor ecx, ecx
	xor ebx, ebx
	mov esi, 40h
	xor edi, edi

loc_42DF64:
	cmp edi, [esp+ebx+374h]
	jz loc_42DFE2
	lea eax, [esp+418h]
	mov edx, esi
	call sub_46FD30
	test eax, eax
	jz loc_42DFE2
	mov eax, [esp+420h]
	push eax
	mov edx, dword [byte_4EEBF8]
	push edx
	push edx
	mov eax, dword [byte_4EEBF4]
	push eax
	push eax
	mov ebp, [esp+ecx+128h]
	push ebp
	mov eax, [esp+ecx+128h]
	push eax
	mov edx, [esp+ecx+138h]
	push edx
	mov ebp, [esp+ecx+138h]
	push ebp
	mov eax, [esp+ecx+0B8h]
	push eax
	mov edx, [esp+ecx+0B8h]
	push edx
	mov ebp, [esp+ecx+0B8h]
	push ebp
	mov eax, [esp+ecx+0B8h]
	push eax
	mov eax, [esp+44Ch]
	call sub_42E580

loc_42DFE2:
	add ebx, 4
	add ecx, 8
	cmp ebx, 40h
	jnz loc_42DF64
	mov eax, esp
	xor edx, edx
	xor ebp, ebp
	mov [esp+430h], edx
	mov [esp+428h], eax
	lea eax, [esp+198h]
	mov [esp+42Ch], edx
	mov [esp+424h], eax

loc_42E01A:
	mov eax, [esp+42Ch]
	cmp dword [esp+eax+330h], 0
	jz loc_42E14D
	mov edx, 38h
	lea eax, [esp+40Ch]
	call sub_46FD30
	test eax, eax
	jz loc_42E14D
	push 0
	lea ecx, [esp+414h]
	mov ebx, [esp+428h]
	push 1
	mov edx, [esp+430h]
	lea eax, [esp+400h]
	call sub_45B5A0
	mov eax, [esp+40Ch]
	mov dword [eax+4], 3
	mov eax, [esp+40Ch]
	mov esi, [esp+420h]
	mov dword [eax+30h], 0
	test esi, esi
	jz loc_42E21A
	mov eax, [esp+40Ch]
	mov dword [eax+34h], 3C23D666h

loc_42E0A6:
	mov eax, [esp+40Ch]
	mov byte [eax+2Ch], 0FFh
	mov eax, [esp+40Ch]
	mov byte [eax+2Dh], 0FFh
	mov eax, [esp+40Ch]
	mov byte [eax+2Eh], 0FFh
	mov eax, [esp+40Ch]
	mov byte [eax+2Fh], 0FFh
	mov edx, [esp+42Ch]
	mov eax, [esp+40Ch]
	mov edx, dword dword_4EEB50[edx]
	mov edi, dword [dword_4EEBDC]
	mov [eax+28h], edx
	test edi, edi
	jz loc_42E22D
	cmp dword [esp+430h], 7
	jle loc_42E22D
	mov edi, [esp+40Ch]
	lea esi, [esp+3F8h]
	lea edi, [edi+8]
	movsd
	movsd
	mov edi, [esp+40Ch]
	lea esi, [esp+ebp]
	lea edi, [edi+10h]
	movsd
	movsd
	mov edi, [esp+40Ch]
	lea esi, [esp+ebp+220h]
	lea edi, [edi+18h]
	movsd
	movsd
	mov edi, [esp+40Ch]
	lea esi, [esp+ebp+228h]

loc_42E148:
	lea edi, [edi+20h]
	movsd
	movsd

loc_42E14D:
	mov ecx, [esp+424h]
	mov ebx, [esp+42Ch]
	mov esi, [esp+430h]
	mov edx, [esp+428h]
	add ebp, 8
	add ecx, 8
	add ebx, 4
	inc esi
	add edx, 8
	mov [esp+424h], ecx
	mov [esp+42Ch], ebx
	mov [esp+430h], esi
	mov [esp+428h], edx
	cmp esi, 10h
	jl loc_42E01A
	jmp loc_42DC30

loc_42E1A0:
	mov [esp+eax+330h], ebp
	mov [esp+eax+374h], ebp
	jmp loc_42DE91

loc_42E1B3:
	push esi
	mov eax, dword dword_4EF3F8[ebp]
	push eax
	mov edx, dword [byte_4EF3F0]
	push edx
	push edx
	mov edx, dword byte_4EF3F4[ebp]
	push edx
	mov eax, [esp+ecx+0A8h]
	push eax
	mov edx, [esp+ecx+0A8h]
	push edx
	mov eax, [esp+ecx+2D0h]
	push eax
	mov edx, [esp+ecx+2D0h]
	push edx
	mov eax, [esp+ecx+2D0h]
	push eax
	mov edx, [esp+ecx+2D0h]
	push edx
	mov eax, [esp+ecx+0B8h]
	push eax
	mov edx, [esp+ecx+0B8h]
	jmp loc_42DF33

loc_42E20E:
	mov eax, edi
	call sub_42CFB0
	jmp loc_42DF59

loc_42E21A:
	mov eax, [esp+40Ch]
	mov dword [eax+34h], 3F7FFF00h
	jmp loc_42E0A6

loc_42E22D:
	mov edi, [esp+40Ch]
	lea esi, [esp+ebp]
	lea edi, [edi+8]
	movsd
	movsd
	mov edi, [esp+40Ch]
	lea esi, [esp+3F8h]
	lea edi, [edi+10h]
	movsd
	movsd
	mov edi, [esp+40Ch]
	lea esi, [esp+ebp+228h]
	lea edi, [edi+18h]
	movsd
	movsd
	mov edi, [esp+40Ch]
	lea esi, [esp+ebp+220h]
	jmp loc_42E148
;sub_42DAF0 endp

sub_42E280: ;SUBROUTINE
	push ebx
	push edx
	push edi
	mov edx, eax
	cmp dword [dword_51221C], 4
	jnz loc_42E2D9
	mov ebx, dword [dword_5117C4]
	cmp ebx, 447h
	jle loc_42E2A4
	cmp ebx, 556h
	jl loc_42E2DF

loc_42E2A4:
	mov edi, dword [dword_5117C4]
	cmp edi, 3F5h
	jle loc_42E2C6
	cmp edi, 446h
	jge loc_42E2C6
	lea eax, [edx+14h]
	call sub_42E3B0
	test eax, eax
	jnz loc_42E2DF

loc_42E2C6:
	mov eax, dword [dword_5117C4]
	cmp eax, 555h
	jle loc_42E2D9
	cmp eax, 59Ah
	jl loc_42E2E8

loc_42E2D9:
	xor eax, eax
	pop edi
	pop edx
	pop ebx
	ret

loc_42E2DF:
	mov eax, 1
	pop edi
	pop edx
	pop ebx
	ret

loc_42E2E8:
	lea eax, [edx+14h]
	call sub_42E300
	test eax, eax
	jz loc_42E2D9
	mov eax, 1
	pop edi
	pop edx
	pop ebx
	ret
;sub_42E280 endp

sub_42E300: ;SUBROUTINE
	push ecx
	push edx
	push esi
	push edi
	sub esp, 18h
	mov edx, dword [dword_5117C4]
	lea esi, [eax+18h]
	lea eax, 0[edx*8]
	add edx, eax
	mov eax, dword [dword_5118A4]
	shl edx, 2
	mov edi, esp
	add eax, edx
	movsd
	movsd
	movsd
	mov edx, [eax+0Ch]
	sar edx, 18h
	shl edx, 9
	mov [esp+0Ch], edx
	mov edx, [eax+0Dh]
	sar edx, 18h
	mov eax, [eax+0Eh]
	shl edx, 9
	sar eax, 18h
	mov [esp+10h], edx
	shl eax, 9
	mov edx, [esp+0Ch]
	mov [esp+14h], eax
	mov eax, [esp]
	imul edx
	shl edx, 10h
	shr eax, 10h
	adc eax, edx
	mov edx, [esp+10h]
	mov ecx, eax
	mov eax, [esp+4]
	imul edx
	shl edx, 10h
	shr eax, 10h
	adc eax, edx
	mov edx, [esp+14h]
	add ecx, eax
	mov eax, [esp+8]
	imul edx
	shl edx, 10h
	shr eax, 10h
	adc eax, edx
	add eax, ecx
	test eax, eax
	jl loc_42E398
	xor eax, eax
	add esp, 18h
	pop edi
	pop esi
	pop edx
	pop ecx
	ret

loc_42E398:
	mov eax, 1
	add esp, 18h
	pop edi
	pop esi
	pop edx
	pop ecx
	ret
;sub_42E300 endp

sub_42E3B0: ;SUBROUTINE
	push ecx
	push edx
	push esi
	push edi
	sub esp, 18h
	mov edx, dword [dword_5117C4]
	lea esi, [eax+18h]
	lea eax, 0[edx*8]
	add edx, eax
	mov eax, dword [dword_5118A4]
	shl edx, 2
	mov edi, esp
	add eax, edx
	movsd
	movsd
	movsd
	mov edx, [eax+0Ch]
	sar edx, 18h
	shl edx, 9
	mov [esp+0Ch], edx
	mov edx, [eax+0Dh]
	sar edx, 18h
	mov eax, [eax+0Eh]
	shl edx, 9
	sar eax, 18h
	mov [esp+10h], edx
	shl eax, 9
	mov edx, [esp+0Ch]
	mov [esp+14h], eax
	mov eax, [esp]
	imul edx
	shl edx, 10h
	shr eax, 10h
	adc eax, edx
	mov edx, [esp+10h]
	mov ecx, eax
	mov eax, [esp+4]
	imul edx
	shl edx, 10h
	shr eax, 10h
	adc eax, edx
	mov edx, [esp+14h]
	add ecx, eax
	mov eax, [esp+8]
	imul edx
	shl edx, 10h
	shr eax, 10h
	adc eax, edx
	add eax, ecx
	test eax, eax
	jle loc_42E44B
	mov eax, 1
	add esp, 18h
	pop edi
	pop esi
	pop edx
	pop ecx
	ret

loc_42E44B:
	xor eax, eax
	add esp, 18h
	pop edi
	pop esi
	pop edx
	pop ecx
	ret
;sub_42E3B0 endp

sub_42E460: ;SUBROUTINE
	push ecx
	push edx
	push edi
	sub esp, 0Ch
	mov ecx, esi
	mov edx, 10h
	lea eax, [esp+8]
	call sub_46FD30
	test eax, eax
	jz loc_42E4A5
	mov eax, [esp+8]
	mov dword [eax+4], 1Bh
	mov eax, [esp+8]
	mov dword [eax], 0
	mov eax, [esp+8]
	mov dword [eax+8], 0Ah
	mov eax, [esp+8]
	mov dword [eax+0Ch], 2

loc_42E4A5:
	mov esi, esp
	mov edi, ecx
	call sub_46FCF0
	mov esi, esp
	movsd
	movsd
	mov eax, ecx
	add esp, 0Ch
	pop edi
	pop edx
	pop ecx
	ret
;sub_42E460 endp

sub_42E4C0: ;SUBROUTINE
	push edx
	sub esp, 4
	call sub_46FD80
	mov edx, 10h
	mov eax, esp
	call sub_46FD30
	test eax, eax
	jnz loc_42E4DE
	add esp, 4
	pop edx
	ret

loc_42E4DE:
	mov eax, [esp]
	mov dword [eax+4], 1Bh
	mov eax, [esp]
	mov dword [eax], 0
	mov eax, [esp]
	mov dword [eax+8], 0Ah
	mov eax, [esp]
	mov dword [eax+0Ch], 0
	add esp, 4
	pop edx
	ret
;sub_42E4C0 endp

sub_42E510: ;SUBROUTINE
	push ebx
	push esi
	push edi
	push ebp
	cmp dword [eax], 1
	jnz loc_42E54A
	mov esi, 6Eh
	mov edi, 1E6h
	mov ebp, 27Ch
	mov ebx, 28h
	mov dword [byte_5127BC], esi
	mov dword [dword_5127B0], edi
	mov dword [dword_5127A8], ebp
	mov dword [dword_5127B4], ebx
	pop ebp
	pop edi
	pop esi
	pop ebx
	ret

loc_42E54A:
	push edx
	push ecx
	push byte_5127BC
	mov ecx, dword_5127A8
	mov ebx, dword_5127B4
	mov edx, dword_5127B0
	mov eax, [eax+4]
	call sub_42A270
	mov eax, dword [dword_5127B4]
	add dword [byte_5127BC], eax
	pop ecx
	pop edx
	pop ebp
	pop edi
	pop esi
	pop ebx
	ret
;sub_42E510 endp

sub_42E580: ;SUBROUTINE
	push edx
	push esi
	push edi
	mov edx, [esp+40h]
	mov dword [eax+4], 7
	test edx, edx
	jz loc_42E632
	mov dword [eax+3Ch], 3C23D666h
	mov dword [eax+38h], 0

loc_42E5A4:
	lea esi, [esp+10h]
	lea edi, [eax+8]
	movsd
	movsd
	lea esi, [esp+18h]
	lea edi, [eax+10h]
	movsd
	movsd
	lea esi, [esp+20h]
	lea edi, [eax+18h]
	movsd
	movsd
	lea esi, [esp+28h]
	lea edi, [eax+20h]
	movsd
	movsd
	mov byte [eax+28h], 0FFh
	mov byte [eax+2Ch], 0FFh
	mov byte [eax+30h], 0FFh
	mov dl, [esp+32h]
	mov byte [eax+34h], 0FFh
	mov [eax+29h], dl
	mov dl, [esp+31h]
	mov [eax+2Ah], dl
	mov dl, [esp+30h]
	mov [eax+2Bh], dl
	mov dl, [esp+36h]
	mov [eax+2Dh], dl
	mov dl, [esp+35h]
	mov [eax+2Eh], dl
	mov dl, [esp+34h]
	mov [eax+2Fh], dl
	mov dl, [esp+3Ah]
	mov [eax+31h], dl
	mov dl, [esp+39h]
	mov [eax+32h], dl
	mov dl, [esp+38h]
	mov [eax+33h], dl
	mov dl, [esp+3Eh]
	mov [eax+35h], dl
	mov dl, [esp+3Dh]
	mov [eax+36h], dl
	mov dl, [esp+3Ch]
	mov [eax+37h], dl
	pop edi
	pop esi
	pop edx
	ret 34h

loc_42E632:
	mov dword [eax+3Ch], 3F7FFF00h
	mov [eax+38h], edx
	jmp loc_42E5A4
;sub_42E580 endp

sub_42E650: ;SUBROUTINE
	xor byte [dword_4EEBE8], 1
	ret
;sub_42E650 endp

sub_42E660: ;SUBROUTINE
	push ebx
	push ecx
	push esi
	sub esp, 44h
	mov esi, eax
	mov ebx, edx
	xor edx, edx

loc_42E66C:
	mov ecx, [eax+8]
	add eax, 0Ch
	mov [esp+edx], ecx
	mov ecx, dword [dword_4EEBE4]
	add edx, 4
	mov [eax-4], ecx
	cmp edx, 44h
	jnz loc_42E66C
	mov ecx, dword_4D5268
	mov eax, 11h
	mov edx, esi
	call sub_45B690
	mov edx, esi
	xor eax, eax

loc_42E69B:
	add edx, 0Ch
	mov ecx, [esp+eax]
	add eax, 4
	mov [edx-4], ecx
	cmp eax, 44h
	jnz loc_42E69B
	add esp, 44h
	pop esi
	pop ecx
	pop ebx
	ret
;sub_42E660 endp

sub_42E6C0: ;SUBROUTINE
	mov eax, dword [dword_5127AC]
	call sub_4848FC
	mov eax, dword [dword_5127B8]
	jmp sub_4848FC
;sub_42E6C0 endp

sub_42E6E0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	mov edx, aCNfs2seGame3_1 ; "c:\\nfs2se\\game\\3rash\\hrzsku.c"
	mov ecx, 167h
	mov esi, 169h
	mov eax, dword [dword_512250]
	xor ebx, ebx
	mov dword [dword_4EEBE8], eax
	mov dword [dword_4DB1D8], edx
	mov edx, 180h
	mov eax, aGrngcoordtop ; "gRngCoordTop"
	mov dword [dword_4DB1DC], ecx
	call sub_484498
	mov ebx, aCNfs2seGame3_1 ; "c:\\nfs2se\\game\\3rash\\hrzsku.c"
	mov edx, 180h
	mov dword [dword_5127AC], eax
	mov eax, aGrngcoordbotto ; "gRngCoordBottom"
	mov dword [dword_4DB1D8], ebx
	xor ebx, ebx
	mov dword [dword_4DB1DC], esi
	call sub_484498
	mov dword [dword_5127B8], eax
	call sub_42E750
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_42E6E0 endp

sub_42E750: ;SUBROUTINE
	push ecx
	push edx
	push esi
	push ebp
	sub esp, 4Ch
	push edi
	push ebx
	xor ecx, ecx
	xor esi, esi

loc_42E75D:
	mov edx, ecx
	mov eax, ecx
	sar edx, 1Fh
	shl edx, 4
	sbb eax, edx
	sar eax, 4
	mov ebx, dword [dword_4EEB44]
	add ebx, eax
	mov eax, ebx
	mov edx, dword [dword_4EEBEC]
	call sub_49C150
	imul edx
	shl edx, 10h
	shr eax, 10h
	adc eax, edx
	mov edx, eax
	mov eax, dword [dword_5127B8]
	mov [esi+eax], edx
	mov edx, dword [dword_4EEBF0]
	mov [esi+eax+4], edx
	mov eax, ebx
	mov edx, dword [dword_4EEBEC]
	call sub_49C1C0
	imul edx
	shl edx, 10h
	shr eax, 10h
	adc eax, edx
	mov edx, eax
	mov eax, dword [dword_5127B8]
	mov [esi+eax+8], edx
	mov edi, dword [dword_5127AC]
	mov edx, [esi+eax]
	mov [edi+esi], edx
	mov edx, dword [dword_4EEB94]
	mov ebx, [esi+eax+4]
	add esi, 0Ch
	add ebx, edx
	mov [edi+esi-8], ebx
	mov eax, [esi+eax-4]
	add ecx, 10000h
	mov [edi+esi-4], eax
	cmp ecx, 200000h
	jnz loc_42E75D
	mov ecx, 1
	mov esi, 0Fh
	lea edi, [esp+8]
	mov [esp+50h], ecx
	xor ecx, ecx

loc_42E80E:
	cmp dword [dword_4EEBDC], 0
	jz loc_42E8B5
	cmp ecx, 7
	jle loc_42E8B5
	mov ebx, 8
	mov edx, esi
	mov eax, esi

loc_42E82D:
	sar edx, 1Fh
	idiv ebx
	mov edx, dword dword_4EEB20[edx*4]
	mov dword dword_4EEB50[ecx*4], edx
	lea ebp, 0[ecx*4]
	lea edx, [esp+4Ch]
	mov ebx, edi
	mov eax, dword dword_4EEB50[ebp]
	call sub_42ED00
	mov edx, [esp+50h]
	mov eax, [esp+ebp+8]
	cmp eax, edx
	jle loc_42E868
	mov [esp+50h], eax

loc_42E868:
	add edi, 4
	inc ecx
	dec esi
	cmp ecx, 10h
	jl loc_42E80E
	mov ecx, dword [dword_4EEB4C]
	mov edx, dword [dword_4EEBE0]
	sub edx, ecx
	mov ebx, [esp+50h]
	mov eax, edx
	sar edx, 1Fh
	idiv ebx
	mov esi, dword [dword_4EEB4C]
	xor ecx, ecx
	mov edx, eax
	pop ebx
	pop edi

loc_42E897:
	mov eax, [esp+ecx]
	imul eax, edx
	add ecx, 4
	add eax, esi
	mov dword dword_4EEB94[ecx], eax
	cmp ecx, 44h
	jnz loc_42E897
	add esp, 4Ch
	pop ebp
	pop esi
	pop edx
	pop ecx
	ret

loc_42E8B5:
	mov ebx, 8
	mov edx, ecx
	mov eax, ecx
	jmp loc_42E82D
;sub_42E750 endp

sub_42E8F0: ;SUBROUTINE
	push edx
	mov edx, eax
	xor eax, eax

loc_42E8F5:
	mov dword dword_4EEB20[eax], edx
	add eax, 4
	add edx, 1Ch
	cmp eax, 20h
	jnz loc_42E8F5
	pop edx
	ret
;sub_42E8F0 endp

sub_42E910: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 12Ch
	mov edx, dword [dword_51221C]
	push edx
	mov ecx, dword [dword_513480]
	push ecx
	push aS3tr02d_hrz ; "%s3Tr%02d.hrz"
	lea eax, [esp+0Ch]
	push eax
	call sprintf_
	add esp, 10h
	xor edx, edx
	mov eax, esp
	call sub_486F40
	mov ecx, eax
	mov [esp+100h], eax
	lea eax, [esp+100h]
	call sub_470EC0
	mov [esp+120h], eax
	fild dword [esp+120h]
	lea eax, [esp+100h]
	fstp dword [flt_4D5260]
	call sub_470EC0
	mov [esp+120h], eax
	fild dword [esp+120h]
	lea eax, [esp+100h]
	fstp dword [flt_4D5264]
	call sub_470EC0
	mov dword [dword_4EEB40], eax
	lea eax, [esp+100h]
	call sub_470EC0
	mov dword [dword_4EEBDC], eax
	lea eax, [esp+100h]
	call sub_470EC0
	mov dword [dword_4EEBEC], eax
	lea eax, [esp+100h]
	call sub_470EC0
	mov dword [dword_4EEB44], eax
	lea eax, [esp+100h]
	call sub_470EC0
	mov dword [dword_4EEBE4], eax
	lea eax, [esp+100h]
	call sub_470EC0
	mov dword [dword_4EEBF0], eax
	lea eax, [esp+100h]
	call sub_470EC0
	mov dword [dword_4EEB94], eax
	lea eax, [esp+100h]
	call sub_470EC0
	mov edi, eax
	lea eax, [esp+100h]
	call sub_470EC0
	mov ebp, eax
	lea eax, [esp+100h]
	call sub_470EC0
	mov esi, eax
	lea eax, [esp+100h]
	call sub_470EC0
	mov byte [byte_4EEBF6], al
	lea eax, [esp+100h]
	call sub_470EC0
	mov byte [byte_4EEBF5], al
	lea eax, [esp+100h]
	call sub_470EC0
	mov byte [byte_4EEBF4], al
	lea eax, [esp+100h]
	call sub_470EC0
	mov byte [byte_4EEBFA], al
	lea eax, [esp+100h]
	call sub_470EC0
	mov byte [byte_4EEBF9], al
	lea eax, [esp+100h]
	call sub_470EC0
	mov byte [byte_4EEBF8], al
	lea eax, [esp+100h]
	call sub_470EC0
	mov byte [byte_4EF3F2], al
	lea eax, [esp+100h]
	call sub_470EC0
	mov byte [byte_4EF3F1], al
	lea eax, [esp+100h]
	call sub_470EC0
	mov byte [byte_4EF3F0], al
	lea eax, [esp+100h]
	call sub_470EC0
	mov [esp+110h], eax
	lea eax, [esp+100h]
	call sub_470EC0
	mov [esp+104h], eax
	lea eax, [esp+100h]
	call sub_470EC0
	mov [esp+108h], eax
	lea eax, [esp+100h]
	call sub_470EC0
	mov ebx, eax
	lea eax, [esp+100h]
	call sub_470EC0
	mov [esp+10Ch], eax
	lea eax, [esp+100h]
	call sub_470EC0
	mov [esp+120h], eax
	mov eax, ecx
	call sub_4848FC
	call sub_42DA20
	mov edx, dword [dword_4EEB44]
	shl edx, 10h
	mov ecx, 168h
	mov eax, edx
	sar edx, 1Fh
	idiv ecx
	mov dword [dword_4EEB44], eax
	mov eax, 10000h
	mov edx, eax
	mov ecx, dword [dword_4EEB94]
	sar edx, 1Fh
	idiv ecx
	imul edi, eax
	imul ebp, eax
	imul esi, eax
	xor ecx, ecx
	xor eax, eax
	mov cl, [esp+110h]
	mov al, bl
	mov dword [dword_4EEB48], edi
	sub eax, ecx
	mov dword [dword_4EEBE0], ebp
	shl eax, 0Dh
	xor ebx, ebx
	mov [esp+128h], eax
	xor eax, eax
	mov bl, [esp+104h]
	mov al, [esp+10Ch]
	mov dword [dword_4EEB4C], esi
	sub eax, ebx
	movzx esi, byte [esp+108h]
	shl eax, 0Dh
	mov ebp, 40h
	mov [esp+11Ch], eax
	xor eax, eax
	xor edi, edi
	mov al, [esp+120h]
	shl ecx, 10h
	sub eax, esi
	shl ebx, 10h
	shl eax, 0Dh
	shl esi, 10h
	mov [esp+124h], eax

loc_42EBEC:
	mov edx, ecx
	mov eax, ecx
	sar edx, 1Fh
	shl edx, 10h
	sbb eax, edx
	sar eax, 10h
	mov [esp+114h], eax
	mov edx, ebx
	mov eax, ebx
	sar edx, 1Fh
	shl edx, 10h
	sbb eax, edx
	sar eax, 10h
	mov [esp+118h], eax
	mov edx, esi
	mov eax, esi
	sar edx, 1Fh
	shl edx, 10h
	sbb eax, edx
	sar eax, 10h
	mov ah, [esp+114h]
	mov byte byte_4EF3F6[edi], ah
	mov ah, [esp+118h]
	mov byte byte_4EF3F5[edi], ah
	sub ebp, 4
	mov byte byte_4EF3F4[edi], al
	mov ah, [esp+114h]
	mov byte byte_4EF3F6[ebp], ah
	mov ah, [esp+118h]
	mov byte byte_4EF3F5[ebp], ah
	add edi, 4
	mov byte byte_4EF3F4[ebp], al
	mov eax, [esp+128h]
	mov edx, [esp+11Ch]
	add ecx, eax
	mov eax, [esp+124h]
	add ebx, edx
	add esi, eax
	cmp edi, 20h
	jnz loc_42EBEC
	mov eax, dword [byte_4EF3F4]
	mov edx, dword [dword_4EEB40]
	mov dword [dword_4EF434], eax
	test edx, edx
	jz loc_42ECCC
	xor dl, dl
	mov byte [byte_4EF3EE], dl
	mov byte [byte_4EF3ED], dl
	mov byte [byte_4EF3EC], dl
	mov byte [byte_4EF3EF], dl
	add esp, 12Ch
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_42ECCC:
	mov byte [byte_4EF3EF], 0FFh
	mov al, byte [byte_4EF3F2]
	mov byte [byte_4EF3EE], al
	mov al, byte [byte_4EF3F1]
	mov byte [byte_4EF3ED], al
	mov al, byte [byte_4EF3F0]
	mov byte [byte_4EF3EC], al
	add esp, 12Ch
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_42E910 endp

sub_42ED00: ;SUBROUTINE
	push ecx
	mov ecx, [eax]
	mov ecx, [ecx+2]
	sar ecx, 10h
	mov [edx], ecx
	mov eax, [eax]
	mov eax, [eax+4]
	sar eax, 10h
	mov [ebx], eax
	pop ecx
	ret
;sub_42ED00 endp

sub_42ED30: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	sub esp, 0Ch
	mov ecx, dword [dword_512234]
	push ecx
	mov edx, 100h
	push aPazD ; "paz%d"
	lea eax, [esp+8]
	xor ebx, ebx
	push eax
	mov dword [dword_4D9944], edx
	mov ecx, dword_4EFC74
	call sprintf_
	add esp, 0Ch
	mov edx, esp
	mov eax, dword [dword_512AAC]
	call sub_4352C0
	xor ebx, ebx
	mov dword [dword_4D9944], ebx
	add esp, 0Ch
	pop edx
	pop ecx
	pop ebx
	ret
;sub_42ED30 endp

off_42ED80: dd loc_42F446
	dd loc_42F4D3
	dd loc_42F511
	dd loc_42F55A
	dd loc_42F5A3
	dd loc_42F5EF
off_42ED98: dd loc_42F64A
	dd loc_42F68E
	dd loc_42F6CC
	dd loc_42F715
	dd loc_42F75E
	dd loc_42F7AA

sub_42EDB0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	sub esp, 0Ch
	mov ecx, 7FFFFFFFh
	mov edx, dword_4EFC74
	mov ebx, dword [dword_512AB4]
	mov dword [dword_4EFC70], ecx
	mov dword [dword_4EFC6C], edx
	test ebx, ebx
	jnz loc_42F055
	call sub_42F9F0
	mov edx, 4Dh

loc_42EDE7:
	mov ah, 20h
	mov esi, 40h
	mov edi, 1B0h
	mov ebp, 23Dh
	xor bl, bl
	mov byte [byte_4EFCB8], ah
	mov byte [byte_4EFCB9], bl
	mov byte [byte_4EFCBA], bl
	mov byte [byte_4EFCBB], bl
	mov dword [dword_4EFC98], esi
	mov dword [dword_4EFC9C], edi
	mov dword [dword_4EFCA0], ebp
	mov dword [dword_4EFCA4], edi
	mov dword [dword_4EFCA8], ebp
	mov ebx, 1ADh
	mov esi, 43h
	mov eax, dword_4EFC90
	mov ebp, 240h
	mov dword [dword_4EFCAC], ebx
	mov dword [dword_4EFCB0], esi
	mov dword [dword_4EFCB4], ebx
	call sub_42A980
	mov ebx, 23Dh
	mov eax, dword_4EFC90
	mov dword [dword_4EFC98], ebp
	mov dword [dword_4EFC9C], edx
	mov dword [dword_4EFCA0], ebp
	mov dword [dword_4EFCA4], edi
	mov dword [dword_4EFCAC], edi
	mov ebp, 40h
	mov dword [dword_4EFCA8], ebx
	lea ecx, [edx+3]
	mov dword [dword_4EFCB0], ebx
	mov dword [dword_4EFCB4], ecx
	call sub_42A980
	mov ebx, esi
	mov al, 10h
	mov dword [dword_4EFC98], ebp
	mov dword [dword_4EFC9C], edi
	mov dword [dword_4EFCA0], esi
	mov dword [dword_4EFCA8], ebx
	mov dword [dword_4EFCAC], edx
	mov dword [dword_4EFCB0], ebp
	mov dword [dword_4EFCB4], edx
	mov esi, 1ADh
	mov byte [byte_4EFCB8], al
	mov edi, ebx
	mov ah, 0FFh
	mov ebx, 23Dh
	mov dword [dword_4EFCA4], esi
	mov byte [byte_4EFCB9], ah
	mov byte [byte_4EFCBA], ah
	mov byte [byte_4EFCBB], ah
	mov eax, dword_4EFC90
	mov esi, edi
	call sub_42A980
	mov eax, 240h
	mov dword [dword_4EFC9C], edx
	mov dword [dword_4EFCA0], ebx
	mov dword [dword_4EFCA4], ecx
	mov dword [dword_4EFCA8], esi
	mov dword [dword_4EFCAC], ecx
	mov dword [dword_4EFCB0], edi
	mov dword [dword_4EFC98], eax
	mov eax, dword_4EFC90
	mov dword [dword_4EFCB4], edx
	call sub_42A980
	mov ebp, dword [dword_512AB4]
	cmp ebp, 1
	jnz loc_42F064

loc_42EF54:
	cmp dword [dword_5121F8], 2
	jnz loc_42F34D
	mov ebp, 0BEh
	mov eax, 80h
	mov edx, 0FFh
	mov ecx, 1Bh
	mov esi, 93h
	xor ebx, ebx
	mov dword [dword_4EFC54], ebp
	mov dword [dword_4EFC58], eax
	mov dword [dword_4EFC5C], edx
	mov dword [dword_4EFC60], ecx
	mov dword [dword_4EFC64], ebx
	mov eax, dword_4EFC4C
	mov dword [dword_4EFC68], esi

loc_42EFA4:
	call sub_42ABF0
	cmp dword [dword_512AA8], 0
	jz loc_42F395
	mov ebp, 0C3h
	mov eax, 0E6h
	mov edx, 5Dh
	mov ecx, 27h
	mov ebx, 0A3h
	mov edi, 0B0FFFFFFh
	xor esi, esi
	mov dword [dword_4EFC54], ebp
	mov dword [dword_4EFC58], eax
	mov dword [dword_4EFC5C], edx
	mov dword [dword_4EFC60], ecx
	mov dword [dword_4EFC64], ebx
	mov dword [dword_4EFC68], esi
	mov dword [dword_4EFC70], edi
	mov eax, dword_4EFC4C
	mov ebp, 15Ch
	mov edi, 7F5F5F5Fh
	call sub_42ABF0
	mov eax, 0E6h
	mov dword [dword_4EFC54], ebp
	mov dword [dword_4EFC5C], edx
	mov dword [dword_4EFC60], ecx
	mov dword [dword_4EFC64], ebx
	mov dword [dword_4EFC68], ecx

loc_42F036:
	mov dword [dword_4EFC58], eax
	mov eax, dword_4EFC4C
	mov dword [dword_4EFC70], edi
	call sub_42ABF0

loc_42F04B:
	add esp, 0Ch
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_42F055:
	call sub_42FCB0
	mov edx, 30h
	jmp loc_42EDE7

loc_42F064:
	cmp ebp, 2
	jz loc_42EF54
	mov edx, 6
	mov ecx, 24h
	mov ebx, dword [dword_512208]
	mov [esp], edx
	cmp ebx, 1
	jle loc_42F08F
	mov esi, 5
	xor ecx, ecx
	mov [esp], esi

loc_42F08F:
	mov edi, [esp]
	xor edx, edx
	test edi, edi
	jle loc_42F12E
	lea esi, [ecx+7Bh]
	lea ebx, [ecx+9Eh]
	lea edi, [ecx+58h]
	lea ebp, [ecx+0C1h]
	lea eax, [ecx+0E4h]
	add ecx, 108h
	mov [esp+4], eax
	mov [esp+8], ecx
	xor ecx, ecx

loc_42F0C4:
	cmp edx, 1
	jnz loc_42F41C
	cmp dword [dword_512ABC], 0
	jz loc_42F41C
	mov dword [dword_4EFC54], 86h
	mov dword [dword_4EFC5C], 9Bh
	mov dword [dword_4EFC60], 18h
	xor eax, eax
	mov dword [dword_4EFC64], eax
	mov dword [dword_4EFC68], 19h
	mov dword [dword_4EFC70], 2F5F5F5Fh

loc_42F113:
	mov eax, dword_4EFC4C
	mov dword [dword_4EFC58], esi

loc_42F11E:
	call sub_42ABF0

loc_42F123:
	mov eax, [esp]
	inc edx
	add ecx, 4
	cmp edx, eax
	jl loc_42F0C4

loc_42F12E:
	mov edx, dword [dword_512208]
	test edx, edx
	jz loc_42F04B
	cmp edx, 1
	jz loc_42F04B
	cmp dword [dword_512214], 1
	jg loc_42F04B
	cmp byte [byte_51345F], 1
	jnz loc_42F7F6
	xor edx, edx
	mov ebp, 0D1h
	mov bh, 8Fh
	mov bl, 0FFh
	mov esi, dword_4EFC90

loc_42F16F:
	mov ecx, 81h
	mov eax, 0CBh
	mov byte [byte_4EFCB8], bl
	mov byte [byte_4EFCB9], bl
	mov byte [byte_4EFCBA], bl
	mov byte [byte_4EFCBB], bl
	add edx, 4
	mov dword [dword_4EFC98], ecx
	mov dword [dword_4EFCA0], eax
	mov ecx, dword dword_4D4C00[edx]
	mov dword [dword_4EFCA8], eax
	sub ecx, 0Ah
	mov eax, 81h
	mov dword [dword_4EFC9C], ecx
	mov dword [dword_4EFCA4], ecx
	mov ecx, dword dword_4D4C00[edx]
	mov dword [dword_4EFCB0], eax
	sub ecx, 9
	mov eax, esi
	mov dword [dword_4EFCAC], ecx
	mov dword [dword_4EFCB4], ecx
	call sub_42A980
	mov ah, 7Fh
	mov ecx, 81h
	mov byte [byte_4EFCB9], bh
	mov byte [byte_4EFCBA], bh
	mov byte [byte_4EFCBB], bh
	mov byte [byte_4EFCB8], ah
	mov dword [dword_4EFC98], ecx
	mov ecx, dword dword_4D4C00[edx]
	mov eax, 0CBh
	sub ecx, 9
	mov dword [dword_4EFCA0], eax
	mov dword [dword_4EFCA8], eax
	mov eax, 81h
	mov dword [dword_4EFC9C], ecx
	mov dword [dword_4EFCA4], ecx
	mov ecx, dword dword_4D4C00[edx]
	mov dword [dword_4EFCB0], eax
	add ecx, 2
	mov eax, esi
	mov dword [dword_4EFCAC], ecx
	mov dword [dword_4EFCB4], ecx
	call sub_42A980
	mov eax, 203h
	mov byte [byte_4EFCB8], bl
	mov byte [byte_4EFCB9], bl
	mov ecx, dword dword_4D4C00[edx]
	mov byte [byte_4EFCBA], bl
	sub ecx, 0Ah
	mov byte [byte_4EFCBB], bl
	mov dword [dword_4EFC9C], ecx
	mov ecx, 203h
	mov dword [dword_4EFC98], ebp
	mov dword [dword_4EFCA0], ecx
	mov ecx, dword [dword_4EFC9C]
	mov dword [dword_4EFCB0], ebp
	mov dword [dword_4EFCA4], ecx
	mov ecx, dword dword_4D4C00[edx]
	mov dword [dword_4EFCA8], eax
	sub ecx, 9
	mov eax, esi
	mov dword [dword_4EFCAC], ecx
	mov dword [dword_4EFCB4], ecx
	call sub_42A980
	mov cl, 7Fh
	mov eax, 203h
	mov byte [byte_4EFCB9], bh
	mov byte [byte_4EFCB8], cl
	mov ecx, dword dword_4D4C00[edx]
	mov byte [byte_4EFCBA], bh
	sub ecx, 9
	mov byte [byte_4EFCBB], bh
	mov dword [dword_4EFC9C], ecx
	mov ecx, 203h
	mov dword [dword_4EFC98], ebp
	mov dword [dword_4EFCA0], ecx
	mov ecx, dword [dword_4EFC9C]
	mov dword [dword_4EFCB0], ebp
	mov dword [dword_4EFCA4], ecx
	mov ecx, dword dword_4D4C00[edx]
	mov dword [dword_4EFCA8], eax
	add ecx, 2
	mov eax, esi
	mov dword [dword_4EFCAC], ecx
	mov dword [dword_4EFCB4], ecx
	call sub_42A980
	cmp edx, 20h
	jnz loc_42F16F
	mov eax, 1
	call sub_4211E0
	add esp, 0Ch
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

loc_42F34D:
	mov eax, 0BEh
	mov edx, 80h
	mov ecx, 0FFh
	mov ebx, 1Bh
	mov edi, 78h
	xor esi, esi
	mov dword [dword_4EFC54], eax
	mov dword [dword_4EFC58], edx
	mov dword [dword_4EFC5C], ecx
	mov dword [dword_4EFC60], ebx
	mov dword [dword_4EFC64], esi
	mov eax, dword_4EFC4C
	mov dword [dword_4EFC68], edi
	jmp loc_42EFA4

loc_42F395:
	mov ebp, 15Ch
	mov eax, 0E6h
	mov edx, 5Dh
	mov ecx, 27h
	mov ebx, 0A3h
	mov edi, 0B0FFFFFFh
	mov dword [dword_4EFC54], ebp
	mov dword [dword_4EFC58], eax
	mov dword [dword_4EFC5C], edx
	mov dword [dword_4EFC60], ecx
	mov dword [dword_4EFC64], ebx
	mov esi, ecx
	mov dword [dword_4EFC68], ecx
	mov dword [dword_4EFC70], edi
	mov eax, dword_4EFC4C
	mov ebp, 0C3h
	mov edi, 7F5F5F5Fh
	call sub_42ABF0
	xor esi, ecx
	mov eax, 0E6h
	mov dword [dword_4EFC54], ebp
	mov dword [dword_4EFC5C], edx
	mov dword [dword_4EFC60], ecx
	mov dword [dword_4EFC64], ebx
	mov dword [dword_4EFC68], esi
	jmp loc_42F036

loc_42F41C:
	cmp edx, 2
	jnz loc_42F42A
	cmp dword [dword_512AB8], 0
	jnz loc_42F48A

loc_42F42A:
	mov eax, dword [dword_512AA8]
	cmp edx, eax
	jnz loc_42F63B
	cmp eax, 5
	ja loc_42F123
	jmp off_42ED80[ecx]

loc_42F446:
	mov dword [dword_4EFC54], 86h
	mov dword [dword_4EFC5C], 9Bh
	mov dword [dword_4EFC60], 18h
	xor eax, eax
	mov dword [dword_4EFC64], eax
	mov dword [dword_4EFC68], eax
	mov dword [dword_4EFC70], 7FFFFFFFh
	mov eax, dword_4EFC4C
	mov dword [dword_4EFC58], edi
	jmp loc_42F11E

loc_42F48A:
	mov dword [dword_4EFC54], 86h
	mov dword [dword_4EFC5C], 9Bh
	mov dword [dword_4EFC60], 18h
	xor eax, eax
	mov dword [dword_4EFC64], eax
	mov dword [dword_4EFC68], 49h
	mov dword [dword_4EFC70], 2F5F5F5Fh
	mov eax, dword_4EFC4C
	mov dword [dword_4EFC58], ebx
	jmp loc_42F11E

loc_42F4D3:
	mov dword [dword_4EFC54], 86h
	mov dword [dword_4EFC5C], 9Bh
	mov dword [dword_4EFC60], 18h
	xor eax, eax
	mov dword [dword_4EFC64], eax
	mov dword [dword_4EFC68], 19h
	mov dword [dword_4EFC70], 7FFFFFFFh
	jmp loc_42F113

loc_42F511:
	mov dword [dword_4EFC54], 86h
	mov dword [dword_4EFC5C], 9Bh
	mov dword [dword_4EFC60], 18h
	xor eax, eax
	mov dword [dword_4EFC64], eax
	mov dword [dword_4EFC68], 49h
	mov dword [dword_4EFC70], 7FFFFFFFh
	mov eax, dword_4EFC4C
	mov dword [dword_4EFC58], ebx
	jmp loc_42F11E

loc_42F55A:
	mov dword [dword_4EFC54], 86h
	mov dword [dword_4EFC5C], 0FFh
	mov dword [dword_4EFC60], 18h
	xor eax, eax
	mov dword [dword_4EFC64], eax
	mov dword [dword_4EFC68], 61h
	mov dword [dword_4EFC70], 7FFFFFFFh
	mov eax, dword_4EFC4C
	mov dword [dword_4EFC58], ebp
	jmp loc_42F11E

loc_42F5A3:
	mov dword [dword_4EFC54], 86h
	mov eax, [esp+4]
	mov dword [dword_4EFC58], eax
	mov dword [dword_4EFC5C], 9Bh
	mov dword [dword_4EFC60], 18h
	xor eax, eax
	mov dword [dword_4EFC64], eax
	mov dword [dword_4EFC68], 31h
	mov dword [dword_4EFC70], 7FFFFFFFh
	mov eax, dword_4EFC4C
	jmp loc_42F11E

loc_42F5EF:
	mov dword [dword_4EFC54], 86h
	mov eax, [esp+8]
	mov dword [dword_4EFC58], eax
	mov dword [dword_4EFC5C], 0FFh
	mov dword [dword_4EFC60], 1Ch
	xor eax, eax
	mov dword [dword_4EFC64], eax
	mov dword [dword_4EFC68], 0C7h
	mov dword [dword_4EFC70], 7FFFFFFFh
	mov eax, dword_4EFC4C
	jmp loc_42F11E

loc_42F63B:
	cmp edx, 5
	ja loc_42F123
	jmp off_42ED98[ecx]

loc_42F64A:
	mov dword [dword_4EFC54], 86h
	mov dword [dword_4EFC5C], 9Bh
	mov dword [dword_4EFC60], 18h
	xor eax, eax
	mov dword [dword_4EFC64], eax
	mov dword [dword_4EFC68], eax
	mov dword [dword_4EFC70], 7F5F5F5Fh
	mov eax, dword_4EFC4C
	mov dword [dword_4EFC58], edi
	jmp loc_42F11E

loc_42F68E:
	mov dword [dword_4EFC54], 86h
	mov dword [dword_4EFC5C], 9Bh
	mov dword [dword_4EFC60], 18h
	xor eax, eax
	mov dword [dword_4EFC64], eax
	mov dword [dword_4EFC68], 19h
	mov dword [dword_4EFC70], 7F5F5F5Fh
	jmp loc_42F113

loc_42F6CC:
	mov dword [dword_4EFC54], 86h
	mov dword [dword_4EFC5C], 9Bh
	mov dword [dword_4EFC60], 18h
	xor eax, eax
	mov dword [dword_4EFC64], eax
	mov dword [dword_4EFC68], 49h
	mov dword [dword_4EFC70], 7F5F5F5Fh
	mov eax, dword_4EFC4C
	mov dword [dword_4EFC58], ebx
	jmp loc_42F11E

loc_42F715:
	mov dword [dword_4EFC54], 86h
	mov dword [dword_4EFC5C], 0FFh
	mov dword [dword_4EFC60], 18h
	xor eax, eax
	mov dword [dword_4EFC64], eax
	mov dword [dword_4EFC68], 61h
	mov dword [dword_4EFC70], 7F5F5F5Fh
	mov eax, dword_4EFC4C
	mov dword [dword_4EFC58], ebp
	jmp loc_42F11E

loc_42F75E:
	mov dword [dword_4EFC54], 86h
	mov eax, [esp+4]
	mov dword [dword_4EFC58], eax
	mov dword [dword_4EFC5C], 9Bh
	mov dword [dword_4EFC60], 18h
	xor eax, eax
	mov dword [dword_4EFC64], eax
	mov dword [dword_4EFC68], 31h
	mov dword [dword_4EFC70], 7F5F5F5Fh
	mov eax, dword_4EFC4C
	jmp loc_42F11E

loc_42F7AA:
	mov dword [dword_4EFC54], 86h
	mov eax, [esp+8]
	mov dword [dword_4EFC58], eax
	mov dword [dword_4EFC5C], 0FFh
	mov dword [dword_4EFC60], 1Ch
	xor eax, eax
	mov dword [dword_4EFC64], eax
	mov dword [dword_4EFC68], 0C7h
	mov dword [dword_4EFC70], 7F5F5F5Fh
	mov eax, dword_4EFC4C
	jmp loc_42F11E

loc_42F7F6:
	xor edx, edx
	mov edi, 0D1h
	mov bh, 8Fh
	mov bl, 0FFh
	mov esi, dword_4EFC90

loc_42F806:
	mov ecx, 81h
	mov eax, 0CBh
	mov byte [byte_4EFCB8], bl
	mov byte [byte_4EFCB9], bl
	mov byte [byte_4EFCBA], bl
	mov byte [byte_4EFCBB], bl
	add edx, 10h
	mov dword [dword_4EFC98], ecx
	mov dword [dword_4EFCA0], eax
	mov ecx, dword off_4D4BF4[edx]
	mov dword [dword_4EFCA8], eax
	sub ecx, 0Ah
	mov eax, 81h
	mov dword [dword_4EFC9C], ecx
	mov dword [dword_4EFCA4], ecx
	mov ecx, dword off_4D4BF4[edx]
	mov dword [dword_4EFCB0], eax
	sub ecx, 9
	mov eax, esi
	mov dword [dword_4EFCAC], ecx
	mov dword [dword_4EFCB4], ecx
	call sub_42A980
	mov ch, 7Fh
	mov eax, 0CBh
	mov byte [byte_4EFCB9], bh
	mov byte [byte_4EFCBA], bh
	mov byte [byte_4EFCBB], bh
	mov byte [byte_4EFCB8], ch
	mov ecx, 81h
	mov dword [dword_4EFCA0], eax
	mov dword [dword_4EFC98], ecx
	mov ecx, dword off_4D4BF4[edx]
	mov dword [dword_4EFCA8], eax
	sub ecx, 9
	mov eax, 81h
	mov dword [dword_4EFC9C], ecx
	mov dword [dword_4EFCA4], ecx
	mov ecx, dword off_4D4BF4[edx]
	mov dword [dword_4EFCB0], eax
	add ecx, 2
	mov eax, esi
	mov dword [dword_4EFCAC], ecx
	mov dword [dword_4EFCB4], ecx
	call sub_42A980
	mov eax, 203h
	mov byte [byte_4EFCB8], bl
	mov byte [byte_4EFCB9], bl
	mov ecx, dword off_4D4BF4[edx]
	mov byte [byte_4EFCBA], bl
	sub ecx, 0Ah
	mov byte [byte_4EFCBB], bl
	mov dword [dword_4EFC9C], ecx
	mov ecx, 203h
	mov dword [dword_4EFC98], edi
	mov dword [dword_4EFCA0], ecx
	mov ecx, dword [dword_4EFC9C]
	mov dword [dword_4EFCB0], edi
	mov dword [dword_4EFCA4], ecx
	mov ecx, dword off_4D4BF4[edx]
	mov dword [dword_4EFCA8], eax
	sub ecx, 9
	mov eax, esi
	mov dword [dword_4EFCAC], ecx
	mov dword [dword_4EFCB4], ecx
	call sub_42A980
	mov al, 7Fh
	mov byte [byte_4EFCB9], bh
	mov byte [byte_4EFCBA], bh
	mov byte [byte_4EFCBB], bh
	mov ecx, dword off_4D4BF4[edx]
	mov dword [dword_4EFC98], edi
	sub ecx, 9
	mov dword [dword_4EFCB0], edi
	mov dword [dword_4EFC9C], ecx
	mov ecx, 203h
	mov byte [byte_4EFCB8], al
	mov dword [dword_4EFCA0], ecx
	mov ecx, dword [dword_4EFC9C]
	mov eax, 203h
	mov dword [dword_4EFCA4], ecx
	mov ecx, dword dword_4D4C00[edx]
	mov dword [dword_4EFCA8], eax
	add ecx, 2
	mov eax, esi
	mov dword [dword_4EFCAC], ecx
	mov dword [dword_4EFCB4], ecx
	call sub_42A980
	cmp edx, 20h
	jnz loc_42F806
	mov eax, 1
	call sub_4211E0
	add esp, 0Ch
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_42EDB0 endp

sub_42F9F0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp
	mov edx, dword [dword_512208]
	mov ecx, 24h
	cmp edx, 1
	jle loc_42FA08
	xor ecx, ecx

loc_42FA08:
	call sub_42FCB0
	mov ebx, 26h
	mov esi, 1Dh
	mov edi, 0D1h
	mov ebp, 0E3h
	mov eax, 7FFFFFFFh
	xor edx, edx
	mov dword [dword_4EFC5C], ebx
	mov dword [dword_4EFC60], esi
	mov dword [dword_4EFC64], edi
	mov dword [dword_4EFC68], ebp
	mov dword [dword_4EFC70], eax
	mov ebx, dword_4EFC4C
	mov esi, 30h

loc_42FA4F:
	imul eax, edx, 26h
	add eax, 40h
	mov dword [dword_4EFC58], esi
	mov dword [dword_4EFC54], eax
	mov eax, ebx
	inc edx
	call sub_42ABF0
	cmp edx, 0Eh
	jl loc_42FA4F
	mov edi, 0FFh
	mov eax, 82h
	mov edx, 1Dh
	mov ebp, 14Eh
	mov dword [dword_4EFC58], esi
	xor ebx, ebx
	mov esi, 0E5h
	mov dword [dword_4EFC54], edi
	mov dword [dword_4EFC5C], eax
	mov dword [dword_4EFC60], edx
	mov dword [dword_4EFC64], ebx
	mov edi, 0FFFFFFFFh
	mov eax, dword_4EFC4C
	mov edx, 1Ch
	mov dword [dword_4EFC68], esi
	mov esi, 0ACh
	mov dword [dword_4EFC70], edi
	call sub_42ABF0
	mov edi, 7FFFFFFFh
	mov dword [dword_4EFC54], ebp
	lea eax, [ecx+9Eh]
	mov dword [dword_4EFC60], edx
	mov dword [dword_4EFC64], ebx
	mov dword [dword_4EFC58], eax
	mov eax, 0AAh
	mov dword [dword_4EFC68], esi
	mov dword [dword_4EFC5C], eax
	mov eax, dword_4EFC4C
	mov dword [dword_4EFC70], edi
	call sub_42ABF0
	lea eax, [ecx+0C2h]
	mov dword [dword_4EFC58], eax
	mov eax, dword_4EFC4C
	mov dword [dword_4EFC54], ebp
	call sub_42ABF0
	mov eax, dword [dword_512AA0]
	add eax, 163h
	mov dword [dword_4EFC98], eax
	lea eax, [ecx+0A6h]
	xor dl, dl
	mov dword [dword_4EFC9C], eax
	mov eax, 1E5h
	mov byte [byte_4EFCB9], dl
	mov dword [dword_4EFCA0], eax
	mov dword [dword_4EFCA8], eax
	lea eax, [ecx+0B2h]
	mov byte [byte_4EFCBA], dl
	mov dword [dword_4EFCAC], eax
	mov eax, dword [dword_4EFC98]
	mov esi, dword [dword_4EFC9C]
	mov dword [dword_4EFCB0], eax
	mov ah, 7Fh
	mov dword [dword_4EFCA4], esi
	mov byte [byte_4EFCB8], ah
	mov al, 0FFh
	mov ebx, dword [dword_4EFCAC]
	mov byte [byte_4EFCBB], al
	mov eax, dword_4EFC90
	mov dword [dword_4EFCB4], ebx
	call sub_42A980
	mov eax, dword [dword_512AA4]
	mov edi, 1E5h
	add eax, 163h
	mov dword [dword_4EFCA0], edi
	mov dword [dword_4EFC98], eax
	lea eax, [ecx+0CAh]
	mov dword [dword_4EFCA8], edi
	mov dword [dword_4EFC9C], eax
	mov edx, eax
	mov dword [dword_4EFCA4], eax
	add ecx, 0D6h
	mov eax, dword [dword_4EFC98]
	mov dword [dword_4EFCAC], ecx
	mov dword [dword_4EFCB0], eax
	mov eax, dword_4EFC90
	mov dword [dword_4EFCB4], ecx
	call sub_42A980
	mov eax, 163h
	mov dword [dword_4EFC9C], esi
	mov dword [dword_4EFCA4], esi
	mov dword [dword_4EFCAC], ebx
	mov dword [dword_4EFCB4], ebx
	mov dword [dword_4EFC98], eax
	mov eax, dword [dword_512AA0]
	mov esi, 163h
	add eax, 163h
	mov bl, 0FFh
	mov dword [dword_4EFCA0], eax
	mov dword [dword_4EFCA8], eax
	mov ah, 7Fh
	mov dword [dword_4EFCB0], esi
	mov byte [byte_4EFCB8], ah
	xor al, al
	mov byte [byte_4EFCB9], bl
	mov byte [byte_4EFCBB], al
	mov eax, dword_4EFC90
	mov byte [byte_4EFCBA], bl
	call sub_42A980
	mov eax, dword [dword_512AA4]
	mov dword [dword_4EFC98], esi
	mov dword [dword_4EFC9C], edx
	mov dword [dword_4EFCA4], edx
	mov dword [dword_4EFCAC], ecx
	add eax, esi
	mov dword [dword_4EFCB0], esi
	mov dword [dword_4EFCA0], eax
	mov dword [dword_4EFCA8], eax
	mov eax, dword_4EFC90
	mov dword [dword_4EFCB4], ecx
	call sub_42A980
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
;sub_42F9F0 endp

sub_42FCB0: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push ebp
	mov edx, 40h
	mov ecx, 30h
	mov ebp, 1B0h
	mov ebx, 240h
	push ebp
	mov dword [dword_4EFC98], edx
	mov dword [dword_4EFC9C], ecx
	push ebx
	mov dword [dword_4EFCA0], ebx
	mov dword [dword_4EFCA4], ecx
	push ecx
	mov dword [dword_4EFCA8], ebx
	mov dword [dword_4EFCAC], ebp
	push edx
	mov dword [dword_4EFCB0], edx
	mov dword [dword_4EFCB4], ebp
	call sub_497714
	mov ah, 3Fh
	mov dl, 10h
	mov byte [byte_4EFCB8], ah
	mov byte [byte_4EFCB9], dl
	mov byte [byte_4EFCBB], ah
	mov dh, 6
	mov eax, dword_4EFC90
	mov byte [byte_4EFCBA], dh
	call sub_42A980
	pop ebp
	pop edx
	pop ecx
	pop ebx
	ret
;sub_42FCB0 endp

sub_4301B0: ;SUBROUTINE
	push ecx
	push edx
	call sub_4307F0
	call sub_478020
	call sub_476250
	call sub_476CA0
	call sub_4642D0
	mov eax, dword_4EFCC8
	call sub_489B70
	call sub_478340
	call sub_421980
	call sub_4972BC
	jmp ExitProcess0
;sub_4301B0 endp

sub_430200: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	push edi
	push ebp
	mov ecx, 1E0h
	mov edx, 0A00000h
	mov eax, 3E8h
	mov ebx, 10h
	call sub_49CABC
	mov edx, 280h
	mov dword [dword_51304C], eax
	mov dword [dword_4DAB84], ebx
	mov dword [dword_4DAB7C], edx
	mov dword [dword_4DAB80], ecx
	call sub_49D020
	call sub_430920
	mov edx, sub_430760
	mov eax, 1
	push sub_430380
	push 218h
	call sub_482270
	cmp dword [dword_4DAB5C], 0
	jz loc_430366
	xor edi, edi
	mov ebp, 1
	mov dword [dword_4DB2EC], edi
	mov dword [dword_4DB208], ebp
	call sub_47F010
	mov eax, 80h
	call sub_483C18
	mov eax, 80h
	xor edx, edx
	mov dword [dword_4DABCC], eax
	mov eax, ebp
	xor ebx, ebx
	call sub_4642F0
	call sub_430780
	mov edx, 2000h
	mov eax, 14h
	call sub_48550C
	call sub_422530
	call sub_408730
	call sub_476DC0
	call sub_4769D0
	mov eax, ebp
	mov ecx, 0FFFFFFFFh
	call sub_464030
	mov ebx, ebp
	push dword_4EFCC8
	xor edx, edx
	mov eax, sub_453840
	call sub_489AE0
	call sub_478040
	mov edx, ebp
	mov eax, ebp
	call sub_428830
	push edi
	call grChromakeyMode
	call sub_49769C
	push 2
	push 0Ah
	call sub_497738
	push edi
	push 2
	call sub_497738
	call sub_433B30
	pop ebp
	pop edi
	pop edx
	pop ecx
	pop ebx
	ret

loc_430366:
	jmp ExitProcess0
;sub_430200 endp

sub_430380: ;SUBROUTINE
	mov eax, [esp+10h]
	test eax, eax
	jz loc_43038D
	cmp eax, 1
	jnz loc_430395

loc_43038D:
	mov eax, 424D5144h
	ret 18h

loc_430395:
	mov eax, 1
	ret 18h
;sub_430380 endp

sub_430760: ;SUBROUTINE
	cmp edx, 2Ch
	jz loc_43076B
	mov eax, 1
	ret

loc_43076B:
	mov byte [byte_4DB32B], 1
	mov eax, 1
	ret
;sub_430760 endp

sub_430780: ;SUBROUTINE
	push ecx
	push edx
	sub esp, 104h
	mov edx, dword [dword_5134C8]
	push edx
	push aSplatcfg_dat ; "%splatcfg.dat"
	lea eax, [esp+8]
	push eax
	call sprintf_
	add esp, 0Ch
	lea edx, [esp+100h]
	mov eax, esp
	call sub_49C628
	test eax, eax
	jz loc_4307CA
	mov ecx, [esp+100h]
	cmp ecx, 40133333h
	jg loc_4307CA
	cmp ecx, 3F800000h
	jge loc_4307D3

loc_4307CA:
	add esp, 104h
	pop edx
	pop ecx
	ret

loc_4307D3:
	mov dword [dword_4D4D20], ecx
	add esp, 104h
	pop edx
	pop ecx
	ret
;sub_430780 endp

sub_4307F0: ;SUBROUTINE
	push ebx
	push edx
	sub esp, 104h
	mov edx, dword [dword_5134C8]
	push edx
	mov eax, dword [dword_4D4D20]
	push aSplatcfg_dat ; "%splatcfg.dat"
	mov [esp+108h], eax
	lea eax, [esp+8]
	push eax
	mov ebx, 4
	call sprintf_
	add esp, 0Ch
	lea edx, [esp+100h]
	mov eax, esp
	call sub_4875B0
	add esp, 104h
	pop edx
	pop ebx
	ret
;sub_4307F0 endp

sub_430840: ;SUBROUTINE
	mov eax, 1
	jmp sub_435500
;sub_430840 endp

sub_430850: ;SUBROUTINE
	xor eax, eax
	jmp sub_435500
;sub_430850 endp

;	Attributes: thunk

sub_430860: ;SUBROUTINE
	jmp sub_4848FC
;sub_430860 endp

sub_430870: ;SUBROUTINE
	push ebx
	push ecx
	push edx
	mov edx, aCNfs2seGame3ra ; "c:\\nfs2se\\game\\3rash\\platform.c"
	mov ecx, 0B9h
	mov dword [eax], 0AF000h
	xor ebx, ebx
	mov eax, aDynamicRenderi ; "Dynamic rendering buffer"
	mov dword [dword_4DB1D8], edx
	mov edx, 0AF000h
	mov dword [dword_4DB1DC], ecx
	call sub_484498
	pop edx
	pop ecx
	pop ebx
	ret
;sub_430870 endp

sub_430920: ;SUBROUTINE
	call sub_490AD0
	mov dword [hWnd], eax
	test eax, eax
	jz loc_4309F5
	mov ah, byte [dword_4D5278]
	and ah, 0E6h
	mov byte [dword_4D5278], ah
	jmp loc_4309E8

loc_4309A7:
	mov eax, dword [hWnd]
	push eax ; hWnd
	call SetForegroundWindow_wrap
	xor eax, eax
	ret

loc_4309E8:
	mov dl, ah
	or dl, 11h
	mov byte [dword_4D5278], dl
	jmp loc_4309A7

loc_4309F5:
	mov eax, 578h
	pop ebp
	pop edx
	pop ecx
	ret
;sub_430920 endp

sub_430B80: ;SUBROUTINE
	push esi
	push edi
	push ebp
	sub esp, 10h
	mov edi, eax
	mov esi, ebx
	mov ebp, ecx
	mov al, [eax+14h]
	mov [esp+0Ch], al
	mov al, [edx+14h]
	mov [esp+0Dh], al
	mov al, [ebx+14h]
	mov [esp+0Eh], al
	mov al, [ecx+14h]
	mov [esp+0Fh], al
	mov al, [esp+0Ch]
	and al, [esp+0Dh]
	mov ah, [esp+0Eh]
	and ah, al
	mov al, [esp+0Fh]
	and al, ah
	jnz loc_430C0A
	mov al, [esp+0Ch]
	or al, [esp+0Dh]
	or al, [esp+0Eh]
	mov bl, [esp+0Fh]
	or bl, al
	jz loc_430C11
	test ah, ah
	jnz loc_430BE3
	test al, al
	jnz loc_430C1D
	push esi
	push edx
	push edi
	call sub_4983B0

loc_430BE3:
	mov al, [esp+0Ch]
	mov cl, [esp+0Eh]
	and al, cl
	mov ch, [esp+0Fh]
	and al, ch
	jnz loc_430C0A
	mov al, [esp+0Ch]
	or al, cl
	mov ah, ch
	or ah, al
	jnz loc_430C39
	push ebp
	push esi
	push edi
	call sub_4983B0

loc_430C0A:
	add esp, 10h
	pop ebp
	pop edi
	pop esi
	ret

loc_430C11:
	push ecx
	push esi
	push edx
	push edi
	call sub_497B24
	jmp loc_430C0A

loc_430C1D:
	mov [esp], edi
	mov [esp+4], edx
	xor ebx, ebx
	lea edx, [esp+0Ch]
	mov bl, al
	mov eax, esp
	mov [esp+8], esi
	call sub_430C70
	jmp loc_430BE3

loc_430C39:
	lea edx, [esp+0Ch]
	mov [esp], edi
	mov [esp+4], esi
	mov [esp+8], ebp
	xor ebx, ebx
	mov [esp+0Dh], cl
	mov bl, ah
	mov eax, esp
	mov [esp+0Eh], ch
	call sub_430C70
	add esp, 10h
	pop ebp
	pop edi
	pop esi
	ret
;sub_430B80 endp

sub_430C70: ;SUBROUTINE
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 104h
	mov [esp+100h], bl
	mov ecx, off_4D52C0
	mov edi, dword_4F1E7C
	xor esi, esi
	mov [esp], ecx
	mov [esp+0F8h], esi
	mov ecx, 8
	mov [esp+14h], esi
	mov esi, [eax]
	rep movsd
	mov ecx, 8
	mov edi, dword_4F1E9C
	mov esi, [eax+4]
	rep movsd
	mov ecx, 8
	mov edi, dword_4F1EBC
	mov esi, [eax+8]
	mov ebx, 3
	rep movsd
	xor eax, eax
	mov edi, dword_4F16C4
	mov esi, dword_4F15FC
	mov dword [dword_4F1E90], eax
	mov dword [dword_4F1EB0], eax
	mov dword [dword_4F1ED0], eax
	mov ah, [esp+100h]
	mov [esp+10h], edi
	test ah, 30h
	jz loc_4314B8
	test ah, 10h
	jz loc_43108C
	mov eax, 2
	mov edi, off_4D52C0
	mov [esp+78h], edx
	xor ebp, ebp
	xor ecx, ecx
	mov [esp+0ECh], eax
	mov [esp+4], ebp
	mov [esp+7Ch], edi

loc_430D20:
	mov eax, [esp+0ECh]
	add eax, edx
	mov [esp+44h], eax
	test byte [eax], 10h
	jnz loc_430D71
	lea eax, 0[ebp*4]
	mov edi, [esp+0ECh]
	mov [esp+0D0h], eax
	shl edi, 2
	mov eax, dword_4F16C4
	add edi, off_4D52C0
	add eax, [esp+0D0h]
	mov edi, [edi]
	mov [eax], edi
	mov edi, ebp
	mov eax, [esp+44h]
	add edi, dword_4F15FC
	mov al, [eax]
	inc ebp
	mov [edi], al

loc_430D71:
	mov eax, [esp+0ECh]
	mov al, [edx+eax]
	and eax, 0FFh
	mov edi, [esp+78h]
	mov [esp+0D4h], eax
	xor eax, eax
	mov al, [edi]
	mov [esp+0D0h], eax
	mov eax, [esp+0D4h]
	xor eax, [esp+0D0h]
	test al, 10h
	jz loc_431033
	mov eax, [esp+0ECh]
	mov edi, off_4D52C0
	shl eax, 2
	add edi, eax
	mov eax, [edi]
	mov [esp+0D0h], eax
	mov eax, [esp+7Ch]
	mov [esp+0D4h], edi
	mov edi, [esp+0D0h]
	mov eax, [eax]
	fld dword [edi+0Ch]
	fsub dword [eax+0Ch]
	fld dword [dword_4F1E00]
	fld dword [edi+0Ch]
	fsub st0, st1
	fdivrp st2, st0
	fld dword [edi]
	fsub dword [eax]
	fxch st2
	fstp dword [esp+0F0h]
	fxch st1
	fmul dword [esp+0F0h]
	fld dword [edi+4]
	fsub dword [eax+4]
	fmul dword [esp+0F0h]
	fxch st1
	fsubr dword [edi]
	mov eax, [esp+0D4h]
	fstp dword flt_4EFCFC[ecx]
	mov eax, [eax]
	fsubr dword [eax+4]
	mov edi, [esp+0D4h]
	fstp dword flt_4EFD00[ecx]
	mov edi, [edi]
	mov eax, [edi+10h]
	and eax, 0FFh
	mov [esp+2Ch], eax
	mov eax, [edi+10h]
	shr eax, 8
	and eax, 0FFh
	mov [esp+24h], eax
	mov eax, [edi+10h]
	mov edi, [edi+10h]
	shr edi, 18h
	and edi, 0FFh
	shr eax, 10h
	mov [esp+18h], edi
	mov edi, [esp+7Ch]
	and eax, 0FFh
	mov edi, [edi]
	mov [esp+1Ch], eax
	mov eax, [edi+10h]
	and eax, 0FFh
	mov [esp+30h], eax
	mov eax, [edi+10h]
	shr eax, 8
	and eax, 0FFh
	mov [esp+28h], eax
	mov eax, [edi+10h]
	shr eax, 10h
	mov edi, [edi+10h]
	shr edi, 18h
	and eax, 0FFh
	and edi, 0FFh
	mov [esp+20h], eax
	mov eax, [esp+18h]
	sub eax, edi
	mov edi, [esp+20h]
	mov [esp+0FCh], eax
	mov eax, [esp+1Ch]
	fild dword [esp+0FCh]
	sub eax, edi
	fmul dword [esp+0F0h]
	mov [esp+0FCh], eax
	mov edi, [esp+24h]
	fild dword [esp+0FCh]
	mov eax, [esp+28h]
	fmul dword [esp+0F0h]
	sub edi, eax
	mov eax, [esp+30h]
	mov [esp+0FCh], edi
	mov edi, [esp+2Ch]
	sub edi, eax
	fild dword [esp+0FCh]
	mov [esp+0FCh], edi
	fmul dword [esp+0F0h]
	fild dword [esp+0FCh]
	fmul dword [esp+0F0h]
	fxch st3
	call __CHP
	fistp dword [esp+0D0h]
	fxch st1
	call __CHP
	fistp dword [esp+0D4h]
	mov eax, [esp+0D0h]
	call __CHP
	mov edi, [esp+18h]
	fistp dword [esp+0D0h]
	sub edi, eax
	mov eax, [esp+0D4h]
	mov [esp+18h], edi
	mov edi, [esp+1Ch]
	call __CHP
	sub edi, eax
	mov eax, [esp+0D0h]
	mov [esp+1Ch], edi
	mov edi, [esp+24h]
	fistp dword [esp+0D0h]
	sub edi, eax
	mov eax, [esp+0D0h]
	mov [esp+24h], edi
	sub [esp+2Ch], eax
	mov edi, [esp+1Ch]
	mov eax, [esp+18h]
	shl edi, 10h
	shl eax, 18h
	or edi, eax
	mov eax, [esp+24h]
	shl eax, 8
	or eax, edi
	mov edi, [esp+2Ch]
	or eax, edi
	mov dword dword_4EFD0C[ecx], eax
	xor eax, eax
	mov edi, dword_4F15FC
	mov dword dword_4EFD04[ecx], eax
	add edi, ebp
	fstp dword flt_4EFD08[ecx]
	mov byte [edi], 10h
	fld dword flt_4EFD00[ecx]
	fcomp dword [dword_4F1DF4]
	fnstsw ax
	sahf
	jnb loc_4324BF
	or byte [edi], 8

loc_430FEA:
	mov edi, dword_4F15FC
	fld dword flt_4EFCFC[ecx]
	add edi, ebp
	fcomp dword [dword_4F1DF0]
	fnstsw ax
	sahf
	jnb loc_4324DC
	or byte [edi], 1

loc_431009:
	mov edi, [esp+0F8h]
	inc edi
	mov eax, ecx
	mov [esp+0F8h], edi
	mov edi, flt_4EFCFC
	add edi, eax
	lea eax, 0[ebp*4]
	add ecx, 20h
	add eax, dword_4F16C4
	inc ebp
	mov [eax], edi

loc_431033:
	mov eax, [esp+4]
	mov [esp+0ECh], eax
	mov eax, [esp+78h]
	mov edi, [esp+7Ch]
	inc eax
	dec ebx
	mov [esp+78h], eax
	mov eax, [esp+4]
	add edi, 4
	inc eax
	mov [esp+7Ch], edi
	mov [esp+4], eax
	test ebx, ebx
	jg loc_430D20
	cmp ebp, 3
	jl loc_4324F9
	mov edx, dword_4F16C4
	mov ecx, [esp+10h]
	mov ebx, ebp
	lea eax, 0[ebp*4]
	mov [esp], edx
	add ecx, eax
	mov edx, esi
	mov [esp+10h], ecx
	add esi, ebp

loc_43108C:
	test byte [esp+100h], 20h
	jz loc_431491
	mov ecx, [esp+0F8h]
	lea eax, [ebx-1]
	mov [esp+80h], edx
	xor ebp, ebp
	mov [esp+0B8h], eax
	mov [esp+0CCh], ebp
	mov eax, [esp]
	shl ecx, 5
	mov [esp+84h], eax

loc_4310C8:
	mov eax, [esp+0B8h]
	add eax, edx
	mov [esp+48h], eax
	test byte [eax], 20h
	jnz loc_431114
	mov eax, [esp+0B8h]
	mov edi, [esp]
	shl eax, 2
	add eax, edi
	lea edi, 0[ebp*4]
	mov [esp+0D0h], edi
	mov edi, [esp+10h]
	add edi, [esp+0D0h]
	mov eax, [eax]
	mov [edi], eax
	mov eax, ebp
	lea edi, [esi+eax]
	mov eax, [esp+48h]
	inc ebp
	mov al, [eax]
	mov [edi], al

loc_431114:
	mov eax, [esp+0B8h]
	mov al, [edx+eax]
	and eax, 0FFh
	mov edi, [esp+80h]
	mov [esp+0D4h], eax
	xor eax, eax
	mov al, [edi]
	mov [esp+0D0h], eax
	mov eax, [esp+0D4h]
	xor eax, [esp+0D0h]
	test al, 20h
	jz loc_431424
	mov eax, [esp+0B8h]
	mov edi, [esp]
	shl eax, 2
	add edi, eax
	mov eax, [edi]
	mov [esp+0D0h], eax
	mov eax, [esp+84h]
	mov [esp+0D4h], edi
	mov edi, [esp+0D0h]
	mov eax, [eax]
	fld dword [edi+0Ch]
	fsub dword [eax+0Ch]
	fld dword [edi]
	fld dword [dword_4F1DF8]
	fld dword [edi+0Ch]
	fsub st0, st1
	fxch st2
	fsub dword [eax]
	fxch st2
	fdivrp st3, st0
	fxch st1
	fmul st0, st2
	fld dword [edi+4]
	fsub dword [eax+4]
	fmul st0, st3
	fxch st1
	fsubr dword [edi]
	mov eax, [esp+0D4h]
	fstp dword flt_4EFCFC[ecx]
	mov eax, [eax]
	fsubr dword [eax+4]
	mov edi, [esp+0D4h]
	fstp dword flt_4EFD00[ecx]
	mov edi, [edi]
	mov eax, [edi+10h]
	and eax, 0FFh
	mov [esp+0E4h], eax
	mov eax, [edi+10h]
	shr eax, 8
	and eax, 0FFh
	mov [esp+0DCh], eax
	mov eax, [edi+10h]
	shr eax, 10h
	mov edi, [edi+10h]
	shr edi, 18h
	and eax, 0FFh
	and edi, 0FFh
	mov [esp+0D4h], eax
	mov eax, [esp+84h]
	mov [esp+0D0h], edi
	mov edi, [eax]
	mov eax, [edi+10h]
	and eax, 0FFh
	mov [esp+0E8h], eax
	mov eax, [edi+10h]
	shr eax, 8
	and eax, 0FFh
	mov [esp+0E0h], eax
	mov eax, [edi+10h]
	shr eax, 10h
	and eax, 0FFh
	mov [esp+0D8h], eax
	mov eax, [edi+10h]
	shr eax, 18h
	mov edi, [esp+0D0h]
	and eax, 0FFh
	sub edi, eax
	mov eax, [esp+0D4h]
	mov [esp+0FCh], edi
	mov edi, [esp+0D8h]
	fild dword [esp+0FCh]
	sub eax, edi
	fmul st0, st2
	mov [esp+0FCh], eax
	mov edi, [esp+0DCh]
	fild dword [esp+0FCh]
	mov eax, [esp+0E0h]
	fmul st0, st3
	sub edi, eax
	mov eax, [esp+0E8h]
	mov [esp+0FCh], edi
	mov edi, [esp+0E4h]
	sub edi, eax
	fild dword [esp+0FCh]
	mov [esp+0FCh], edi
	fmul st0, st4
	fild dword [esp+0FCh]
	fmulp st5, st0
	fxch st2
	call __CHP
	fistp dword [esp+0D8h]
	call __CHP
	fistp dword [esp+0E0h]
	mov eax, [esp+0D8h]
	call __CHP
	mov edi, [esp+0D0h]
	fistp dword [esp+0D8h]
	sub edi, eax
	mov eax, [esp+0E0h]
	mov [esp+0D0h], edi
	mov edi, [esp+0D4h]
	fxch st1
	call __CHP
	sub edi, eax
	mov eax, [esp+0D8h]
	mov [esp+0D4h], edi
	mov edi, [esp+0DCh]
	fistp dword [esp+0D8h]
	sub edi, eax
	mov eax, [esp+0D8h]
	mov [esp+0DCh], edi
	mov edi, [esp+0E4h]
	sub edi, eax
	mov eax, [esp+0D0h]
	shl eax, 18h
	mov [esp+0E4h], edi
	mov [esp+0D0h], eax
	mov eax, [esp+0D4h]
	mov edi, [esp+0D0h]
	shl eax, 10h
	or edi, eax
	mov eax, [esp+0DCh]
	shl eax, 8
	or eax, edi
	mov edi, [esp+0E4h]
	or eax, edi
	mov dword dword_4EFD0C[ecx], eax
	mov dword dword_4EFD04[ecx], 3F800000h
	lea edi, [esi+ebp]
	fstp dword flt_4EFD08[ecx]
	mov byte [edi], 10h
	fld dword flt_4EFD00[ecx]
	fcomp dword [dword_4F1DF4]
	fnstsw ax
	sahf
	jnb loc_43250B
	or byte [edi], 8

loc_4313D0:
	fld dword flt_4EFCFC[ecx]
	lea edi, [esi+ebp]
	fcomp dword [dword_4F1DF0]
	fnstsw ax
	sahf
	jnb loc_432528
	or byte [edi], 1

loc_4313EB:
	mov edi, [esp+0F8h]
	inc edi
	mov eax, ecx
	mov [esp+0F8h], edi
	mov edi, flt_4EFCFC
	add edi, eax
	mov [esp+0D0h], edi
	lea eax, 0[ebp*4]
	mov edi, [esp+10h]
	add ecx, 20h
	add eax, edi
	mov edi, [esp+0D0h]
	inc ebp
	mov [eax], edi

loc_431424:
	mov eax, [esp+0CCh]
	mov [esp+0B8h], eax
	mov eax, [esp+80h]
	mov edi, [esp+84h]
	inc eax
	dec ebx
	mov [esp+80h], eax
	mov eax, [esp+0CCh]
	add edi, 4
	inc eax
	mov [esp+84h], edi
	mov [esp+0CCh], eax
	test ebx, ebx
	jg loc_4310C8
	cmp ebp, 3
	jl loc_4324F9
	mov eax, [esp+10h]
	mov ecx, [esp+10h]
	mov ebx, ebp
	mov [esp], eax
	lea eax, 0[ebp*4]
	mov edx, esi
	add ecx, eax
	add esi, ebp
	mov [esp+10h], ecx

loc_431491:
	dec ebp
	lea ecx, [edx+ebp]
	mov al, [ecx]
	mov [esp+100h], al

loc_43149E:
	mov al, [ecx-1]
	mov ah, [esp+100h]
	dec ebp
	or ah, al
	dec ecx
	mov [esp+100h], ah
	test ebp, ebp
	jg loc_43149E
	nop

loc_4314B8:
	mov cl, [esp+100h]
	test cl, 0Ch
	jz loc_431CA0
	test cl, 4
	jz loc_43189E
	mov ecx, [esp+0F8h]
	lea eax, [ebx-1]
	mov [esp+88h], edx
	xor ebp, ebp
	mov [esp+0B4h], eax
	mov [esp+0C8h], ebp
	mov eax, [esp]
	shl ecx, 5
	mov [esp+8Ch], eax

loc_4314FF:
	mov eax, [esp+0B4h]
	add eax, edx
	mov [esp+4Ch], eax
	test byte [eax], 4
	jnz loc_43154D
	mov eax, [esp+0B4h]
	mov edi, [esp]
	shl eax, 2
	add edi, eax
	mov [esp+0D0h], edi
	lea eax, 0[ebp*4]
	mov edi, [esp+10h]
	add edi, eax
	mov eax, [esp+0D0h]
	mov eax, [eax]
	mov [edi], eax
	mov eax, ebp
	lea edi, [esi+eax]
	mov eax, [esp+4Ch]
	inc ebp
	mov al, [eax]
	mov [edi], al

loc_43154D:
	mov eax, [esp+0B4h]
	add eax, edx
	mov [esp+50h], eax
	mov edi, [esp+50h]
	xor eax, eax
	mov al, [edi]
	mov edi, [esp+88h]
	mov [esp+0D4h], eax
	xor eax, eax
	mov al, [edi]
	mov [esp+0D0h], eax
	mov eax, [esp+0D4h]
	xor eax, [esp+0D0h]
	test al, 4
	jz loc_431831
	mov eax, [esp+0B4h]
	mov edi, [esp]
	shl eax, 2
	add edi, eax
	mov eax, [edi]
	mov [esp+0D0h], eax
	mov eax, [esp+8Ch]
	mov [esp+0D4h], edi
	mov edi, [esp+0D0h]
	mov eax, [eax]
	fld dword [edi+4]
	fsub dword [eax+4]
	fld dword [edi]
	fld dword [dword_4F1DEC]
	fld dword [edi+4]
	fsub st0, st1
	fxch st2
	fsub dword [eax]
	fxch st2
	fdivrp st3, st0
	fxch st1
	fmul st0, st2
	fld dword [edi+0Ch]
	fsub dword [eax+0Ch]
	fmul st0, st3
	fxch st1
	fsubr dword [edi]
	mov eax, [esp+0D4h]
	fstp dword flt_4EFCFC[ecx]
	mov eax, [eax]
	fsubr dword [eax+0Ch]
	mov edi, [esp+0D4h]
	fstp dword flt_4EFD08[ecx]
	mov edi, [edi]
	mov eax, [edi+10h]
	and eax, 0FFh
	mov [esp+0E4h], eax
	mov eax, [edi+10h]
	shr eax, 8
	and eax, 0FFh
	mov [esp+0DCh], eax
	mov eax, [edi+10h]
	shr eax, 10h
	mov edi, [edi+10h]
	shr edi, 18h
	and eax, 0FFh
	and edi, 0FFh
	mov [esp+0D4h], eax
	mov eax, [esp+8Ch]
	mov [esp+0D0h], edi
	mov edi, [eax]
	mov eax, [edi+10h]
	and eax, 0FFh
	mov [esp+0E8h], eax
	mov eax, [edi+10h]
	shr eax, 8
	and eax, 0FFh
	mov [esp+0E0h], eax
	mov eax, [edi+10h]
	shr eax, 10h
	mov edi, [edi+10h]
	shr edi, 18h
	and eax, 0FFh
	and edi, 0FFh
	mov [esp+0D8h], eax
	mov eax, [esp+0D0h]
	sub eax, edi
	mov edi, [esp+0D8h]
	mov [esp+0FCh], eax
	mov eax, [esp+0D4h]
	fild dword [esp+0FCh]
	sub eax, edi
	fmul st0, st2
	mov [esp+0FCh], eax
	mov edi, [esp+0E0h]
	fild dword [esp+0FCh]
	mov eax, [esp+0DCh]
	fmul st0, st3
	sub eax, edi
	mov edi, [esp+0E8h]
	mov [esp+0FCh], eax
	mov eax, [esp+0E4h]
	sub eax, edi
	fild dword [esp+0FCh]
	mov [esp+0FCh], eax
	fmul st0, st4
	fild dword [esp+0FCh]
	fmulp st5, st0
	fxch st2
	call __CHP
	fistp dword [esp+0D8h]
	call __CHP
	fistp dword [esp+0E0h]
	mov edi, [esp+0D0h]
	call __CHP
	mov eax, [esp+0D8h]
	fistp dword [esp+0D8h]
	sub edi, eax
	mov eax, [esp+0E0h]
	mov [esp+0D0h], edi
	mov edi, [esp+0D4h]
	fxch st1
	call __CHP
	sub edi, eax
	mov eax, [esp+0D8h]
	mov [esp+0D4h], edi
	mov edi, [esp+0DCh]
	fistp dword [esp+0D8h]
	sub edi, eax
	mov eax, [esp+0D8h]
	mov [esp+0DCh], edi
	sub [esp+0E4h], eax
	mov edi, [esp+0D4h]
	mov eax, [esp+0D0h]
	shl edi, 10h
	shl eax, 18h
	or edi, eax
	mov eax, [esp+0DCh]
	shl eax, 8
	or eax, edi
	mov edi, [esp+0E4h]
	or eax, edi
	mov dword dword_4EFD0C[ecx], eax
	mov edi, [esp+50h]
	fstp dword flt_4EFD00[ecx]
	mov al, [edi]
	and al, 0F0h
	lea edi, [esi+ebp]
	or al, 4
	mov [edi], al
	fld dword flt_4EFCFC[ecx]
	fcomp dword [dword_4F1DF0]
	fnstsw ax
	sahf
	jnb loc_432545
	or byte [edi], 1

loc_4317F8:
	mov edi, [esp+0F8h]
	inc edi
	mov eax, ecx
	mov [esp+0F8h], edi
	mov edi, flt_4EFCFC
	add edi, eax
	mov [esp+0D0h], edi
	lea eax, 0[ebp*4]
	mov edi, [esp+10h]
	add ecx, 20h
	add eax, edi
	mov edi, [esp+0D0h]
	inc ebp
	mov [eax], edi

loc_431831:
	mov eax, [esp+0C8h]
	mov [esp+0B4h], eax
	mov eax, [esp+88h]
	mov edi, [esp+8Ch]
	inc eax
	dec ebx
	mov [esp+88h], eax
	mov eax, [esp+0C8h]
	add edi, 4
	inc eax
	mov [esp+8Ch], edi
	mov [esp+0C8h], eax
	test ebx, ebx
	jg loc_4314FF
	cmp ebp, 3
	jl loc_4324F9
	mov eax, [esp+10h]
	mov ecx, [esp+10h]
	mov ebx, ebp
	mov [esp], eax
	lea eax, 0[ebp*4]
	mov edx, esi
	add ecx, eax
	add esi, ebp
	mov [esp+10h], ecx

loc_43189E:
	test byte [esp+100h], 8
	jz loc_431C79
	mov ecx, [esp+0F8h]
	lea eax, [ebx-1]
	mov [esp+90h], edx
	xor ebp, ebp
	mov [esp+0B0h], eax
	mov [esp+0C4h], ebp
	mov eax, [esp]
	shl ecx, 5
	mov [esp+94h], eax

loc_4318DA:
	mov eax, [esp+0B0h]
	add eax, edx
	mov [esp+54h], eax
	test byte [eax], 8
	jnz loc_431928
	mov eax, [esp+0B0h]
	mov edi, [esp]
	shl eax, 2
	add edi, eax
	mov [esp+0D0h], edi
	lea eax, 0[ebp*4]
	mov edi, [esp+10h]
	add edi, eax
	mov eax, [esp+0D0h]
	mov eax, [eax]
	mov [edi], eax
	mov eax, ebp
	lea edi, [esi+eax]
	mov eax, [esp+54h]
	inc ebp
	mov al, [eax]
	mov [edi], al

loc_431928:
	mov eax, [esp+0B0h]
	add eax, edx
	mov [esp+58h], eax
	mov edi, [esp+58h]
	xor eax, eax
	mov al, [edi]
	mov edi, [esp+90h]
	mov [esp+0D4h], eax
	xor eax, eax
	mov al, [edi]
	mov [esp+0D0h], eax
	mov eax, [esp+0D4h]
	xor eax, [esp+0D0h]
	test al, 8
	jz loc_431C0C
	mov eax, [esp+0B0h]
	mov edi, [esp]
	shl eax, 2
	add edi, eax
	mov eax, [edi]
	mov [esp+0D0h], eax
	mov eax, [esp+94h]
	mov [esp+0D4h], edi
	mov edi, [esp+0D0h]
	mov eax, [eax]
	fld dword [edi+4]
	fsub dword [eax+4]
	fld dword [edi]
	fld dword [dword_4F1DF4]
	fld dword [edi+4]
	fsub st0, st1
	fxch st2
	fsub dword [eax]
	fxch st2
	fdivrp st3, st0
	fxch st1
	fmul st0, st2
	fld dword [edi+0Ch]
	fsub dword [eax+0Ch]
	fmul st0, st3
	fxch st1
	fsubr dword [edi]
	mov eax, [esp+0D4h]
	fstp dword flt_4EFCFC[ecx]
	mov eax, [eax]
	fsubr dword [eax+0Ch]
	mov edi, [esp+0D4h]
	fstp dword flt_4EFD08[ecx]
	mov edi, [edi]
	mov eax, [edi+10h]
	and eax, 0FFh
	mov [esp+0E4h], eax
	mov eax, [edi+10h]
	shr eax, 8
	and eax, 0FFh
	mov [esp+0DCh], eax
	mov eax, [edi+10h]
	shr eax, 10h
	mov edi, [edi+10h]
	shr edi, 18h
	and eax, 0FFh
	and edi, 0FFh
	mov [esp+0D4h], eax
	mov eax, [esp+94h]
	mov [esp+0D0h], edi
	mov edi, [eax]
	mov eax, [edi+10h]
	and eax, 0FFh
	mov [esp+0E8h], eax
	mov eax, [edi+10h]
	shr eax, 8
	and eax, 0FFh
	mov [esp+0E0h], eax
	mov eax, [edi+10h]
	shr eax, 10h
	mov edi, [edi+10h]
	shr edi, 18h
	and eax, 0FFh
	and edi, 0FFh
	mov [esp+0D8h], eax
	mov eax, [esp+0D0h]
	sub eax, edi
	mov edi, [esp+0D8h]
	mov [esp+0FCh], eax
	mov eax, [esp+0D4h]
	fild dword [esp+0FCh]
	sub eax, edi
	fmul st0, st2
	mov [esp+0FCh], eax
	mov edi, [esp+0E0h]
	fild dword [esp+0FCh]
	mov eax, [esp+0DCh]
	fmul st0, st3
	sub eax, edi
	mov edi, [esp+0E8h]
	mov [esp+0FCh], eax
	mov eax, [esp+0E4h]
	sub eax, edi
	fild dword [esp+0FCh]
	mov [esp+0FCh], eax
	fmul st0, st4
	fild dword [esp+0FCh]
	fmulp st5, st0
	fxch st2
	call __CHP
	fistp dword [esp+0D8h]
	call __CHP
	fistp dword [esp+0E0h]
	mov edi, [esp+0D0h]
	call __CHP
	mov eax, [esp+0D8h]
	fistp dword [esp+0D8h]
	sub edi, eax
	mov eax, [esp+0E0h]
	mov [esp+0D0h], edi
	mov edi, [esp+0D4h]
	fxch st1
	call __CHP
	sub edi, eax
	mov eax, [esp+0D8h]
	mov [esp+0D4h], edi
	mov edi, [esp+0DCh]
	fistp dword [esp+0D8h]
	sub edi, eax
	mov eax, [esp+0D8h]
	mov [esp+0DCh], edi
	sub [esp+0E4h], eax
	mov edi, [esp+0D4h]
	mov eax, [esp+0D0h]
	shl edi, 10h
	shl eax, 18h
	or eax, edi
	mov edi, [esp+0DCh]
	shl edi, 8
	or eax, edi
	mov edi, [esp+0E4h]
	or eax, edi
	mov dword dword_4EFD0C[ecx], eax
	mov edi, [esp+58h]
	fstp dword flt_4EFD00[ecx]
	mov al, [edi]
	and al, 0F0h
	lea edi, [esi+ebp]
	or al, 8
	mov [edi], al
	fld dword flt_4EFCFC[ecx]
	fcomp dword [dword_4F1DF0]
	fnstsw ax
	sahf
	jnb loc_432562
	or byte [edi], 1

loc_431BD3:
	mov edi, [esp+0F8h]
	inc edi
	mov eax, ecx
	mov [esp+0F8h], edi
	mov edi, flt_4EFCFC
	add edi, eax
	mov [esp+0D0h], edi
	lea eax, 0[ebp*4]
	mov edi, [esp+10h]
	add ecx, 20h
	add eax, edi
	mov edi, [esp+0D0h]
	inc ebp
	mov [eax], edi

loc_431C0C:
	mov eax, [esp+0C4h]
	mov [esp+0B0h], eax
	mov eax, [esp+90h]
	mov edi, [esp+94h]
	inc eax
	dec ebx
	mov [esp+90h], eax
	mov eax, [esp+0C4h]
	add edi, 4
	inc eax
	mov [esp+94h], edi
	mov [esp+0C4h], eax
	test ebx, ebx
	jg loc_4318DA
	cmp ebp, 3
	jl loc_4324F9
	mov eax, [esp+10h]
	mov ecx, [esp+10h]
	mov ebx, ebp
	mov [esp], eax
	lea eax, 0[ebp*4]
	mov edx, esi
	add ecx, eax
	add esi, ebp
	mov [esp+10h], ecx

loc_431C79:
	dec ebp
	lea ecx, [edx+ebp]
	mov al, [ecx]
	mov [esp+100h], al

loc_431C86:
	mov al, [ecx-1]
	mov ah, [esp+100h]
	dec ebp
	or ah, al
	dec ecx
	mov [esp+100h], ah
	test ebp, ebp
	jg loc_431C86
	nop

loc_431CA0:
	mov cl, [esp+100h]
	test cl, 3
	jz loc_432440
	test cl, 1
	jz loc_432079
	mov ebp, [esp+0F8h]
	lea eax, [ebx-1]
	mov [esp+98h], edx
	xor ecx, ecx
	mov [esp+0ACh], eax
	mov [esp+0C0h], ecx
	mov eax, [esp]
	shl ebp, 5
	mov [esp+9Ch], eax

loc_431CE7:
	mov eax, [esp+0ACh]
	add eax, edx
	mov [esp+5Ch], eax
	test byte [eax], 1
	jnz loc_431D35
	mov eax, [esp+0ACh]
	mov edi, [esp]
	shl eax, 2
	add edi, eax
	mov [esp+0D0h], edi
	lea eax, 0[ecx*4]
	mov edi, [esp+10h]
	add edi, eax
	mov eax, [esp+0D0h]
	mov eax, [eax]
	mov [edi], eax
	mov eax, ecx
	lea edi, [esi+eax]
	mov eax, [esp+5Ch]
	inc ecx
	mov al, [eax]
	mov [edi], al

loc_431D35:
	mov eax, [esp+0ACh]
	add eax, edx
	mov [esp+60h], eax
	mov edi, [esp+60h]
	xor eax, eax
	mov al, [edi]
	mov edi, [esp+98h]
	mov [esp+0D4h], eax
	xor eax, eax
	mov al, [edi]
	mov [esp+0D0h], eax
	mov eax, [esp+0D4h]
	xor eax, [esp+0D0h]
	test al, 1
	jz loc_43200C
	mov eax, [esp+0ACh]
	mov edi, [esp]
	shl eax, 2
	add edi, eax
	mov eax, [edi]
	mov [esp+0D0h], eax
	mov eax, [esp+9Ch]
	mov [esp+0D4h], edi
	mov edi, [esp+0D0h]
	mov eax, [eax]
	fld dword [edi]
	fsub dword [eax]
	fld dword [edi+4]
	fld dword [dword_4F1DF0]
	fld dword [edi]
	fsub st0, st1
	fxch st2
	fsub dword [eax+4]
	fxch st2
	fdivrp st3, st0
	fxch st1
	fmul st0, st2
	fld dword [edi+0Ch]
	fsub dword [eax+0Ch]
	fmul st0, st3
	fxch st1
	fsubr dword [edi+4]
	mov eax, [esp+0D4h]
	fstp dword flt_4EFD00[ebp]
	mov eax, [eax]
	fsubr dword [eax+0Ch]
	mov edi, [esp+0D4h]
	fstp dword flt_4EFD08[ebp]
	mov edi, [edi]
	mov eax, [edi+10h]
	and eax, 0FFh
	mov [esp+0E4h], eax
	mov eax, [edi+10h]
	shr eax, 8
	and eax, 0FFh
	mov [esp+0DCh], eax
	mov eax, [edi+10h]
	shr eax, 10h
	mov edi, [edi+10h]
	shr edi, 18h
	and eax, 0FFh
	and edi, 0FFh
	mov [esp+0D4h], eax
	mov eax, [esp+9Ch]
	mov [esp+0D0h], edi
	mov edi, [eax]
	mov eax, [edi+10h]
	and eax, 0FFh
	mov [esp+0E8h], eax
	mov eax, [edi+10h]
	shr eax, 8
	and eax, 0FFh
	mov [esp+0E0h], eax
	mov eax, [edi+10h]
	shr eax, 10h
	mov edi, [edi+10h]
	shr edi, 18h
	and eax, 0FFh
	and edi, 0FFh
	mov [esp+0D8h], eax
	mov eax, [esp+0D0h]
	sub eax, edi
	mov edi, [esp+0D8h]
	mov [esp+0FCh], eax
	mov eax, [esp+0D4h]
	fild dword [esp+0FCh]
	sub eax, edi
	fmul st0, st2
	mov [esp+0FCh], eax
	mov edi, [esp+0E0h]
	fild dword [esp+0FCh]
	mov eax, [esp+0DCh]
	fmul st0, st3
	sub eax, edi
	mov edi, [esp+0E8h]
	mov [esp+0FCh], eax
	mov eax, [esp+0E4h]
	sub eax, edi
	fild dword [esp+0FCh]
	mov [esp+0FCh], eax
	fmul st0, st4
	fild dword [esp+0FCh]
	fmulp st5, st0
	fxch st2
	call __CHP
	fistp dword [esp+0D8h]
	call __CHP
	fistp dword [esp+0E0h]
	mov edi, [esp+0D0h]
	call __CHP
	mov eax, [esp+0D8h]
	fistp dword [esp+0D8h]
	sub edi, eax
	mov eax, [esp+0E0h]
	mov [esp+0D0h], edi
	mov edi, [esp+0D4h]
	fxch st1
	call __CHP
	sub edi, eax
	mov eax, [esp+0D8h]
	mov [esp+0D4h], edi
	mov edi, [esp+0DCh]
	fistp dword [esp+0D8h]
	sub edi, eax
	mov eax, [esp+0D8h]
	mov [esp+0DCh], edi
	mov edi, [esp+0E4h]
	sub edi, eax
	mov eax, [esp+0D4h]
	mov [esp+0E4h], edi
	mov edi, [esp+0D0h]
	shl eax, 10h
	shl edi, 18h
	or eax, edi
	mov edi, [esp+0DCh]
	shl edi, 8
	or edi, eax
	mov eax, [esp+0E4h]
	or edi, eax
	mov dword dword_4EFD0C[ebp], edi
	mov edi, [esp+60h]
	fstp dword flt_4EFCFC[ebp]
	mov al, [edi]
	and al, 0FCh
	lea edi, [esi+ecx]
	or al, 1
	mov [edi], al
	mov edi, [esp+0F8h]
	mov [esp+64h], ebp
	inc edi
	mov eax, flt_4EFCFC
	mov [esp+0F8h], edi
	add eax, [esp+64h]
	lea edi, 0[ecx*4]
	mov [esp+0D0h], edi
	mov edi, [esp+10h]
	add edi, [esp+0D0h]
	add ebp, 20h
	inc ecx
	mov [edi], eax

loc_43200C:
	mov eax, [esp+0C0h]
	mov [esp+0ACh], eax
	mov eax, [esp+98h]
	mov edi, [esp+9Ch]
	inc eax
	dec ebx
	mov [esp+98h], eax
	mov eax, [esp+0C0h]
	add edi, 4
	inc eax
	mov [esp+9Ch], edi
	mov [esp+0C0h], eax
	test ebx, ebx
	jg loc_431CE7
	cmp ecx, 3
	jl loc_4324F9
	mov eax, [esp+10h]
	mov edi, [esp+10h]
	mov ebx, ecx
	mov [esp], eax
	lea eax, 0[ecx*4]
	mov edx, esi
	add edi, eax
	add esi, ecx
	mov [esp+10h], edi

loc_432079:
	test byte [esp+100h], 2
	jz loc_432440
	mov ebp, [esp+0F8h]
	lea eax, [ebx-1]
	mov [esp+0A0h], edx
	xor ecx, ecx
	mov [esp+0A8h], eax
	mov [esp+0BCh], ecx
	mov eax, [esp]
	shl ebp, 5
	mov [esp+0A4h], eax

loc_4320B5:
	mov eax, [esp+0A8h]
	add eax, edx
	mov [esp+68h], eax
	test byte [eax], 2
	jnz loc_4320FF
	mov eax, [esp+0A8h]
	mov edi, [esp]
	shl eax, 2
	add edi, eax
	mov [esp+0D0h], edi
	lea eax, 0[ecx*4]
	add eax, [esp+10h]
	mov edi, [esp+0D0h]
	mov edi, [edi]
	mov [eax], edi
	mov eax, [esp+68h]
	mov edi, ecx
	mov al, [eax]
	inc ecx
	mov [edi+esi], al

loc_4320FF:
	mov eax, [esp+0A8h]
	add eax, edx
	mov [esp+6Ch], eax
	mov edi, [esp+6Ch]
	xor eax, eax
	mov al, [edi]
	mov edi, [esp+0A0h]
	mov [esp+0D4h], eax
	xor eax, eax
	mov al, [edi]
	mov [esp+0D0h], eax
	mov eax, [esp+0D4h]
	xor eax, [esp+0D0h]
	test al, 2
	jz loc_4323E8
	mov eax, [esp+0A8h]
	mov edi, [esp]
	shl eax, 2
	add edi, eax
	mov eax, [edi]
	mov [esp+0D0h], eax
	mov eax, [esp+0A4h]
	mov [esp+0D4h], edi
	mov edi, [esp+0D0h]
	mov eax, [eax]
	fld dword [edi]
	fsub dword [eax]
	fld dword [edi+4]
	fld dword [dword_4F1DFC]
	fld dword [edi]
	fsub st0, st1
	fxch st2
	fsub dword [eax+4]
	fxch st2
	fdivrp st3, st0
	fxch st1
	fmul st0, st2
	fld dword [edi+0Ch]
	fsub dword [eax+0Ch]
	fmul st0, st3
	fxch st1
	fsubr dword [edi+4]
	mov eax, [esp+0D4h]
	fstp dword flt_4EFD00[ebp]
	mov eax, [eax]
	fsubr dword [eax+0Ch]
	mov edi, [esp+0D4h]
	fstp dword flt_4EFD08[ebp]
	mov edi, [edi]
	mov eax, [edi+10h]
	and eax, 0FFh
	mov [esp+0E4h], eax
	mov eax, [edi+10h]
	shr eax, 8
	and eax, 0FFh
	mov [esp+0DCh], eax
	mov eax, [edi+10h]
	shr eax, 10h
	mov edi, [edi+10h]
	shr edi, 18h
	and eax, 0FFh
	and edi, 0FFh
	mov [esp+0D4h], eax
	mov eax, [esp+0A4h]
	mov [esp+0D0h], edi
	mov edi, [eax]
	mov eax, [edi+10h]
	and eax, 0FFh
	mov [esp+0E8h], eax
	mov eax, [edi+10h]
	shr eax, 8
	and eax, 0FFh
	mov [esp+0E0h], eax
	mov eax, [edi+10h]
	shr eax, 10h
	mov edi, [edi+10h]
	shr edi, 18h
	and eax, 0FFh
	and edi, 0FFh
	mov [esp+0D8h], eax
	mov eax, [esp+0D0h]
	sub eax, edi
	mov edi, [esp+0D8h]
	mov [esp+0FCh], eax
	mov eax, [esp+0D4h]
	fild dword [esp+0FCh]
	sub eax, edi
	fmul st0, st2
	mov [esp+0FCh], eax
	mov edi, [esp+0E0h]
	fild dword [esp+0FCh]
	mov eax, [esp+0DCh]
	fmul st0, st3
	sub eax, edi
	mov edi, [esp+0E8h]
	mov [esp+0FCh], eax
	mov eax, [esp+0E4h]
	sub eax, edi
	fild dword [esp+0FCh]
	mov [esp+0FCh], eax
	fmul st0, st4
	fild dword [esp+0FCh]
	fmulp st5, st0
	fxch st2
	call __CHP
	fistp dword [esp+0D8h]
	call __CHP
	fistp dword [esp+0E0h]
	mov edi, [esp+0D0h]
	call __CHP
	mov eax, [esp+0D8h]
	fistp dword [esp+0D8h]
	sub edi, eax
	mov eax, [esp+0E0h]
	mov [esp+0D0h], edi
	mov edi, [esp+0D4h]
	fxch st1
	call __CHP
	sub edi, eax
	mov eax, [esp+0D8h]
	mov [esp+0D4h], edi
	mov edi, [esp+0DCh]
	fistp dword [esp+0D8h]
	sub edi, eax
	mov eax, [esp+0D8h]
	mov [esp+0DCh], edi
	mov edi, [esp+0E4h]
	sub edi, eax
	mov eax, [esp+0D0h]
	shl eax, 18h
	mov [esp+0E4h], edi
	mov [esp+0D0h], eax
	mov eax, [esp+0D4h]
	mov edi, [esp+0D0h]
	shl eax, 10h
	or edi, eax
	mov eax, [esp+0DCh]
	shl eax, 8
	or eax, edi
	mov edi, [esp+0E4h]
	or eax, edi
	mov dword dword_4EFD0C[ebp], eax
	mov edi, [esp+6Ch]
	fstp dword flt_4EFCFC[ebp]
	mov al, [edi]
	and al, 0FCh
	lea edi, [esi+ecx]
	or al, 2
	mov [esp+70h], ebp
	mov [edi], al
	mov eax, [esp+0F8h]
	inc eax
	mov edi, [esp+70h]
	mov [esp+0F8h], eax
	mov eax, flt_4EFCFC
	add eax, edi
	mov edi, [esp+10h]
	mov [esp+0D0h], eax
	lea eax, 0[ecx*4]
	add ebp, 20h
	add eax, edi
	mov edi, [esp+0D0h]
	inc ecx
	mov [eax], edi

loc_4323E8:
	mov eax, [esp+0BCh]
	mov [esp+0A8h], eax
	mov eax, [esp+0A0h]
	mov edi, [esp+0A4h]
	inc eax
	dec ebx
	mov [esp+0A0h], eax
	mov eax, [esp+0BCh]
	add edi, 4
	inc eax
	mov [esp+0A4h], edi
	mov [esp+0BCh], eax
	test ebx, ebx
	jg loc_4320B5
	cmp ecx, 3
	jl loc_4324F9
	mov eax, [esp+10h]
	mov ebx, ecx
	mov [esp], eax

loc_432440:
	xor esi, esi
	test ebx, ebx
	jle loc_43246C
	mov edx, [esp]

loc_432449:
	mov ecx, [edx]
	fld1
	fld dword [ecx+18h]
	fxch st1
	fdiv dword [ecx+0Ch]
	fxch st1
	fmul st0, st1
	fstp dword [ecx+18h]
	mov ecx, [edx]
	fmul dword [ecx+1Ch]
	add edx, 4
	inc esi
	fstp dword [ecx+1Ch]
	cmp esi, ebx
	jl loc_432449

loc_43246C:
	dec ebx
	mov edx, [esp]
	lea eax, 0[ebx*4]
	mov ecx, [esp]
	dec ebx
	mov ebp, [esp]
	lea esi, 0[ebx*4]
	add eax, edx
	add esi, ecx
	mov ebp, [ebp+0]
	mov edx, [eax]
	mov edi, [esi]

loc_432490:
	push edx
	mov eax, [esp+18h]
	push edi
	sub esi, 4
	inc eax
	push ebp
	dec ebx
	mov [esp+20h], eax
	call sub_4983B0
	mov edx, edi
	mov edi, [esi]
	test ebx, ebx
	jg loc_432490
	mov ebx, [esp+14h]
	mov eax, ebx
	add esp, 104h
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret

loc_4324BF:
	fld dword flt_4EFD00[ecx]
	fcomp dword [dword_4F1DEC]
	fnstsw ax
	sahf
	jbe loc_430FEA
	or byte [edi], 4
	jmp loc_430FEA

loc_4324DC:
	fld dword flt_4EFCFC[ecx]
	fcomp dword [dword_4F1DFC]
	fnstsw ax
	sahf
	jbe loc_431009
	or byte [edi], 2
	jmp loc_431009

loc_4324F9:
	mov ebx, 0FFFFFFFFh
	mov eax, ebx
	add esp, 104h
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret

loc_43250B:
	fld dword flt_4EFD00[ecx]
	fcomp dword [dword_4F1DEC]
	fnstsw ax
	sahf
	jbe loc_4313D0
	or byte [edi], 4
	jmp loc_4313D0

loc_432528:
	fld dword flt_4EFCFC[ecx]
	fcomp dword [dword_4F1DFC]
	fnstsw ax
	sahf
	jbe loc_4313EB
	or byte [edi], 2
	jmp loc_4313EB

loc_432545:
	fld dword flt_4EFCFC[ecx]
	fcomp dword [dword_4F1DFC]
	fnstsw ax
	sahf
	jbe loc_4317F8
	or byte [edi], 2
	jmp loc_4317F8

loc_432562:
	fld dword flt_4EFCFC[ecx]
	fcomp dword [dword_4F1DFC]
	fnstsw ax
	sahf
	jbe loc_431BD3
	or byte [edi], 2
	jmp loc_431BD3
;sub_430C70 endp

sub_432580: ;SUBROUTINE
	push esi
	push edi
	push ebp
	sub esp, 10h
	mov edi, eax
	mov esi, ebx
	mov ebp, ecx
	mov al, [eax+14h]
	mov [esp+0Ch], al
	mov al, [edx+14h]
	mov [esp+0Dh], al
	mov al, [ebx+14h]
	mov [esp+0Eh], al
	mov al, [ecx+14h]
	mov [esp+0Fh], al
	mov al, [esp+0Ch]
	and al, [esp+0Dh]
	mov ah, [esp+0Eh]
	and ah, al
	mov al, [esp+0Fh]
	and al, ah
	jnz loc_43260A
	mov al, [esp+0Ch]
	or al, [esp+0Dh]
	or al, [esp+0Eh]
	mov bl, [esp+0Fh]
	or bl, al
	jz loc_432611
	test ah, ah
	jnz loc_4325E3
	test al, al
	jnz loc_43261D
	push esi
	push edx
	push edi
	call sub_4983B0

loc_4325E3:
	mov al, [esp+0Ch]
	mov cl, [esp+0Eh]
	and al, cl
	mov ch, [esp+0Fh]
	and al, ch
	jnz loc_43260A
	mov al, [esp+0Ch]
	or al, cl
	mov ah, ch
	or ah, al
	jnz loc_432639
	push ebp
	push esi
	push edi
	call sub_4983B0

loc_43260A:
	add esp, 10h
	pop ebp
	pop edi
	pop esi
	ret

loc_432611:
	push ecx
	push esi
	push edx
	push edi
	call sub_497B24
	jmp loc_43260A

loc_43261D:
	mov [esp], edi
	mov [esp+4], edx
	xor ebx, ebx
	lea edx, [esp+0Ch]
	mov bl, al
	mov eax, esp
	mov [esp+8], esi
	call sub_4326E0
	jmp loc_4325E3

loc_432639:
	lea edx, [esp+0Ch]
	mov [esp], edi
	mov [esp+4], esi
	mov [esp+8], ebp
	xor ebx, ebx
	mov [esp+0Dh], cl
	mov bl, ah
	mov eax, esp
	mov [esp+0Eh], ch
	call sub_4326E0
	add esp, 10h
	pop ebp
	pop edi
	pop esi
	ret
;sub_432580 endp

sub_432670: ;SUBROUTINE
	push ecx
	sub esp, 10h
	mov ecx, eax
	mov al, [eax+14h]
	mov [esp+0Ch], al
	mov al, [edx+14h]
	mov [esp+0Dh], al
	mov al, [ebx+14h]
	mov [esp+0Eh], al
	mov al, [esp+0Ch]
	and al, [esp+0Dh]
	and al, [esp+0Eh]
	jnz loc_4326B0
	mov al, [esp+0Ch]
	or al, [esp+0Dh]
	or al, [esp+0Eh]
	jnz loc_4326B5
	push ebx
	push edx
	push ecx
	call sub_4983B0

loc_4326B0:
	add esp, 10h
	pop ecx
	ret

loc_4326B5:
	mov [esp+4], edx
	mov [esp+8], ebx
	xor ebx, ebx
	lea edx, [esp+0Ch]
	mov bl, al
	mov eax, esp
	mov [esp], ecx
	call sub_4326E0
	add esp, 10h
	pop ecx
	ret
;sub_432670 endp

sub_4326E0: ;SUBROUTINE
	push ecx
	push esi
	push edi
	push ebp
	sub esp, 0D8h
	mov [esp+0D4h], bl
	xor esi, esi
	mov ecx, off_4D52B4
	mov [esp+14h], esi
	mov [esp+0C8h], esi
	mov esi, [eax]
	mov [esp+0B4h], ecx
	mov ecx, [esi+10h]
	and ecx, 0FF000000h
	mov edi, dword_4F1E1C
	mov [esp+1Ch], ecx
	mov ecx, 8
	rep movsd
	mov ecx, 8
	mov edi, dword_4F1E3C
	mov esi, [eax+4]
	rep movsd
	mov ecx, 8
	mov edi, dword_4F1E5C
	mov esi, [eax+8]
	xor eax, eax
	rep movsd
	mov dword [dword_4F1E30], eax
	mov dword [dword_4F1E50], eax
	mov dword [dword_4F1E70], eax
	mov eax, dword [off_4D52B4]
	fld dword [eax+0Ch]
	fmul dword [eax+18h]
	fld dword [eax+0Ch]
	fmul dword [eax+1Ch]
	fxch st1
	fstp dword [eax+18h]
	fstp dword [eax+1Ch]
	mov eax, dword [off_4D52B8]
	fld dword [eax+0Ch]
	fmul dword [eax+18h]
	fld dword [eax+0Ch]
	fmul dword [eax+1Ch]
	fxch st1
	fstp dword [eax+18h]
	fstp dword [eax+1Ch]
	mov eax, dword [off_4D52BC]
	fld dword [eax+0Ch]
	fmul dword [eax+18h]
	fld dword [eax+0Ch]
	fmul dword [eax+1Ch]
	mov ebx, 3
	mov [esp], edx
	mov esi, dword_4F16C4
	fxch st1
	fstp dword [eax+18h]
	fstp dword [eax+1Ch]
	mov ah, [esp+0D4h]
	mov ecx, dword_4F15FC
	test ah, 30h
	jz loc_432D14
	test ah, 10h
	jz loc_432A54
	mov edi, 2
	mov [esp+58h], edx
	xor ebp, ebp
	mov edx, off_4D52B4
	mov [esp+4], edi
	mov [esp+0B8h], ebp
	mov [esp+5Ch], edx
	xor edx, edx

loc_4327EB:
	mov eax, [esp]
	mov edi, [esp+4]
	add eax, edi
	mov [esp+30h], eax
	test byte [eax], 10h
	jnz loc_432835
	lea eax, 0[ebp*4]
	shl edi, 2
	mov [esp+0B0h], eax
	mov eax, dword_4F16C4
	add edi, off_4D52B4
	add eax, [esp+0B0h]
	mov edi, [edi]
	mov [eax], edi
	mov edi, ebp
	mov eax, [esp+30h]
	add edi, dword_4F15FC
	mov al, [eax]
	inc ebp
	mov [edi], al

loc_432835:
	mov edi, [esp]
	add edi, [esp+4]
	xor eax, eax
	mov al, [edi]
	mov edi, [esp+58h]
	mov [esp+0B0h], eax
	xor eax, eax
	mov al, [edi]
	mov edi, [esp+0B0h]
	xor edi, eax
	test di, 10h
	jz loc_4329F8
	mov eax, [esp+4]
	mov edi, off_4D52B4
	shl eax, 2
	add edi, eax
	mov [esp+0B0h], edi
	mov eax, [edi]
	mov edi, [esp+5Ch]
	mov edi, [edi]
	fld dword [eax+0Ch]
	fsub dword [edi+0Ch]
	fld dword [dword_4F1E00]
	fld dword [eax+0Ch]
	fsub st0, st1
	fdivrp st2, st0
	fld dword [eax]
	fsub dword [edi]
	fxch st2
	fstp dword [esp+8]
	fxch st1
	fmul dword [esp+8]
	fld dword [eax+4]
	fsub dword [edi+4]
	fmul dword [esp+8]
	fld dword [eax+1Ch]
	fld dword [eax+18h]
	fsub dword [edi+18h]
	fxch st1
	fsub dword [edi+1Ch]
	fxch st3
	fsubr dword [eax]
	mov edi, [esp+0B0h]
	fstp dword flt_4EFCFC[edx]
	mov edi, [edi]
	fmul dword [esp+8]
	fxch st1
	fsubr dword [edi+4]
	mov edi, [esp+0B0h]
	fstp dword flt_4EFD00[edx]
	mov edi, [edi]
	fxch st1
	fmul dword [esp+8]
	fxch st1
	fsubr dword [edi+18h]
	mov edi, [esp+0B0h]
	fstp dword flt_4EFD14[edx]
	mov edi, [edi]
	fsubr dword [edi+1Ch]
	mov edi, [esp+0B0h]
	fstp dword flt_4EFD18[edx]
	mov edi, [edi]
	mov eax, [edi+10h]
	mov edi, [esp+5Ch]
	and eax, 0FFh
	mov edi, [edi]
	mov [esp+18h], eax
	mov eax, [edi+10h]
	mov edi, [esp+18h]
	and eax, 0FFh
	sub edi, eax
	mov [esp+0D0h], edi
	fild dword [esp+0D0h]
	fmul dword [esp+8]
	mov [esp+0CCh], eax
	mov edi, [esp+18h]
	call __CHP
	fistp dword [esp+0B0h]
	sub edi, [esp+0B0h]
	mov eax, [esp+1Ch]
	mov [esp+18h], edi
	shl edi, 10h
	or eax, edi
	mov edi, [esp+18h]
	shl edi, 8
	or edi, eax
	mov eax, [esp+18h]
	or edi, eax
	mov dword dword_4EFD0C[edx], edi
	xor edi, edi
	mov dword dword_4EFD04[edx], edi
	mov edi, dword_4F15FC
	add edi, ebp
	fstp dword flt_4EFD08[edx]
	mov byte [edi], 10h
	fld dword flt_4EFD00[edx]
	fcomp dword [dword_4F1DF4]
	fnstsw ax
	sahf
	jnb loc_43384C
	or byte [edi], 8

loc_4329B4:
	mov edi, dword_4F15FC
	fld dword flt_4EFCFC[edx]
	add edi, ebp
	fcomp dword [dword_4F1DF0]
	fnstsw ax
	sahf
	jnb loc_433869
	or byte [edi], 1

loc_4329D3:
	mov eax, [esp+14h]
	inc eax
	mov edi, edx
	mov [esp+14h], eax
	mov eax, flt_4EFCFC
	add eax, edi
	lea edi, 0[ebp*4]
	add edx, 20h
	add edi, dword_4F16C4
	inc ebp
	mov [edi], eax

loc_4329F8:
	mov eax, [esp+0B8h]
	mov edi, [esp+58h]
	dec ebx
	mov [esp+4], eax
	inc edi
	mov eax, [esp+5Ch]
	mov [esp+58h], edi
	mov edi, [esp+0B8h]
	add eax, 4
	inc edi
	mov [esp+5Ch], eax
	mov [esp+0B8h], edi
	test ebx, ebx
	jg loc_4327EB
	cmp ebp, 3
	jl loc_433886
	mov eax, dword_4F16C4
	mov ebx, ebp
	mov [esp+0B4h], eax
	lea eax, 0[ebp*4]
	mov [esp], ecx
	add esi, eax
	add ecx, ebp

loc_432A54:
	test byte [esp+0D4h], 20h
	jz loc_432CEA
	mov edx, [esp+14h]
	lea eax, [ebx-1]
	xor ebp, ebp
	mov [esp+98h], eax
	mov eax, [esp]
	mov [esp+0ACh], ebp
	mov [esp+60h], eax
	mov eax, [esp+0B4h]
	shl edx, 5
	mov [esp+64h], eax

loc_432A8E:
	mov eax, [esp]
	mov edi, [esp+98h]
	add eax, edi
	mov [esp+24h], eax
	test byte [eax], 20h
	jnz loc_432AC8
	mov eax, [esp+0B4h]
	shl edi, 2
	add edi, eax
	lea eax, 0[ebp*4]
	add eax, esi
	mov edi, [edi]
	mov [eax], edi
	mov eax, [esp+24h]
	mov edi, ebp
	mov al, [eax]
	inc ebp
	mov [ecx+edi], al

loc_432AC8:
	mov edi, [esp]
	add edi, [esp+98h]
	xor eax, eax
	mov al, [edi]
	mov edi, [esp+60h]
	mov [esp+0B0h], eax
	xor eax, eax
	mov al, [edi]
	mov edi, [esp+0B0h]
	xor edi, eax
	test di, 20h
	jz loc_432C90
	mov eax, [esp+98h]
	mov edi, [esp+0B4h]
	shl eax, 2
	add edi, eax
	mov [esp+0D0h], edi
	mov eax, [edi]
	mov edi, [esp+64h]
	mov edi, [edi]
	fld dword [eax+0Ch]
	fsub dword [edi+0Ch]
	fld dword [eax]
	fld dword [dword_4F1DF8]
	fld dword [eax+0Ch]
	fsub st0, st1
	fxch st2
	fsub dword [edi]
	fxch st2
	fdivrp st3, st0
	fxch st1
	fmul st0, st2
	fld dword [eax+4]
	fsub dword [edi+4]
	fmul st0, st3
	fld dword [eax+1Ch]
	fld dword [eax+18h]
	fsub dword [edi+18h]
	fxch st1
	fsub dword [edi+1Ch]
	fxch st3
	fsubr dword [eax]
	mov edi, [esp+0D0h]
	fstp dword flt_4EFCFC[edx]
	mov edi, [edi]
	fmul st0, st4
	fxch st1
	fsubr dword [edi+4]
	mov edi, [esp+0D0h]
	fstp dword flt_4EFD00[edx]
	mov edi, [edi]
	fxch st1
	fmul st0, st3
	fxch st1
	fsubr dword [edi+18h]
	mov edi, [esp+0D0h]
	fstp dword flt_4EFD14[edx]
	mov edi, [edi]
	fsubr dword [edi+1Ch]
	mov edi, [esp+0D0h]
	fstp dword flt_4EFD18[edx]
	mov edi, [edi]
	mov eax, [edi+10h]
	mov edi, [esp+64h]
	and eax, 0FFh
	mov edi, [edi]
	mov [esp+0B0h], eax
	mov eax, [edi+10h]
	mov edi, [esp+0B0h]
	and eax, 0FFh
	sub edi, eax
	mov [esp+0D0h], edi
	fild dword [esp+0D0h]
	fmulp st2, st0
	mov [esp+0CCh], eax
	mov edi, [esp+0B0h]
	fxch st1
	call __CHP
	fistp dword [esp+0D0h]
	sub edi, [esp+0D0h]
	mov eax, [esp+1Ch]
	mov [esp+0B0h], edi
	shl edi, 10h
	or eax, edi
	mov edi, [esp+0B0h]
	shl edi, 8
	or edi, eax
	mov eax, [esp+0B0h]
	or edi, eax
	mov dword dword_4EFD0C[edx], edi
	mov dword dword_4EFD04[edx], 3F800000h
	lea edi, [ecx+ebp]
	fstp dword flt_4EFD08[edx]
	mov byte [edi], 10h
	fld dword flt_4EFD00[edx]
	fcomp dword [dword_4F1DF4]
	fnstsw ax
	sahf
	jnb loc_433898
	or byte [edi], 8

loc_432C55:
	fld dword flt_4EFCFC[edx]
	lea edi, [ecx+ebp]
	fcomp dword [dword_4F1DF0]
	fnstsw ax
	sahf
	jnb loc_4338B5
	or byte [edi], 1

loc_432C70:
	mov eax, [esp+14h]
	mov edi, edx
	inc eax
	add edx, 20h
	mov [esp+14h], eax
	lea eax, 0[ebp*4]
	add edi, flt_4EFCFC
	add eax, esi
	inc ebp
	mov [eax], edi

loc_432C90:
	mov eax, [esp+0ACh]
	mov edi, [esp+60h]
	dec ebx
	mov [esp+98h], eax
	inc edi
	mov eax, [esp+64h]
	mov [esp+60h], edi
	mov edi, [esp+0ACh]
	add eax, 4
	inc edi
	mov [esp+64h], eax
	mov [esp+0ACh], edi
	test ebx, ebx
	jg loc_432A8E
	cmp ebp, 3
	jl loc_433886
	mov ebx, ebp
	mov [esp+0B4h], esi
	lea eax, 0[ebp*4]
	mov [esp], ecx
	add esi, eax
	add ecx, ebp

loc_432CEA:
	mov edx, [esp]
	dec ebp
	add edx, ebp
	mov al, [edx]
	mov [esp+0D4h], al

loc_432CF9:
	mov al, [edx-1]
	mov ah, [esp+0D4h]
	dec ebp
	or ah, al
	dec edx
	mov [esp+0D4h], ah
	test ebp, ebp
	jg loc_432CF9
	mov eax, eax

loc_432D14:
	mov dl, [esp+0D4h]
	test dl, 0Ch
	jz loc_43327C
	test dl, 4
	jz loc_432FC0
	mov edx, [esp+14h]
	lea eax, [ebx-1]
	xor ebp, ebp
	mov [esp+94h], eax
	mov eax, [esp]
	mov [esp+0A8h], ebp
	mov [esp+68h], eax
	mov eax, [esp+0B4h]
	shl edx, 5
	mov [esp+6Ch], eax

loc_432D59:
	mov eax, [esp]
	mov edi, [esp+94h]
	add eax, edi
	mov [esp+28h], eax
	test byte [eax], 4
	jnz loc_432DA2
	mov eax, [esp+0B4h]
	shl edi, 2
	add eax, edi
	lea edi, 0[ebp*4]
	mov [esp+0B0h], eax
	lea eax, [esi+edi]
	mov edi, [esp+0B0h]
	mov edi, [edi]
	mov [eax], edi
	mov eax, [esp+28h]
	mov edi, ebp
	mov al, [eax]
	inc ebp
	mov [ecx+edi], al

loc_432DA2:
	mov eax, [esp]
	mov edi, [esp+94h]
	add eax, edi
	mov [esp+2Ch], eax
	mov edi, [esp+2Ch]
	xor eax, eax
	mov al, [edi]
	mov edi, [esp+68h]
	mov [esp+0B0h], eax
	xor eax, eax
	mov al, [edi]
	mov edi, [esp+0B0h]
	xor edi, eax
	test di, 4
	jz loc_432F66
	mov eax, [esp+94h]
	mov edi, [esp+0B4h]
	shl eax, 2
	add edi, eax
	mov eax, [edi]
	mov [esp+0B0h], eax
	mov eax, [esp+6Ch]
	mov [esp+0D0h], edi
	mov edi, [eax]
	mov eax, [esp+0B0h]
	fld dword [eax+4]
	fsub dword [edi+4]
	fld dword [eax]
	fld dword [dword_4F1DEC]
	fld dword [eax+4]
	fsub st0, st1
	fxch st2
	fsub dword [edi]
	fxch st2
	fdivrp st3, st0
	fxch st1
	fmul st0, st2
	fld dword [eax+0Ch]
	fsub dword [edi+0Ch]
	fmul st0, st3
	fld dword [eax+1Ch]
	fld dword [eax+18h]
	fsub dword [edi+18h]
	fxch st1
	fsub dword [edi+1Ch]
	fxch st3
	fsubr dword [eax]
	mov edi, [esp+0D0h]
	fstp dword flt_4EFCFC[edx]
	mov edi, [edi]
	fmul st0, st4
	fxch st1
	fsubr dword [edi+0Ch]
	mov edi, [esp+0D0h]
	fstp dword flt_4EFD08[edx]
	mov edi, [edi]
	fxch st1
	fmul st0, st3
	fxch st1
	fsubr dword [edi+18h]
	mov edi, [esp+0D0h]
	fstp dword flt_4EFD14[edx]
	mov edi, [edi]
	fsubr dword [edi+1Ch]
	mov edi, [esp+0D0h]
	fstp dword flt_4EFD18[edx]
	mov edi, [edi]
	mov eax, [edi+10h]
	mov edi, [esp+6Ch]
	and eax, 0FFh
	mov edi, [edi]
	mov [esp+0B0h], eax
	mov eax, [edi+10h]
	mov edi, [esp+0B0h]
	and eax, 0FFh
	sub edi, eax
	mov [esp+0D0h], edi
	fild dword [esp+0D0h]
	fmulp st2, st0
	mov [esp+0CCh], eax
	mov edi, [esp+0B0h]
	fxch st1
	call __CHP
	fistp dword [esp+0D0h]
	sub edi, [esp+0D0h]
	mov eax, [esp+1Ch]
	mov [esp+0B0h], edi
	shl edi, 10h
	or eax, edi
	mov edi, [esp+0B0h]
	shl edi, 8
	or edi, eax
	mov eax, [esp+0B0h]
	or edi, eax
	mov dword dword_4EFD0C[edx], edi
	mov edi, [esp+2Ch]
	fstp dword flt_4EFD00[edx]
	mov al, [edi]
	and al, 0F0h
	lea edi, [ecx+ebp]
	or al, 4
	mov [edi], al
	fld dword flt_4EFCFC[edx]
	fcomp dword [dword_4F1DF0]
	fnstsw ax
	sahf
	jnb loc_4338D2
	or byte [edi], 1

loc_432F46:
	mov eax, [esp+14h]
	inc eax
	mov edi, edx
	mov [esp+14h], eax
	mov eax, flt_4EFCFC
	add edx, 20h
	add eax, edi
	lea edi, 0[ebp*4]
	inc ebp
	mov [edi+esi], eax

loc_432F66:
	mov eax, [esp+0A8h]
	mov edi, [esp+68h]
	dec ebx
	mov [esp+94h], eax
	inc edi
	mov eax, [esp+6Ch]
	mov [esp+68h], edi
	mov edi, [esp+0A8h]
	add eax, 4
	inc edi
	mov [esp+6Ch], eax
	mov [esp+0A8h], edi
	test ebx, ebx
	jg loc_432D59
	cmp ebp, 3
	jl loc_433886
	mov ebx, ebp
	mov [esp+0B4h], esi
	lea eax, 0[ebp*4]
	mov [esp], ecx
	add esi, eax
	add ecx, ebp

loc_432FC0:
	test byte [esp+0D4h], 8
	jz loc_433252
	mov edx, [esp+14h]
	lea eax, [ebx-1]
	xor ebp, ebp
	mov [esp+90h], eax
	mov eax, [esp]
	mov [esp+0A4h], ebp
	mov [esp+70h], eax
	mov eax, [esp+0B4h]
	shl edx, 5
	mov [esp+74h], eax

loc_432FFA:
	mov eax, [esp]
	mov edi, [esp+90h]
	add eax, edi
	mov [esp+34h], eax
	test byte [eax], 8
	jnz loc_433034
	mov eax, [esp+0B4h]
	shl edi, 2
	add edi, eax
	lea eax, 0[ebp*4]
	add eax, esi
	mov edi, [edi]
	mov [eax], edi
	mov eax, [esp+34h]
	mov edi, ebp
	mov al, [eax]
	inc ebp
	mov [ecx+edi], al

loc_433034:
	mov eax, [esp]
	mov edi, [esp+90h]
	add eax, edi
	mov [esp+38h], eax
	mov edi, [esp+38h]
	xor eax, eax
	mov al, [edi]
	mov edi, [esp+70h]
	mov [esp+0B0h], eax
	xor eax, eax
	mov al, [edi]
	mov edi, [esp+0B0h]
	xor edi, eax
	test di, 8
	jz loc_4331F8
	mov eax, [esp+90h]
	mov edi, [esp+0B4h]
	shl eax, 2
	add edi, eax
	mov eax, [edi]
	mov [esp+0B0h], eax
	mov eax, [esp+74h]
	mov [esp+0D0h], edi
	mov edi, [eax]
	mov eax, [esp+0B0h]
	fld dword [eax+4]
	fsub dword [edi+4]
	fld dword [eax]
	fld dword [dword_4F1DF4]
	fld dword [eax+4]
	fsub st0, st1
	fxch st2
	fsub dword [edi]
	fxch st2
	fdivrp st3, st0
	fxch st1
	fmul st0, st2
	fld dword [eax+0Ch]
	fsub dword [edi+0Ch]
	fmul st0, st3
	fld dword [eax+1Ch]
	fld dword [eax+18h]
	fsub dword [edi+18h]
	fxch st1
	fsub dword [edi+1Ch]
	fxch st3
	fsubr dword [eax]
	mov edi, [esp+0D0h]
	fstp dword flt_4EFCFC[edx]
	mov edi, [edi]
	fmul st0, st4
	fxch st1
	fsubr dword [edi+0Ch]
	mov edi, [esp+0D0h]
	fstp dword flt_4EFD08[edx]
	mov edi, [edi]
	fxch st1
	fmul st0, st3
	fxch st1
	fsubr dword [edi+18h]
	mov edi, [esp+0D0h]
	fstp dword flt_4EFD14[edx]
	mov edi, [edi]
	fsubr dword [edi+1Ch]
	mov edi, [esp+0D0h]
	fstp dword flt_4EFD18[edx]
	mov edi, [edi]
	mov eax, [edi+10h]
	mov edi, [esp+74h]
	and eax, 0FFh
	mov edi, [edi]
	mov [esp+0B0h], eax
	mov eax, [edi+10h]
	mov edi, [esp+0B0h]
	and eax, 0FFh
	sub edi, eax
	mov [esp+0D0h], edi
	fild dword [esp+0D0h]
	fmulp st2, st0
	mov [esp+0CCh], eax
	mov edi, [esp+0B0h]
	fxch st1
	call __CHP
	fistp dword [esp+0D0h]
	sub edi, [esp+0D0h]
	mov eax, [esp+1Ch]
	mov [esp+0B0h], edi
	shl edi, 10h
	or edi, eax
	mov eax, [esp+0B0h]
	shl eax, 8
	or edi, eax
	mov eax, [esp+0B0h]
	or edi, eax
	mov dword dword_4EFD0C[edx], edi
	mov edi, [esp+38h]
	fstp dword flt_4EFD00[edx]
	mov al, [edi]
	and al, 0F0h
	lea edi, [ecx+ebp]
	or al, 8
	mov [edi], al
	fld dword flt_4EFCFC[edx]
	fcomp dword [dword_4F1DF0]
	fnstsw ax
	sahf
	jnb loc_4338EF
	or byte [edi], 1

loc_4331D8:
	mov eax, [esp+14h]
	mov edi, edx
	inc eax
	add edx, 20h
	mov [esp+14h], eax
	lea eax, 0[ebp*4]
	add edi, flt_4EFCFC
	add eax, esi
	inc ebp
	mov [eax], edi

loc_4331F8:
	mov eax, [esp+0A4h]
	mov edi, [esp+70h]
	dec ebx
	mov [esp+90h], eax
	inc edi
	mov eax, [esp+74h]
	mov [esp+70h], edi
	mov edi, [esp+0A4h]
	add eax, 4
	inc edi
	mov [esp+74h], eax
	mov [esp+0A4h], edi
	test ebx, ebx
	jg loc_432FFA
	cmp ebp, 3
	jl loc_433886
	mov ebx, ebp
	mov [esp+0B4h], esi
	lea eax, 0[ebp*4]
	mov [esp], ecx
	add esi, eax
	add ecx, ebp

loc_433252:
	mov edx, [esp]
	dec ebp
	add edx, ebp
	mov al, [edx]
	mov [esp+0D4h], al

loc_433261:
	mov al, [edx-1]
	mov ah, [esp+0D4h]
	dec ebp
	or ah, al
	dec edx
	mov [esp+0D4h], ah
	test ebp, ebp
	jg loc_433261
	mov eax, eax

loc_43327C:
	mov dl, [esp+0D4h]
	test dl, 3
	jz loc_4337B3
	test dl, 1
	jz loc_433517
	mov edx, [esp+14h]
	lea eax, [ebx-1]
	xor ebp, ebp
	mov [esp+8Ch], eax
	mov eax, [esp]
	mov [esp+0A0h], ebp
	mov [esp+78h], eax
	mov eax, [esp+0B4h]
	shl edx, 5
	mov [esp+7Ch], eax

loc_4332C1:
	mov eax, [esp]
	mov edi, [esp+8Ch]
	add eax, edi
	mov [esp+3Ch], eax
	test byte [eax], 1
	jnz loc_43330A
	mov eax, [esp+0B4h]
	shl edi, 2
	add eax, edi
	lea edi, 0[ebp*4]
	mov [esp+0B0h], eax
	lea eax, [esi+edi]
	mov edi, [esp+0B0h]
	mov edi, [edi]
	mov [eax], edi
	mov eax, [esp+3Ch]
	mov edi, ebp
	mov al, [eax]
	inc ebp
	mov [ecx+edi], al

loc_43330A:
	mov eax, [esp]
	mov edi, [esp+8Ch]
	add eax, edi
	mov [esp+40h], eax
	mov edi, [esp+40h]
	xor eax, eax
	mov al, [edi]
	mov edi, [esp+78h]
	mov [esp+0B0h], eax
	xor eax, eax
	mov al, [edi]
	mov edi, [esp+0B0h]
	xor edi, eax
	test di, 1
	jz loc_4334BD
	mov eax, [esp+8Ch]
	mov edi, [esp+0B4h]
	shl eax, 2
	add edi, eax
	mov eax, [edi]
	mov [esp+0B0h], eax
	mov eax, [esp+7Ch]
	mov [esp+0D0h], edi
	mov edi, [esp+0B0h]
	mov eax, [eax]
	fld dword [edi]
	fsub dword [eax]
	fld dword [edi+4]
	fld dword [dword_4F1DF0]
	fld dword [edi]
	fsub st0, st1
	fxch st2
	fsub dword [eax+4]
	fxch st2
	fdivrp st3, st0
	fxch st1
	fmul st0, st2
	fld dword [edi+0Ch]
	fsub dword [eax+0Ch]
	fmul st0, st3
	fld dword [edi+1Ch]
	fld dword [edi+18h]
	fsub dword [eax+18h]
	fxch st1
	fsub dword [eax+1Ch]
	fxch st3
	fsubr dword [edi+4]
	mov edi, [esp+0D0h]
	fstp dword flt_4EFD00[edx]
	mov edi, [edi]
	fmul st0, st4
	fxch st1
	fsubr dword [edi+0Ch]
	mov edi, [esp+0D0h]
	fstp dword flt_4EFD08[edx]
	mov edi, [edi]
	fxch st1
	fmul st0, st3
	fxch st1
	fsubr dword [edi+18h]
	mov edi, [esp+0D0h]
	fstp dword flt_4EFD14[edx]
	mov edi, [edi]
	fsubr dword [edi+1Ch]
	mov edi, [esp+0D0h]
	fstp dword flt_4EFD18[edx]
	mov edi, [edi]
	mov eax, [edi+10h]
	mov edi, [esp+7Ch]
	and eax, 0FFh
	mov edi, [edi]
	mov [esp+0B0h], eax
	mov eax, [edi+10h]
	mov edi, [esp+0B0h]
	and eax, 0FFh
	sub edi, eax
	mov [esp+0D0h], edi
	fild dword [esp+0D0h]
	fmulp st2, st0
	mov [esp+0CCh], eax
	mov edi, [esp+0B0h]
	fxch st1
	call __CHP
	fistp dword [esp+0D0h]
	sub edi, [esp+0D0h]
	mov eax, [esp+1Ch]
	mov [esp+0B0h], edi
	shl edi, 10h
	or eax, edi
	mov edi, [esp+0B0h]
	shl edi, 8
	or edi, eax
	mov eax, [esp+0B0h]
	or edi, eax
	mov dword dword_4EFD0C[edx], edi
	mov edi, [esp+40h]
	fstp dword flt_4EFCFC[edx]
	mov al, [edi]
	and al, 0FCh
	lea edi, [ecx+ebp]
	or al, 1
	mov [edi], al
	mov edi, [esp+14h]
	mov [esp+44h], edx
	inc edi
	mov eax, [esp+44h]
	mov [esp+14h], edi
	mov edi, flt_4EFCFC
	add edi, eax
	lea eax, 0[ebp*4]
	add edx, 20h
	add eax, esi
	inc ebp
	mov [eax], edi

loc_4334BD:
	mov eax, [esp+0A0h]
	mov edi, [esp+78h]
	dec ebx
	mov [esp+8Ch], eax
	inc edi
	mov eax, [esp+7Ch]
	mov [esp+78h], edi
	mov edi, [esp+0A0h]
	add eax, 4
	inc edi
	mov [esp+7Ch], eax
	mov [esp+0A0h], edi
	test ebx, ebx
	jg loc_4332C1
	cmp ebp, 3
	jl loc_433886
	mov ebx, ebp
	mov [esp+0B4h], esi
	lea eax, 0[ebp*4]
	mov [esp], ecx
	add esi, eax
	add ecx, ebp

loc_433517:
	test byte [esp+0D4h], 2
	jz loc_4337B3
	mov edx, [esp+14h]
	lea eax, [ebx-1]
	xor ebp, ebp
	mov [esp+88h], eax
	mov eax, [esp]
	mov [esp+9Ch], ebp
	mov [esp+80h], eax
	mov eax, [esp+0B4h]
	shl edx, 5
	mov [esp+84h], eax

loc_433557:
	mov eax, [esp]
	mov edi, [esp+88h]
	add eax, edi
	mov [esp+48h], eax
	test byte [eax], 2
	jnz loc_4335A0
	mov eax, [esp+0B4h]
	shl edi, 2
	add eax, edi
	lea edi, 0[ebp*4]
	mov [esp+0B0h], eax
	lea eax, [esi+edi]
	mov edi, [esp+0B0h]
	mov edi, [edi]
	mov [eax], edi
	mov eax, [esp+48h]
	mov edi, ebp
	mov al, [eax]
	inc ebp
	mov [ecx+edi], al

loc_4335A0:
	mov eax, [esp]
	mov edi, [esp+88h]
	add eax, edi
	mov [esp+4Ch], eax
	mov edi, [esp+4Ch]
	xor eax, eax
	mov al, [edi]
	mov edi, [esp+80h]
	mov [esp+0B0h], eax
	xor eax, eax
	mov al, [edi]
	mov edi, [esp+0B0h]
	xor edi, eax
	test di, 2
	jz loc_43375B
	mov eax, [esp+88h]
	mov edi, [esp+0B4h]
	shl eax, 2
	add edi, eax
	mov eax, [edi]
	mov [esp+0B0h], eax
	mov eax, [esp+84h]
	mov [esp+0D0h], edi
	mov edi, [esp+0B0h]
	mov eax, [eax]
	fld dword [edi]
	fsub dword [eax]
	fld dword [edi+4]
	fld dword [dword_4F1DFC]
	fld dword [edi]
	fsub st0, st1
	fxch st2
	fsub dword [eax+4]
	fxch st2
	fdivrp st3, st0
	fxch st1
	fmul st0, st2
	fld dword [edi+0Ch]
	fsub dword [eax+0Ch]
	fmul st0, st3
	fld dword [edi+1Ch]
	fld dword [edi+18h]
	fsub dword [eax+18h]
	fxch st1
	fsub dword [eax+1Ch]
	fxch st3
	fsubr dword [edi+4]
	mov edi, [esp+0D0h]
	fstp dword flt_4EFD00[edx]
	mov edi, [edi]
	fmul st0, st4
	fxch st1
	fsubr dword [edi+0Ch]
	mov edi, [esp+0D0h]
	fstp dword flt_4EFD08[edx]
	mov edi, [edi]
	fxch st1
	fmul st0, st3
	fxch st1
	fsubr dword [edi+18h]
	mov edi, [esp+0D0h]
	fstp dword flt_4EFD14[edx]
	mov edi, [edi]
	fsubr dword [edi+1Ch]
	mov edi, [esp+0D0h]
	fstp dword flt_4EFD18[edx]
	mov edi, [edi]
	mov eax, [edi+10h]
	mov edi, [esp+84h]
	and eax, 0FFh
	mov edi, [edi]
	mov [esp+0B0h], eax
	mov eax, [edi+10h]
	mov edi, [esp+0B0h]
	and eax, 0FFh
	sub edi, eax
	mov [esp+0D0h], edi
	fild dword [esp+0D0h]
	fmulp st2, st0
	mov [esp+0CCh], eax
	mov edi, [esp+0B0h]
	fxch st1
	call __CHP
	fistp dword [esp+0D0h]
	sub edi, [esp+0D0h]
	mov eax, [esp+1Ch]
	mov [esp+0B0h], edi
	shl edi, 10h
	or edi, eax
	mov eax, [esp+0B0h]
	shl eax, 8
	or edi, eax
	mov eax, [esp+0B0h]
	or edi, eax
	mov dword dword_4EFD0C[edx], edi
	mov edi, [esp+4Ch]
	fstp dword flt_4EFCFC[edx]
	mov al, [edi]
	and al, 0FCh
	lea edi, [ecx+ebp]
	or al, 2
	mov [edi], al
	mov edi, [esp+14h]
	mov [esp+50h], edx
	inc edi
	mov eax, flt_4EFCFC
	mov [esp+14h], edi
	mov edi, [esp+50h]
	add edx, 20h
	add eax, edi
	lea edi, 0[ebp*4]
	inc ebp
	mov [edi+esi], eax

loc_43375B:
	mov eax, [esp+9Ch]
	mov [esp+88h], eax
	mov eax, [esp+80h]
	mov edi, [esp+84h]
	inc eax
	dec ebx
	mov [esp+80h], eax
	mov eax, [esp+9Ch]
	add edi, 4
	inc eax
	mov [esp+84h], edi
	mov [esp+9Ch], eax
	test ebx, ebx
	jg loc_433557
	cmp ebp, 3
	jl loc_433886
	mov ebx, ebp
	mov [esp+0B4h], esi

loc_4337B3:
	xor esi, esi
	test ebx, ebx
	jle loc_4337E4
	mov edx, [esp+0B4h]

loc_4337C0:
	mov ecx, [edx]
	fld1
	fld dword [ecx+18h]
	fxch st1
	fdiv dword [ecx+0Ch]
	fxch st1
	fmul st0, st1
	fstp dword [ecx+18h]
	mov ecx, [edx]
	fmul dword [ecx+1Ch]
	add edx, 4
	inc esi
	fstp dword [ecx+1Ch]
	cmp esi, ebx
	jl loc_4337C0
	nop

loc_4337E4:
	dec ebx
	mov edx, [esp+0B4h]
	lea eax, 0[ebx*4]
	mov ecx, [esp+0B4h]
	dec ebx
	mov ebp, [esp+0B4h]
	lea esi, 0[ebx*4]
	add eax, edx
	add esi, ecx
	mov ebp, [ebp+0]
	mov edx, [eax]
	mov edi, [esi]

loc_433814:
	push edx
	mov eax, [esp+0CCh]
	push edi
	sub esi, 4
	inc eax
	push ebp
	dec ebx
	mov [esp+0D4h], eax
	call sub_4983B0
	mov edx, edi
	mov edi, [esi]
	test ebx, ebx
	jg loc_433814
	mov ebp, [esp+0C8h]
	mov eax, ebp
	add esp, 0D8h
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret

loc_43384C:
	fld dword flt_4EFD00[edx]
	fcomp dword [dword_4F1DEC]
	fnstsw ax
	sahf
	jbe loc_4329B4
	or byte [edi], 4
	jmp loc_4329B4

loc_433869:
	fld dword flt_4EFCFC[edx]
	fcomp dword [dword_4F1DFC]
	fnstsw ax
	sahf
	jbe loc_4329D3
	or byte [edi], 2
	jmp loc_4329D3

loc_433886:
	mov ebp, 0FFFFFFFFh
	mov eax, ebp
	add esp, 0D8h
	pop ebp
	pop edi
	pop esi
	pop ecx
	ret

loc_433898:
	fld dword flt_4EFD00[edx]
	fcomp dword [dword_4F1DEC]
	fnstsw ax
	sahf
	jbe loc_432C55
	or byte [edi], 4
	jmp loc_432C55

loc_4338B5:
	fld dword flt_4EFCFC[edx]
	fcomp dword [dword_4F1DFC]
	fnstsw ax
	sahf
	jbe loc_432C70
	or byte [edi], 2
	jmp loc_432C70

loc_4338D2:
	fld dword flt_4EFCFC[edx]
	fcomp dword [dword_4F1DFC]
	fnstsw ax
	sahf
	jbe loc_432F46
	or byte [edi], 2
	jmp loc_432F46

loc_4338EF:
	fld dword flt_4EFCFC[edx]
	fcomp dword [dword_4F1DFC]
	fnstsw ax
	sahf
	jbe loc_4331D8
	or byte [edi], 2
	jmp loc_4331D8
;sub_4326E0 endp

sub_433910: ;SUBROUTINE
	push edx
	push ebp
	mov ebp, esp
	sub esp, 10h
	and esp, 0FFFFFFF8h
	fld dword [flt_4CB6C4]
	fld dword [ebp+1Ch]
	fmul st0, st1
	fld dword [ebp+20h]
	fmulp st2, st0
	fld dword [ebp+14h]
	mov eax, [ebp+1Ch]
	fldz
	mov dword [dword_4D5294], eax
	fxch st2
	fstp dword [flt_4D52A4]
	fxch st2
	fst dword [flt_4D52A8]
	fld dword [flt_4D52A4]
	fadd dword [ebp+0Ch]
	fxch st1
	fadd dword [ebp+10h]
	fxch st1
	fstp dword [flt_4D529C]
	fstp dword [flt_4D52A0]
	fcompp
	fnstsw ax
	sahf
	jz loc_4339F5
	fld dword [ebp+18h]
	fld dword [ebp+14h]
	fmul dword [flt_4CB6C8]
	fstp dword [esp]
	fldz
	fcompp
	fnstsw ax
	sahf
	jz loc_433A01
	fld dword [esp]
	fptan
	fstp st0
	fld dword [ebp+18h]
	fmul dword [flt_4CB6C8]
	fptan
	fstp st0
	fld dword [ebp+1Ch]
	fdivrp st2, st0
	fdivr dword [ebp+20h]
	fxch st1

loc_4339A8:
	fstp dword [dword_4D5294]

loc_4339AE:
	fstp dword [flt_4D5298]
	mov ah, byte [flt_4D5298+3]
	fld dword [dword_4D5294]
	xor ah, 80h
	fld dword [flt_4CB6C4]
	fxch st1
	fmul st0, st1
	mov byte [flt_4D5298+3], ah
	fld dword [flt_4D5298]
	fmulp st2, st0
	mov edx, [ebp+24h]
	fstp dword [dword_4D5294]
	fstp dword [flt_4D5298]
	test edx, edx
	jnz loc_433A26
	mov esp, ebp
	pop ebp
	pop edx
	ret 1Ch

loc_4339F5:
	fld dword [ebp+20h]
	fld dword [ebp+1Ch]
	fdiv st0, st1
	fmulp st1, st0
	jmp loc_4339AE

loc_433A01:
	fld dword [esp]
	fptan
	fstp st0
	fld dword [ebp+1Ch]
	fld st0
	fld1
	fdivrp st3, st0
	fxch st1
	fld dword [ebp+20h]
	fxch st1
	fdiv st0, st1
	fmulp st1, st0
	fxch st1
