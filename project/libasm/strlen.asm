section .text
	global _strlen

; Type:
;	int
; Args:
;	ESI = [ESP + 8]:	str
_strlen:
	push esi

	; init var
	xor eax, eax		; i = 0
	mov esi, [esp + 8]

loop_strlen:
	cmp byte [esi], 0
	je end_strlen
	inc eax
	inc esi
	jmp loop_strlen

end_strlen:
	pop esi
	ret
