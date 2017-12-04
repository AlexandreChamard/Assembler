# compilation
CC		=	gcc -c
ASMC		=	nasm
LK		=	ld
AR		=	ar rc

# remove mode
RM		=	rm -f
RMDIR		=	rm -rf

# default name
NAME		=	a.out

# default directory
SRCDIR		=	src
ODIR		=	obj

# 32bits or 64bits
MODE		=	64

ifeq ($(MODE), 32)
 CFLAGS		=	-m32
 ASMFLAGS	=	-f elf
 LKFLAGS	=	-m elf_i386
 LIBDIR		=	project/libasm
 LIBNAME	=	asm
endif
ifeq ($(MODE), 64)
 CFLAGS		=
 ASMFLAGS	=	-f elf64
 LKFLAGS	=
 LIBDIR		=	project/libasm64
 LIBNAME	=	asm64
endif

# COLOR
WHITE		=	'\033[0;97m'
BLACK		=	'\033[1;30m'
RED		=	'\033[1;31m'
GREEN		=	'\033[1;92m'
YELLOW		=	'\033[1;33m'
BLUE		=	'\033[1;34m'
MAGENTA		=	'\033[1;35m'
CYAN		=	'\033[1;36m'
