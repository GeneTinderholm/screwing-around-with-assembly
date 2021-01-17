.section .text
.globl _start

# argc is on the stack
# argv follows argc on the stack

/*
    Further explanation:
    The stack pointer at program initiation is a pointer to argc (the number of command line arguments passed).
    After argc, is an array of character pointers (c strings) the length of which is determined by argc

    Build with:

    as -o example.o -gstabs example.s
    ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc example.o
 */

_start:
    pop     %rax            # argc

print_arg:
    pop     %rdi            # argv[i]

    push    %rax
    push    %rdi

    call    puts
    
    pop     %rdi
    pop     %rax

    dec     %rax
    jnz     print_arg

    mov     $60, %rax
    xor     %rdi, %rdi
    syscall
