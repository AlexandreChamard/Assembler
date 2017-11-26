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

OBJ		=	$(SRC:.asm=.o)

OBJDIR		=	objects/

RM		=	rm -rf

all:		CREATE_DIR CREATE_OBJ

CREATE_DIR:
		mkdir -p $(OBJDIR)

CREATE_OBJ:	$(OBJ)

%.o: %.asm
	$(ASMC) $(ASMFLAGS) $< -o $(OBJDIR)$@

clean:
	$(RM) $(OBJDIR)
