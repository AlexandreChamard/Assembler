section .text
	global _strcpy
	global _strncpy
	extern _strlen

; Type:
;	char *
; args:
;	EDI = [EBP + 8]:  char *dest
;	ESI = [EBP + 12]: const char *src
_strcpy:
	push ebp
	mov ebp, esp
	push esi
	push edi
	push ecx
	mov edi, [ebp + 8]
	mov esi, [ebp + 12]

	; Get len to cpy
	push esi
	call _strlen
	pop esi
	mov ecx, eax		; ECX = len of esi

loop_cpy:
	mov al, [esi]
	mov [edi], al
	inc esi
	inc edi
	loop loop_cpy		; While not end of len
	mov byte [edi], 0	; Set '\0' at end of dest

end_strcpy:
	mov eax, [ebp + 8]	; Return dest
	pop ecx
	pop edi
	pop esi
	pop ebp
	ret

; Type:
;	char*
; Args;
;	EDI = [ESP + 16]: char *dest
;	ESI = [ESP + 20]: const char *src
;	ECX = [ESP + 24]: int len
_strncpy:
	push esi
	push edi
	push ecx
	mov edi, [esp + 16]
	mov esi, [esp + 20]
	mov ecx, [esp + 24]

loop_ncpy:
	mov al, [esi]
	mov [edi], al
	inc esi
	inc edi
	loop loop_ncpy	; While not end of len
	mov byte [edi], 0	; Set '\0' at end of dest

end_ncpy:
	mov eax, [esp + 16]	; Return dest
	pop ecx
	pop edi
	pop esi
	ret
