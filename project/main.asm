section .rodata
src db "source: "
lensrc equ $ - src
dest db "dest: "
lendest equ $ - dest


section .text
	global _start
        extern _putstr
	extern _strcmp
	extern _strncmp
	extern _memcmp
	extern _puts
	extern _putstr
	extern _putnbr
	extern _atoi
        extern _ltrim
	extern _rtrim
	extern _trim

_start:
	mov ebp, esp
	cmp dword [ebp], 2
	jl exit

	push dword [ebp + 8]
        call _puts
        call _trim
        call _puts

exit:
	mov eax, 1              ; sys_exit
	int 0x80
