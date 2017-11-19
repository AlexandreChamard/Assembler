section .text
	global _start

_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, [esp + 4]
	mov edx, 7
	int 0x80

	mov eax, 1
	mov ebx, 0
	int 0x80
