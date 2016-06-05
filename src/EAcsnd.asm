; This is a port of the Windows game Need For Speed™ II Special Edition.
; Copyright (C) 2014-2016  Błażej Szczygieł

; This program is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.

; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.

; You should have received a copy of the GNU General Public License
; along with this program.  If not, see <http://www.gnu.org/licenses/>.


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
