section .text
	global _putstr
	global _putstr_computed
	extern _strlen

; Type:
;	void
; Args:
;	RDI: const char *str
_putstr:
	push rbp
	mov rbp, rsp
	call _strlen
	xor rdx, rdx
	mov edx, eax
	mov qword rsi, rdi
	mov rdi, 1
	mov rax, 1
	syscall
	leave
	ret

; Type:
;	void
; Args:
;	RDI: const char *str
;	ESI: int
_putstr_computed:
	push rbp
	mov rbp, rsp
	mov edx, esi
	mov qword rsi, rdi
	mov rdi, 1
	mov rax, 1
	syscall
	leave
	ret
