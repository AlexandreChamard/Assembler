ASMC		=	nasm

ASMFLAGS	=	-f elf

LK		=	ld

LKFLAGS		=	-m elf_i386

SRCDIR		=	project

SRC		=	main.asm

OBJDIR		=	$(SRCDIR)/objsrc

OBJ		=	$(patsubst %,$(OBJDIR)/%,$(SRC:.asm=.o))

LIB		=	$(SRCDIR)/libasm

OBJLIB		=	$(LIB)/objlib

NAME		=	program

RM		=	rm -rf

all:		verif_objdir make_lib $(OBJ)

verif_objdir:
		@ if [ ! -d $(OBJDIR) ]; then mkdir $(OBJDIR); fi

make_lib:
		make -C $(LIB)

$(OBJDIR)/%.o: $(SRCDIR)/%.asm	
		$(ASMC) $(ASMFLAGS) $< -o $@
		$(LK) $(LKFLAGS) $(OBJ) $(OBJLIB)/*.o -o $(NAME)

clean:
		make -C $(LIB) clean
		$(RM) $(OBJDIR)

fclean:		clean
		$(RM) $(NAME)

re:		fclean all
