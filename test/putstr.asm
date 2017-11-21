section .rodata
        str1 db "Hello world!", 0x0A    ; 0x0A -> '\n'

section .text
        global _start
        extern _strlen

_start:
        push ebp
        mov ebp, esp
        push str1
        call _putstr
        pop esi
        mov eax, 1
        xor ebx, ebx
        int 0x80

_putstr:
        push ebp
        mov ebp, esp
        ; Gonna use eax, ebx, ecx, edx
        push eax                ; putstr is a void, so no need to lose eax
        push ebx
        push ecx
        push edx

        mov esi, [ebp + 8]
        cmp esi, 0
        je return
        push esi                ; Push str
        call _strlen
        pop esi                 ; Get back str
        cmp eax, 0              ; If len == 0
        je return               ; No need to call sys_write
        
        mov edx, eax            ; Ret of strlen into 3rd argument of sys_write
        mov eax, 4              ; sys_write
        mov ebx, 1              ; STDOUT
        mov ecx, esi            ; *str
        int 0x80

return:
        pop edx
        pop ecx
        pop ebx
        pop eax

        pop ebp
        ret
