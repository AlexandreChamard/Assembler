ASMC		=	nasm

ASMFLAGS	=	-f elf

SRC		=	atoi.asm
SRC		+=	cmp.asm
SRC		+=	is.asm
SRC		+=	is.asm
SRC		+=	putchar.asm
SRC		+=	puts.asm
SRC		+=	putstr.asm
SRC		+=	strcpy.asm
SRC		+=	strlen.asm
SRC		+=	trim.asm

OBJDIR		=	objlib

OBJ		=	$(patsubst %,$(OBJDIR)/%,$(SRC:.asm=.o))
# OBJ		=	$(OBJDIR)$(SRC:.asm=.o)


RM		=	rm -rf

all:		verif_objdir $(OBJ)

verif_objdir:
		@ if [ ! -d $(OBJDIR) ]; then mkdir $(OBJDIR); fi

$(OBJDIR)/%.o: %.asm
		$(ASMC) $(ASMFLAGS) $< -o $@

clean:
		$(RM) $(OBJDIR)

fclean:		clean
