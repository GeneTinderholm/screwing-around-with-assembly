.section .text
.globl   _start
_start:
    movl    $65, %eax
    movl    $89, %ebx
    call    _bottom
    movl    $77, %ecx
    mov     $60, %rax
    xor     %rdi, %rdi
    syscall

_bottom:
    addl    $100, %eax
    addl    $50, %ebx
    ret
