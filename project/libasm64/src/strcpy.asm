section .text
	global _strcpy
        global _strncpy
	extern _strlen

; Type:
;	char *
; args:
;	RDI = char *dest
;	RSI = const char *src
_strcpy:
	push rbp
	mov rbp, rsp

        push rdi                ; save *dest for the return
	; Get len to cpy
        push rdi                ; save *dest
        push rsi                ; save *src
        mov rdi, rsi            ; call strlen on *src that was in rsi
	call _strlen
        pop rsi
        pop rdi
	mov rcx, rax		; RCX = len of rsi

loop_cpy:
	mov al, [rsi]
	mov [rdi], al
	inc rsi
	inc rdi
	loop loop_cpy		; While not end of len
	mov byte [rdi], 0	; Set '\0' at end of dest

end_strcpy:
        pop rax                 ; return *dest
        pop rbp
	ret


; Type:
;	char*
; Args;
;	RDI = char *dest
;	RSI = const char *src
;	RDX = int len
_strncpy:
        push rbp
        mov rbp, rsp

        push rdi                ; save *dest for return

	mov rcx, rdx 

loop_ncpy:
	mov al, [rsi]
	mov [rdi], al
	inc rsi
	inc rdi
	loop loop_ncpy	; While not end of len
	mov byte [rdi], 0	; Set '\0' at end of dest

end_strncpy:
        pop rax                 ; return *dest
        pop rbp
	ret
