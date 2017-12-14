section .rodata
	new_line db 0x0A

section .text
	global _puts
        global _perror
	extern _strlen

; Type:
;	void
; Args;
;	RDI = const char *str
_puts:
	push rbp
	mov rbp, rsp

	cmp rdi, 0
	je end_puts		; If !str

	call _strlen		; EAX = len of ESI
	cmp rax, 0
	je end_puts		; If len == 0 ; No need to call write

	; Write str sizeof len
	mov rdx, rax
	mov rax, 1              ; sys_write
        mov rsi, rdi            ; *str is now in rsi
	mov rdi, 1              ; STDOUT
	syscall

end_puts:
	;write '\n'
        mov rax, 1              ; sys_write
        mov rdi, 1              ; STDOUT
	mov rsi, new_line       ; *str
	mov rdx, 1              ; len
        syscall

	pop rbp
	ret


; Type:
;	void
; Args;
;	RDI = const char *str
_perror:
        push rbp
        mov rbp, rsp

        cmp rdi, 0
        je end_perror           ; if !str

        call _strlen
        cmp rax, 0
        je end_perror           ; if len == 0

        mov rdx, rax            ; write len characters
        mov rax, 1              ; sys_write
        mov rsi, rdi            ; *str is now in rsi
        mov rdi, 2              ; STDERR
        syscall

end_perror:
        ;write '\n'
        mov rax, 1              ; sys_write
        mov rdi, 2              ; STDERR
	mov rsi, new_line       ; *str
	mov rdx, 1              ; len
        syscall

	pop rbp
	ret
