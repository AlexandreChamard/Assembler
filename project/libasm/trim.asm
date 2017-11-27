section .text
	global _trim
	global _ltrim
	global _rtrim

; Type:
;	char *
; Args:
;	esi = [EBP + 8]: char *str
_trim:
	call _rtrim

; Type:
;	char *
; Args:
;	esi = [EBP + 8]: char *str
_ltrim:
	push ebp
	mov ebp, esp
	push esi
	push edi

	mov esi, [ebp + 8]
	mov edi, [ebp + 8]
loop_blank_ltrim:
	mov al, [esi]
	cmp al, 0		; '\0'
	je end_ltrim
	cmp al, 0x09		; '\n'
	je end_ltrim
	cmp al, ' '		; ' '
	je next_ltrim
	cmp al, 0x09		; '\t'
	je next_ltrim

; Vars:
;	esi: source
;	edi: dest
do_it_ltrim:
	mov al, [esi]
	cmp al, 0		; '\0'
	je end_do_it_ltrim
	cmp al, 0x09		; '\n'
	je end_do_it_ltrim
	mov [edi], al
	inc esi
	inc edi
	jmp do_it_ltrim
end_do_it_ltrim:
	mov [edi], al
	jmp end_ltrim

next_ltrim:
	inc esi
	jmp loop_blank_ltrim


end_ltrim:
	mov eax, [ebp + 8]
	pop edi
	pop esi
	pop ebp
	ret

; Type:
;	char *
; Args:
;	esi = [EBP + 8]: char *str
_rtrim:
	push ebp
	mov ebp, esp
	push esi

	mov esi, [ebp + 8]
loop_blank_rtrim:
	mov al, [esi]
	cmp al, 0		; '\0'
	je end_rtrim
	cmp al, 0x09		; '\n'
	je end_rtrim
	cmp al, ' '		; ' '
	je loop_blank_rtrim
	cmp al, 0x09		; '\t'
	je loop_blank_rtrim

loop_word_rtrim:
	mov al, [esi]
	cmp al, 0		; '\0'
	je end_rtrim
	cmp al, 0x09		; '\n'
	je end_rtrim
	cmp al, ' '		; ' '
	jne loop_word_rtrim
	cmp al, 0x09		; '\t'
	jne loop_word_rtrim

	mov byte [esi], 0

next_blank_rtrim:
	inc esi
	jmp loop_blank_rtrim

next_word_rtrim:
	inc esi
	jmp loop_word_rtrim


end_rtrim:
	mov eax, [ebp + 8]
	pop esi
	pop ebp
	ret
