section .text
	global _strlen

; Type:
;	int
; Args:
;	RDI = [ESP + 8]: const char *str
_strlen:
	push rbp
	mov rbp, rsp
	sub rsp, 0x10
	xor rax, rax
	mov dword [rbp - 4], 0
	jmp while_strlen
loop_strlen:
	inc dword [rbp - 4]
while_strlen:
	mov eax, [rbp - 4]
	cmp byte [rdi + rax], 0
	jne loop_strlen
	leave
	ret
