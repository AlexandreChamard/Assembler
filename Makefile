include ./depend.mk

SRCDIR		=	project

SRC		=	main.asm

CSRC		=	main.c

ASMSRC		=

CSRCDIR		=	C
ASMSRCDIR	=	project
ODIR		=	obj

OBJ		=	$(patsubst %,$(ODIR)/%,$(ASMSRC:.asm=.o)) \
			$(patsubst %,$(ODIR)/%,$(CSRC:.c=.o))

LIB		=	$(SRCDIR)/libasm

NAME		=	program

RM		=	rm -rf

all		:	$(NAME)

$(NAME)		:	verif_odir make_lib $(OBJ)
			@ echo -ne $(CYAN)'compilation de '$(NAME)'...'$(WHITE)
			@ $(LK) $(LKFLAGS) $(OBJ) -o $(NAME) -l$(LIBNAME) -L$(LIBDIR)
			@ echo -e $(YELLOW)' SUCCESS'$(WHITE)


verif_odir	:
			@ if [ ! -d $(ODIR) ]; then mkdir $(ODIR); fi

make_lib	:
			@ make -C $(LIB)

$(ODIR)/%.o	:	$(CSRCDIR)/%.c
			@ echo -e 'compilation de: ' $(GREEN)$(notdir $<)$(WHITE)
			@ $(CC) $(CFLAGS) $< -o $(patsubst %,$(ODIR)/%,$(notdir $@))

$(ODIR)/%.o	:	$(ASMSRCDIR)/%.asm
			@ echo -e 'compilation de: ' $(GREEN)$(notdir $<)$(WHITE)
			@ $(ASMC) $(ASMFLAGS) $< -o $(patsubst %,$(ODIR)/%,$(notdir $@))

clean		:
			@ echo -e $(RED)'remove OBJS'$(WHITE)
			@ $(RMDIR) $(ODIR)
			@ make -C $(LIB) clean

fclean		:	clean
			@ echo -e $(RED)'remove '$(NAME)$(WHITE)
			@ $(RM) $(NAME)
			@ make -C $(LIB) fclean

re		:	fclean all
