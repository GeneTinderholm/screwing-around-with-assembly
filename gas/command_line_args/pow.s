/* 
    prints the power of x ^ y where x and y are command line arguments to this program
    x and y will be interpreted in base 10
 */

.section .data
badargs:    .ascii "This program requires two command line arguments\n" # len = 49

.section .text
.globl _start

_start:
    pop  %rax
    cmp  $3, %rax
    jne  badarguments

    pop  %rdi  # ignore filename
    pop  %rdi
    call parse_num

    mov  %rax, %rdx
    pop  %rdi
    call parse_num
    mov  %rax, %rsi
    mov  %rdx, %rdi

    call pow_num
    mov  %rax, %rdi
    call print_num
    jmp  end

badarguments:
    mov $1, %rax
    mov $1, %rdi
    mov $badargs, %rsi
    mov $49, %rdx
    syscall

end:
    mov $60, %rax
    xor %rdi, %rdi
    syscall

parse_num:
    push %rdi
    push %rsi
    push %rdx
    push %rcx

    xor  %rax, %rax
    mov  $10, %rsi

start_parse_num:
    movb (%rdi), %cl
    cmpb $0, %cl
    je   end_parse_num
    sub  $'0', %cl
    mul  %rsi
    add  %rcx, %rax
    inc  %rdi
    jmp  start_parse_num

end_parse_num:
    pop  %rcx
    pop  %rdx
    pop  %rsi
    pop  %rdi
    ret


pow_num:
    /* x in rdi, y in rsi */
    mov  $1, %rax
    cmp  $0, %rsi
    je   end_pow_num
    push %rcx
    mov  %rsi, %rcx
start_pow_num:
    mul %rdi
    loop start_pow_num
    pop  %rcx
end_pow_num:
    ret   


print_num:
    /* expects number to be in rdi to be compatible with c calling convention */
    # uses r8, rdi, rbx, rdx, rsi
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
