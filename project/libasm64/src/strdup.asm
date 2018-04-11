section .text
        global _strdup
        global _strndup
        extern _strlen
        extern _strcpy
        extern _strncpy
        extern _malloc

; Type:
;	char *
; args:
;	RDI = const char *dest
_strdup:
	push rbp
	mov rbp, rsp

        push rdi                ; save *str
	; Get len to cpy
        call _strlen
        inc rax                 ; add 1 to len for '\0'
        mov rdi, rax            ; arg to _malloc
        call _malloc
        mov rdi, rax            ; 1st arg to _strcpy
        pop rsi                 ; get *str in 2nd arg for _strcpy
        call _strcpy

end_strdup:
        pop rbp
	ret

; Type:
;	char *
; args:
;	RDI = const char *dest
;       RSI = int len

_strndup:
	push rbp
	mov rbp, rsp

        push rsi                ; save len
        push rdi                ; save *str
        mov rdi, rsi            ; len as 1st arg for _malloc
        call _malloc
        mov rdi, rax            ; 1st arg to _strncpy
        pop rsi                 ; get *str in 2nd arg for _strncpy
        pop rdx                 ; get len in third arg for _strncpy
        call _strncpy

end_strndup:
        pop rbp
	ret


