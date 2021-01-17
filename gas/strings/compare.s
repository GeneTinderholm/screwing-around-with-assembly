# cmpsb: compares a byte value
# cmpsw: compares two bytes (word)
# ...

.section .data
value1:     .ascii "Test"
prompt:     .ascii "Enter a string to compare to \"Test\": "
promptlen:  .int 37
equal:      .ascii "Equal\n"
equallen:   .int 6
nequal:     .ascii "Not Equal\n"
nequallen:  .int 10

.section .bss
.lcomm      input, 4

.section .text
.globl  _start

_start:
    # write prompt
    mov     $1, %rax
    mov     $1, %rdi
    mov     $prompt, %rsi
    movl    promptlen, %edx
    syscall

    # read input
    mov     $0, %rax
    mov     $0, %rdi
    mov     $input, %rsi
    mov     $4, %rdx
    syscall

    leal    value1, %esi
    leal    input, %edi
    cld
    cmpsl
    je      eq
    jmp     neq

eq:
    mov     $equal, %rsi
    movl    equallen, %edx
    jmp     end

neq:
    mov     $nequal, %rsi
    movl    nequallen, %edx

end: 
    mov     $1, %rax
    mov     $1, %rdi
    syscall
    mov     $60, %rax
    xor     %rdi, %rdi
    syscall
