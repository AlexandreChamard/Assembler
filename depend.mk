CC		=	gcc -c
ASMC		=	nasm
LK		=	ld
AR		=	ar rc

RM		=	rm -f
RMDIR		=	rm -rf

CFLAGS		=	-m32
ASMFLAGS	=	-f elf
LKFLAGS		=	-m elf_i386

LIBDIR		=	project/libasm
LIBNAME		=	asm

WHITE		=	'\033[0;97m'
BLACK		=	'\033[1;30m'
RED		=	'\033[1;31m'
GREEN		=	'\033[1;92m'
YELLOW		=	'\033[1;33m'
BLUE		=	'\033[1;34m'
MAGENTA		=	'\033[1;35m'
CYAN		=	'\033[1;36m'
