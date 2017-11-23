section .text
    global _atoi

; Type:
;	int
; Args:
;	ESI = [EBP + 8]: const char *str
_atoi:
        push ebp
        mov ebp, esp
        push esi
	push ebx
        sub esp, 8

	xor ebx, ebx
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
        jl end_atoi       ; if < '0'
        cmp byte [esi], '9'
        jg end_atoi       ; if > '9'
        imul eax, [esp + 4], 10
        mov bl, [esi]
        sub bl, '0'
	add eax, ebx
        mov [esp + 4], eax
        inc esi
        jmp loop_nb
end_atoi:
        mov eax, [esp + 4]  ; ret = nb
        imul eax, [esp]     ; ret = nb * neg
        add esp, 8
	pop ebx
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
