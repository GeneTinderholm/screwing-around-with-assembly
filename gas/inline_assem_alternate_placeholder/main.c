#include <stdio.h>

int main(void) {
    int data1 = 10;
    int data2 = 20;

    asm(
            "imull %[value1], %[value2] \n\t"
            :[value2]"=r"(data2)
            :[value1]"r"(data1), "0"(data2)
       );

    printf("data2 = %d\n", data2);
}
