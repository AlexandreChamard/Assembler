section .text

        global _strcat
        extern _strlen
        extern _strcpy
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
        mov rsp, rbp

        ; DEBUG
        call _puts
        ; DEBUG

        ; No need to play with rdi/rsi as they are not modified by _strlen and _strcpy
        call _strlen                    ; _strlen(char *dest)

        push rdi                        ; save *dest
        push rax                        ; save *dest len
        
        call _strcpy                    ; _strcpy(char *dest, char *src)
        
        mov rsi, rax                    ; *dest will now be 2nd arg of _strcpy
        pop rax
        add rdi, rax
        pop rsi                         ; get *dest in 2nd arg of _strcpy
        call _strcpy
        
        pop rbp
        ret
