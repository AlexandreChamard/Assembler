#include <stdio.h>
#include "include/libasm.h"

int my_atoi(char *str)
{
	int nb = 0;
	int neg = 1;

	if (*str == '-') {
		neg = -1;
		str++;
	}
	while (*str >= '0' && *str <= '9') {
		nb = nb * 10 + *str - '0';
		str++;
	}
	return (nb * neg);
}

int main(int ac, char **av)
{
	if (_memcmp(NULL, av[2], 3))
                _putstr("KO\n");
        else
                _putstr("OK\n");
	return (0);
}
