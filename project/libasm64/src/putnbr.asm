section .rodata
	minus db '-'
	number db '0123456789'

section .text
        global _putnbr

; Type:
;       void
; Args:
;       EDI: int nb
_putnbr:
        push rbp
        mov rbp, rsp

        sub rsp, 0x10
        mov [rbp - 0x4], edi    ; [rsp - 0x4] = nb
        cmp dword [rbp - 0x4], 0
        jge is_positif

        neg dword [rbp - 0x4]
        ;write '-'
        mov rax, 1
        mov rdi, 1
        mov rsi, minus
        mov rdx, 1
        syscall

is_positif:

        mov rcx, 10
        call loop_putnbr
        leave
        ret

loop_putnbr:
        xor rdx, rdx
        xor rax, rax
        mov eax, [rbp - 0x4]
        idiv rcx
        cmp dword [rbp - 0x4], 10
        jl stop_loop
        mov [rbp - 0x4], eax
        push rdx
        call loop_putnbr
        pop rdx

stop_loop:
        mov rax, 1
        mov rdi, 1
        mov rsi, number
        add rsi, rdx
        mov rdx, 1
        syscall
        ret
