section .text
	global _putchar

_putchar:
	push eax
	push ebx
	push ecx
	push edx

	mov eax, 4
	mov ebx, 1
	mov ecx, esp
	add ecx, 20
	mov edx, 1
	int 0x80

	pop edx
	pop ecx
	pop ebx
	pop eax
	ret
