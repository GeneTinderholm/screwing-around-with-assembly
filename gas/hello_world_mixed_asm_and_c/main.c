#include <string.h>

int main(void) {
    char* str = "Hello, World\n";
    long len = strlen(str);
    int ret = 0;

    asm(
            "mov $1, %%rax \n\t"
            "mov $1, %%rdi \n\t"
            "mov %1, %%rsi \n\t"
            "mov %2, %%rdx \n\t"
            "syscall"
            : "=g"(ret)
            : "g"(str), "g"(len)
       );

    return ret;
}
