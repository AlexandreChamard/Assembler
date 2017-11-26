section .rodata
	new_line db 0x0A

section .text
	global _puts
	        extern _strlen

; Type:
;	void
; Args;
;	ECX = [ESP + 20]: const char *str
_puts:
	push ebp
	mov ebp, esp
	push eax
	push ebx
	push ecx
	push edx
	push esi

	mov esi, [ebp + 8]
	cmp esi, 0
	je end_puts		; If !str

	push esi
	call _strlen		; EAX = len of ESI
	pop esi
	cmp eax, 0
	je end_puts		; If len == 0 ; No need to call write

	; Write str sizeof len
	mov edx, eax
	mov eax, 4
	mov ebx, 1
	mov ecx, esi
	int 0x80
        jmp end_puts

; Type:
;	void
; Args;
;	ECX = [ESP + 20]: const char *str
_perror:
        push ebp
        mov ebp, esp

        push eax
        push ebx
        push ecx
        push edx
        push esi

        mov esi, [ebp + 8]
        cmp esi, 0
        je end_puts             ; if !str

        push esi
        call _strlen
        pop esi
        cmp eax, 0
        je end_pus              ; if len == 0

        mov edx, eax            ; write len characters
        mov eax, 4              ; sys_call
        mov ebx, 1
        mov ecx, esi
        
        pop esi
        jmp end_puts       

end_puts:
	;write '\n'
	mov eax, 4
	mov ecx, new_line
	mov edx, 1
	int 0x80

	pop esi
	pop edx
	pop ecx
	pop ebx
	pop eax

	pop ebp
	ret
