; Wrapper for Watcom fastcall

global iSNDdirectsetfunctions_

extern iSNDdirectsetfunctions

[BITS 32]

section .text

iSNDdirectsetfunctions_:
	sub esp, 16 ;Prepare stack for 4 arguments
	mov [esp+4], eax ;Move 1st argument
	mov [esp+8], edx ;Move 2nd argument
	mov [esp+12], ebx ;Move 3rd argument
	mov eax, [esp+16] ;Move return address from stack to register
	mov [esp], eax ;Move return address from register on stack
	mov [esp+16], ecx ;Move 4th argument
	jmp iSNDdirectsetfunctions
