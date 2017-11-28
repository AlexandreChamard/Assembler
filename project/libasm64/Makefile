include		./depend.mk

SRC		=

SRCDIR		=	src
ODIR		=	obj

OBJ		=	$(patsubst %,$(ODIR)/%,$(SRC:.asm=.o))

NAME		=	libasm64.a

all		:	verif_odir $(NAME)

$(NAME)		:	$(OBJ)
			@ echo -ne $(CYAN)'compilation LIB...'$(WHITE)
			@ $(AR) $(NAME) $(OBJ)
			@ echo -e $(YELLOW)' SUCCESS'$(WHITE)

verif_odir	:
			@ if [ ! -d $(ODIR) ]; then mkdir $(ODIR); fi
			@ echo -e $(CYAN)'make LIB'$(WHITE)

$(ODIR)/%.o	:	$(SRCDIR)/%.asm
			@ echo -e 'compilation de: ' $(GREEN)$(notdir $<)$(WHITE)
			@ $(ASMC) $(ASMFLAGS) $< -o $(patsubst %,$(ODIR)/%,$(notdir $@))

clean		:
			@ if [ -d $(ODIR) ]; then echo -e $(RED)'remove LIBs OBJS'$(WHITE); fi
			@ $(RMDIR) $(ODIR)

fclean		:	clean
			@ echo -e $(RED)'remove LIB'$(WHITE)
			@ $(RM) $(NAME)

re		:	fclean all
