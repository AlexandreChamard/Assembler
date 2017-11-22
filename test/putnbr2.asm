section .rodata
	msg db "test", 0x0A
	base_len equ 10			; Base numbers
	ng db "-"               	; Negative symbol

section .text
        global _putnbr
        extern _putstr

_putnbr:
        push ebp
        mov ebp, esp
	push eax
	push ebx
	push ecx
	push edx
	push esi

        mov eax, [ebp + 8]
	cmp eax, 0
        jge calc_loop
        ; if (nb < 0)
        push ng
        call _putstr
        pop esi
        neg eax				; Multiply eax by -1

calc_loop:
	push msg
	call _putstr
	pop esi
        cmp eax, base_len
        jl end_print
        xor edx, edx
	mov ecx, base_len
	idiv ecx

print_in_loop:
	push eax
	mov ecx, eax
	;add ecx, '0'
	mov eax, 4			; sys_write
	mov ebx, 1			; STDOUT
	mov edx, 1
	int 0x80
	pop eax
	jmp calc_loop

end_print:
	mov ecx, eax
	add ecx, '0'
	mov eax, 4			; sys_write
	mov ebx, 1			; STDOUT
	mov edx, 1
	int 0x80

end_putnbr:
	pop esi
	pop edx
	pop ecx
	pop ebx
	pop eax
	pop ebp
	ret
