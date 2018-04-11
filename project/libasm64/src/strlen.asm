section .text
	global _strlen

; Type:
;	int
; Args:
;	RDI = [ESP + 8]: const char *str
_strlen:
	push rbp
	mov rbp, rsp
	xor rax, rax
	jmp while_strlen
loop_strlen:
	inc rax
while_strlen:
	cmp byte [rdi + rax], 0
	jne loop_strlen
	leave
	ret
;openbsd
