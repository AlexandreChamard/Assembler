section .text
	global _strcmp
	global _strncmp
	global _memcmp
	global _wordcmp

; Type:
;	int
; Args:
;	RDI = const void *ptr1
;	RSI = const void *ptr2
;	RDX = int n
_memcmp:
	push rbp
	mov rbp, rsp

        push rbx                        ; save rbx

	xor rax, rax
	xor rbx, rbx			; set registers to 0 used to calcul result

        cmp rdi, 0                      ; if !ptr1
        je null_handling
        cmp rsi, 0                      ; if !ptr2
        je null_handling

        mov rcx, rdx                    ; Get size_t given as third arg
	dec rcx				; don't show the last char if ending
	cmp rcx, 0
	jl end_memcmp			; If n < 0
	je calcul_result_memcmp		; If n == 0

loop_memcmp:
	mov al, [rdi]
	cmp al, [rsi]
	jne calcul_result_memcmp	; If *ptr1 != *ptr2
	cmp al, 0
	je calcul_result_memcmp		; If !*ptr1
	inc rdi
	inc rsi
	loop loop_memcmp

calcul_result_memcmp:
	mov al, [rdi]
	mov bl, [rsi]
	sub rax, rbx			; RAX = *ptr1 - *ptr2
	cmp rax, 0
	je end_memcmp			; If !*ptr1
	cmp rbx, 0
	je end_memcmp			; If !*ptr2
	mov rbx, 256
	imul rax, rbx			; If *ptr1 && *ptr2 then RAX = RAX * 256

end_memcmp:
        pop rbx
	pop rbp
	ret


; Type:
;	bool
; Args:
;	RDI = const char *str1
;	RSI = const char *str2
_wordcmp:
	push rbp
	mov rbp, rsp

        cmp rdi, 0                      ; if !ptr1
        je null_handling
        cmp rsi, 0                      ; if !ptr2
        je null_handling

	xor rax, rax

loop_wordcmp:
	mov al, [rsi]
	cmp al, 0
	je end_true_wordcmp			; If !*str1
	cmp al, [rdi]
	jne end_false_wordcmp			; If *str1 != *str2
	inc rdi
	inc rsi
	jmp loop_wordcmp

end_true_wordcmp:
	mov rax, 1				; Return true
	jmp end_wordcmp

end_false_wordcmp:
	mov rax, 0				; Return false

end_wordcmp:
	pop rbp
	ret


null_handling:
        mov rax, 84                     ; Ahem
        pop rbx
        pop rbp
        ret
