section .text

        global _strcat
        extern _strlen
        extern _strcpy
        extern _strncpy
        ; DEBUG
        extern _puts
        ; DEBUG

; Type:
;	char *
; args:
;	RDI = char *dest
;	RSI = const char *src
_strcat:
        push rbp
        mov rbp, rsp

        push rdi                        ; save *dest

        call _strlen                    ; get dest_len in rax

        add rdi, rax
        call _strcpy

        pop rax                         ; get back *dest in ret
        pop rbp
        ret
