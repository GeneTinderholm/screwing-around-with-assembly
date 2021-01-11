#include <stdio.h>

int main(void) {
    int a = 20;
    int b = 30;
    int result;
    asm(
            "cmp %1, %2  \n\t"
            "jge greater \n\t"
            "movl %1, %0 \n\t"
            "jmp end     \n\t"
            "greater:    \n\t"
            "movl %2, %0 \n\t"
            "end:"
            :"=r"(result)
            :"r"(a), "r"(b)
       );

    printf("result = %d\n", result);
    return 0;
}
