
cread_alt:	file format Mach-O 64-bit x86-64


Disassembly of section __TEXT,__text:

0000000100003f40 _cread_alt:
100003f40: 55                          	pushq	%rbp
100003f41: 48 89 e5                    	movq	%rsp, %rbp
100003f44: 48 89 7d f0                 	movq	%rdi, -16(%rbp)
100003f48: c7 45 ec 00 00 00 00        	movl	$0, -20(%rbp)
100003f4f: 48 83 7d f0 00              	cmpq	$0, -16(%rbp)
100003f54: 0f 85 0d 00 00 00           	jne	13 <_cread_alt+0x27>
100003f5a: 48 c7 45 f8 00 00 00 00     	movq	$0, -8(%rbp)
100003f62: e9 0b 00 00 00              	jmp	11 <_cread_alt+0x32>
100003f67: 48 8b 45 f0                 	movq	-16(%rbp), %rax
100003f6b: 48 8b 00                    	movq	(%rax), %rax
100003f6e: 48 89 45 f8                 	movq	%rax, -8(%rbp)
100003f72: 48 8b 45 f8                 	movq	-8(%rbp), %rax
100003f76: 5d                          	popq	%rbp
100003f77: c3                          	retq
100003f78: 0f 1f 84 00 00 00 00 00     	nopl	(%rax,%rax)

0000000100003f80 _main:
100003f80: 55                          	pushq	%rbp
100003f81: 48 89 e5                    	movq	%rsp, %rbp
100003f84: 48 83 ec 20                 	subq	$32, %rsp
100003f88: c7 45 fc 00 00 00 00        	movl	$0, -4(%rbp)
100003f8f: b8 01 00 00 00              	movl	$1, %eax
100003f94: 48 89 45 f0                 	movq	%rax, -16(%rbp)
100003f98: 48 8b 7d f0                 	movq	-16(%rbp), %rdi
100003f9c: e8 9f ff ff ff              	callq	-97 <_cread_alt>
100003fa1: 31 c9                       	xorl	%ecx, %ecx
100003fa3: 48 89 45 e8                 	movq	%rax, -24(%rbp)
100003fa7: 89 c8                       	movl	%ecx, %eax
100003fa9: 48 83 c4 20                 	addq	$32, %rsp
100003fad: 5d                          	popq	%rbp
100003fae: c3                          	retq
