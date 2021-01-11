.section .data
data:
    .int    4
ascii_offset:
    .int    0x30

.section .text
.globl _start

/* have to or together 3 and 4 because you can't push a single byte */
_start:
    mov     data, %rsi
    add     ascii_offset, %rsi
    sal     $8, %rsi

    mov     $3, %rdi
    add     ascii_offset, %rdi

    or      %rsi, %rdi
    push    %rdi

    mov     $1, %rax
    mov     $1, %rdi
    mov     %rsp, %rsi
    /* add     $4, %rsi */
    mov     $2, %rdx
    syscall

    mov     $60, %rax
    xor     %rdi, %rdi
    syscall
