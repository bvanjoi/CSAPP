
exchange.o:	file format Mach-O 64-bit x86-64


Disassembly of section __TEXT,__text:

0000000000000000 _exchange:
       0: 55                           	pushq	%rbp
       1: 48 89 e5                     	movq	%rsp, %rbp
       4: 48 8b 07                     	movq	(%rdi), %rax
       7: 48 89 37                     	movq	%rsi, (%rdi)
       a: 5d                           	popq	%rbp
       b: c3                           	retq
