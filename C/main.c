#include <stdio.h>
#include "include/libasm.h"

int main(int ac, char **av)
{
	if (_memcmp(NULL, av[2], 3))
                _putstr("KO\n");
        else
                _putstr("OK\n");
	return (0);
}
