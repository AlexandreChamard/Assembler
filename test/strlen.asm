section .rodata
	ptr	db	'bonjour', 0

section .data

section .text
	global _start

strlen:
	push ebp     ; Save the old base pointer value.
	mov ebp, esp ; Set the new base pointer value.
	push ecx
	push edx
	push edi     ; Save the values of registers that the function
	push esi     ; will modify. This function uses EDI and ESI.

	mov edx, ebp	; ebx va start
	add edx, 7	; ebx va au ptr
	mov ecx, 0	; i = 0
l1:
	inc edx		; avance de i dans la str
	mov al, [ebx]
	cmp byte al, 0
	je l2
	inc ecx
	jmp l1

l2:
	add ebp, 4	;va au return
	mov ebp, ecx	;return i

	pop esi
	pop edi
	pop edx
	pop ecx
	pop ebp
	ret
