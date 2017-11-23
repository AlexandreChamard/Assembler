section .rodata
	;;; TO REMOVE
	msg db "Nb to write : ", 0
	end_line db 0x0A, 0
	;;; TO REMOVE
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

        mov eax, [ebp + 8]		; Get int given by _atoi
	cmp eax, 0
        jge calc_loop			; if (nb < 0)
        push ng
        call _putstr
        pop esi
	;;; TO REMOVE
	push end_line
	call _putstr
	pop esi
	;;; TO REMOVE
        neg eax				; Multiply eax by -1

calc_loop:
	;;; TO REMOVE
	push msg
	call _putstr
	pop esi
	;;; TO REMOVE
        cmp eax, 10
        jl end_print
        xor edx, edx
	mov ecx, 10
	idiv ecx

print_in_loop:
	push eax
	mov ecx, edx			; Nb to write
	add ecx, '0'
	mov eax, 4			; sys_write
	mov ebx, 1			; STDOUT
	mov edx, 1
	int 0x80
	;;; TO REMOVE
	push end_line
	call _putstr
	pop esi
	;;; TO REMOVE
	pop eax
	jmp calc_loop

end_print:
	mov ecx, eax
	add ecx, '0'
	mov eax, 4			; sys_write
	mov ebx, 1			; STDOUT
	mov edx, 1
	int 0x80
	;;; TO REMOVE
	push end_line
	call _putstr
	pop esi
	;;; TO REMOVE

end_putnbr:
	pop esi
	pop edx
	pop ecx
	pop ebx
	pop eax
	pop ebp
	ret
