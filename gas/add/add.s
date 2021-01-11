/* assemble with debug
 as -gstabs -o add.o add.s
 ld -o add add.o
*/

.section .data
data:
    .int    40

.section .text
.global _start
_start:
    nop
    movl    $0, %eax
    movl    $0, %ebx
    movl    $0, %ecx
    movb    $20, %al
    addb    $10, %al
    addb    $30, %al
    movl    $122, %ebx
    addl    data, %ebx
    addl    data, %ebx
    addl    data, %ebx
    addl    data, %ebx
    nop # not exiting properly, run in debugger
    nop
