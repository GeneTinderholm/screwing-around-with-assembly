# as -o c_library_call.o c_library_call.s
# ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc c_library_call.o
.section .data
message: .asciz "Hello, World!"

.section .text
.globl  _start

_start:
    mov $message, %rdi
    call puts

    mov $60, %rax
    xor %rdi, %rdi
    syscall
