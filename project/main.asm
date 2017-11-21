section .rodata
src db "source: "
lensrc equ $ - src
dest db "dest: "
lendest equ $ - dest
next_line db 0x0A


section .text
	global _start
	extern _atoi
	extern _putnbr

_start:
	mov ebp, esp

	cmp dword [ebp], 1
	je exit

	push dword [ebp + 8]
	call _atoi

	mov [esp], eax

	call _putnbr
	add esp, 4

	mov ebx, eax
	mov eax, 1
	int 0x80

exit:
	mov eax, 1              ; sys_exit
	xor ebx, ebx            ; return 0
	int 0x80
