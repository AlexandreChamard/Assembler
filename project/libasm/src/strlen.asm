section .text
	global _strlen

; Type:
;	int
; Args:
;	ESI = [ESP + 8]: const char *str
_strlen:
	push esi

	; Init var
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
