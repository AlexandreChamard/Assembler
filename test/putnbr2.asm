section .rodata
	base db "0123456789"		; Decimal base
	base_len equ $ - base		; Len of base
	ng db "-"               	; Negative symbol

section .text
        global _putnbr
        extern _putstr

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
	push esi

        mov eax, [ebp + 8]		; Get int given by _atoi
	cmp eax, 0
        jge calc_loop			; if (nb < 0)
        push ng
        call _putstr
        pop esi
        neg eax				; Multiply eax by -1

calc_loop:
        cmp eax, base_len
        jl end_print
        xor edx, edx
	mov ecx, base_len
	idiv ecx

print_in_loop:
	push eax			; save remainder for calc_loop
	mov ecx, base			; Get base string
	add ecx, edx			; Go to base[nb]
	mov eax, 4			; sys_write
	mov ebx, 1			; STDOUT
	mov edx, 1
	int 0x80
	pop eax
	jmp calc_loop

end_print:
	mov ecx, base			; Get base string
	add ecx, eax			; Go to base[nb]
	mov eax, 4			; sys_write
	mov ebx, 1			; STDOUT
	mov edx, 1			; 1 char
	int 0x80

end_putnbr:
	pop esi
	pop edx
	pop ecx
	pop ebx
	pop eax
	pop ebp
	ret
