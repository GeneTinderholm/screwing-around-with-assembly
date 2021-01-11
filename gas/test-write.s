.section .text
.globl  _start

_start:
    /* push $0x */
    push $0x00646c72
    pushq $0x6c6c6568
    movl $0x6f77206f, 4(%rsp) /* fills the upper 16 bytes, you can't push a 64 bit hex value directly*/
    /* moving the full value into a register and pushing would have also worked */

    mov  $1, %rax
    mov  $1, %rdi
    mov  %rsp, %rsi
    mov  $16, %rdx
    syscall

    mov  $60, %rax
    xor  %rsi, %rsi
    syscall
