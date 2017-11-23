section .text
  global _printf
  extern _puts
	extern _putnbr

; Type:
;	int
; Args:
;	int nb to print
;	vaargs
_printf:
	push ebp
	mov ebp, esp
	push eax
	push ebx
	push ecx
	push edx
	push esi
	push edi

  mov ecx, [ebp + 8]
  mov eax, 3
  cmp ecx, 0
  je end_printf
loop_print:
  mov edi, [ebp + 4 * eax]
  push edi
  call _puts
  pop edi
  inc eax
  loop loop_print

end_printf:
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	pop eax
	pop ebp
	ret
