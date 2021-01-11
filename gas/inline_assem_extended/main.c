#include <stdio.h>

// output has = prefixing constraing
int main (void) {
    int data1 = 10;
    int data2 = 20;
    int result;

    asm(
            "imull %%edx, %%ecx \n\t"
            "movl %%ecx, %%eax "
            : "=a"(result)           // output from registers
            : "d"(data1), "c"(data2) // input for registers
        );

    printf("result = %d\n", result);

    return 0;
}
