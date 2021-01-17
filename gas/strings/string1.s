# movs instruction moves string from %esi to %edi
# %esi and %edi must both contain addresses

.section .data
value1:
    .ascii "This is a test string.\n"

.section .bss          # uninitialized variables
    .lcomm output, 23  # lcomm = local common section

.section .text
.globl _start

_start:
    leal    value1, %esi
    leal    output, %edi
    movsb
    movsw
    movsl

    mov     $60, %rax
    xor     %rdi, %rdi
    syscall
