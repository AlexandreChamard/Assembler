section .rodata
	minus db '-'
	number db '0123456789'

section .text
	global _putnbr

; Type:
;	void
; Args:
;	EAX = [EBP + 8]: int nb
_putnbr:
	push ebp
	mov ebp, esp
	push eax
	push ebx
	push ecx
	push edx
	mov eax, [ebp + 8]

	cmp eax, 0
	jge is_positif		; If nb is positif
	neg eax

	; Write '-'
	push eax
	mov eax, 4
	mov ebx, 1
	mov ecx, minus
	mov edx, 1
	int 0x80
	pop eax
is_positif:

	mov ebx, 10		; Pow = 10
	call _loop_putnbr

	pop edx
	pop ecx
	pop ebx
	pop eax
	pop ebp
	ret

; Vars:
;	EAX: nb
;	EBX: pow (10)
;	EDX: rank of to print
_loop_putnbr:
	xor edx, edx		; Set most significant bytes of nb to 0
	mov ecx, eax
	idiv ebx
	cmp ecx, 10
	jl stop_loop		; If nb < 10
	push edx
	call _loop_putnbr	; If nb >= 10
	pop edx

stop_loop:
	mov eax, 4
	mov ebx, 1
	mov ecx, number
	add ecx, edx
	mov edx, 1
	int 0x80
	ret


; int nb == eax
; char n == edx

; void putnbr(int nb)
; {
; 	if (nb < 0) {
; 		nb = nb * -1
; 		write(1, '-', 1)
; 	}
; 	loop_write(nb)
; }
;
; void loop_write(int nb)
; {
; 	char n = nb % 10 + '0'
;
; 	if (nb > 10) {
; 		putnbr(nb / 10)
; 	}
; 	write(1, &n, 1)
; }
