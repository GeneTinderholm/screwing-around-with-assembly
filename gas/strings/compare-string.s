.section .data
value1: .ascii "This is b test string."
value2: .ascii "This is a test string."
len: .int 22
eq: .ascii "Equal\n"
neq: .ascii "Not Equal\n"
eqlen: .int 6
neqlen: .int 10

.section .text
.globl _start

_start:
    leal value1, %esi
    leal value2, %edi
    movl len, %ecx
    repe cmpsb # terminates early if one of the iterations is not equal
    je equal

    mov $neq, %rsi
    movl neqlen, %edx

    jmp end

equal:
    mov $eq, %rsi
    movl eqlen, %edx

end:
    mov $1, %rax
    mov $1, %rdi
    syscall

    mov $60, %rax
    xor %rdi, %rdi
    syscall
