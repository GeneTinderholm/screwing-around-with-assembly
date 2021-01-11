.section .text
.globl _start

/*
    div -> rax (quotient), rdx (remainder)
*/

_start:
    mov     $0, %r9
    mov     $0, %rdi
    mov     $1, %rsi
fib:
    call    print_num
    mov     %rdi, %r8
    mov     %rsi, %rdi
    add     %r8, %rsi
    add     $1, %r9
    cmp     $42, %r9
    je      done
    jmp     fib

done:
    mov     $60, %rax
    xor     %rdi, %rdi
    syscall

print_num:
    /* expects number to be in rdi */
    # r8, rdi, rbx, rdx, rsi
    push    %r8
    push    %rdi
    push    %rbx
    push    %rdx
    push    %rsi

    mov     %rsp, %r8    # store off the original value of the stack pointer
    mov     %rdi, %rax
    mov     $10, %rbx
    sub     $1, %rsp
    movb    $0xA, (%rsp) # newline

    /* main loop, converts one digit into a character and pushes it on the stack */
begin:
    mov     $0, %rdx # rdx needs to be reset each iteration, or an arithmatic error occurs
    div     %rbx
    add     $0x30, %rdx # ascii offset for numbers
    sub     $1, %rsp
    movb    %dl, (%rsp)

    cmp     $0, %rax  # if rax is zero, we're done
    je      after

    jmp     begin

after:
    sub     %rsp, %r8  # figure out how many bytes we've added to the stack

    /* write number */
    mov     $1, %rax
    mov     $1, %rdi
    mov     %rsp, %rsi
    mov     %r8, %rdx
    syscall

    add     %r8, %rsp # restore stack pointer

    pop     %rsi
    pop     %rdx
    pop     %rbx
    pop     %rdi
    pop     %r8

    ret

