	.file	"assign1.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_zicsr2p0_zifencei2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.hidden	main
	.type	main, @function
main:
	li	a0,0
	ret
	.size	main, .-main
	.hidden	_stack
	.globl	_stack
	.bss
	.align	4
	.type	_stack, @object
	.size	_stack, 16384
_stack:
	.zero	16384
	.ident	"GCC: () 12.2.0"
