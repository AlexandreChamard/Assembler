;Defines
SYS_EXIT	equ 1
SYS_READ	equ 3
SYS_WRITE	equ 4
STDIN		equ 0
STDOUT		equ 1
EXIT_S		equ 0
EXIT_F		equ 84
BUFF_SIZE	equ 1024
READ_SIZE	equ 1

section .data							;Data segment
	userPrompt	db	'Please enter: '	;Prompt
	lenPrompt	equ	$-userPrompt		;???
	dispMsg		db	'You have entered: ';Response
	lenMsg		equ	$-dispMsg			;???
	stars		db	'****', 0x0A		;Stars
	lenStars	equ	$-stars				;???

section .bss							;Uninitialized data (static vars)
	lenInput	resb	BUFF_SIZE		;???
	iterator	resb	1

section .text							;Code Segment
	global _start

_start:
										;Write stars
	mov eax, SYS_WRITE					;eax serve here for storing the number of the syscall (here, write)
	mov ebx, STDOUT						;fd (stdout)
	mov ecx, stars						;pointer of stars to write
	mov edx, lenStars					;len of stars to write
	int 0x80							;syscall

;Write prompt
	mov eax, SYS_WRITE					;syscall write
	mov ebx, STDOUT						;fd (stdout)
	mov ecx, userPrompt					;pointer for message to write
	mov edx, lenPrompt					;len of the message to write
	int 0x80							;calling the syscall with interrupt

;Read and store input
	mov eax, SYS_READ					;read syscall number
	mov ebx, STDIN						;fd (stdin)
	mov ecx, lenInput					;pointer to store read bytes
	mov edx, READ_SIZE					;nb of bytes to read
	int 0x80							;syscall

;Write response
	mov eax, SYS_WRITE					;syscall write
	mov ebx, STDOUT						;fd (stdout)
	mov ecx, dispMsg					;pointer
	mov edx, lenMsg						;len to write
	int 0x80							;syscall

;Output what was entered
	mov eax, SYS_WRITE					;syscall write
	mov ebx, STDOUT						;fd (stdout)
	mov ecx, lenInput					;pointer
	mov edx, BUFF_SIZE					;len to write
	int 0x80							;syscall

;Write stars
	mov eax, SYS_WRITE					;eax serve here for storing the number of the syscall (here, write)
	mov ebx, STDOUT						;fd (stdout)
	mov ecx, stars						;pointer of stars to write
	mov edx, lenStars					;len of stars to write
	int 0x80							;syscall

;Exit code
	mov eax, SYS_EXIT					;syscall exit
	mov ebx, EXIT_S						;return value
	int 0x80							;syscall
