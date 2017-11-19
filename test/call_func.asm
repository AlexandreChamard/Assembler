section .text
	global _start

func1:
	; au start:
	; esp - 4 -> int de return
	; esp - 8 -> 'AAAH'
	mov eax, 4		;write
	mov ebx, 1		;stdout
	mov ecx, esp		;set ecx sur esp
	add ecx, 8		;set ecx sur esp - 8 -> 'AAAH'
	mov edx, 4		;write 4
	int 0x80

	sub ecx, 4		;set ecx sur esp - 4 -> int de return
	mov dword [ecx], 0	;set int du return à 0
	ret


_start:
	push 'AAAH'		;push 'AAAH' dans la stack	esp == 4
	sub esp, 4		;alloc 4 bytes dans la stack	esp == 8

	;start: arg1 = AAAH et return = ?
	call func1
	;end: arg1 = AAAH et return = 0

	mov ecx, esp		;set ecx sur esp -> esp == 8 donc ecx est sur l'int de return
	int 0x80		; write 4bytes sur stdout l'int de return

	;verif exit func 1
	mov ebx, 0		; return du main = 0

	cmp dword [esp], 0	; si cmp return et 0
	je exit_s		;si return == 0 jump exit
	mov ebx, 84		;sinon return du main = 84
exit_s:
	mov eax, 1		;exit avec soit 0 soit 84
	int 0x80
