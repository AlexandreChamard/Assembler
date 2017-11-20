section .text
	global _start
	extern _strlen

_start:

	mov ebp, esp			; set le ebp sur 0
	mov eax, 84
	cmp dword [ebp], 1
	je end
	push dword [ebp + 8]		; push av[ecx]
	call _strlen			;will put len at [esp], and the string at [esp - 4]

end:
	mov ebx, eax
	mov eax, 1
	int 0x80
