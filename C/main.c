// #include "include/libasm.h"

int main(int ac, char **av)
{
	printf("ac: %d\n", ac);
	for (int i = 0; i < ac; i++) {
		printf("av[%d]: %s\n", i, av[i]);
	}
	return (ac);
}
