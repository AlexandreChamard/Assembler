section .text
	global _putstr
	global _putstr_computed
	extern _strlen

; Type:
;	void
; Args:
;	ESI = [EBP + 8]: str
_putstr:
	push ebp
	mov ebp, esp
	push eax
	push ebx
	push ecx
	push edx

	mov esi, [ebp + 8]
	cmp esi, 0
	je end_putstr		; If !str

	push esi
	call _strlen		; EAX = len of ESI
	pop esi
	cmp eax, 0
	je end_putstr		; If len == 0 ; No need to call write

	; Write str sizeof len
	mov edx, eax
	mov eax, 4
	mov ebx, 1
	mov ecx, esi
	int 0x80

end_putstr:
	pop edx
	pop ecx
	pop ebx
	pop eax

	pop ebp
	ret

; Type:
;	void
; Args;
;	ECX = [ESP + 20]: str
;	EDX = [ESP + 24]: len
_putstr_computed:
	push eax
	push ebx
	push ecx
	push edx

	; Write str sizeof len
	mov eax, 4
	mov ebx, 1
	mov ecx, [esp + 20]
	mov edx, [esp + 24]
	int 0x80

	pop edx
	pop ecx
	pop ebx
	pop eax
	ret
