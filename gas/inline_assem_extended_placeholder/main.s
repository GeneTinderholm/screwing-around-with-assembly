	.file	"main.c"
	.text
	.section	.rodata
.LC0:
	.string	"result = %d\n"
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
	subq	$16, %rsp
	movl	$10, -12(%rbp)
	movl	$15, -8(%rbp)
	movl	-12(%rbp), %eax
	movl	-8(%rbp), %edx
#APP
# 20 "main.c" 1
	imull %eax, %edx 
	movl  %edx, %eax 
# 0 "" 2
#NO_APP
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
