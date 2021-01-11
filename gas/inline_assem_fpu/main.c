#include <stdio.h>

int main(void) {
    float angle = 90;
    float radian, cosine, sine;
    radian = angle / 180 * 3.14159;

    asm(
            "fsincos"
            :"=t"(cosine), "=u"(sine)
            :"0"(radian)
       );

    printf("cosine = %f\n", cosine);
    printf("sine = %f\n", sine);
    return 0;
}
