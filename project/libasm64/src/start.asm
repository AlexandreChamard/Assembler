section .text
	global _start
	extern main

_start:
	xor ebp, ebp
	and rsp, 0xfffffffffffffff0
	mov edi, [rsp]
	lea rsi, [rsp + 8]
	call main
	mov rdi, rax
	mov rax, 60
	syscall
