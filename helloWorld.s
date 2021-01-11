/* .global	_start */

/* .text */
/* _start: */
/* 	movl  $4, %eax   # 4 (code for "write" syscall) -> EAX register */
/* 	movl  $1, %ebx   # 1 (file descriptor for stdout) -> EBX (1st argument to syscall) */
/* 	movl  $msg, %ecx # address of msg string -> ECX (2nd argument) */
/* 	movl  $len, %edx # len (32 bit address) -> EDX (3rd arg) */
/* 	int   $0x80      # interrupt with location 0x80 (128), which invokes the kernel's system call procedure */

/* 	movl  $1, %eax   # 1 ("exit") -> EAX */
/* 	movl  $0, %ebx   # 0 (with success) -> EBX */
/* 	int   $0x80      # see previous */
/* .data */
/* msg: */
/* 	.ascii  "Hello, world!\n" # inline ascii string */
/* 	len =   . - msg           # assign value of (current address - address of msg start) to symbol "len" */
# ----------------------------------------------------------------------------------------
# Writes "Hello, World" to the console using only system calls. Runs on 64-bit Linux only.
# To assemble and run:
#
#     gcc -c hello.s && ld hello.o && ./a.out
#
# or
#
#     gcc -nostdlib hello.s && ./a.out
# ----------------------------------------------------------------------------------------

        .global _start

        .text
_start:
        # write(1, message, 13)
        mov     $1, %rax                # system call 1 is write
        mov     $1, %rdi                # file handle 1 is stdout
        mov     $message, %rsi          # address of string to output
        mov     $13, %rdx               # number of bytes
        syscall                         # invoke operating system to do the write

        # exit(0)
        mov     $60, %rax               # system call 60 is exit
        xor     %rdi, %rdi              # we want return code 0
        syscall                         # invoke operating system to exit
message:
        .ascii  "Hello, world\n"

