section .text
	global _start
	extern main

_start:
	mov ebp, esp

	mov ecx, [esp]
	dec ecx
push_av:
	push ebp
	add dword [esp], 4
	loop push_av
	push dword [ebp]
	call main
	mov ebx, eax

exit:
	mov eax, 1              ; sys_exit
	int 0x80
