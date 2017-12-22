// #include "include/libasm.h"

#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>

void * my_malloc(int);

typedef struct {
    char c;
    short s;
    int i;
    char k;
    long b;
    char f;
} st;

void bla(st ab)
{
    ab.c = 0x11;
    ab.s = 0x12;
    ab.i = 0x13;
    ab.k = 0x14;
    ab.b = 0x15;
    ab.f = 0x16;
}

int main(int ac, char **av)
{
    st ab;

    ab.c = 1;
    ab.s = 2;
    ab.i = 3;
    ab.k = 4;
    ab.b = 5;
    ab.f = 6;
    bla(ab);
    return (0);
}
