#include <stdio.h>
#include "include/libasm.h"

int main(int ac, char **av)
{
	if (_wordcmp(av[1], av[2]))
                _putstr("KO\n");
        else
                _putstr("OK\n");
	return (0);
}
