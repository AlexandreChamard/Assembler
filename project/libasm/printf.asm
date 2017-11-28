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
	push ebp
	mov ebp, esp
	push eax
	push ebx
	push ecx
	push edx
	push esi
	push edi

	mov edi, [ebp + 8]
	mov eax, 12			; EAX = rank of varargs

loop_read:				; loop in format
	cmp byte [edi], 0
	je end_printf			; If end of format
	cmp byte [edi], '%'
	je find_code			; If find code

continue_read:				; read next char of format
	push dword [edi]
	call _putchar
	add esp, 4
	inc edi
	jmp loop_read


find_code:
	inc edi
	mov esi, tab

; Vars
;	ESI = début de la ligne à chaque loop
;	EDI = addresse du code à trouver
loop_find_code:				; Loop in tab to find right code
	cmp dword [esi], 0
	je bad_end_find_code		; If end tab

	push eax
	push esi			; Arg2 of wordcmp: address of code of tab
	push edi			; Arg1 of wordcmp: address of code to find
	call _wordcmp			; Verify code
	add esp, 8
	cmp eax, 1
	pop eax
	je finded_code			; If find right code

	add esi, [len_line]		; Go to the next line of tab
	jmp loop_find_code		; If not go to next code



finded_code:				; print with func of code finded
	push dword [ebp + eax]
	call [esi + 4]
	add esp, 4
	add eax, [esi + 8]
	add edi, 1
	jmp loop_read

bad_end_find_code:
	push dword [l_error]
	push error
	call _putstr_computed
	add esp, 8
	jmp loop_read

end_printf:
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	pop eax
	pop ebp
	ret
