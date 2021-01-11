.section .data
less:
    .ascii "less"
great:
    .ascii "more"

.section .text
.globl  _start
_start:
    nop
    movl    $15, %eax
    movl    $10, %ebx
    movl    $0, %ecx
    cmp     %ebx, %eax
    jge     greater

    mov     $1, %rax
    mov     $1, %rdi
    mov     $less, %rsi
    mov     $4, %rdx
    syscall
    jmp     end

greater:
    mov     $1, %rax
    mov     $1, %rdi
    mov     $great, %rsi
    mov     $4, %rdx
    syscall
    
end:
    mov     $60, %rax
    xor     %rdi, %rdi
    syscall
