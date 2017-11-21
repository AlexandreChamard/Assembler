section .rodata
src db "source: "
lensrc equ $ - src
dest db "dest: "
lendest equ $ - dest
next_line db 0x0A


section .text
	global _start
	extern _strcpy_computed
	extern _strlen

_start:
	push ebp
	mov ebp, esp

	push lendest
	push dest
	push dword [ebp + 12]
	call _strcpy_computed

	mov ecx, eax
	mov ebx, 1
	push ecx
	call _strlen
	pop ecx
	mov edx, eax
	mov eax, 4
	int 0x80

exit:
	pop ebp
	mov eax, 1              ; sys_exit
	xor ebx, ebx            ; return 0
	int 0x80
