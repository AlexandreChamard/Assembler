section .rodata
	error db 'error', 0
	l_error dd $ - error
	; [code, funcptr, stacksize (in Byte)]
	len_line dd 12
	tab dd 's', _putstr, 4
	    dd 'd', _putnbr, 4
	    dd 'i', _putnbr, 4
	    dd 'c', _putchar, 4
	    dd 0

section .text
	global _printf
	extern _wordcmp
	extern _putchar
	extern _putstr
	extern _putstr_computed
	extern _putnbr

; Type:
;	int
; Args:
;	EDI = [EBP + 8]: const char *format
;	[EBP + 12+ ]:    var args
_printf:
	push rbp
	mov rbp, rsp
	
