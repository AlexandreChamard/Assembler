section .text

        global _malloc

; Type:
; 	void *
; args:
; 	RDI = int size
_malloc:
        push rbp
        mov rbp, rsp

        push rdi                        ; save size
        xor rdi, rdi                    ; 0 as arg to get current break
        mov rax, 12                     ; sys_brk
        syscall

        mov rdi, rax                    ; get cureent break as arg
        add rdi, 16                     ; add place for the size of *new_ptr
        mov rax, [rsp]                  ; get size back
        add rdi, rax                    ; add place for the memory *new_ptr will point to
        mov rax, 12                     ; sys_brk
        syscall                         ; get new break in rax

        pop rdi                         ; get size back
        sub rax, 16                     ;
        mov [rax], rdi                  ; have the size on the 16 first bits of new allocated memory
        add rax, 16

        pop rbp
        ret
