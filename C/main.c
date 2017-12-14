#include "include/libasm.h"

int main(int ac, char **av)
{
        _puts(av[1]);
        _puts(av[2]);
        _puts(NULL);
        _strncpy(av[2], av[1], 2);
        _puts(av[1]);
        _puts(av[2]);
	return (0);
}
