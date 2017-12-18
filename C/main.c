#include "include/libasm.h"

int main(int ac, char **av)
{
        char test1[] = "Oui";
        char test2[] = "Non\0\0\0";

        _puts(test1);
        _puts(test2);
        _strcat(test2, test1);
        _puts(test2);
	return (0);
}
