section .rodata
        str1 db "Bite", 0x0A    ; 0x0A -> '\n'
        len1 equ $ - str1

section .data 
        str2 db "AHHHHH", 0x0A  ; 0x0A -> '\n'
        len2 equ $ - str2

section .text
        global _start

_start:
        mov ebp, esp            ; Save esp
        xor ecx, ecx            ; Set iterator to 0
        mov esi, str1           ; Save str1 pointer into esi
        mov edi, str2           ; Save str2 pointer into edi

loop:
        mov eax, [esi]          ; Save str1[ecx] into eax
        mov [edi], eax          ; Put eax into str2[ecx]
        inc esi                 ; 
        inc edi                 ;
        cmp ecx, len1           ; Test if we reached the end of str1
        je print
        inc ecx                 ; Increment iterator
        jmp loop

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
        mov eax, 1              ; sys_exit
        xor ebx, ebx            ; return 0
        int 0x80
