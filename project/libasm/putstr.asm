section .text
        global _putstr
        global _putstr_computed
        extern _strlen

_putstr:
        push ebp
        mov ebp, esp
        push eax                ; putstr is a void, so no need to lose eax
        push ebx
        push ecx
        push edx

        ; arg
        ; ebp + 8 = str

        mov esi, [ebp + 8]
        cmp esi, 0              ; If str == NULL
        je end_putstr

        push esi
        call _strlen
        pop esi
        cmp eax, 0              ; If len == 0
        je end_putstr           ; No need to call sys_write

        mov edx, eax
        mov eax, 4
        mov ebx, 1
        mov ecx, esi
        int 0x80

end_putstr:
        pop edx
        pop ecx
        pop ebx
        pop eax

        pop ebp
        ret

_putstr_computed:
        push eax
        push ebx
        push ecx
        push edx

        ; args
        ; esp + 20 = str
        ; esp + 24 = len

        mov eax, 4
        mov ebx, 1
        mov ecx, [esp + 20] ; str
        mov edx, [esp + 24] ; sizeof str
        int 0x80

        pop edx
        pop ecx
        pop ebx
        pop eax
        ret
