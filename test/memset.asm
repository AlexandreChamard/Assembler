
; A TESTER ;

section .text
	global _memset

; Type:
;	void *
; Args:
;	[EBP + 8]:  void *str
;	[EBP + 12]: int c
;	[EBP + 16]: size_t n
_memset:
	push ebp
	mov ebp, esp
	push esi
	push edi
	push ecx

	mov esi, [ebp + 8]		; return
	mov edi, [ebp + 8]		; str
	mov eax, [ebp + 12]		; c
	mov ecx, [ebp + 16]		; n
loop_memset:
	mov byte [edi], al
	inc edi
	loop loop_memset

	mov eax, esi
	pop ecx
	pop edi
	pop esi
	pop ebp
	ret
