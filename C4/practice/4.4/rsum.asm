	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15, 6
	.globl	_rsum                   ## -- Begin function rsum
	.p2align	4, 0x90
_rsum:                                  ## @rsum
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jg	LBB0_2
## %bb.1:
	movq	$0, -8(%rbp)
	jmp	LBB0_3
LBB0_2:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rcx
	addq	$8, %rcx
	movq	-24(%rbp), %rdx
	subq	$1, %rdx
	movq	%rcx, %rdi
	movq	%rdx, %rsi
	movq	%rax, -32(%rbp)         ## 8-byte Spill
	callq	_rsum
	movq	-32(%rbp), %rcx         ## 8-byte Reload
	addq	%rax, %rcx
	movq	%rcx, -8(%rbp)
LBB0_3:
	movq	-8(%rbp), %rax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
.subsections_via_symbols
