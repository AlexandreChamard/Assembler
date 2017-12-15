section .text
	global _isblank
        global _isnum
        global _isalpha
        global _islower
        global _isupper
        global _isalphanum

_isblank:
	mov rax, rdi 
	cmp al, ' '
	je return_true
	cmp al, 0x09
	je return_true
	jmp return_false

_isnum:
	mov rax, rdi 
	cmp al, '0'
	jl return_false
	cmp al, '9'
	jg return_false
	jmp return_true

_isalpha:
	mov rax, rdi
	cmp al, '_'
	je return_true		; is '_'
	cmp al, 'A'
	jl return_false		; < 'A'
	cmp al, 'z'
	jg return_false		; > 'z'
	cmp al, 'a'
	jge return_true		; 'a' <= c <= 'z'
	cmp al, 'Z'
	jle return_true		; 'A' <= c <= 'Z'
	jmp return_false	; 'Z' < c < 'a'

_islower:
        mov rax, rdi
        cmp al, 'a'
        jl return_false
        cmp al, 'z'
        jg return_false
        jmp return_true

_isupper:
        mov rax, rdi
        cmp al, 'A'
        jl return_false
        cmp al, 'Z'
        jg return_false
        jmp return_true

_isalphanum:
	call _isnum
	cmp rax, 1
	je return_true
	call _isalpha
	cmp rax, 1
	je return_true
	jmp return_false

return_true:
	mov rax, 1
	ret
return_false:
	mov rax, 0
	ret
