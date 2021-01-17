/* to build: gcc main.c factorial.s */
#include <stdio.h>
#include <inttypes.h>

uint64_t factorial(unsigned int n);

int main(void) {
    for (unsigned int i = 1; i <= 10; ++i) {
        printf("%lu\n", factorial(i));
    }
}
