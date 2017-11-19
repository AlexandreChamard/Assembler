section .text
        global _start

_start:
        mov esp, [esp + 4]      ;Set esp on argv[0]
        sub esp, 4              ;alloc an int on stack
        call strlen             ;will put len at [esp], and the string at [esp - 4]
        mov edx, esp
        mov eax, 4              ;sys_write
        mov ebx, 1              ;STDOUT
        mov ecx, [esp - 4]      ;pointer on string
        int 0x80                ;syscall
        
        
