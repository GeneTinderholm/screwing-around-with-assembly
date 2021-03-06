.section .data
value1:     .ascii "This is a test string.\n"

.section .bss
.lcomm      output, 23

.section .text
.globl      _start

_start:
    leal    value1, %esi
    leal    output, %edi
    movl    $23, %ecx

    cld             # clear direction flag, changes how rep works
    rep     movsb   # uses %ecx

    mov     $1, %rax
    mov     $1, %rdi
    mov     $output, %rsi
    mov     $23, %rdx
    syscall

    mov     $60, %rax
    xor     %rdi, %rdi
    syscall
