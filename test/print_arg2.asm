section .text
        global _start

_start:
	mov ebp, esp
        push dword [esp + 4]      ;Set esp on argv[0]
        sub esp, 4              ;alloc an int on stack
        call _strlen             ;will put len at [esp], and the string at [esp - 4]
        mov edx, esp
        mov eax, 4              ;sys_write
        mov ebx, 1              ;STDOUT
        mov ecx, [esp + 4]      ;pointer on string
        int 0x80                ;syscall

	mov eax, 1
	mov ebx, 0
	int 0x80

_strlen:
	push ebp     ; Save the old base pointer value.
	mov ebp, esp ; Set the new base pointer value.
	push ecx
	push edx
	push edi     ; Save the values of registers that the function
	push esi     ; will modify. This function uses EDI and ESI.

	; [ebp + 12] = str
	; ebp + 8 = return

	mov edx, ebp	; ebx va start
	add edx, 11	; ebx va au ptr
	mov ecx, 0	; i = 0
l1:
	inc edx		; avance de i dans la str
	mov al, [edx]
	cmp byte al, 0
	je l2
	inc ecx
	jmp l1

l2:
	add ebp, 8	;va au return
	mov ebp, ecx	;return i

	pop esi
	pop edi
	pop edx
	pop ecx
	pop ebp
	ret
