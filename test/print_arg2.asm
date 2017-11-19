section .rodata
	new_line db 10		; '\n'

section .text
	global _start

_start:
	mov ebp, esp			; set le ebp sur 0
	mov ecx, 0			; ecx == iteration des av

loop_arg:
	push ecx			; push iteration des av

	push dword [ebp + 4 * (ecx + 1)]	; push av[ecx]
	sub esp, 4			; addresse de return
	call _strlen			;will put len at [esp], and the string at [esp - 4]


	mov eax, 4
	mov ebx, 1
	mov ecx, [ebp + 4 * (ecx + 1)]	; addresse av[ecx]
	pop edx				; pop le return de _strlen
	int 0x80

	;print '\n'
	mov eax, 4		;eax est écraser par l'appel système
	mov ecx, new_line	; addresse d'un '\n'
	mov edx, 1
	int 0x80

	add esp, 4		; remove le ptr de av[ecx]
	pop ecx			; recupere l'ancien ecx soit l'iteration des av

	inc ecx
	cmp ecx, [ebp]		; si ecx == ac
	jne loop_arg

end:
	mov eax, 1
	mov ebx, 0
	int 0x80

_strlen:
	push ebp		; Save the old base pointer value.
	mov ebp, esp		; Set the new base pointer value.

	push ebx		; Save the values of registers that the function
	push ecx		; will modify.
	push edx		; This function uses ebx, ecx, edx, EDI and ESI.
	push edi
	push esi

	; [ebp] = prev ebp
	; [ebp + 4] = ????
	; ebp + 8 = return
	; [ebp + 12] = sur av[0]

	; init var
	mov ecx, 0		; i = 0

l1:
	mov edx, [ebp + 12]	; av[0]
	add edx, ecx		; av[0] + i
	cmp byte [edx], 0	; av[0][i] == 0
	je l2
	inc ecx
	jmp l1

l2:
	mov [ebp + 8], ecx	;return i

	pop esi
	pop edi
	pop edx
	pop ecx
	pop ebx
	pop ebp
	ret
