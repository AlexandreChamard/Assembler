ASMC		=	nasm

ASMFLAGS	=	-f elf

LK		=	ld

LKFLAGS		=	-m elf_i386

SRCDIR		=	project

SRC		=	main.asm \

OBJDIR		=	$(SRCDIR)/objsrc

OBJ		=	$(patsubst %,$(OBJDIR)/%,$(SRC:.asm=.o))

LIB		=	$(SRCDIR)/libasm

OBJLIB		=	$(LIB)/objlib

NAME		=	program

RM		=	rm -rf

all:		verif_objdir make_lib $(OBJ) end_compile

verif_objdir:
		@ if [ ! -d $(OBJDIR) ]; then mkdir $(OBJDIR); fi

end_compile:
		@ echo -e '\033[1;36m'end of Makefile'\033[0;97m'

make_lib:
		@ make -C $(LIB)
		@ echo -e '\033[1;36m'make PROJECT'\033[0;97m'

$(OBJDIR)/%.o: $(SRCDIR)/%.asm
		@ echo -e compilation de: '\033[1;92m' $< '\033[0;97m'
		@ $(ASMC) $(ASMFLAGS) $< -o $@
		@ $(LK) $(LKFLAGS) $(OBJ) $(OBJLIB)/*.o -o $(NAME)

clean:
		@ make -C $(LIB) clean
		@ echo -e '\033[1;31mremove OBJ\033[0;97m'
		@ $(RM) $(OBJDIR)

fclean:		clean
		@ $(RM) $(NAME)

re:		fclean all
