# gcc -no-pie gcc_c_library_call.s

.section .data
message: .asciz "Hello, World!"

.section .text
.globl  main

main:
    mov $message, %rdi
    call puts

    ret
