section .rodata
str1 db "Biteeee", 0x0A    ; 0x0A -> '\n'
len1 equ $ - str1


section .text
	global _start
  extern _putstr
	extern _putstr_computed

_start:

	mov ebp, esp			; set le ebp sur 0
	mov eax, 84
	cmp dword [ebp], 1
	je end
  push len1
  push str1
	call _putstr			;will put len at [esp], and the string at [esp - 4]

  xor eax, eax
end:
	mov ebx, eax
	mov eax, 1
	int 0x80
