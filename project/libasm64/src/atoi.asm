section .text
    global _atoi

; Type:
;       int
; Args:
;       RDI: str
_atoi:
        push rbp
        mov rbp, rsp
        xor rax, rax
        xor rdx, rdx
        xor rcx, rcx
        cmp byte [rdi], '-'
        jne loop_atoi
        inc rcx
        inc rdi

loop_atoi:
        cmp byte [rdi], '0'
        jl ret_atoi
        cmp byte [rdi], '9'
        jg ret_atoi
        imul rax, 10
        mov dl, [rdi]
        sub dl, '0'
        add rax, rdx
        inc rdi
        jmp loop_atoi

ret_atoi:
        cmp rcx, 0              ; rcx == 0 positif
        je end_atoi             ; rcx == 1 negatif
        neg rax
end_atoi:
        leave
        ret
