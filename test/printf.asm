section .rodata
  code db 'sd', 0
  print dd _puts, _putnbr

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

  mov edi, [ebp + 8]
  mov eax, 3

loop_read:
  cmp byte [edi], 0
  je end_printf
  xor ecx, ecx  ; ECX = verif quel print à faire
loop_who_print:
  mov bl, [code + ecx]
  cmp bl, 0
  je continue_read
  cmp bl, [edi]
  jne bad_code
  push dword [ebp + 4 * eax]
  call [print + ecx]
  add esp, 4
  inc eax
  jmp continue_read

bad_code:
  inc ecx
  jmp loop_who_print

continue_read:
  inc edi
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
