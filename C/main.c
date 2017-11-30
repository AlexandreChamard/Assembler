#include "include/libasm.h"

int main(int ac, char **av)
{
	_printf("ac: %d\n", ac);
	for (int i = 0; i < ac; i++) {
		_printf("av[%d]: %s\n", i, av[i]);
	}
	return (ac);
}
