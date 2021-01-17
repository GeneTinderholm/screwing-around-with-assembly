.section .data
prompt:     .ascii "Please enter a string (50 characters max)\n" # 42

.section .bss
.lcomm  input, 51

.section .text
.globl   _start

_start:
    mov     $1, %rax
    mov     $1, %rdi
    mov     $prompt, %rsi
    mov     $42, %rdx
    syscall

    mov     $0, %rax
    mov     $0, %rdi
    mov     $input, %rsi
    mov     $51, %rdx
    syscall

    movl    $51, %ecx
    mov     %rsi, %rdi

start_convert:
    lodsb   # moves byte from address in %rsi to %al and increments value in rsi
    cmpb    $0x7A, %al
    jg      skip
    cmpb    $0x61, %al
    jl      skip
    subb    $0x20, %al
skip:
    stosb   # moves byte from %al to %rdi and increments value in rdi
    loop    start_convert

    mov     $input, %rsi
    mov     $1, %rax
    mov     $1, %rdi
    mov     $50, %rdx
    syscall

    mov     $60, %rax
    xor     %rdi, %rdi
    syscall

