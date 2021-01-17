#include <stdio.h>

#define GREATER(a, b, result) ({\
        asm(\
                "cmp %1, %2  \n\t"\
                "jge 0f      \n\t"\
                "movl %1, %0 \n\t"\
                "jmp 1f      \n\t"\
                "0:          \n\t"\
                "movl %2, %0 \n\t"\
                "1:"\
                :"=r"(result)\
                :"r"(a), "r"(b)\
           );\
        })

int main (void) {
    int data1 = 1;
    int data2 = 2;
    int answer;

    GREATER(data1, data2, answer);

    printf("answer = %d\n", answer);
    return 0;
}
