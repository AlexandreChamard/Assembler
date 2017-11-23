section .text
	global _strcmp
	global _strncmp
	global _memcmp
	global _wordcmp

; Type:
;	int
; Args:
;	EDI = [EBP + 8]:  const char *str1
;	ESI = [EBP + 12]: const char *str2
_strcmp:
	push ebp
	mov ebp, esp
	push esi
	push edi
	push ebx
	mov edi, [ebp + 8]
	mov esi, [ebp + 12]

	xor eax, eax
	xor ebx, ebx			; set registers to 0 used to calcul result
loop_strcmp:
	mov al, [edi]
	cmp al, [esi]
	jne end_strcmp			; If *str1 != *str2
	cmp al, 0
	je end_strcmp			; If !*str1
	inc edi
	inc esi
	jmp loop_strcmp

end_strcmp:
	mov al, [edi]
	mov bl, [esi]
	sub eax, ebx			; EAX = *str1 - *str2

	pop ebx
	pop edi
	pop esi
	pop ebp
	ret

; Type:
;	int
; Args:
;	EDI = [EBP + 8]:  const char *str1
;	ESI = [EBP + 12]: const char *str2
;	ECX = [EBP + 16]: int n
_strncmp:
	push ebp
	mov ebp, esp
	push esi
	push edi
	push ebx
	push ecx
	mov edi, [ebp + 8]
	mov esi, [ebp + 12]
	mov ecx, [ebp + 16]
	xor eax, eax
	xor ebx, ebx			; set registers to 0 used to calcul result


	dec ecx				; don't show the last char if ending
	cmp ecx, 0
	jl end_strncmp			; If n < 0
	je calcul_result_strncmp	; If n == 0

loop_strncmp:
	mov al, [edi]
	cmp al, [esi]
	jne calcul_result_strncmp	; If *str1 != *str2
	cmp al, 0
	je calcul_result_strncmp	; If !*str1
	inc edi
	inc esi
	loop loop_strncmp

calcul_result_strncmp:
	mov al, [edi]
	mov bl, [esi]
	sub eax, ebx			; EAX = *str1 - *str2

end_strncmp:
	pop ecx
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret

; Type:
;	int
; Args:
;	EDI = [EBP + 8]:  const void *ptr1
;	ESI = [EBP + 12]: const void *ptr2
;	ECX = [EBP + 16]: int n
_memcmp:
	push ebp
	mov ebp, esp
	push esi
	push edi
	push ebx
	push ecx
	mov edi, [ebp + 8]
	mov esi, [ebp + 12]
	mov ecx, [ebp + 16]
	xor eax, eax
	xor ebx, ebx			; set registers to 0 used to calcul result


	dec ecx				; don't show the last char if ending
	cmp ecx, 0
	jl end_memcmp			; If n < 0
	je calcul_result_memcmp		; If n == 0

loop_memcmp:
	mov al, [edi]
	cmp al, [esi]
	jne calcul_result_memcmp	; If *ptr1 != *ptr2
	cmp al, 0
	je calcul_result_memcmp		; If !*ptr1
	inc edi
	inc esi
	loop loop_memcmp

calcul_result_memcmp:
	mov al, [edi]
	mov bl, [esi]
	sub eax, ebx			; EAX = *ptr1 - *ptr2
	cmp eax, 0
	je end_memcmp			; If !*ptr1
	cmp ebx, 0
	je end_memcmp			; If !*ptr2
	mov ebx, 256
	imul eax, ebx			; If *ptr1 && *ptr2 then EAX = EAX * 256

end_memcmp:
	pop ecx
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret


; Type:
;	bool
; Args:
;	EDI = [EBP + 8]:  const char *str1
;	ESI = [EBP + 12]: const char *str2
_wordcmp:
	push ebp
	mov ebp, esp
	push esi
	push edi
	mov edi, [ebp + 8]
	mov esi, [ebp + 12]

	xor eax, eax
loop_wordcmp:
	mov al, [esi]
	cmp al, 0
	je end_true_wordcmp			; If !*str1
	cmp al, [edi]
	jne end_false_wordcmp			; If *str1 != *str2
	inc edi
	inc esi
	jmp loop_wordcmp

end_true_wordcmp:
	mov eax, 1				; Return true
	jmp end_wordcmp

end_false_wordcmp:
	mov eax, 0				; Return false

end_wordcmp:
	pop edi
	pop esi
	pop ebp
	ret
