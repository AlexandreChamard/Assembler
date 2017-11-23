section .rodata
	format db '%s %d %s%c', 0
	str1 db 'bonjour', 0
	nb1 dd 1234
	str2 db 'aurevoir!', 0
	c db 0x0A

section .text
	global _start
	extern _printf
	extern _puts
	extern _putnbr

_start:
	mov ebp, esp

	push dword c
	push str2
	push dword [nb1]
	push str1
	push format
	call _printf

end_start:
	add esp, [ebp]
	add esp, 4
	mov eax, 1
	mov ebx, 0
	int 0x80

; _start:
; 	mov ebp, esp
;
; 	mov ecx, [ebp]
; 	cmp ecx, 1
; 	je end_start
; 	dec ecx
;
; push_args:
; 	push dword [ebp + 4 * ecx + 4]
; 	loop push_args
; 	call _printf
;
; end_start:
; 	add esp, [ebp]
; 	add esp, 4
; 	mov eax, 1
; 	mov ebx, 0
; 	int 0x80
