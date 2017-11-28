// #include <stdio.h>

char *_ltrim(char *);
char *_rtrim(char *);
void _puts(char *);
int _atoi(char *);
void _putnbr(int);
void _putchar(char);
int _printf(char *, ...);

int main(int ac, char **av)
{
	char *bonjour = "bonjourrrr";
	_printf("\n", bonjour);
	// char c = 'a';
	// _putchar(c);
	// _printf("%s\n", _ltrim(bonjour));
}

void _start() {

    /* main body of program: call main(), etc */
	main(0, (void*)0);
    /* exit system call */
    asm("movl $1,%eax;"
        "xorl %ebx,%ebx;"
        "int  $0x80"
    );
}
