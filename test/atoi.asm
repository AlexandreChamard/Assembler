section .text
    global _start

_start:
        mov ebp, esp
        push dword [ebp + 8]
        call _atoi
        mov ebx, eax
        mov eax, 1
        int 0x80


_atoi:
        push ebp
        mov ebp, esp
        push edi
        sub esp, 8        ; esp = neg ; esp + 4 = nb

        ; arg
        ; [ebp + 8] = str

        mov edi, [ebp + 8]
        mov dword [esp + 4], 0  ; nb = 0
        mov dword [esp], 1      ; neg = 1

        cmp byte [edi], '-'
        jne if_not_minus
        mov dword [esp], -1
        inc edi
if_not_minus:

loop_nb:
        cmp byte [edi], '0'
        jl set_return       ; if < '0'
        cmp byte [edi], '9'
        jg set_return       ; if > '9'
        imul eax, [esp + 4], 10
        add al, [edi]
        sub eax, '0'
        mov [esp + 4], eax
        inc edi
        jmp loop_nb
end_atoi:
        mov eax, [esp + 4]  ; ret = nb
        imul eax, [esp]     ; ret = nb * neg
        add esp, 8
        pop edi
        pop ebp
        ret

; int nb = 0
; int neg = 1
;
; if (*str == '-') {
;   str++
;   neg = -1
; }
; while (*str) {
;   nb = nb * 10 + *str - '0'
;   str++
; }
; return nb * neg
