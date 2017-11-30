; section .rodata
; 	w db 10

section .text
	global _start
	extern main
	; extern _putnbr
	; extern _puts
	; extern _atoi

_start:
	push esp
	add dword [esp], 4
	push dword [esp + 4]
	call main
	mov ebx, eax
	mov eax, 1
	int 0x80

; main:
; 	lea	ecx, [esp + 4]
; 	and	esp, 0xfffffff0
; 	push   	dword [ecx-0x4]
; 	push	ebp
;
;
; 	ret
