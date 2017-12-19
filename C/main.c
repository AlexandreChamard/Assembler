#include "include/libasm.h"

int main(int ac, char **av)
{
        char *new;
        int len;

        _puts(av[1]);
        len = _strlen(av[1]);
        new = _malloc(sizeof(char) * (len + 1));
        _puts(new);
        new = _strcpy(new, av[1]);
        _puts(new);
	return (0);
}
