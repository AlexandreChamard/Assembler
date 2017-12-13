include		./depend.mk

SRC		=	start.asm		\
			strlen.asm		\
			putstr.asm		\
			atoi.asm		\
			putnbr.asm		\
			cmp.asm			\

OBJ		=	$(patsubst %,$(ODIR)/%,$(SRC:.asm=.o))

NAME		=	lib$(LIBNAME).a

all		:	verif_odir $(NAME)

$(NAME)		:	$(OBJ)
			@ echo -ne $(CYAN)'compilation LIB...'$(WHITE)
			@ $(AR) $(NAME) $(OBJ)
			@ echo -e $(YELLOW)' SUCCESS'$(WHITE)

verif_odir	:
			@ if [ ! -d $(ODIR) ]; then mkdir $(ODIR); fi
			@ echo -e $(CYAN)'make '$(NAME)$(WHITE)

$(ODIR)/%.o	:	$(SRCDIR)/%.asm
			@ echo -e 'compilation de: ' $(GREEN)$(notdir $<)$(WHITE)
			@ $(ASMC) $(ASMFLAGS) $< -o $(patsubst %,$(ODIR)/%,$(notdir $@))

clean		:
			@ if [ -d $(ODIR) ]; then echo $(RED)'remove '$(NAME)' OBJS'$(WHITE); fi
			@ $(RMDIR) $(ODIR)

fclean		:	clean
			@ if [ -f $(NAME) ]; then echo $(RED)'remove '$(NAME)$(WHITE); fi
			@ $(RM) $(NAME)

re		:	fclean all
