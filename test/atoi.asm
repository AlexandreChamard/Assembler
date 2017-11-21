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
        push esi
        sub esp, 8        ; esp = neg ; esp + 4 = nb

        ; arg
        ; [ebp + 8] = str

        mov esi, [ebp + 8]
        mov dword [esp + 4], 0  ; nb = 0
        mov dword [esp], 1      ; neg = 1

        cmp byte [esi], '-'
        jne if_not_minus
        mov dword [esp], -1
        inc esi
if_not_minus:

loop_nb:
        cmp byte [esi], '0'
        jl set_return       ; if < '0'
        cmp byte [esi], '9'
        jg set_return       ; if > '9'
        imul eax, [esp + 4], 10
        add al, [esi]
        sub eax, '0'
        mov [esp + 4], eax
        inc esi
        jmp loop_nb
end_atoi:
        mov eax, [esp + 4]  ; ret = nb
        imul eax, [esp]     ; ret = nb * neg
        add esp, 8
        pop esi
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
