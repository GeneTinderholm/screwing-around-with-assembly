# to print a register in hex, use "print/x $ebx" (or "p/x $ebx")
.section .text
.global _start

_start:
    nop
    movl    $0x12345678, %ebx
    bswap   %ebx
    nop
    nop
