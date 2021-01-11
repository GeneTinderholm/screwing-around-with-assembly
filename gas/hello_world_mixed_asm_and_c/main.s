	.file	"main.c"
	.text
	.section	.rodata
.LC0:
	.string	"Hello, World\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	leaq	.LC0(%rip), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, -8(%rbp)
	movl	$0, -20(%rbp)
#APP
# 8 "main.c" 1
	mov $1, %rax 
	mov $1, %rdi 
	mov -16(%rbp), %rsi 
	mov -8(%rbp), %rdx 
	syscall
# 0 "" 2
#NO_APP
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
