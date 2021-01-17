.section .data

string1: .ascii "This is a long string, we will be scanning it"
length: .int 45
string2: .ascii ","
fnd: .ascii "Found\n"
flen: .int 6
nfnd: .ascii "Not Found\n"
nflen: .int 10

.section .text
.globl _start

_start:
    leal string1, %edi
    leal string2, %esi
    movl length, %ecx
    lodsb # loads from address in %esi (string2)
    cld

    repne scasb # compares %al to value at the address in %edi, then increments %esi

    jne notfound

    mov $fnd, %rsi
    movl flen, %edx
    jmp end

notfound:
    mov $nfnd, %rsi
    movl nflen, %edx

end:
    mov $1, %rax
    mov $1, %rdi
    syscall

    mov $60, %rax
    xor %rdi, %rdi
    syscall
