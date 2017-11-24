section .rodata
src db "source: "
lensrc equ $ - src
dest db "dest: "
lendest equ $ - dest


section .text
	global _start
	extern _strcmp
	extern _strncmp
	extern _memcmp
	extern _puts
	extern _putnbr
	extern _atoi
	extern _ltrim

_start:
	mov ebp, esp
	cmp dword [ebp], 2
	jl exit

	push dword [ebp + 8]
	call _ltrim
	add esp, 4
	push eax
	call _putstr
	pop eax

exit:
	mov eax, 1              ; sys_exit
	int 0x80
