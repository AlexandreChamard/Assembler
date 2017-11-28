ASMC		=	nasm

ASMFLAGS	=	-f elf

LK		=	ld

LKFLAGS		=	-m elf_i386

SRCDIR		=	project

SRC		=	main.asm

ODIR		=	$(SRCDIR)/objsrc

OBJ		=	$(patsubst %,$(ODIR)/%,$(SRC:.asm=.o))

LIB		=	$(SRCDIR)/libasm

OLIB		=	$(LIB)/objlib/*.o

NAME		=	program

RM		=	rm -rf

all		:	$(NAME)

$(NAME)		:	verif_odir make_lib $(OBJ) end_compile
			@ $(LK) $(LKFLAGS) $(OBJ) $(OLIB) -o $(NAME)


verif_odir	:
			@ if [ ! -d $(ODIR) ]; then mkdir $(ODIR); fi

end_compile	:
			@ echo -e '\033[1;36m'end of Makefile'\033[0;97m'

make_lib	:
			@ make -C $(LIB)
			@ echo -e '\033[1;36m'make PROJECT'\033[0;97m'

$(ODIR)/%.o	:	$(SRCDIR)/%.asm
			@ echo -e compilation de: '\033[1;92m' $< '\033[0;97m'
			@ $(ASMC) $(ASMFLAGS) $< -o $@

clean		:
			@ make -C $(LIB) clean
			@ echo -e '\033[1;31mremove OBJ\033[0;97m'
			@ $(RM) $(ODIR)

fclean		:	clean
			@ $(RM) $(NAME)

re		:	fclean all
