section .rodata
        src db "source: "
        lensrc equ $ - src
        dest db "dest: "
        lendest equ $ - dest
        next_line db 0x0A

section .text
        global _start
        extern _strlen

_start:
        push ebp
        mov ebp, esp
        mov edi, [ebp + 12]
        mov esi, [ebp + 16]
        push edi
        push esi
        call _strcpy
        pop esi
        pop edi

print:
        mov eax, 4
        mov ecx, dest
        mov edx, lendest
        int 0x80

        push edi
        call _strlen
        pop edi
        mov edx, eax           ; Write len bytes
        mov eax, 4              ; sys_write
        mov ebx, 1              ; fd = STDOUT
        mov ecx, edi            ; Write str1
        int 0x80

        mov eax, 4
        mov ecx, next_line
        mov edx, 1
        int 0x80

        mov eax, 4
        mov ecx, src
        mov edx, lensrc
        int 0x80

        push esi
        call _strlen
        pop esi
        mov edx, eax           ; Write len bytes
        mov eax, 4              ; sys_write
        mov ebx, 1              ; fd = STDOUT
        mov ecx, esi            ; Write str2
        int 0x80

        mov eax, 4
        mov ecx, next_line
        mov edx, 1
        int 0x80

exit:
        pop ebp
        mov eax, 1              ; sys_exit
        xor ebx, ebx            ; return 0
        int 0x80

_strcpy:
        push ebp
        mov ebp, esp            ; Save esp
        ; Gonna use eax, ecx, esi, edi
        push esi
        push edi
        push ecx
        mov esi, [ebp + 8]      ; Save str1 pointer into edi
        mov edi, [ebp + 12]     ; Save str2 pointer into esi

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
if_len_l:

loop_cpy:
        mov al, [esi]           ; Save str1[ecx] into al
        mov [edi], al           ; Put al into str2[ecx]
        inc esi                 ; Increment str1 index
        inc edi                 ; Increment str2 index
        loop loop_cpy           ; if (ecx){goto loop_cpy}

        mov byte [edi], 0
return:
        mov eax, [ebp + 8]      ; return *str2
        ; Get back registers
        pop ecx
        pop edi
        pop esi
        pop ebp
        ret
