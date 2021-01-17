.section .text
.globl getmax

getmax:
# c calling convention: 
# args in rdi, rsi, and rdx
# return value in rax

    mov %rdi, %rax
    cmp %rsi, %rax
    cmovl %rsi, %rax  # moves if the previous condition is less than
    cmp %rdx, %rax
    cmovl %rdx, %rax
    ret

# cmov{condition}
# cmovg
# cmovge
# cmovle
# etc also exist
