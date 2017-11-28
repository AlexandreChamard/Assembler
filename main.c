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
	_printf("%d\n", ac);
	_printf("%s\n", av[0]);
	_printf("%s\n", av[2]);
	// char *bonjour = "bonjourrrr";
	// _printf("\n%c%s\n", 'a', av[0]);
	// char c = 'a';
	// _putchar(c);
	// _printf("%s\n", _ltrim(bonjour));
	return (0);
}
