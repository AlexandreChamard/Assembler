ASMC		=	nasm

ASMFLAGS	=	-f elf

SRC		=	atoi.asm	\
			cmp.asm		\
			is.asm		\
			putchar.asm	\
			putnbr.asm	\
			puts.asm	\
			putstr.asm	\
			strcpy.asm	\
			strlen.asm	\
			trim.asm	\
			printf.asm	\

ODIR		=	objlib

OBJ		=	$(patsubst %,$(ODIR)/%,$(SRC:.asm=.o))

RM		=	rm -rf

all:			verif_odir $(OBJ)

verif_odir	:
			@ if [ ! -d $(ODIR) ]; then mkdir $(ODIR); fi
			@ echo -e '\033[1;36m'make LIB'\033[0;97m'

$(ODIR)/%.o	:	%.asm
			@ echo -e compilation de: '\033[1;92m' $< '\033[0;97m'
			@ $(ASMC) $(ASMFLAGS) $< -o $@

clean		:
			@ echo -e '\033[1;31mremove LIB\033[0;97m'
			@ $(RM) $(ODIR)

re		:	clean all
