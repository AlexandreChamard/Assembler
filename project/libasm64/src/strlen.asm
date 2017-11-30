section .text
	global _strlen

; Type:
;	int
; Args:
;	ESI = [ESP + 8]: const char *str
_strlen:

; mov rax, 1
; mov rbx, 1
; mov rcx, [rsp + 8]
; mov rdx, 10
; syscall
;
; mov rax, 60
; syscall
;
; 	push rbp
; 	mov rsp, rbp
; 	push rsi
;
; 	xor rax, rax
; 	mov rsi, [rbp + 8]
;
; loop_strlen:
; 	cmp byte [rsi], 0
; 	je end_strlen
; 	inc rax
; 	inc rsi
; 	jmp loop_strlen
;
; end_strlen:
; 	pop rsi
; 	pop rbp
	ret
