.section .text
.global _start
_start:
    mov     $1,   %rax
    mov     $1,   %rdi
    mov     $msg, %rsi
    mov     $14,  %rdx
    syscall
    mov     $60,  %rax
    xor     %rdi, %rdi
    syscall
msg:
    .ascii "Hello, World!\n"
