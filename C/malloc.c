#include <unistd.h>
void *my_malloc(int size)
{
    int *ptr = NULL;
    int res = brk(ptr);
    if (!res) {
        ptr = sbrk(size);
    }
    return (ptr);
}
