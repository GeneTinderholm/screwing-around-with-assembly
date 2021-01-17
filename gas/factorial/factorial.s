.section .text
.globl factorial

factorial:
    mov  $1, %rax
    cmp  $1, %rdi
    jl   end
    push %rdi
    dec  %rdi
    call factorial
    pop  %rdi
    mul  %rdi
end:
    ret
