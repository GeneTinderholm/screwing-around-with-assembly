; nasm -felf64 example.asm
; gcc -no-pie example.o

section .text
global main
extern puts

main:
    push    rdi
    push    rsi
    sub     rsp, 8  ; align stack before call

    mov     rdi, [rsi]
    call    puts

    add     rsp, 8
    pop     rsi
    pop     rdi

    add     rsi, 8
    dec     rdi
    jnz     main

    ret

