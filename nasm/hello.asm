; assemble/link instructions
; nasm -felf64 hello.asm
; ld hello.o

section .data

message:    db "Hello, World!",10

section .text
global _start

_start:
    mov     rax, 1 ; sys_write
    mov     rdi, 1
    mov     rsi, message
    mov     rdx, 14
    syscall
    mov     rax, 60 ; sys_exit
    xor     rdi, rdi
    syscall
