.section .data
data: .int 40

.section .text
.globl _start

_start:
    nop
    movl $0, %ebx
    movb $20, %bl
    subb $10, %bl
    mov  $60, %rax
    mov  %rbx, %rdi
    syscall

