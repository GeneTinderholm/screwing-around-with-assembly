; nasm -felf64 c_lib_call.asm
; gcc -no-pie c_lib_call.o

section .text
global main
extern puts

main:
    mov rdi,  message
    call puts
    ret
    
message: db "Hello, World!",0
