# examine in debugger
# print array with:
# x/10d &values
# TODO print out array

.section .data
values: .int 10, 12, 6, 9, 13, 67, 5, 3, 45, 87 # 9

.section .text
.globl _start

_start:
    movl $values, %esi
    movl $9, %ecx # counter for outer loop
    movl $9, %ebx # counter for inner loop

loop:
    movl (%esi), %eax
    cmp  %eax, 4(%esi)
    jge  skip
    xchg %eax, 4(%esi)
    movl %eax, (%esi)

skip:
    add  $4, %esi
    dec  %ebx
    jnz  loop
    dec  %ecx
    jz   end
    movl $values, %esi
    movl %ecx, %ebx
    jmp  loop

end:
    mov $60, %rax
    xor %rdi, %rdi
    syscall
