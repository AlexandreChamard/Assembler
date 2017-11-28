#include "include/libasm.h"

int main(int ac, char **av)
{
	_printf("%d\n", ac);
	for (int i = 0; i < ac; i++) {
		_trim(av[i]);
		_printf("%s\n", av[i]);
	}
	return (0);
}
