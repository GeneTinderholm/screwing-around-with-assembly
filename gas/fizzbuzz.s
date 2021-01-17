/* does fizzbuzz for numbers 1-100 
   requires print_num.s 

   Build with:
   as -o fizzbuzz.o fizzbuzz.s
   as -o print_num.o print_num.s
   ld fizzbuzz.o print_num.o
*/
.section .data
fizz: .ascii "FIZZ"
buzz: .ascii "BUZZ"

.section .text
.globl _start

_start:
    mov $1, %rcx

begin_fizzbuzz:
    mov $0, %rsi # will be zero if we have to write the number
    mov $0, %rdx # needs to be zeroed out after other divs, otherwise it intreprest the number as huge
    mov %rcx, %rax
    mov $3, %rbx
    div %rbx
    cmp $0, %rdx
    jne nofizz
    mov $1, %rsi
    call writefizz

nofizz:
    mov $0, %rdx
    mov %rcx, %rax
    mov $5, %rbx
    div %rbx
    cmp $0, %rdx
    jne nobuzz
    mov $1, %rsi
    call writebuzz

nobuzz:
    cmp $0, %rsi
    jne nonum
    mov %rcx, %rdi
    push %rcx
    call print_num
    pop  %rcx

nonum:
    cmp $100, %rcx
    je  done
    inc %rcx
    call write_nl
    jmp begin_fizzbuzz

done:
    call write_nl
    mov $60, %rax
    xor %rdi, %rdi
    syscall

writefizz:
    push %rax
    push %rdi
    push %rsi
    push %rdx
    push %rcx
    mov $1, %rax
    mov $1, %rdi
    mov $fizz, %rsi
    mov $4, %rdx
    syscall
    pop  %rcx
    pop  %rdx
    pop  %rsi
    pop  %rdi
    pop  %rax
    ret

writebuzz:
    /* push %rax */
    /* push %rdi */
    /* push %rsi */
    /* push %rdx */
    /* push %rcx */
    /* mov $1, %rax */
    /* mov $1, %rdi */
    /* mov $buzz, %rsi */
    /* mov $4, %rdx */
    /* syscall */
    /* pop  %rcx */
    /* pop  %rdx */
    /* pop  %rsi */
    /* pop  %rdi */
    /* pop  %rax */
    /* ret */
    push %rsi
    push %rdx
    mov $buzz, %rsi
    mov $4, %rdx
    call write
    pop %rdx
    pop %rsi
    ret

write_nl:
    push %rdx
    push %rsi
    sub $1, %rsp
    movb $'\n', (%rsp)
    mov %rsp, %rsi
    mov $1, %rdx
    call write
    add $1, %rsp
    pop %rsi
    pop %rdx
    ret

write:
    push %rax
    push %rdi
    push %rcx
    mov $1, %rax
    mov $1, %rdi
    syscall
    pop  %rcx
    pop  %rdi
    pop  %rax
    ret
