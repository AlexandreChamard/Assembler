include ./depend.mk

SRCDIR		=	project

SRC		=	main.asm

CSRC		=	main.c

ASMSRC		=

CSRCDIR		=	C
ASMSRCDIR	=	project

OBJ		=	$(patsubst %,$(ODIR)/%,$(ASMSRC:.asm=.o)) \
			$(patsubst %,$(ODIR)/%,$(CSRC:.c=.o))

NAME		=	program

all		:	$(NAME)

$(NAME)		:	verif_odir make_lib $(OBJ)
			@ echo -ne $(CYAN)'compilation de '$(NAME)'...'$(WHITE)
			@ $(LK) $(LKFLAGS) $(OBJ) -o $(NAME) -l$(LIBNAME) -L$(LIBDIR)
			@ echo -e $(YELLOW)' SUCCESS'$(WHITE)


verif_odir	:
			@ if [ ! -d $(ODIR) ]; then mkdir $(ODIR); fi

make_lib	:
			@ make -C $(LIBDIR)

$(ODIR)/%.o	:	$(CSRCDIR)/%.c
			@ echo -e 'compilation de: ' $(GREEN)$(notdir $<)$(WHITE)
			@ $(CC) $(CFLAGS) $< -o $(patsubst %,$(ODIR)/%,$(notdir $@))

$(ODIR)/%.o	:	$(ASMSRCDIR)/%.asm
			@ echo -e 'compilation de: ' $(GREEN)$(notdir $<)$(WHITE)
			@ $(ASMC) $(ASMFLAGS) $< -o $(patsubst %,$(ODIR)/%,$(notdir $@))

clean		:
			@ echo -e $(RED)'remove OBJS'$(WHITE)
			@ $(RMDIR) $(ODIR)
			@ make -C $(LIBDIR) clean

fclean		:	clean
			@ echo -e $(RED)'remove '$(NAME)$(WHITE)
			@ $(RM) $(NAME)
			@ make -C $(LIBDIR) fclean

re		:	fclean all
