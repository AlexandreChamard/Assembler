#include "include/libasm.h"

int main(int ac, char **av)
{
        // char *test = "Hello";
        _strcpy(av[1], av[2]);
        _puts(av[1]);
        _puts(av[2]);
	return (0);
}
