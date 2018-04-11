#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>

int main(int ac, char **av) {
    printf("%s\n", av[1]);
    return (0);
}

void _start(char *unused, int ac)
{
    exit(main(ac, &unused + 3));
}
