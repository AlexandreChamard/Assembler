#include "include/libasm.h"

int main(int ac, char **av)
{
        char test[] = "Hello";
        _strcpy(test, av[1]);
        _puts(av[1]);
        _puts(test);
	return (0);
}
