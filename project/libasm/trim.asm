section .text
	global _ltrim

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
	push edi

	mov esi, [ebp + 8]
	mov edi, [ebp + 8]
loop_blank_rtrim:
	mov al, [esi]
	cmp al, 0		; '\0'
	je end_rtrim
	cmp al, 0x09		; '\n'
	je end_rtrim
	cmp al, ' '		; ' '
	je next_rtrim
	cmp al, 0x09		; '\t'
	je next_rtrim

; Vars:
;	esi: source
;	edi: dest
do_it_rtrim:
	mov al, [esi]
	cmp al, 0		; '\0'
	je end_do_it_rtrim
	cmp al, 0x09		; '\n'
	je end_do_it_rtrim
	mov [edi], al
	inc esi
	inc edi
	jmp do_it_rtrim
end_do_it_rtrim:
	mov [edi], al
	jmp end_rtrim

next_rtrim:
	inc esi
	jmp loop_blank_rtrim


end_rtrim:
	mov eax, [ebp + 8]
	pop edi
	pop esi
	pop ebp
	ret
