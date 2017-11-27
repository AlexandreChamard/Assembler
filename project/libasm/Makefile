ASMC		=	nasm

ASMFLAGS	=	-f elf

SRC		=	atoi.asm	\
			cmp.asm		\
			is.asm		\
			is.asm		\
			putchar.asm	\
			puts.asm	\
			putstr.asm	\
			strcpy.asm	\
			strlen.asm	\
			trim.asm	\

OBJDIR		=	objlib

OBJ		=	$(patsubst %,$(OBJDIR)/%,$(SRC:.asm=.o))

RM		=	rm -rf

all:		verif_objdir $(OBJ)

verif_objdir:
		@ if [ ! -d $(OBJDIR) ]; then mkdir $(OBJDIR); fi
		@ echo -e '\033[1;36m'make LIB'\033[0;97m'

$(OBJDIR)/%.o: %.asm
		@ echo -e compilation de: '\033[1;92m' $< '\033[0;97m'
		@ $(ASMC) $(ASMFLAGS) $< -o $@

clean:
		@ echo -e '\033[1;31mremove LIB\033[0;97m'
		@ $(RM) $(OBJDIR)

fclean:		clean
