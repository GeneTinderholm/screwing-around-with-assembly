#include <stdio.h>

int main(void) {
    int divident = 20;
    int divisor = 5;
    int result;

    asm(
            "divb %2 \n\t"
            "movl %%eax, %0 \n\t"
            :"=m"(result)
            :"a"(divident), "m"(divisor)
       );

    printf("result = %d\n", result);
}
