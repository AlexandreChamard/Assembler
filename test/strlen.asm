section .rodata
	ptr	db	'bonjour', 0

section .data

section .text
	global _start

_start:
	mov eax, 0
	push eax
l1:
	mov ebx, ptr
	add ebx, [esp]
	mov al, [ebx]
	cmp byte al, 0
	je l2
	inc dword [esp]
	jmp l1

l2:
	add dword [esp], '0'
	mov eax, 4			;eax serve here for storing the number of the syscall (here, write)
	mov ebx, 1			;fd (stdout)
	mov ecx, esp
	mov edx, 4			;len of stars to write
	int 0x80							;syscall

nullptr:

; *** END ***
	mov eax, 1
	mov ebx, 0
	int 0x80
