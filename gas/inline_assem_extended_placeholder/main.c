#include <stdio.h>

/*
 * asm(
 *      "asssembly code goes here"
 *      : "=r"(result)
 *      : "r" (data1), "r"(data2)
 *     );
 *
 *    %0 will be the register for result
 *    %1 will be the register for data1
 *    %2 will be the register for data2
 */

int main (void) {
    int data1 = 10;
    int data2 = 15;
    int result;

    asm(
            "imull %1, %2 \n\t"
            "movl  %2, %0 "
            : "=r"(result)
            : "r"(data1), "r"(data2)
       );

    printf("result = %d\n", result);
}
