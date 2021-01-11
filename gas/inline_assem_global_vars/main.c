// gcc -no-pie main.c
#include <stdio.h>

int a = 10;
int b = 20;
int result;

int main(void) {
    asm (
            "movl a, %eax \n\t"
            "movl b, %ebx \n\t"
            "imul %ebx, %eax \n\t"
            "movl %eax, result \n\t"
        );

    printf("result = %d\n", result);
}
