section .text
	global _strlen
_strlen:
	push ebp		; Save the old base pointer value.
	mov ebp, esp		; Set the new base pointer value.

	; use eax, esi
	push esi

	; [ebp]        prev ebp
	; [ebp + 8]    str

	; init var
	xor eax, eax		; i = 0
	mov esi, [ebp + 8]	; esi = str

loop_strlen:
	cmp byte [esi], 0
	je end_strlen
	inc eax
	inc esi
	jmp loop_strlen

end_strlen:
	pop esi
	pop ebp
	ret
