/*
 * gcc -c max.c
 * as -o getmax.o getmax.s
 * gcc max.o getmax.o
 *
 * OR
 *
 * gcc max.c getmax.s
 */
#include <stdio.h>
#include <inttypes.h>

int64_t getmax(int64_t a, int64_t b, int64_t c);

int main(void) {
    int64_t a = getmax(1, 2, 3);
    int64_t b = getmax(2, 3, 1);
    int64_t c = getmax(3, 1, 2);

    printf("Should all be 3\n");
    printf("a = %ld\n", a);
    printf("b = %ld\n", b);
    printf("c = %ld\n", c);
}
