section .text
	global _start
	extern main

_start:
	; push qword [rsp + 8]
	; mov rax, 60
	; mov rdi, 1
	; mov rdx, 20
	; syscall
	; push rsp
	; add qword [rsp], 8
	push rsp
	call main
	mov rdi, rdx
	mov rax, 60
	; mov rdi, 42
	syscall



	; printf av[0]
	; push qword [rsp + 8]
	; mov rax, 1
	; mov rdi, 1
	; mov rsi, [rsp]
	; mov rdx, 20
	; syscall
