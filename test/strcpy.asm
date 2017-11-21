section .rodata
        str1 db "Biteeeee", 0x0A    ; 0x0A -> '\n'
        len1 equ $ - str1

section .data
        str2 db "AHH", 0x0A  ; 0x0A -> '\n'
        len2 equ $ - str2

section .text
        global _start
        extern _strlen

_start:
        push ebp
        mov ebp, esp
        push str2
        push str1

; Start of strcpy
_strcpy:
        push ebp
        mov ebp, esp            ; Save esp
        mov esi, [ebp + 8]      ; Save str1 pointer into esi
        mov edi, [ebp + 12]     ; Save str2 pointer into edi

call_strlen:
        push esi                ; Push str1 pointer on stack for strlen
        call _strlen            ; len1 is ret in eax
        pop esi                 ; Get back str1 pointer
        mov ecx, eax            ; Save len1 into ecx
        push edi                ; Push str2 pointer on stack for strlen
        call _strlen            ; len2 is ret in eax
        pop edi                 ; Get back str2 pointer

if_min_len:
        cmp ecx, eax            ; ecx = len1 ; eax = len2
        jge if_len_ge           ; if len1 >= len2
        jmp if_len_l            ; if len1 < len2

if_len_ge:
        mov ecx, eax
        jmp end_if
if_len_l:

end_if:

          cmp ecx, 0
          jmp end_strcpy        ; if len == 0

loop_cpy:
        mov eax, [esi]          ; Save str1[ecx] into eax
        mov [edi], eax          ; Put eax into str2[ecx]
        inc esi                 ; Increment str1 index
        inc edi                 ; Increment str2 index
        loop loop_cpy           ; if (ecx){goto loop_cpy}

end_strcpy:
; End of strcpy

print:
        mov eax, 4              ; sys_write
        mov ebx, 1              ; fd = STDOUT
        mov ecx, str1           ; Write str1
        mov edx, len1           ; Write len bytes
        int 0x80

        mov eax, 4              ; sys_write
        mov ebx, 1              ; fd = STDOUT
        mov ecx, str2           ; Write str2
        mov edx, len2           ; Write len bytes
        int 0x80

exit:
        pop ebp
        mov eax, 1              ; sys_exit
        xor ebx, ebx            ; return 0
        int 0x80
