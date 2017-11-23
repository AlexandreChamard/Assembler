section .text
	global _start
	extern _printf
	extern _puts
	extern _putnbr

_start:
	mov ebp, esp

	mov ecx, [ebp]
  cmp ecx, 1
  je end_start
	dec ecx

push_args:
	push dword [ebp + 4 * ecx + 4]
	loop push_args
  call _printf

end_start:
	add esp, [ebp]
	add esp, 4
	mov eax, 1
	mov ebx, 0
	int 0x80
