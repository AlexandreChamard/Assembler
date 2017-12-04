section .text
	global _start
	extern main

_start:
	push esp
	add dword [esp], 4
	push dword [esp + 4]
	call main
	mov ebx, eax
	mov eax, 1
	int 0x80
