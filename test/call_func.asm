section .text
	global _start

func1:
	mov eax, 4
	mov ebx, 1
	mov ecx, esp
	add ecx, 8
	mov edx, 4
	int 0x80

	sub ecx, 4
	mov dword [ecx], 0
	ret


_start:
	push 'AAAH'
	sub esp, 4
	call func1
	mov ecx, esp
	int 0x80

	;verif exit func 1
	cmp dword [esp], 0
	mov ebx, 0
	je exit_s
	mov ebx, 84
exit_s:
	mov eax, 1
	int 0x80
