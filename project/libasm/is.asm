section .text
	global _isblank

_isblank:
	mov eax, [esp + 4]
	cmp al, ' '
	je return_true
	cmp al, 0x09
	je return_true
	jmp return_false

_isnum:
	mov eax, [esp + 4]
	cmp al, '0'
	jl return_false
	cmp al, '9'
	jg return_false
	jmp return_true

_isalpha:
	mov eax, [esp + 4]
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

_isalphanum:
	call _isnum
	cmp eax, 1
	je return_true
	call _isalpha
	cmp eax, 1
	je return_true
	jmp return_false

return_true:
	mov eax, 1
	ret
return_false:
	mov eax, 0
	ret
