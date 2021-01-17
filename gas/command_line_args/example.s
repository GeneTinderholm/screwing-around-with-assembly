.section .text
.globl _start

_start:
    mov     (%rsp), %rax    # argc
    add     $8, %rsp

print_arg:
    mov     (%rsp), %rdi  # argv[i]
    push    %rax
    push    %rdi

    call    puts
    
    pop     %rdi
    pop     %rax

    add     $8, %rsp    # move next pointer to top of stack
    dec     %rax
    jnz     print_arg

    mov     $60, %rax
    xor     %rdi, %rdi
    syscall
