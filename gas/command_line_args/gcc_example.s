/*
    programs built with gcc handle command line arguments a little differently
    argc will be in %rdi at program execution
    argv (a pointer to the first string) will be in %rsi

    Build with:

    gcc -no-pie gcc_example.s
 */

.section .text
.globl main

main:
    push    %rdi
    push    %rsi

    mov     (%rsi), %rdi
    call    puts

    pop     %rsi
    pop     %rdi

    add     $8, %rsi    # rsi contains a pointer to a pointer to a character, so adding 8 will give us the pointer to the beginning of the next string
    dec     %rdi

    jnz main

    ret
