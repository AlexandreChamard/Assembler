// #include "include/libasm.h"

// #include <unistd.h>
// #include <stdlib.h>
// #include <stdio.h>
// #include <fcntl.h>
#include "include/libasm.h"

void * my_malloc(int);

// typedef struct
// {
//  short level ;
//  short token ;
//  short bsize ;
//  char fd ;
//  unsigned flags ;
//  unsigned char hold ;
//  unsigned char *buffer ;
//  unsigned char * curp ;
//  unsigned istemp;
// }FILE ;

int main(int ac, char **av)
{
	if (ac != 1) {
		_putnbr(_strlen(av[1]));
	}
	return (0);
}
