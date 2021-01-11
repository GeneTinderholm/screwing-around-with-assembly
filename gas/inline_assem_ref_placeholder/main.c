#include <stdio.h>

int main (void) {
    int data1 = 10;
    int data2 = 20;

    asm(
            "imull %1, %0"
            :"=r"(data2)
            :"r"(data1), "0"(data2) // 0 means same as =r placeholder
       );

    return printf("result = %d\n", data2);
}
