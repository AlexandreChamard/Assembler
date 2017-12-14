section .text
	global _strcpy
	extern _strlen
        ; IN TESTING - TO REMOVE
        extern _puts
        ; IN TESTING - TO REMOVE

; Type:
;	char *
; args:
;	RDI = char *dest
;	RSI = const char *src
_strcpy:
	push rbp
	mov rbp, rsp

        ; if !dest or !src
        cmp rdi, 0
        je end_strcpy
        cmp rsi, 0
        je end_strcpy

	; Get len to cpy
        push rdi                ; save *dest
        mov rsi, rdi            ; call strlen on *src
	call _strlen
        pop rdi
	mov rcx, rax		; RCX = len of rsi

loop_cpy:
        ; IN TESTING - TO REMOVE
        call _puts
        ; IN TESTING - TO REMOVE
	mov al, [rsi]
	mov [rdi], al
	inc rsi
	inc rdi
	loop loop_cpy		; While not end of len
	mov byte [rdi], 0	; Set '\0' at end of dest

end_strcpy:
	mov rax, rdi	        ; Return dest
	ret

; Type:
;	char*
; Args;
;	RDI = char *dest
;	RSI = const char *src
;	RDX = int len
_strcpy_computed:
        push rbp
        mov rbp, rsp

	mov rcx, rdx 

loop_cpy_computed:
	mov al, [rsi]
	mov [rdi], al
	inc rsi
	inc rdi
	loop loop_cpy_computed	; While not end of len
	mov byte [rdi], 0	; Set '\0' at end of dest

end_strcpy_computed:
	mov rax, rdi	        ; Return dest
        pop rbp
	ret
