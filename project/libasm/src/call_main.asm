section .text
	global _start
	extern main

_start:
	mov ebp, esp

	mov ecx, [ebp]
	cmp ecx, 1
	je push_av
	dec ecx

push_av:
	push dword [ebp + 4]
	push ebp
	add dword [esp], 4
	loop push_av
	push dword [ebp]
	call main
	mov ebx, eax

exit:
	mov eax, 1              ; sys_exit
	int 0x80
