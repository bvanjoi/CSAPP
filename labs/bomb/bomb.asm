
bomb:	file format ELF64-x86-64


Disassembly of section .init:

0000000000400ac0 _init:
  400ac0: 48 83 ec 08                  	subq	$8, %rsp
  400ac4: e8 f3 01 00 00               	callq	499 <call_gmon_start>
  400ac9: 48 83 c4 08                  	addq	$8, %rsp
  400acd: c3                           	retq

Disassembly of section .plt:

0000000000400ad0 .plt:
  400ad0: ff 35 1a 25 20 00            	pushq	2106650(%rip)
  400ad6: ff 25 1c 25 20 00            	jmpq	*2106652(%rip)
  400adc: 0f 1f 40 00                  	nopl	(%rax)

0000000000400ae0 getenv@plt:
  400ae0: ff 25 1a 25 20 00            	jmpq	*2106650(%rip)
  400ae6: 68 00 00 00 00               	pushq	$0
  400aeb: e9 e0 ff ff ff               	jmp	-32 <.plt>

0000000000400af0 __errno_location@plt:
  400af0: ff 25 12 25 20 00            	jmpq	*2106642(%rip)
  400af6: 68 01 00 00 00               	pushq	$1
  400afb: e9 d0 ff ff ff               	jmp	-48 <.plt>

0000000000400b00 strcpy@plt:
  400b00: ff 25 0a 25 20 00            	jmpq	*2106634(%rip)
  400b06: 68 02 00 00 00               	pushq	$2
  400b0b: e9 c0 ff ff ff               	jmp	-64 <.plt>

0000000000400b10 puts@plt:
  400b10: ff 25 02 25 20 00            	jmpq	*2106626(%rip)
  400b16: 68 03 00 00 00               	pushq	$3
  400b1b: e9 b0 ff ff ff               	jmp	-80 <.plt>

0000000000400b20 write@plt:
  400b20: ff 25 fa 24 20 00            	jmpq	*2106618(%rip)
  400b26: 68 04 00 00 00               	pushq	$4
  400b2b: e9 a0 ff ff ff               	jmp	-96 <.plt>

0000000000400b30 __stack_chk_fail@plt:
  400b30: ff 25 f2 24 20 00            	jmpq	*2106610(%rip)
  400b36: 68 05 00 00 00               	pushq	$5
  400b3b: e9 90 ff ff ff               	jmp	-112 <.plt>

0000000000400b40 alarm@plt:
  400b40: ff 25 ea 24 20 00            	jmpq	*2106602(%rip)
  400b46: 68 06 00 00 00               	pushq	$6
  400b4b: e9 80 ff ff ff               	jmp	-128 <.plt>

0000000000400b50 close@plt:
  400b50: ff 25 e2 24 20 00            	jmpq	*2106594(%rip)
  400b56: 68 07 00 00 00               	pushq	$7
  400b5b: e9 70 ff ff ff               	jmp	-144 <.plt>

0000000000400b60 read@plt:
  400b60: ff 25 da 24 20 00            	jmpq	*2106586(%rip)
  400b66: 68 08 00 00 00               	pushq	$8
  400b6b: e9 60 ff ff ff               	jmp	-160 <.plt>

0000000000400b70 __libc_start_main@plt:
  400b70: ff 25 d2 24 20 00            	jmpq	*2106578(%rip)
  400b76: 68 09 00 00 00               	pushq	$9
  400b7b: e9 50 ff ff ff               	jmp	-176 <.plt>

0000000000400b80 fgets@plt:
  400b80: ff 25 ca 24 20 00            	jmpq	*2106570(%rip)
  400b86: 68 0a 00 00 00               	pushq	$10
  400b8b: e9 40 ff ff ff               	jmp	-192 <.plt>

0000000000400b90 signal@plt:
  400b90: ff 25 c2 24 20 00            	jmpq	*2106562(%rip)
  400b96: 68 0b 00 00 00               	pushq	$11
  400b9b: e9 30 ff ff ff               	jmp	-208 <.plt>

0000000000400ba0 gethostbyname@plt:
  400ba0: ff 25 ba 24 20 00            	jmpq	*2106554(%rip)
  400ba6: 68 0c 00 00 00               	pushq	$12
  400bab: e9 20 ff ff ff               	jmp	-224 <.plt>

0000000000400bb0 __memmove_chk@plt:
  400bb0: ff 25 b2 24 20 00            	jmpq	*2106546(%rip)
  400bb6: 68 0d 00 00 00               	pushq	$13
  400bbb: e9 10 ff ff ff               	jmp	-240 <.plt>

0000000000400bc0 __memcpy_chk@plt:
  400bc0: ff 25 aa 24 20 00            	jmpq	*2106538(%rip)
  400bc6: 68 0e 00 00 00               	pushq	$14
  400bcb: e9 00 ff ff ff               	jmp	-256 <.plt>

0000000000400bd0 strtol@plt:
  400bd0: ff 25 a2 24 20 00            	jmpq	*2106530(%rip)
  400bd6: 68 0f 00 00 00               	pushq	$15
  400bdb: e9 f0 fe ff ff               	jmp	-272 <.plt>

0000000000400be0 fflush@plt:
  400be0: ff 25 9a 24 20 00            	jmpq	*2106522(%rip)
  400be6: 68 10 00 00 00               	pushq	$16
  400beb: e9 e0 fe ff ff               	jmp	-288 <.plt>

0000000000400bf0 __isoc99_sscanf@plt:
  400bf0: ff 25 92 24 20 00            	jmpq	*2106514(%rip)
  400bf6: 68 11 00 00 00               	pushq	$17
  400bfb: e9 d0 fe ff ff               	jmp	-304 <.plt>

0000000000400c00 __printf_chk@plt:
  400c00: ff 25 8a 24 20 00            	jmpq	*2106506(%rip)
  400c06: 68 12 00 00 00               	pushq	$18
  400c0b: e9 c0 fe ff ff               	jmp	-320 <.plt>

0000000000400c10 fopen@plt:
  400c10: ff 25 82 24 20 00            	jmpq	*2106498(%rip)
  400c16: 68 13 00 00 00               	pushq	$19
  400c1b: e9 b0 fe ff ff               	jmp	-336 <.plt>

0000000000400c20 exit@plt:
  400c20: ff 25 7a 24 20 00            	jmpq	*2106490(%rip)
  400c26: 68 14 00 00 00               	pushq	$20
  400c2b: e9 a0 fe ff ff               	jmp	-352 <.plt>

0000000000400c30 connect@plt:
  400c30: ff 25 72 24 20 00            	jmpq	*2106482(%rip)
  400c36: 68 15 00 00 00               	pushq	$21
  400c3b: e9 90 fe ff ff               	jmp	-368 <.plt>

0000000000400c40 __fprintf_chk@plt:
  400c40: ff 25 6a 24 20 00            	jmpq	*2106474(%rip)
  400c46: 68 16 00 00 00               	pushq	$22
  400c4b: e9 80 fe ff ff               	jmp	-384 <.plt>

0000000000400c50 sleep@plt:
  400c50: ff 25 62 24 20 00            	jmpq	*2106466(%rip)
  400c56: 68 17 00 00 00               	pushq	$23
  400c5b: e9 70 fe ff ff               	jmp	-400 <.plt>

0000000000400c60 __ctype_b_loc@plt:
  400c60: ff 25 5a 24 20 00            	jmpq	*2106458(%rip)
  400c66: 68 18 00 00 00               	pushq	$24
  400c6b: e9 60 fe ff ff               	jmp	-416 <.plt>

0000000000400c70 __sprintf_chk@plt:
  400c70: ff 25 52 24 20 00            	jmpq	*2106450(%rip)
  400c76: 68 19 00 00 00               	pushq	$25
  400c7b: e9 50 fe ff ff               	jmp	-432 <.plt>

0000000000400c80 socket@plt:
  400c80: ff 25 4a 24 20 00            	jmpq	*2106442(%rip)
  400c86: 68 1a 00 00 00               	pushq	$26
  400c8b: e9 40 fe ff ff               	jmp	-448 <.plt>

Disassembly of section .text:

0000000000400c90 _start:
  400c90: 31 ed                        	xorl	%ebp, %ebp
  400c92: 49 89 d1                     	movq	%rdx, %r9
  400c95: 5e                           	popq	%rsi
  400c96: 48 89 e2                     	movq	%rsp, %rdx
  400c99: 48 83 e4 f0                  	andq	$-16, %rsp
  400c9d: 50                           	pushq	%rax
  400c9e: 54                           	pushq	%rsp
  400c9f: 49 c7 c0 a0 22 40 00         	movq	$4203168, %r8
  400ca6: 48 c7 c1 10 22 40 00         	movq	$4203024, %rcx
  400cad: 48 c7 c7 a0 0d 40 00         	movq	$4197792, %rdi
  400cb4: e8 b7 fe ff ff               	callq	-329 <__libc_start_main@plt>
  400cb9: f4                           	hlt
  400cba: 90                           	nop
  400cbb: 90                           	nop

0000000000400cbc call_gmon_start:
  400cbc: 48 83 ec 08                  	subq	$8, %rsp
  400cc0: 48 8b 05 19 23 20 00         	movq	2106137(%rip), %rax
  400cc7: 48 85 c0                     	testq	%rax, %rax
  400cca: 74 02                        	je	2 <call_gmon_start+0x12>
  400ccc: ff d0                        	callq	*%rax
  400cce: 48 83 c4 08                  	addq	$8, %rsp
  400cd2: c3                           	retq
  400cd3: 90                           	nop
  400cd4: 90                           	nop
  400cd5: 90                           	nop
  400cd6: 90                           	nop
  400cd7: 90                           	nop
  400cd8: 90                           	nop
  400cd9: 90                           	nop
  400cda: 90                           	nop
  400cdb: 90                           	nop
  400cdc: 90                           	nop
  400cdd: 90                           	nop
  400cde: 90                           	nop
  400cdf: 90                           	nop

0000000000400ce0 deregister_tm_clones:
  400ce0: b8 47 37 60 00               	movl	$6305607, %eax
  400ce5: 55                           	pushq	%rbp
  400ce6: 48 2d 40 37 60 00            	subq	$6305600, %rax
  400cec: 48 83 f8 0e                  	cmpq	$14, %rax
  400cf0: 48 89 e5                     	movq	%rsp, %rbp
  400cf3: 77 02                        	ja	2 <deregister_tm_clones+0x17>
  400cf5: 5d                           	popq	%rbp
  400cf6: c3                           	retq
  400cf7: b8 00 00 00 00               	movl	$0, %eax
  400cfc: 48 85 c0                     	testq	%rax, %rax
  400cff: 74 f4                        	je	-12 <deregister_tm_clones+0x15>
  400d01: 5d                           	popq	%rbp
  400d02: bf 40 37 60 00               	movl	$6305600, %edi
  400d07: ff e0                        	jmpq	*%rax
  400d09: 0f 1f 80 00 00 00 00         	nopl	(%rax)

0000000000400d10 register_tm_clones:
  400d10: b8 40 37 60 00               	movl	$6305600, %eax
  400d15: 55                           	pushq	%rbp
  400d16: 48 2d 40 37 60 00            	subq	$6305600, %rax
  400d1c: 48 c1 f8 03                  	sarq	$3, %rax
  400d20: 48 89 e5                     	movq	%rsp, %rbp
  400d23: 48 89 c2                     	movq	%rax, %rdx
  400d26: 48 c1 ea 3f                  	shrq	$63, %rdx
  400d2a: 48 01 d0                     	addq	%rdx, %rax
  400d2d: 48 d1 f8                     	sarq	%rax
  400d30: 75 02                        	jne	2 <register_tm_clones+0x24>
  400d32: 5d                           	popq	%rbp
  400d33: c3                           	retq
  400d34: ba 00 00 00 00               	movl	$0, %edx
  400d39: 48 85 d2                     	testq	%rdx, %rdx
  400d3c: 74 f4                        	je	-12 <register_tm_clones+0x22>
  400d3e: 5d                           	popq	%rbp
  400d3f: 48 89 c6                     	movq	%rax, %rsi
  400d42: bf 40 37 60 00               	movl	$6305600, %edi
  400d47: ff e2                        	jmpq	*%rdx
  400d49: 0f 1f 80 00 00 00 00         	nopl	(%rax)

0000000000400d50 __do_global_dtors_aux:
  400d50: 80 3d 01 2a 20 00 00         	cmpb	$0, 2107905(%rip)
  400d57: 75 11                        	jne	17 <__do_global_dtors_aux+0x1a>
  400d59: 55                           	pushq	%rbp
  400d5a: 48 89 e5                     	movq	%rsp, %rbp
  400d5d: e8 7e ff ff ff               	callq	-130 <deregister_tm_clones>
  400d62: 5d                           	popq	%rbp
  400d63: c6 05 ee 29 20 00 01         	movb	$1, 2107886(%rip)
  400d6a: f3 c3                        	rep		retq
  400d6c: 0f 1f 40 00                  	nopl	(%rax)

0000000000400d70 frame_dummy:
  400d70: 48 83 3d 90 20 20 00 00      	cmpq	$0, 2105488(%rip)
  400d78: 74 1e                        	je	30 <frame_dummy+0x28>
  400d7a: b8 00 00 00 00               	movl	$0, %eax
  400d7f: 48 85 c0                     	testq	%rax, %rax
  400d82: 74 14                        	je	20 <frame_dummy+0x28>
  400d84: 55                           	pushq	%rbp
  400d85: bf 08 2e 60 00               	movl	$6303240, %edi
  400d8a: 48 89 e5                     	movq	%rsp, %rbp
  400d8d: ff d0                        	callq	*%rax
  400d8f: 5d                           	popq	%rbp
  400d90: e9 7b ff ff ff               	jmp	-133 <register_tm_clones>
  400d95: 0f 1f 00                     	nopl	(%rax)
  400d98: e9 73 ff ff ff               	jmp	-141 <register_tm_clones>
  400d9d: 90                           	nop
  400d9e: 90                           	nop
  400d9f: 90                           	nop

0000000000400da0 main:
  400da0: 53                           	pushq	%rbx
  400da1: 83 ff 01                     	cmpl	$1, %edi
  400da4: 75 10                        	jne	16 <main+0x16>
  400da6: 48 8b 05 9b 29 20 00         	movq	2107803(%rip), %rax
  400dad: 48 89 05 b4 29 20 00         	movq	%rax, 2107828(%rip)
  400db4: eb 63                        	jmp	99 <main+0x79>
  400db6: 48 89 f3                     	movq	%rsi, %rbx
  400db9: 83 ff 02                     	cmpl	$2, %edi
  400dbc: 75 3a                        	jne	58 <main+0x58>
  400dbe: 48 8b 7e 08                  	movq	8(%rsi), %rdi
  400dc2: be b4 22 40 00               	movl	$4203188, %esi
  400dc7: e8 44 fe ff ff               	callq	-444 <fopen@plt>
  400dcc: 48 89 05 95 29 20 00         	movq	%rax, 2107797(%rip)
  400dd3: 48 85 c0                     	testq	%rax, %rax
  400dd6: 75 41                        	jne	65 <main+0x79>
  400dd8: 48 8b 4b 08                  	movq	8(%rbx), %rcx
  400ddc: 48 8b 13                     	movq	(%rbx), %rdx
  400ddf: be b6 22 40 00               	movl	$4203190, %esi
  400de4: bf 01 00 00 00               	movl	$1, %edi
  400de9: e8 12 fe ff ff               	callq	-494 <__printf_chk@plt>
  400dee: bf 08 00 00 00               	movl	$8, %edi
  400df3: e8 28 fe ff ff               	callq	-472 <exit@plt>
  400df8: 48 8b 16                     	movq	(%rsi), %rdx
  400dfb: be d3 22 40 00               	movl	$4203219, %esi
  400e00: bf 01 00 00 00               	movl	$1, %edi
  400e05: b8 00 00 00 00               	movl	$0, %eax
  400e0a: e8 f1 fd ff ff               	callq	-527 <__printf_chk@plt>
  400e0f: bf 08 00 00 00               	movl	$8, %edi
  400e14: e8 07 fe ff ff               	callq	-505 <exit@plt>
  400e19: e8 84 05 00 00               	callq	1412 <initialize_bomb>
  400e1e: bf 38 23 40 00               	movl	$4203320, %edi
  400e23: e8 e8 fc ff ff               	callq	-792 <puts@plt>
  400e28: bf 78 23 40 00               	movl	$4203384, %edi
  400e2d: e8 de fc ff ff               	callq	-802 <puts@plt>
  400e32: e8 67 06 00 00               	callq	1639 <read_line>
  400e37: 48 89 c7                     	movq	%rax, %rdi
  400e3a: e8 a1 00 00 00               	callq	161 <phase_1>
  400e3f: e8 80 07 00 00               	callq	1920 <phase_defused>
  400e44: bf a8 23 40 00               	movl	$4203432, %edi
  400e49: e8 c2 fc ff ff               	callq	-830 <puts@plt>
  400e4e: e8 4b 06 00 00               	callq	1611 <read_line>
  400e53: 48 89 c7                     	movq	%rax, %rdi
  400e56: e8 a1 00 00 00               	callq	161 <phase_2>
  400e5b: e8 64 07 00 00               	callq	1892 <phase_defused>
  400e60: bf ed 22 40 00               	movl	$4203245, %edi
  400e65: e8 a6 fc ff ff               	callq	-858 <puts@plt>
  400e6a: e8 2f 06 00 00               	callq	1583 <read_line>
  400e6f: 48 89 c7                     	movq	%rax, %rdi
  400e72: e8 cc 00 00 00               	callq	204 <phase_3>
  400e77: e8 48 07 00 00               	callq	1864 <phase_defused>
  400e7c: bf 0b 23 40 00               	movl	$4203275, %edi
  400e81: e8 8a fc ff ff               	callq	-886 <puts@plt>
  400e86: e8 13 06 00 00               	callq	1555 <read_line>
  400e8b: 48 89 c7                     	movq	%rax, %rdi
  400e8e: e8 79 01 00 00               	callq	377 <phase_4>
  400e93: e8 2c 07 00 00               	callq	1836 <phase_defused>
  400e98: bf d8 23 40 00               	movl	$4203480, %edi
  400e9d: e8 6e fc ff ff               	callq	-914 <puts@plt>
  400ea2: e8 f7 05 00 00               	callq	1527 <read_line>
  400ea7: 48 89 c7                     	movq	%rax, %rdi
  400eaa: e8 b3 01 00 00               	callq	435 <phase_5>
  400eaf: e8 10 07 00 00               	callq	1808 <phase_defused>
  400eb4: bf 1a 23 40 00               	movl	$4203290, %edi
  400eb9: e8 52 fc ff ff               	callq	-942 <puts@plt>
  400ebe: e8 db 05 00 00               	callq	1499 <read_line>
  400ec3: 48 89 c7                     	movq	%rax, %rdi
  400ec6: e8 29 02 00 00               	callq	553 <phase_6>
  400ecb: e8 f4 06 00 00               	callq	1780 <phase_defused>
  400ed0: b8 00 00 00 00               	movl	$0, %eax
  400ed5: 5b                           	popq	%rbx
  400ed6: c3                           	retq
  400ed7: 90                           	nop
  400ed8: 90                           	nop
  400ed9: 90                           	nop
  400eda: 90                           	nop
  400edb: 90                           	nop
  400edc: 90                           	nop
  400edd: 90                           	nop
  400ede: 90                           	nop
  400edf: 90                           	nop

0000000000400ee0 phase_1:
  400ee0: 48 83 ec 08                  	subq	$8, %rsp
  400ee4: be 00 24 40 00               	movl	$4203520, %esi
  400ee9: e8 4a 04 00 00               	callq	1098 <strings_not_equal>
  400eee: 85 c0                        	testl	%eax, %eax
  400ef0: 74 05                        	je	5 <phase_1+0x17>
  400ef2: e8 43 05 00 00               	callq	1347 <explode_bomb>
  400ef7: 48 83 c4 08                  	addq	$8, %rsp
  400efb: c3                           	retq

0000000000400efc phase_2:
  400efc: 55                           	pushq	%rbp
  400efd: 53                           	pushq	%rbx
  400efe: 48 83 ec 28                  	subq	$40, %rsp
  400f02: 48 89 e6                     	movq	%rsp, %rsi
  400f05: e8 52 05 00 00               	callq	1362 <read_six_numbers>
  400f0a: 83 3c 24 01                  	cmpl	$1, (%rsp)
  400f0e: 74 20                        	je	32 <phase_2+0x34>
  400f10: e8 25 05 00 00               	callq	1317 <explode_bomb>
  400f15: eb 19                        	jmp	25 <phase_2+0x34>
  400f17: 8b 43 fc                     	movl	-4(%rbx), %eax
  400f1a: 01 c0                        	addl	%eax, %eax
  400f1c: 39 03                        	cmpl	%eax, (%rbx)
  400f1e: 74 05                        	je	5 <phase_2+0x29>
  400f20: e8 15 05 00 00               	callq	1301 <explode_bomb>
  400f25: 48 83 c3 04                  	addq	$4, %rbx
  400f29: 48 39 eb                     	cmpq	%rbp, %rbx
  400f2c: 75 e9                        	jne	-23 <phase_2+0x1b>
  400f2e: eb 0c                        	jmp	12 <phase_2+0x40>
  400f30: 48 8d 5c 24 04               	leaq	4(%rsp), %rbx
  400f35: 48 8d 6c 24 18               	leaq	24(%rsp), %rbp
  400f3a: eb db                        	jmp	-37 <phase_2+0x1b>
  400f3c: 48 83 c4 28                  	addq	$40, %rsp
  400f40: 5b                           	popq	%rbx
  400f41: 5d                           	popq	%rbp
  400f42: c3                           	retq

0000000000400f43 phase_3:
  400f43: 48 83 ec 18                  	subq	$24, %rsp
  400f47: 48 8d 4c 24 0c               	leaq	12(%rsp), %rcx
  400f4c: 48 8d 54 24 08               	leaq	8(%rsp), %rdx
  400f51: be cf 25 40 00               	movl	$4203983, %esi
  400f56: b8 00 00 00 00               	movl	$0, %eax
  400f5b: e8 90 fc ff ff               	callq	-880 <__isoc99_sscanf@plt>
  400f60: 83 f8 01                     	cmpl	$1, %eax
  400f63: 7f 05                        	jg	5 <phase_3+0x27>
  400f65: e8 d0 04 00 00               	callq	1232 <explode_bomb>
  400f6a: 83 7c 24 08 07               	cmpl	$7, 8(%rsp)
  400f6f: 77 3c                        	ja	60 <phase_3+0x6a>
  400f71: 8b 44 24 08                  	movl	8(%rsp), %eax
  400f75: ff 24 c5 70 24 40 00         	jmpq	*4203632(,%rax,8)
  400f7c: b8 cf 00 00 00               	movl	$207, %eax
  400f81: eb 3b                        	jmp	59 <phase_3+0x7b>
  400f83: b8 c3 02 00 00               	movl	$707, %eax
  400f88: eb 34                        	jmp	52 <phase_3+0x7b>
  400f8a: b8 00 01 00 00               	movl	$256, %eax
  400f8f: eb 2d                        	jmp	45 <phase_3+0x7b>
  400f91: b8 85 01 00 00               	movl	$389, %eax
  400f96: eb 26                        	jmp	38 <phase_3+0x7b>
  400f98: b8 ce 00 00 00               	movl	$206, %eax
  400f9d: eb 1f                        	jmp	31 <phase_3+0x7b>
  400f9f: b8 aa 02 00 00               	movl	$682, %eax
  400fa4: eb 18                        	jmp	24 <phase_3+0x7b>
  400fa6: b8 47 01 00 00               	movl	$327, %eax
  400fab: eb 11                        	jmp	17 <phase_3+0x7b>
  400fad: e8 88 04 00 00               	callq	1160 <explode_bomb>
  400fb2: b8 00 00 00 00               	movl	$0, %eax
  400fb7: eb 05                        	jmp	5 <phase_3+0x7b>
  400fb9: b8 37 01 00 00               	movl	$311, %eax
  400fbe: 3b 44 24 0c                  	cmpl	12(%rsp), %eax
  400fc2: 74 05                        	je	5 <phase_3+0x86>
  400fc4: e8 71 04 00 00               	callq	1137 <explode_bomb>
  400fc9: 48 83 c4 18                  	addq	$24, %rsp
  400fcd: c3                           	retq

0000000000400fce func4:
  400fce: 48 83 ec 08                  	subq	$8, %rsp
  400fd2: 89 d0                        	movl	%edx, %eax
  400fd4: 29 f0                        	subl	%esi, %eax
  400fd6: 89 c1                        	movl	%eax, %ecx
  400fd8: c1 e9 1f                     	shrl	$31, %ecx
  400fdb: 01 c8                        	addl	%ecx, %eax
  400fdd: d1 f8                        	sarl	%eax
  400fdf: 8d 0c 30                     	leal	(%rax,%rsi), %ecx
  400fe2: 39 f9                        	cmpl	%edi, %ecx
  400fe4: 7e 0c                        	jle	12 <func4+0x24>
  400fe6: 8d 51 ff                     	leal	-1(%rcx), %edx
  400fe9: e8 e0 ff ff ff               	callq	-32 <func4>
  400fee: 01 c0                        	addl	%eax, %eax
  400ff0: eb 15                        	jmp	21 <func4+0x39>
  400ff2: b8 00 00 00 00               	movl	$0, %eax
  400ff7: 39 f9                        	cmpl	%edi, %ecx
  400ff9: 7d 0c                        	jge	12 <func4+0x39>
  400ffb: 8d 71 01                     	leal	1(%rcx), %esi
  400ffe: e8 cb ff ff ff               	callq	-53 <func4>
  401003: 8d 44 00 01                  	leal	1(%rax,%rax), %eax
  401007: 48 83 c4 08                  	addq	$8, %rsp
  40100b: c3                           	retq

000000000040100c phase_4:
  40100c: 48 83 ec 18                  	subq	$24, %rsp
  401010: 48 8d 4c 24 0c               	leaq	12(%rsp), %rcx
  401015: 48 8d 54 24 08               	leaq	8(%rsp), %rdx
  40101a: be cf 25 40 00               	movl	$4203983, %esi
  40101f: b8 00 00 00 00               	movl	$0, %eax
  401024: e8 c7 fb ff ff               	callq	-1081 <__isoc99_sscanf@plt>
  401029: 83 f8 02                     	cmpl	$2, %eax
  40102c: 75 07                        	jne	7 <phase_4+0x29>
  40102e: 83 7c 24 08 0e               	cmpl	$14, 8(%rsp)
  401033: 76 05                        	jbe	5 <phase_4+0x2e>
  401035: e8 00 04 00 00               	callq	1024 <explode_bomb>
  40103a: ba 0e 00 00 00               	movl	$14, %edx
  40103f: be 00 00 00 00               	movl	$0, %esi
  401044: 8b 7c 24 08                  	movl	8(%rsp), %edi
  401048: e8 81 ff ff ff               	callq	-127 <func4>
  40104d: 85 c0                        	testl	%eax, %eax
  40104f: 75 07                        	jne	7 <phase_4+0x4c>
  401051: 83 7c 24 0c 00               	cmpl	$0, 12(%rsp)
  401056: 74 05                        	je	5 <phase_4+0x51>
  401058: e8 dd 03 00 00               	callq	989 <explode_bomb>
  40105d: 48 83 c4 18                  	addq	$24, %rsp
  401061: c3                           	retq

0000000000401062 phase_5:
  401062: 53                           	pushq	%rbx
  401063: 48 83 ec 20                  	subq	$32, %rsp
  401067: 48 89 fb                     	movq	%rdi, %rbx
  40106a: 64 48 8b 04 25 28 00 00 00   	movq	%fs:40, %rax
  401073: 48 89 44 24 18               	movq	%rax, 24(%rsp)
  401078: 31 c0                        	xorl	%eax, %eax
  40107a: e8 9c 02 00 00               	callq	668 <string_length>
  40107f: 83 f8 06                     	cmpl	$6, %eax
  401082: 74 4e                        	je	78 <phase_5+0x70>
  401084: e8 b1 03 00 00               	callq	945 <explode_bomb>
  401089: eb 47                        	jmp	71 <phase_5+0x70>
  40108b: 0f b6 0c 03                  	movzbl	(%rbx,%rax), %ecx
  40108f: 88 0c 24                     	movb	%cl, (%rsp)
  401092: 48 8b 14 24                  	movq	(%rsp), %rdx
  401096: 83 e2 0f                     	andl	$15, %edx
  401099: 0f b6 92 b0 24 40 00         	movzbl	4203696(%rdx), %edx
  4010a0: 88 54 04 10                  	movb	%dl, 16(%rsp,%rax)
  4010a4: 48 83 c0 01                  	addq	$1, %rax
  4010a8: 48 83 f8 06                  	cmpq	$6, %rax
  4010ac: 75 dd                        	jne	-35 <phase_5+0x29>
  4010ae: c6 44 24 16 00               	movb	$0, 22(%rsp)
  4010b3: be 5e 24 40 00               	movl	$4203614, %esi
  4010b8: 48 8d 7c 24 10               	leaq	16(%rsp), %rdi
  4010bd: e8 76 02 00 00               	callq	630 <strings_not_equal>
  4010c2: 85 c0                        	testl	%eax, %eax
  4010c4: 74 13                        	je	19 <phase_5+0x77>
  4010c6: e8 6f 03 00 00               	callq	879 <explode_bomb>
  4010cb: 0f 1f 44 00 00               	nopl	(%rax,%rax)
  4010d0: eb 07                        	jmp	7 <phase_5+0x77>
  4010d2: b8 00 00 00 00               	movl	$0, %eax
  4010d7: eb b2                        	jmp	-78 <phase_5+0x29>
  4010d9: 48 8b 44 24 18               	movq	24(%rsp), %rax
  4010de: 64 48 33 04 25 28 00 00 00   	xorq	%fs:40, %rax
  4010e7: 74 05                        	je	5 <phase_5+0x8c>
  4010e9: e8 42 fa ff ff               	callq	-1470 <__stack_chk_fail@plt>
  4010ee: 48 83 c4 20                  	addq	$32, %rsp
  4010f2: 5b                           	popq	%rbx
  4010f3: c3                           	retq

00000000004010f4 phase_6:
  4010f4: 41 56                        	pushq	%r14
  4010f6: 41 55                        	pushq	%r13
  4010f8: 41 54                        	pushq	%r12
  4010fa: 55                           	pushq	%rbp
  4010fb: 53                           	pushq	%rbx
  4010fc: 48 83 ec 50                  	subq	$80, %rsp
  401100: 49 89 e5                     	movq	%rsp, %r13
  401103: 48 89 e6                     	movq	%rsp, %rsi
  401106: e8 51 03 00 00               	callq	849 <read_six_numbers>
  40110b: 49 89 e6                     	movq	%rsp, %r14
  40110e: 41 bc 00 00 00 00            	movl	$0, %r12d
  401114: 4c 89 ed                     	movq	%r13, %rbp
  401117: 41 8b 45 00                  	movl	(%r13), %eax
  40111b: 83 e8 01                     	subl	$1, %eax
  40111e: 83 f8 05                     	cmpl	$5, %eax
  401121: 76 05                        	jbe	5 <phase_6+0x34>
  401123: e8 12 03 00 00               	callq	786 <explode_bomb>
  401128: 41 83 c4 01                  	addl	$1, %r12d
  40112c: 41 83 fc 06                  	cmpl	$6, %r12d
  401130: 74 21                        	je	33 <phase_6+0x5f>
  401132: 44 89 e3                     	movl	%r12d, %ebx
  401135: 48 63 c3                     	movslq	%ebx, %rax
  401138: 8b 04 84                     	movl	(%rsp,%rax,4), %eax
  40113b: 39 45 00                     	cmpl	%eax, (%rbp)
  40113e: 75 05                        	jne	5 <phase_6+0x51>
  401140: e8 f5 02 00 00               	callq	757 <explode_bomb>
  401145: 83 c3 01                     	addl	$1, %ebx
  401148: 83 fb 05                     	cmpl	$5, %ebx
  40114b: 7e e8                        	jle	-24 <phase_6+0x41>
  40114d: 49 83 c5 04                  	addq	$4, %r13
  401151: eb c1                        	jmp	-63 <phase_6+0x20>
  401153: 48 8d 74 24 18               	leaq	24(%rsp), %rsi
  401158: 4c 89 f0                     	movq	%r14, %rax
  40115b: b9 07 00 00 00               	movl	$7, %ecx
  401160: 89 ca                        	movl	%ecx, %edx
  401162: 2b 10                        	subl	(%rax), %edx
  401164: 89 10                        	movl	%edx, (%rax)
  401166: 48 83 c0 04                  	addq	$4, %rax
  40116a: 48 39 f0                     	cmpq	%rsi, %rax
  40116d: 75 f1                        	jne	-15 <phase_6+0x6c>
  40116f: be 00 00 00 00               	movl	$0, %esi
  401174: eb 21                        	jmp	33 <phase_6+0xa3>
  401176: 48 8b 52 08                  	movq	8(%rdx), %rdx
  40117a: 83 c0 01                     	addl	$1, %eax
  40117d: 39 c8                        	cmpl	%ecx, %eax
  40117f: 75 f5                        	jne	-11 <phase_6+0x82>
  401181: eb 05                        	jmp	5 <phase_6+0x94>
  401183: ba d0 32 60 00               	movl	$6304464, %edx
  401188: 48 89 54 74 20               	movq	%rdx, 32(%rsp,%rsi,2)
  40118d: 48 83 c6 04                  	addq	$4, %rsi
  401191: 48 83 fe 18                  	cmpq	$24, %rsi
  401195: 74 14                        	je	20 <phase_6+0xb7>
  401197: 8b 0c 34                     	movl	(%rsp,%rsi), %ecx
  40119a: 83 f9 01                     	cmpl	$1, %ecx
  40119d: 7e e4                        	jle	-28 <phase_6+0x8f>
  40119f: b8 01 00 00 00               	movl	$1, %eax
  4011a4: ba d0 32 60 00               	movl	$6304464, %edx
  4011a9: eb cb                        	jmp	-53 <phase_6+0x82>
  4011ab: 48 8b 5c 24 20               	movq	32(%rsp), %rbx
  4011b0: 48 8d 44 24 28               	leaq	40(%rsp), %rax
  4011b5: 48 8d 74 24 50               	leaq	80(%rsp), %rsi
  4011ba: 48 89 d9                     	movq	%rbx, %rcx
  4011bd: 48 8b 10                     	movq	(%rax), %rdx
  4011c0: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  4011c4: 48 83 c0 08                  	addq	$8, %rax
  4011c8: 48 39 f0                     	cmpq	%rsi, %rax
  4011cb: 74 05                        	je	5 <phase_6+0xde>
  4011cd: 48 89 d1                     	movq	%rdx, %rcx
  4011d0: eb eb                        	jmp	-21 <phase_6+0xc9>
  4011d2: 48 c7 42 08 00 00 00 00      	movq	$0, 8(%rdx)
  4011da: bd 05 00 00 00               	movl	$5, %ebp
  4011df: 48 8b 43 08                  	movq	8(%rbx), %rax
  4011e3: 8b 00                        	movl	(%rax), %eax
  4011e5: 39 03                        	cmpl	%eax, (%rbx)
  4011e7: 7d 05                        	jge	5 <phase_6+0xfa>
  4011e9: e8 4c 02 00 00               	callq	588 <explode_bomb>
  4011ee: 48 8b 5b 08                  	movq	8(%rbx), %rbx
  4011f2: 83 ed 01                     	subl	$1, %ebp
  4011f5: 75 e8                        	jne	-24 <phase_6+0xeb>
  4011f7: 48 83 c4 50                  	addq	$80, %rsp
  4011fb: 5b                           	popq	%rbx
  4011fc: 5d                           	popq	%rbp
  4011fd: 41 5c                        	popq	%r12
  4011ff: 41 5d                        	popq	%r13
  401201: 41 5e                        	popq	%r14
  401203: c3                           	retq

0000000000401204 fun7:
  401204: 48 83 ec 08                  	subq	$8, %rsp
  401208: 48 85 ff                     	testq	%rdi, %rdi
  40120b: 74 2b                        	je	43 <fun7+0x34>
  40120d: 8b 17                        	movl	(%rdi), %edx
  40120f: 39 f2                        	cmpl	%esi, %edx
  401211: 7e 0d                        	jle	13 <fun7+0x1c>
  401213: 48 8b 7f 08                  	movq	8(%rdi), %rdi
  401217: e8 e8 ff ff ff               	callq	-24 <fun7>
  40121c: 01 c0                        	addl	%eax, %eax
  40121e: eb 1d                        	jmp	29 <fun7+0x39>
  401220: b8 00 00 00 00               	movl	$0, %eax
  401225: 39 f2                        	cmpl	%esi, %edx
  401227: 74 14                        	je	20 <fun7+0x39>
  401229: 48 8b 7f 10                  	movq	16(%rdi), %rdi
  40122d: e8 d2 ff ff ff               	callq	-46 <fun7>
  401232: 8d 44 00 01                  	leal	1(%rax,%rax), %eax
  401236: eb 05                        	jmp	5 <fun7+0x39>
  401238: b8 ff ff ff ff               	movl	$4294967295, %eax
  40123d: 48 83 c4 08                  	addq	$8, %rsp
  401241: c3                           	retq

0000000000401242 secret_phase:
  401242: 53                           	pushq	%rbx
  401243: e8 56 02 00 00               	callq	598 <read_line>
  401248: ba 0a 00 00 00               	movl	$10, %edx
  40124d: be 00 00 00 00               	movl	$0, %esi
  401252: 48 89 c7                     	movq	%rax, %rdi
  401255: e8 76 f9 ff ff               	callq	-1674 <strtol@plt>
  40125a: 48 89 c3                     	movq	%rax, %rbx
  40125d: 8d 40 ff                     	leal	-1(%rax), %eax
  401260: 3d e8 03 00 00               	cmpl	$1000, %eax
  401265: 76 05                        	jbe	5 <secret_phase+0x2a>
  401267: e8 ce 01 00 00               	callq	462 <explode_bomb>
  40126c: 89 de                        	movl	%ebx, %esi
  40126e: bf f0 30 60 00               	movl	$6303984, %edi
  401273: e8 8c ff ff ff               	callq	-116 <fun7>
  401278: 83 f8 02                     	cmpl	$2, %eax
  40127b: 74 05                        	je	5 <secret_phase+0x40>
  40127d: e8 b8 01 00 00               	callq	440 <explode_bomb>
  401282: bf 38 24 40 00               	movl	$4203576, %edi
  401287: e8 84 f8 ff ff               	callq	-1916 <puts@plt>
  40128c: e8 33 03 00 00               	callq	819 <phase_defused>
  401291: 5b                           	popq	%rbx
  401292: c3                           	retq
  401293: 90                           	nop
  401294: 90                           	nop
  401295: 90                           	nop
  401296: 90                           	nop
  401297: 90                           	nop
  401298: 90                           	nop
  401299: 90                           	nop
  40129a: 90                           	nop
  40129b: 90                           	nop
  40129c: 90                           	nop
  40129d: 90                           	nop
  40129e: 90                           	nop
  40129f: 90                           	nop

00000000004012a0 sig_handler:
  4012a0: 48 83 ec 08                  	subq	$8, %rsp
  4012a4: bf c0 24 40 00               	movl	$4203712, %edi
  4012a9: e8 62 f8 ff ff               	callq	-1950 <puts@plt>
  4012ae: bf 03 00 00 00               	movl	$3, %edi
  4012b3: e8 98 f9 ff ff               	callq	-1640 <sleep@plt>
  4012b8: be 82 25 40 00               	movl	$4203906, %esi
  4012bd: bf 01 00 00 00               	movl	$1, %edi
  4012c2: b8 00 00 00 00               	movl	$0, %eax
  4012c7: e8 34 f9 ff ff               	callq	-1740 <__printf_chk@plt>
  4012cc: 48 8b 3d 6d 24 20 00         	movq	2106477(%rip), %rdi
  4012d3: e8 08 f9 ff ff               	callq	-1784 <fflush@plt>
  4012d8: bf 01 00 00 00               	movl	$1, %edi
  4012dd: e8 6e f9 ff ff               	callq	-1682 <sleep@plt>
  4012e2: bf 8a 25 40 00               	movl	$4203914, %edi
  4012e7: e8 24 f8 ff ff               	callq	-2012 <puts@plt>
  4012ec: bf 10 00 00 00               	movl	$16, %edi
  4012f1: e8 2a f9 ff ff               	callq	-1750 <exit@plt>

00000000004012f6 invalid_phase:
  4012f6: 48 83 ec 08                  	subq	$8, %rsp
  4012fa: 48 89 fa                     	movq	%rdi, %rdx
  4012fd: be 92 25 40 00               	movl	$4203922, %esi
  401302: bf 01 00 00 00               	movl	$1, %edi
  401307: b8 00 00 00 00               	movl	$0, %eax
  40130c: e8 ef f8 ff ff               	callq	-1809 <__printf_chk@plt>
  401311: bf 08 00 00 00               	movl	$8, %edi
  401316: e8 05 f9 ff ff               	callq	-1787 <exit@plt>

000000000040131b string_length:
  40131b: 80 3f 00                     	cmpb	$0, (%rdi)
  40131e: 74 12                        	je	18 <string_length+0x17>
  401320: 48 89 fa                     	movq	%rdi, %rdx
  401323: 48 83 c2 01                  	addq	$1, %rdx
  401327: 89 d0                        	movl	%edx, %eax
  401329: 29 f8                        	subl	%edi, %eax
  40132b: 80 3a 00                     	cmpb	$0, (%rdx)
  40132e: 75 f3                        	jne	-13 <string_length+0x8>
  401330: f3 c3                        	rep		retq
  401332: b8 00 00 00 00               	movl	$0, %eax
  401337: c3                           	retq

0000000000401338 strings_not_equal:
  401338: 41 54                        	pushq	%r12
  40133a: 55                           	pushq	%rbp
  40133b: 53                           	pushq	%rbx
  40133c: 48 89 fb                     	movq	%rdi, %rbx
  40133f: 48 89 f5                     	movq	%rsi, %rbp
  401342: e8 d4 ff ff ff               	callq	-44 <string_length>
  401347: 41 89 c4                     	movl	%eax, %r12d
  40134a: 48 89 ef                     	movq	%rbp, %rdi
  40134d: e8 c9 ff ff ff               	callq	-55 <string_length>
  401352: ba 01 00 00 00               	movl	$1, %edx
  401357: 41 39 c4                     	cmpl	%eax, %r12d
  40135a: 75 3f                        	jne	63 <strings_not_equal+0x63>
  40135c: 0f b6 03                     	movzbl	(%rbx), %eax
  40135f: 84 c0                        	testb	%al, %al
  401361: 74 25                        	je	37 <strings_not_equal+0x50>
  401363: 3a 45 00                     	cmpb	(%rbp), %al
  401366: 74 0a                        	je	10 <strings_not_equal+0x3a>
  401368: eb 25                        	jmp	37 <strings_not_equal+0x57>
  40136a: 3a 45 00                     	cmpb	(%rbp), %al
  40136d: 0f 1f 00                     	nopl	(%rax)
  401370: 75 24                        	jne	36 <strings_not_equal+0x5e>
  401372: 48 83 c3 01                  	addq	$1, %rbx
  401376: 48 83 c5 01                  	addq	$1, %rbp
  40137a: 0f b6 03                     	movzbl	(%rbx), %eax
  40137d: 84 c0                        	testb	%al, %al
  40137f: 75 e9                        	jne	-23 <strings_not_equal+0x32>
  401381: ba 00 00 00 00               	movl	$0, %edx
  401386: eb 13                        	jmp	19 <strings_not_equal+0x63>
  401388: ba 00 00 00 00               	movl	$0, %edx
  40138d: eb 0c                        	jmp	12 <strings_not_equal+0x63>
  40138f: ba 01 00 00 00               	movl	$1, %edx
  401394: eb 05                        	jmp	5 <strings_not_equal+0x63>
  401396: ba 01 00 00 00               	movl	$1, %edx
  40139b: 89 d0                        	movl	%edx, %eax
  40139d: 5b                           	popq	%rbx
  40139e: 5d                           	popq	%rbp
  40139f: 41 5c                        	popq	%r12
  4013a1: c3                           	retq

00000000004013a2 initialize_bomb:
  4013a2: 48 83 ec 08                  	subq	$8, %rsp
  4013a6: be a0 12 40 00               	movl	$4199072, %esi
  4013ab: bf 02 00 00 00               	movl	$2, %edi
  4013b0: e8 db f7 ff ff               	callq	-2085 <signal@plt>
  4013b5: 48 83 c4 08                  	addq	$8, %rsp
  4013b9: c3                           	retq

00000000004013ba initialize_bomb_solve:
  4013ba: f3 c3                        	rep		retq

00000000004013bc blank_line:
  4013bc: 55                           	pushq	%rbp
  4013bd: 53                           	pushq	%rbx
  4013be: 48 83 ec 08                  	subq	$8, %rsp
  4013c2: 48 89 fb                     	movq	%rdi, %rbx
  4013c5: eb 17                        	jmp	23 <blank_line+0x22>
  4013c7: e8 94 f8 ff ff               	callq	-1900 <__ctype_b_loc@plt>
  4013cc: 48 83 c3 01                  	addq	$1, %rbx
  4013d0: 48 0f be ed                  	movsbq	%bpl, %rbp
  4013d4: 48 8b 00                     	movq	(%rax), %rax
  4013d7: f6 44 68 01 20               	testb	$32, 1(%rax,%rbp,2)
  4013dc: 74 0f                        	je	15 <blank_line+0x31>
  4013de: 0f b6 2b                     	movzbl	(%rbx), %ebp
  4013e1: 40 84 ed                     	testb	%bpl, %bpl
  4013e4: 75 e1                        	jne	-31 <blank_line+0xb>
  4013e6: b8 01 00 00 00               	movl	$1, %eax
  4013eb: eb 05                        	jmp	5 <blank_line+0x36>
  4013ed: b8 00 00 00 00               	movl	$0, %eax
  4013f2: 48 83 c4 08                  	addq	$8, %rsp
  4013f6: 5b                           	popq	%rbx
  4013f7: 5d                           	popq	%rbp
  4013f8: c3                           	retq

00000000004013f9 skip:
  4013f9: 53                           	pushq	%rbx
  4013fa: 48 63 05 5f 23 20 00         	movslq	2106207(%rip), %rax
  401401: 48 8d 3c 80                  	leaq	(%rax,%rax,4), %rdi
  401405: 48 c1 e7 04                  	shlq	$4, %rdi
  401409: 48 81 c7 80 37 60 00         	addq	$6305664, %rdi
  401410: 48 8b 15 51 23 20 00         	movq	2106193(%rip), %rdx
  401417: be 50 00 00 00               	movl	$80, %esi
  40141c: e8 5f f7 ff ff               	callq	-2209 <fgets@plt>
  401421: 48 89 c3                     	movq	%rax, %rbx
  401424: 48 85 c0                     	testq	%rax, %rax
  401427: 74 0c                        	je	12 <skip+0x3c>
  401429: 48 89 c7                     	movq	%rax, %rdi
  40142c: e8 8b ff ff ff               	callq	-117 <blank_line>
  401431: 85 c0                        	testl	%eax, %eax
  401433: 75 c5                        	jne	-59 <skip+0x1>
  401435: 48 89 d8                     	movq	%rbx, %rax
  401438: 5b                           	popq	%rbx
  401439: c3                           	retq

000000000040143a explode_bomb:
  40143a: 48 83 ec 08                  	subq	$8, %rsp
  40143e: bf a3 25 40 00               	movl	$4203939, %edi
  401443: e8 c8 f6 ff ff               	callq	-2360 <puts@plt>
  401448: bf ac 25 40 00               	movl	$4203948, %edi
  40144d: e8 be f6 ff ff               	callq	-2370 <puts@plt>
  401452: bf 08 00 00 00               	movl	$8, %edi
  401457: e8 c4 f7 ff ff               	callq	-2108 <exit@plt>

000000000040145c read_six_numbers:
  40145c: 48 83 ec 18                  	subq	$24, %rsp
  401460: 48 89 f2                     	movq	%rsi, %rdx
  401463: 48 8d 4e 04                  	leaq	4(%rsi), %rcx
  401467: 48 8d 46 14                  	leaq	20(%rsi), %rax
  40146b: 48 89 44 24 08               	movq	%rax, 8(%rsp)
  401470: 48 8d 46 10                  	leaq	16(%rsi), %rax
  401474: 48 89 04 24                  	movq	%rax, (%rsp)
  401478: 4c 8d 4e 0c                  	leaq	12(%rsi), %r9
  40147c: 4c 8d 46 08                  	leaq	8(%rsi), %r8
  401480: be c3 25 40 00               	movl	$4203971, %esi
  401485: b8 00 00 00 00               	movl	$0, %eax
  40148a: e8 61 f7 ff ff               	callq	-2207 <__isoc99_sscanf@plt>
  40148f: 83 f8 05                     	cmpl	$5, %eax
  401492: 7f 05                        	jg	5 <read_six_numbers+0x3d>
  401494: e8 a1 ff ff ff               	callq	-95 <explode_bomb>
  401499: 48 83 c4 18                  	addq	$24, %rsp
  40149d: c3                           	retq

000000000040149e read_line:
  40149e: 48 83 ec 08                  	subq	$8, %rsp
  4014a2: b8 00 00 00 00               	movl	$0, %eax
  4014a7: e8 4d ff ff ff               	callq	-179 <skip>
  4014ac: 48 85 c0                     	testq	%rax, %rax
  4014af: 75 6e                        	jne	110 <read_line+0x81>
  4014b1: 48 8b 05 90 22 20 00         	movq	2106000(%rip), %rax
  4014b8: 48 39 05 a9 22 20 00         	cmpq	%rax, 2106025(%rip)
  4014bf: 75 14                        	jne	20 <read_line+0x37>
  4014c1: bf d5 25 40 00               	movl	$4203989, %edi
  4014c6: e8 45 f6 ff ff               	callq	-2491 <puts@plt>
  4014cb: bf 08 00 00 00               	movl	$8, %edi
  4014d0: e8 4b f7 ff ff               	callq	-2229 <exit@plt>
  4014d5: bf f3 25 40 00               	movl	$4204019, %edi
  4014da: e8 01 f6 ff ff               	callq	-2559 <getenv@plt>
  4014df: 48 85 c0                     	testq	%rax, %rax
  4014e2: 74 0a                        	je	10 <read_line+0x50>
  4014e4: bf 00 00 00 00               	movl	$0, %edi
  4014e9: e8 32 f7 ff ff               	callq	-2254 <exit@plt>
  4014ee: 48 8b 05 53 22 20 00         	movq	2105939(%rip), %rax
  4014f5: 48 89 05 6c 22 20 00         	movq	%rax, 2105964(%rip)
  4014fc: b8 00 00 00 00               	movl	$0, %eax
  401501: e8 f3 fe ff ff               	callq	-269 <skip>
  401506: 48 85 c0                     	testq	%rax, %rax
  401509: 75 14                        	jne	20 <read_line+0x81>
  40150b: bf d5 25 40 00               	movl	$4203989, %edi
  401510: e8 fb f5 ff ff               	callq	-2565 <puts@plt>
  401515: bf 00 00 00 00               	movl	$0, %edi
  40151a: e8 01 f7 ff ff               	callq	-2303 <exit@plt>
  40151f: 8b 15 3b 22 20 00            	movl	2105915(%rip), %edx
  401525: 48 63 c2                     	movslq	%edx, %rax
  401528: 48 8d 34 80                  	leaq	(%rax,%rax,4), %rsi
  40152c: 48 c1 e6 04                  	shlq	$4, %rsi
  401530: 48 81 c6 80 37 60 00         	addq	$6305664, %rsi
  401537: 48 89 f7                     	movq	%rsi, %rdi
  40153a: b8 00 00 00 00               	movl	$0, %eax
  40153f: 48 c7 c1 ff ff ff ff         	movq	$-1, %rcx
  401546: f2 ae                        	repne		scasb	%es:(%rdi), %al
  401548: 48 f7 d1                     	notq	%rcx
  40154b: 48 83 e9 01                  	subq	$1, %rcx
  40154f: 83 f9 4e                     	cmpl	$78, %ecx
  401552: 7e 46                        	jle	70 <read_line+0xfc>
  401554: bf fe 25 40 00               	movl	$4204030, %edi
  401559: e8 b2 f5 ff ff               	callq	-2638 <puts@plt>
  40155e: 8b 05 fc 21 20 00            	movl	2105852(%rip), %eax
  401564: 8d 50 01                     	leal	1(%rax), %edx
  401567: 89 15 f3 21 20 00            	movl	%edx, 2105843(%rip)
  40156d: 48 98                        	cltq
  40156f: 48 6b c0 50                  	imulq	$80, %rax, %rax
  401573: 48 bf 2a 2a 2a 74 72 75 6e 63	movabsq	$7164793191628679722, %rdi
  40157d: 48 89 b8 80 37 60 00         	movq	%rdi, 6305664(%rax)
  401584: 48 bf 61 74 65 64 2a 2a 2a 00	movabsq	$11868310583211105, %rdi
  40158e: 48 89 b8 88 37 60 00         	movq	%rdi, 6305672(%rax)
  401595: e8 a0 fe ff ff               	callq	-352 <explode_bomb>
  40159a: 83 e9 01                     	subl	$1, %ecx
  40159d: 48 63 c9                     	movslq	%ecx, %rcx
  4015a0: 48 63 c2                     	movslq	%edx, %rax
  4015a3: 48 8d 04 80                  	leaq	(%rax,%rax,4), %rax
  4015a7: 48 c1 e0 04                  	shlq	$4, %rax
  4015ab: c6 84 01 80 37 60 00 00      	movb	$0, 6305664(%rcx,%rax)
  4015b3: 83 c2 01                     	addl	$1, %edx
  4015b6: 89 15 a4 21 20 00            	movl	%edx, 2105764(%rip)
  4015bc: 48 89 f0                     	movq	%rsi, %rax
  4015bf: 48 83 c4 08                  	addq	$8, %rsp
  4015c3: c3                           	retq

00000000004015c4 phase_defused:
  4015c4: 48 83 ec 78                  	subq	$120, %rsp
  4015c8: 64 48 8b 04 25 28 00 00 00   	movq	%fs:40, %rax
  4015d1: 48 89 44 24 68               	movq	%rax, 104(%rsp)
  4015d6: 31 c0                        	xorl	%eax, %eax
  4015d8: 83 3d 81 21 20 00 06         	cmpl	$6, 2105729(%rip)
  4015df: 75 5e                        	jne	94 <phase_defused+0x7b>
  4015e1: 4c 8d 44 24 10               	leaq	16(%rsp), %r8
  4015e6: 48 8d 4c 24 0c               	leaq	12(%rsp), %rcx
  4015eb: 48 8d 54 24 08               	leaq	8(%rsp), %rdx
  4015f0: be 19 26 40 00               	movl	$4204057, %esi
  4015f5: bf 70 38 60 00               	movl	$6305904, %edi
  4015fa: e8 f1 f5 ff ff               	callq	-2575 <__isoc99_sscanf@plt>
  4015ff: 83 f8 03                     	cmpl	$3, %eax
  401602: 75 31                        	jne	49 <phase_defused+0x71>
  401604: be 22 26 40 00               	movl	$4204066, %esi
  401609: 48 8d 7c 24 10               	leaq	16(%rsp), %rdi
  40160e: e8 25 fd ff ff               	callq	-731 <strings_not_equal>
  401613: 85 c0                        	testl	%eax, %eax
  401615: 75 1e                        	jne	30 <phase_defused+0x71>
  401617: bf f8 24 40 00               	movl	$4203768, %edi
  40161c: e8 ef f4 ff ff               	callq	-2833 <puts@plt>
  401621: bf 20 25 40 00               	movl	$4203808, %edi
  401626: e8 e5 f4 ff ff               	callq	-2843 <puts@plt>
  40162b: b8 00 00 00 00               	movl	$0, %eax
  401630: e8 0d fc ff ff               	callq	-1011 <secret_phase>
  401635: bf 58 25 40 00               	movl	$4203864, %edi
  40163a: e8 d1 f4 ff ff               	callq	-2863 <puts@plt>
  40163f: 48 8b 44 24 68               	movq	104(%rsp), %rax
  401644: 64 48 33 04 25 28 00 00 00   	xorq	%fs:40, %rax
  40164d: 74 05                        	je	5 <phase_defused+0x90>
  40164f: e8 dc f4 ff ff               	callq	-2852 <__stack_chk_fail@plt>
  401654: 48 83 c4 78                  	addq	$120, %rsp
  401658: c3                           	retq
  401659: 90                           	nop
  40165a: 90                           	nop
  40165b: 90                           	nop
  40165c: 90                           	nop
  40165d: 90                           	nop
  40165e: 90                           	nop
  40165f: 90                           	nop

0000000000401660 sigalrm_handler:
  401660: 48 83 ec 08                  	subq	$8, %rsp
  401664: b9 00 00 00 00               	movl	$0, %ecx
  401669: ba 78 26 40 00               	movl	$4204152, %edx
  40166e: be 01 00 00 00               	movl	$1, %esi
  401673: 48 8b 3d d6 20 20 00         	movq	2105558(%rip), %rdi
  40167a: b8 00 00 00 00               	movl	$0, %eax
  40167f: e8 bc f5 ff ff               	callq	-2628 <__fprintf_chk@plt>
  401684: bf 01 00 00 00               	movl	$1, %edi
  401689: e8 92 f5 ff ff               	callq	-2670 <exit@plt>

000000000040168e rio_readlineb:
  40168e: 41 57                        	pushq	%r15
  401690: 41 56                        	pushq	%r14
  401692: 41 55                        	pushq	%r13
  401694: 41 54                        	pushq	%r12
  401696: 55                           	pushq	%rbp
  401697: 53                           	pushq	%rbx
  401698: 48 83 ec 38                  	subq	$56, %rsp
  40169c: 49 89 f6                     	movq	%rsi, %r14
  40169f: 48 89 54 24 18               	movq	%rdx, 24(%rsp)
  4016a4: 48 83 fa 01                  	cmpq	$1, %rdx
  4016a8: 0f 86 c9 00 00 00            	jbe	201 <rio_readlineb+0xe9>
  4016ae: 48 89 fb                     	movq	%rdi, %rbx
  4016b1: 41 bd 01 00 00 00            	movl	$1, %r13d
  4016b7: 4c 8d 67 10                  	leaq	16(%rdi), %r12
  4016bb: eb 30                        	jmp	48 <rio_readlineb+0x5f>
  4016bd: ba 00 20 00 00               	movl	$8192, %edx
  4016c2: 4c 89 e6                     	movq	%r12, %rsi
  4016c5: 8b 3b                        	movl	(%rbx), %edi
  4016c7: e8 94 f4 ff ff               	callq	-2924 <read@plt>
  4016cc: 89 43 04                     	movl	%eax, 4(%rbx)
  4016cf: 85 c0                        	testl	%eax, %eax
  4016d1: 79 12                        	jns	18 <rio_readlineb+0x57>
  4016d3: e8 18 f4 ff ff               	callq	-3048 <__errno_location@plt>
  4016d8: 83 38 04                     	cmpl	$4, (%rax)
  4016db: 74 10                        	je	16 <rio_readlineb+0x5f>
  4016dd: 0f 1f 00                     	nopl	(%rax)
  4016e0: e9 a1 00 00 00               	jmp	161 <rio_readlineb+0xf8>
  4016e5: 85 c0                        	testl	%eax, %eax
  4016e7: 74 71                        	je	113 <rio_readlineb+0xcc>
  4016e9: 4c 89 63 08                  	movq	%r12, 8(%rbx)
  4016ed: 8b 6b 04                     	movl	4(%rbx), %ebp
  4016f0: 85 ed                        	testl	%ebp, %ebp
  4016f2: 7e c9                        	jle	-55 <rio_readlineb+0x2f>
  4016f4: 85 ed                        	testl	%ebp, %ebp
  4016f6: 41 0f 95 c7                  	setne	%r15b
  4016fa: 41 0f b6 c7                  	movzbl	%r15b, %eax
  4016fe: 89 44 24 0c                  	movl	%eax, 12(%rsp)
  401702: 45 0f b6 ff                  	movzbl	%r15b, %r15d
  401706: 48 8b 4b 08                  	movq	8(%rbx), %rcx
  40170a: 48 89 ce                     	movq	%rcx, %rsi
  40170d: b9 01 00 00 00               	movl	$1, %ecx
  401712: 4c 89 fa                     	movq	%r15, %rdx
  401715: 48 89 74 24 10               	movq	%rsi, 16(%rsp)
  40171a: 48 8d 7c 24 2f               	leaq	47(%rsp), %rdi
  40171f: e8 9c f4 ff ff               	callq	-2916 <__memcpy_chk@plt>
  401724: 4c 03 7c 24 10               	addq	16(%rsp), %r15
  401729: 4c 89 7b 08                  	movq	%r15, 8(%rbx)
  40172d: 8b 44 24 0c                  	movl	12(%rsp), %eax
  401731: 29 c5                        	subl	%eax, %ebp
  401733: 89 6b 04                     	movl	%ebp, 4(%rbx)
  401736: 83 f8 01                     	cmpl	$1, %eax
  401739: 75 13                        	jne	19 <rio_readlineb+0xc0>
  40173b: 49 83 c6 01                  	addq	$1, %r14
  40173f: 0f b6 44 24 2f               	movzbl	47(%rsp), %eax
  401744: 41 88 46 ff                  	movb	%al, -1(%r14)
  401748: 3c 0a                        	cmpb	$10, %al
  40174a: 75 18                        	jne	24 <rio_readlineb+0xd6>
  40174c: eb 2f                        	jmp	47 <rio_readlineb+0xef>
  40174e: 83 7c 24 0c 00               	cmpl	$0, 12(%rsp)
  401753: 75 3a                        	jne	58 <rio_readlineb+0x101>
  401755: 44 89 e8                     	movl	%r13d, %eax
  401758: eb 03                        	jmp	3 <rio_readlineb+0xcf>
  40175a: 44 89 e8                     	movl	%r13d, %eax
  40175d: 83 f8 01                     	cmpl	$1, %eax
  401760: 75 1b                        	jne	27 <rio_readlineb+0xef>
  401762: eb 34                        	jmp	52 <rio_readlineb+0x10a>
  401764: 41 83 c5 01                  	addl	$1, %r13d
  401768: 49 63 c5                     	movslq	%r13d, %rax
  40176b: 48 3b 44 24 18               	cmpq	24(%rsp), %rax
  401770: 73 0b                        	jae	11 <rio_readlineb+0xef>
  401772: e9 76 ff ff ff               	jmp	-138 <rio_readlineb+0x5f>
  401777: 41 bd 01 00 00 00            	movl	$1, %r13d
  40177d: 41 c6 06 00                  	movb	$0, (%r14)
  401781: 49 63 c5                     	movslq	%r13d, %rax
  401784: eb 17                        	jmp	23 <rio_readlineb+0x10f>
  401786: 48 c7 c0 ff ff ff ff         	movq	$-1, %rax
  40178d: eb 0e                        	jmp	14 <rio_readlineb+0x10f>
  40178f: 48 c7 c0 ff ff ff ff         	movq	$-1, %rax
  401796: eb 05                        	jmp	5 <rio_readlineb+0x10f>
  401798: b8 00 00 00 00               	movl	$0, %eax
  40179d: 48 83 c4 38                  	addq	$56, %rsp
  4017a1: 5b                           	popq	%rbx
  4017a2: 5d                           	popq	%rbp
  4017a3: 41 5c                        	popq	%r12
  4017a5: 41 5d                        	popq	%r13
  4017a7: 41 5e                        	popq	%r14
  4017a9: 41 5f                        	popq	%r15
  4017ab: c3                           	retq

00000000004017ac submitr:
  4017ac: 41 57                        	pushq	%r15
  4017ae: 41 56                        	pushq	%r14
  4017b0: 41 55                        	pushq	%r13
  4017b2: 41 54                        	pushq	%r12
  4017b4: 55                           	pushq	%rbp
  4017b5: 53                           	pushq	%rbx
  4017b6: 48 81 ec 68 a0 00 00         	subq	$41064, %rsp
  4017bd: 48 89 fd                     	movq	%rdi, %rbp
  4017c0: 41 89 f5                     	movl	%esi, %r13d
  4017c3: 48 89 54 24 10               	movq	%rdx, 16(%rsp)
  4017c8: 48 89 4c 24 18               	movq	%rcx, 24(%rsp)
  4017cd: 4d 89 c7                     	movq	%r8, %r15
  4017d0: 4c 89 cb                     	movq	%r9, %rbx
  4017d3: 4c 8b b4 24 a0 a0 00 00      	movq	41120(%rsp), %r14
  4017db: 64 48 8b 04 25 28 00 00 00   	movq	%fs:40, %rax
  4017e4: 48 89 84 24 58 a0 00 00      	movq	%rax, 41048(%rsp)
  4017ec: 31 c0                        	xorl	%eax, %eax
  4017ee: c7 44 24 2c 00 00 00 00      	movl	$0, 44(%rsp)
  4017f6: ba 00 00 00 00               	movl	$0, %edx
  4017fb: be 01 00 00 00               	movl	$1, %esi
  401800: bf 02 00 00 00               	movl	$2, %edi
  401805: e8 76 f4 ff ff               	callq	-2954 <socket@plt>
  40180a: 41 89 c4                     	movl	%eax, %r12d
  40180d: 85 c0                        	testl	%eax, %eax
  40180f: 79 50                        	jns	80 <submitr+0xb5>
  401811: 48 b8 45 72 72 6f 72 3a 20 43	movabsq	$4836930262966366789, %rax
  40181b: 49 89 06                     	movq	%rax, (%r14)
  40181e: 48 b8 6c 69 65 6e 74 20 75 6e	movabsq	$7959303600887654764, %rax
  401828: 49 89 46 08                  	movq	%rax, 8(%r14)
  40182c: 48 b8 61 62 6c 65 20 74 6f 20	movabsq	$2337214414117954145, %rax
  401836: 49 89 46 10                  	movq	%rax, 16(%r14)
  40183a: 48 b8 63 72 65 61 74 65 20 73	movabsq	$8295742064141103715, %rax
  401844: 49 89 46 18                  	movq	%rax, 24(%r14)
  401848: 41 c7 46 20 6f 63 6b 65      	movl	$1701536623, 32(%r14)
  401850: 66 41 c7 46 24 74 00         	movw	$116, 36(%r14)
  401857: b8 ff ff ff ff               	movl	$4294967295, %eax
  40185c: e9 07 06 00 00               	jmp	1543 <submitr+0x6bc>
  401861: 48 89 ef                     	movq	%rbp, %rdi
  401864: e8 37 f3 ff ff               	callq	-3273 <gethostbyname@plt>
  401869: 48 85 c0                     	testq	%rax, %rax
  40186c: 75 6b                        	jne	107 <submitr+0x12d>
  40186e: 48 b8 45 72 72 6f 72 3a 20 44	movabsq	$4908987857004294725, %rax
  401878: 49 89 06                     	movq	%rax, (%r14)
  40187b: 48 b8 4e 53 20 69 73 20 75 6e	movabsq	$7959303596504273742, %rax
  401885: 49 89 46 08                  	movq	%rax, 8(%r14)
  401889: 48 b8 61 62 6c 65 20 74 6f 20	movabsq	$2337214414117954145, %rax
  401893: 49 89 46 10                  	movq	%rax, 16(%r14)
  401897: 48 b8 72 65 73 6f 6c 76 65 20	movabsq	$2334402189959849330, %rax
  4018a1: 49 89 46 18                  	movq	%rax, 24(%r14)
  4018a5: 48 b8 73 65 72 76 65 72 20 61	movabsq	$6998719601038222707, %rax
  4018af: 49 89 46 20                  	movq	%rax, 32(%r14)
  4018b3: 41 c7 46 28 64 64 72 65      	movl	$1701995620, 40(%r14)
  4018bb: 66 41 c7 46 2c 73 73         	movw	$29555, 44(%r14)
  4018c2: 41 c6 46 2e 00               	movb	$0, 46(%r14)
  4018c7: 44 89 e7                     	movl	%r12d, %edi
  4018ca: e8 81 f2 ff ff               	callq	-3455 <close@plt>
  4018cf: b8 ff ff ff ff               	movl	$4294967295, %eax
  4018d4: e9 8f 05 00 00               	jmp	1423 <submitr+0x6bc>
  4018d9: 48 c7 44 24 30 00 00 00 00   	movq	$0, 48(%rsp)
  4018e2: 48 c7 44 24 38 00 00 00 00   	movq	$0, 56(%rsp)
  4018eb: 66 c7 44 24 30 02 00         	movw	$2, 48(%rsp)
  4018f2: 48 63 50 14                  	movslq	20(%rax), %rdx
  4018f6: 48 8b 40 18                  	movq	24(%rax), %rax
  4018fa: 48 8d 7c 24 34               	leaq	52(%rsp), %rdi
  4018ff: b9 0c 00 00 00               	movl	$12, %ecx
  401904: 48 8b 30                     	movq	(%rax), %rsi
  401907: e8 a4 f2 ff ff               	callq	-3420 <__memmove_chk@plt>
  40190c: 66 41 c1 cd 08               	rorw	$8, %r13w
  401911: 66 44 89 6c 24 32            	movw	%r13w, 50(%rsp)
  401917: ba 10 00 00 00               	movl	$16, %edx
  40191c: 48 8d 74 24 30               	leaq	48(%rsp), %rsi
  401921: 44 89 e7                     	movl	%r12d, %edi
  401924: e8 07 f3 ff ff               	callq	-3321 <connect@plt>
  401929: 85 c0                        	testl	%eax, %eax
  40192b: 79 5d                        	jns	93 <submitr+0x1de>
  40192d: 48 b8 45 72 72 6f 72 3a 20 55	movabsq	$6133966955649069637, %rax
  401937: 49 89 06                     	movq	%rax, (%r14)
  40193a: 48 b8 6e 61 62 6c 65 20 74 6f	movabsq	$8031079655490609518, %rax
  401944: 49 89 46 08                  	movq	%rax, 8(%r14)
  401948: 48 b8 20 63 6f 6e 6e 65 63 74	movabsq	$8386658456067597088, %rax
  401952: 49 89 46 10                  	movq	%rax, 16(%r14)
  401956: 48 b8 20 74 6f 20 74 68 65 20	movabsq	$2334386829831140384, %rax
  401960: 49 89 46 18                  	movq	%rax, 24(%r14)
  401964: 41 c7 46 20 73 65 72 76      	movl	$1987208563, 32(%r14)
  40196c: 66 41 c7 46 24 65 72         	movw	$29285, 36(%r14)
  401973: 41 c6 46 26 00               	movb	$0, 38(%r14)
  401978: 44 89 e7                     	movl	%r12d, %edi
  40197b: e8 d0 f1 ff ff               	callq	-3632 <close@plt>
  401980: b8 ff ff ff ff               	movl	$4294967295, %eax
  401985: e9 de 04 00 00               	jmp	1246 <submitr+0x6bc>
  40198a: 48 c7 c2 ff ff ff ff         	movq	$-1, %rdx
  401991: 48 89 df                     	movq	%rbx, %rdi
  401994: b8 00 00 00 00               	movl	$0, %eax
  401999: 48 89 d1                     	movq	%rdx, %rcx
  40199c: f2 ae                        	repne		scasb	%es:(%rdi), %al
  40199e: 48 f7 d1                     	notq	%rcx
  4019a1: 48 89 ce                     	movq	%rcx, %rsi
  4019a4: 48 8b 7c 24 10               	movq	16(%rsp), %rdi
  4019a9: 48 89 d1                     	movq	%rdx, %rcx
  4019ac: f2 ae                        	repne		scasb	%es:(%rdi), %al
  4019ae: 49 89 c8                     	movq	%rcx, %r8
  4019b1: 48 8b 7c 24 18               	movq	24(%rsp), %rdi
  4019b6: 48 89 d1                     	movq	%rdx, %rcx
  4019b9: f2 ae                        	repne		scasb	%es:(%rdi), %al
  4019bb: 48 f7 d1                     	notq	%rcx
  4019be: 49 89 c9                     	movq	%rcx, %r9
  4019c1: 4c 89 ff                     	movq	%r15, %rdi
  4019c4: 48 89 d1                     	movq	%rdx, %rcx
  4019c7: f2 ae                        	repne		scasb	%es:(%rdi), %al
  4019c9: 4d 29 c1                     	subq	%r8, %r9
  4019cc: 49 29 c9                     	subq	%rcx, %r9
  4019cf: 48 8d 44 76 fd               	leaq	-3(%rsi,%rsi,2), %rax
  4019d4: 49 8d 44 01 7b               	leaq	123(%r9,%rax), %rax
  4019d9: 48 3d 00 20 00 00            	cmpq	$8192, %rax
  4019df: 76 73                        	jbe	115 <submitr+0x2a8>
  4019e1: 48 b8 45 72 72 6f 72 3a 20 52	movabsq	$5917794173535285829, %rax
  4019eb: 49 89 06                     	movq	%rax, (%r14)
  4019ee: 48 b8 65 73 75 6c 74 20 73 74	movabsq	$8391086215129297765, %rax
  4019f8: 49 89 46 08                  	movq	%rax, 8(%r14)
  4019fc: 48 b8 72 69 6e 67 20 74 6f 6f	movabsq	$8029764343147948402, %rax
  401a06: 49 89 46 10                  	movq	%rax, 16(%r14)
  401a0a: 48 b8 20 6c 61 72 67 65 2e 20	movabsq	$2318902353117408288, %rax
  401a14: 49 89 46 18                  	movq	%rax, 24(%r14)
  401a18: 48 b8 49 6e 63 72 65 61 73 65	movabsq	$7310293708491157065, %rax
  401a22: 49 89 46 20                  	movq	%rax, 32(%r14)
  401a26: 48 b8 20 53 55 42 4d 49 54 52	movabsq	$5932447205327983392, %rax
  401a30: 49 89 46 28                  	movq	%rax, 40(%r14)
  401a34: 48 b8 5f 4d 41 58 42 55 46 00	movabsq	$19796991806623071, %rax
  401a3e: 49 89 46 30                  	movq	%rax, 48(%r14)
  401a42: 44 89 e7                     	movl	%r12d, %edi
  401a45: e8 06 f1 ff ff               	callq	-3834 <close@plt>
  401a4a: b8 ff ff ff ff               	movl	$4294967295, %eax
  401a4f: e9 14 04 00 00               	jmp	1044 <submitr+0x6bc>
  401a54: 48 8d 94 24 40 20 00 00      	leaq	8256(%rsp), %rdx
  401a5c: b9 00 04 00 00               	movl	$1024, %ecx
  401a61: b8 00 00 00 00               	movl	$0, %eax
  401a66: 48 89 d7                     	movq	%rdx, %rdi
  401a69: f3 48 ab                     	rep		stosq	%rax, %es:(%rdi)
  401a6c: 48 89 df                     	movq	%rbx, %rdi
  401a6f: 48 c7 c1 ff ff ff ff         	movq	$-1, %rcx
  401a76: f2 ae                        	repne		scasb	%es:(%rdi), %al
  401a78: 48 f7 d1                     	notq	%rcx
  401a7b: 48 83 e9 01                  	subq	$1, %rcx
  401a7f: 85 c9                        	testl	%ecx, %ecx
  401a81: 0f 84 fd 03 00 00            	je	1021 <submitr+0x6d8>
  401a87: 83 e9 01                     	subl	$1, %ecx
  401a8a: 4c 8d 6c 0b 01               	leaq	1(%rbx,%rcx), %r13
  401a8f: 48 89 d5                     	movq	%rdx, %rbp
  401a92: 44 0f b6 03                  	movzbl	(%rbx), %r8d
  401a96: 41 80 f8 2a                  	cmpb	$42, %r8b
  401a9a: 74 23                        	je	35 <submitr+0x313>
  401a9c: 41 8d 40 d3                  	leal	-45(%r8), %eax
  401aa0: 3c 01                        	cmpb	$1, %al
  401aa2: 76 1b                        	jbe	27 <submitr+0x313>
  401aa4: 41 80 f8 5f                  	cmpb	$95, %r8b
  401aa8: 74 15                        	je	21 <submitr+0x313>
  401aaa: 41 8d 40 d0                  	leal	-48(%r8), %eax
  401aae: 3c 09                        	cmpb	$9, %al
  401ab0: 76 0d                        	jbe	13 <submitr+0x313>
  401ab2: 44 89 c0                     	movl	%r8d, %eax
  401ab5: 83 e0 df                     	andl	$-33, %eax
  401ab8: 83 e8 41                     	subl	$65, %eax
  401abb: 3c 19                        	cmpb	$25, %al
  401abd: 77 0a                        	ja	10 <submitr+0x31d>
  401abf: 48 8d 45 01                  	leaq	1(%rbp), %rax
  401ac3: 44 88 45 00                  	movb	%r8b, (%rbp)
  401ac7: eb 6c                        	jmp	108 <submitr+0x389>
  401ac9: 41 80 f8 20                  	cmpb	$32, %r8b
  401acd: 75 0a                        	jne	10 <submitr+0x32d>
  401acf: 48 8d 45 01                  	leaq	1(%rbp), %rax
  401ad3: c6 45 00 2b                  	movb	$43, (%rbp)
  401ad7: eb 5c                        	jmp	92 <submitr+0x389>
  401ad9: 41 8d 40 e0                  	leal	-32(%r8), %eax
  401add: 3c 5f                        	cmpb	$95, %al
  401adf: 76 0a                        	jbe	10 <submitr+0x33f>
  401ae1: 41 80 f8 09                  	cmpb	$9, %r8b
  401ae5: 0f 85 02 04 00 00            	jne	1026 <submitr+0x741>
  401aeb: 45 0f b6 c0                  	movzbl	%r8b, %r8d
  401aef: b9 48 27 40 00               	movl	$4204360, %ecx
  401af4: ba 08 00 00 00               	movl	$8, %edx
  401af9: be 01 00 00 00               	movl	$1, %esi
  401afe: 48 8d bc 24 40 80 00 00      	leaq	32832(%rsp), %rdi
  401b06: b8 00 00 00 00               	movl	$0, %eax
  401b0b: e8 60 f1 ff ff               	callq	-3744 <__sprintf_chk@plt>
  401b10: 0f b6 84 24 40 80 00 00      	movzbl	32832(%rsp), %eax
  401b18: 88 45 00                     	movb	%al, (%rbp)
  401b1b: 0f b6 84 24 41 80 00 00      	movzbl	32833(%rsp), %eax
  401b23: 88 45 01                     	movb	%al, 1(%rbp)
  401b26: 48 8d 45 03                  	leaq	3(%rbp), %rax
  401b2a: 0f b6 94 24 42 80 00 00      	movzbl	32834(%rsp), %edx
  401b32: 88 55 02                     	movb	%dl, 2(%rbp)
  401b35: 48 83 c3 01                  	addq	$1, %rbx
  401b39: 4c 39 eb                     	cmpq	%r13, %rbx
  401b3c: 0f 84 42 03 00 00            	je	834 <submitr+0x6d8>
  401b42: 48 89 c5                     	movq	%rax, %rbp
  401b45: e9 48 ff ff ff               	jmp	-184 <submitr+0x2e6>
  401b4a: 48 89 da                     	movq	%rbx, %rdx
  401b4d: 48 89 ee                     	movq	%rbp, %rsi
  401b50: 44 89 e7                     	movl	%r12d, %edi
  401b53: e8 c8 ef ff ff               	callq	-4152 <write@plt>
  401b58: 48 85 c0                     	testq	%rax, %rax
  401b5b: 7f 0f                        	jg	15 <submitr+0x3c0>
  401b5d: e8 8e ef ff ff               	callq	-4210 <__errno_location@plt>
  401b62: 83 38 04                     	cmpl	$4, (%rax)
  401b65: 75 12                        	jne	18 <submitr+0x3cd>
  401b67: b8 00 00 00 00               	movl	$0, %eax
  401b6c: 48 01 c5                     	addq	%rax, %rbp
  401b6f: 48 29 c3                     	subq	%rax, %rbx
  401b72: 75 d6                        	jne	-42 <submitr+0x39e>
  401b74: 4d 85 ed                     	testq	%r13, %r13
  401b77: 79 5f                        	jns	95 <submitr+0x42c>
  401b79: 48 b8 45 72 72 6f 72 3a 20 43	movabsq	$4836930262966366789, %rax
  401b83: 49 89 06                     	movq	%rax, (%r14)
  401b86: 48 b8 6c 69 65 6e 74 20 75 6e	movabsq	$7959303600887654764, %rax
  401b90: 49 89 46 08                  	movq	%rax, 8(%r14)
  401b94: 48 b8 61 62 6c 65 20 74 6f 20	movabsq	$2337214414117954145, %rax
  401b9e: 49 89 46 10                  	movq	%rax, 16(%r14)
  401ba2: 48 b8 77 72 69 74 65 20 74 6f	movabsq	$8031079655625290359, %rax
  401bac: 49 89 46 18                  	movq	%rax, 24(%r14)
  401bb0: 48 b8 20 74 68 65 20 73 65 72	movabsq	$8243121275949052960, %rax
  401bba: 49 89 46 20                  	movq	%rax, 32(%r14)
  401bbe: 41 c7 46 28 76 65 72 00      	movl	$7497078, 40(%r14)
  401bc6: 44 89 e7                     	movl	%r12d, %edi
  401bc9: e8 82 ef ff ff               	callq	-4222 <close@plt>
  401bce: b8 ff ff ff ff               	movl	$4294967295, %eax
  401bd3: e9 90 02 00 00               	jmp	656 <submitr+0x6bc>
  401bd8: 44 89 a4 24 40 80 00 00      	movl	%r12d, 32832(%rsp)
  401be0: c7 84 24 44 80 00 00 00 00 00 00     	movl	$0, 32836(%rsp)
  401beb: 48 8d 84 24 50 80 00 00      	leaq	32848(%rsp), %rax
  401bf3: 48 89 84 24 48 80 00 00      	movq	%rax, 32840(%rsp)
  401bfb: ba 00 20 00 00               	movl	$8192, %edx
  401c00: 48 8d 74 24 40               	leaq	64(%rsp), %rsi
  401c05: 48 8d bc 24 40 80 00 00      	leaq	32832(%rsp), %rdi
  401c0d: e8 7c fa ff ff               	callq	-1412 <rio_readlineb>
  401c12: 48 85 c0                     	testq	%rax, %rax
  401c15: 7f 74                        	jg	116 <submitr+0x4df>
  401c17: 48 b8 45 72 72 6f 72 3a 20 43	movabsq	$4836930262966366789, %rax
  401c21: 49 89 06                     	movq	%rax, (%r14)
  401c24: 48 b8 6c 69 65 6e 74 20 75 6e	movabsq	$7959303600887654764, %rax
  401c2e: 49 89 46 08                  	movq	%rax, 8(%r14)
  401c32: 48 b8 61 62 6c 65 20 74 6f 20	movabsq	$2337214414117954145, %rax
  401c3c: 49 89 46 10                  	movq	%rax, 16(%r14)
  401c40: 48 b8 72 65 61 64 20 66 69 72	movabsq	$8244232882187494770, %rax
  401c4a: 49 89 46 18                  	movq	%rax, 24(%r14)
  401c4e: 48 b8 73 74 20 68 65 61 64 65	movabsq	$7306071583668335731, %rax
  401c58: 49 89 46 20                  	movq	%rax, 32(%r14)
  401c5c: 48 b8 72 20 66 72 6f 6d 20 73	movabsq	$8295750839044546674, %rax
  401c66: 49 89 46 28                  	movq	%rax, 40(%r14)
  401c6a: 41 c7 46 30 65 72 76 65      	movl	$1702261349, 48(%r14)
  401c72: 66 41 c7 46 34 72 00         	movw	$114, 52(%r14)
  401c79: 44 89 e7                     	movl	%r12d, %edi
  401c7c: e8 cf ee ff ff               	callq	-4401 <close@plt>
  401c81: b8 ff ff ff ff               	movl	$4294967295, %eax
  401c86: e9 dd 01 00 00               	jmp	477 <submitr+0x6bc>
  401c8b: 4c 8d 84 24 40 60 00 00      	leaq	24640(%rsp), %r8
  401c93: 48 8d 4c 24 2c               	leaq	44(%rsp), %rcx
  401c98: 48 8d 94 24 40 40 00 00      	leaq	16448(%rsp), %rdx
  401ca0: be 4f 27 40 00               	movl	$4204367, %esi
  401ca5: 48 8d 7c 24 40               	leaq	64(%rsp), %rdi
  401caa: b8 00 00 00 00               	movl	$0, %eax
  401caf: e8 3c ef ff ff               	callq	-4292 <__isoc99_sscanf@plt>
  401cb4: 44 8b 44 24 2c               	movl	44(%rsp), %r8d
  401cb9: 41 81 f8 c8 00 00 00         	cmpl	$200, %r8d
  401cc0: 0f 84 be 00 00 00            	je	190 <submitr+0x5d8>
  401cc6: 4c 8d 8c 24 40 60 00 00      	leaq	24640(%rsp), %r9
  401cce: b9 a0 26 40 00               	movl	$4204192, %ecx
  401cd3: 48 c7 c2 ff ff ff ff         	movq	$-1, %rdx
  401cda: be 01 00 00 00               	movl	$1, %esi
  401cdf: 4c 89 f7                     	movq	%r14, %rdi
  401ce2: b8 00 00 00 00               	movl	$0, %eax
  401ce7: e8 84 ef ff ff               	callq	-4220 <__sprintf_chk@plt>
  401cec: 44 89 e7                     	movl	%r12d, %edi
  401cef: e8 5c ee ff ff               	callq	-4516 <close@plt>
  401cf4: b8 ff ff ff ff               	movl	$4294967295, %eax
  401cf9: e9 6a 01 00 00               	jmp	362 <submitr+0x6bc>
  401cfe: ba 00 20 00 00               	movl	$8192, %edx
  401d03: 48 8d 74 24 40               	leaq	64(%rsp), %rsi
  401d08: 48 8d bc 24 40 80 00 00      	leaq	32832(%rsp), %rdi
  401d10: e8 79 f9 ff ff               	callq	-1671 <rio_readlineb>
  401d15: 48 85 c0                     	testq	%rax, %rax
  401d18: 7f 6a                        	jg	106 <submitr+0x5d8>
  401d1a: 48 b8 45 72 72 6f 72 3a 20 43	movabsq	$4836930262966366789, %rax
  401d24: 49 89 06                     	movq	%rax, (%r14)
  401d27: 48 b8 6c 69 65 6e 74 20 75 6e	movabsq	$7959303600887654764, %rax
  401d31: 49 89 46 08                  	movq	%rax, 8(%r14)
  401d35: 48 b8 61 62 6c 65 20 74 6f 20	movabsq	$2337214414117954145, %rax
  401d3f: 49 89 46 10                  	movq	%rax, 16(%r14)
  401d43: 48 b8 72 65 61 64 20 68 65 61	movabsq	$7018130082659132786, %rax
  401d4d: 49 89 46 18                  	movq	%rax, 24(%r14)
  401d51: 48 b8 64 65 72 73 20 66 72 6f	movabsq	$8030593375116879204, %rax
  401d5b: 49 89 46 20                  	movq	%rax, 32(%r14)
  401d5f: 48 b8 6d 20 73 65 72 76 65 72	movabsq	$8243124926671954029, %rax
  401d69: 49 89 46 28                  	movq	%rax, 40(%r14)
  401d6d: 41 c6 46 30 00               	movb	$0, 48(%r14)
  401d72: 44 89 e7                     	movl	%r12d, %edi
  401d75: e8 d6 ed ff ff               	callq	-4650 <close@plt>
  401d7a: b8 ff ff ff ff               	movl	$4294967295, %eax
  401d7f: e9 e4 00 00 00               	jmp	228 <submitr+0x6bc>
  401d84: 80 7c 24 40 0d               	cmpb	$13, 64(%rsp)
  401d89: 0f 85 6f ff ff ff            	jne	-145 <submitr+0x552>
  401d8f: 80 7c 24 41 0a               	cmpb	$10, 65(%rsp)
  401d94: 0f 85 64 ff ff ff            	jne	-156 <submitr+0x552>
  401d9a: 80 7c 24 42 00               	cmpb	$0, 66(%rsp)
  401d9f: 0f 85 59 ff ff ff            	jne	-167 <submitr+0x552>
  401da5: ba 00 20 00 00               	movl	$8192, %edx
  401daa: 48 8d 74 24 40               	leaq	64(%rsp), %rsi
  401daf: 48 8d bc 24 40 80 00 00      	leaq	32832(%rsp), %rdi
  401db7: e8 d2 f8 ff ff               	callq	-1838 <rio_readlineb>
  401dbc: 48 85 c0                     	testq	%rax, %rax
  401dbf: 7f 70                        	jg	112 <submitr+0x685>
  401dc1: 48 b8 45 72 72 6f 72 3a 20 43	movabsq	$4836930262966366789, %rax
  401dcb: 49 89 06                     	movq	%rax, (%r14)
  401dce: 48 b8 6c 69 65 6e 74 20 75 6e	movabsq	$7959303600887654764, %rax
  401dd8: 49 89 46 08                  	movq	%rax, 8(%r14)
  401ddc: 48 b8 61 62 6c 65 20 74 6f 20	movabsq	$2337214414117954145, %rax
  401de6: 49 89 46 10                  	movq	%rax, 16(%r14)
  401dea: 48 b8 72 65 61 64 20 73 74 61	movabsq	$7022364301937698162, %rax
  401df4: 49 89 46 18                  	movq	%rax, 24(%r14)
  401df8: 48 b8 74 75 73 20 6d 65 73 73	movabsq	$8319104456053716340, %rax
  401e02: 49 89 46 20                  	movq	%rax, 32(%r14)
  401e06: 48 b8 61 67 65 20 66 72 6f 6d	movabsq	$7885647255504775009, %rax
  401e10: 49 89 46 28                  	movq	%rax, 40(%r14)
  401e14: 48 b8 20 73 65 72 76 65 72 00	movabsq	$32199706744812320, %rax
  401e1e: 49 89 46 30                  	movq	%rax, 48(%r14)
  401e22: 44 89 e7                     	movl	%r12d, %edi
  401e25: e8 26 ed ff ff               	callq	-4826 <close@plt>
  401e2a: b8 ff ff ff ff               	movl	$4294967295, %eax
  401e2f: eb 37                        	jmp	55 <submitr+0x6bc>
  401e31: 48 8d 74 24 40               	leaq	64(%rsp), %rsi
  401e36: 4c 89 f7                     	movq	%r14, %rdi
  401e39: e8 c2 ec ff ff               	callq	-4926 <strcpy@plt>
  401e3e: 44 89 e7                     	movl	%r12d, %edi
  401e41: e8 0a ed ff ff               	callq	-4854 <close@plt>
  401e46: 41 0f b6 06                  	movzbl	(%r14), %eax
  401e4a: 83 e8 4f                     	subl	$79, %eax
  401e4d: 75 0f                        	jne	15 <submitr+0x6b2>
  401e4f: 41 0f b6 46 01               	movzbl	1(%r14), %eax
  401e54: 83 e8 4b                     	subl	$75, %eax
  401e57: 75 05                        	jne	5 <submitr+0x6b2>
  401e59: 41 0f b6 46 02               	movzbl	2(%r14), %eax
  401e5e: 85 c0                        	testl	%eax, %eax
  401e60: 0f 95 c0                     	setne	%al
  401e63: 0f b6 c0                     	movzbl	%al, %eax
  401e66: f7 d8                        	negl	%eax
  401e68: 48 8b 94 24 58 a0 00 00      	movq	41048(%rsp), %rdx
  401e70: 64 48 33 14 25 28 00 00 00   	xorq	%fs:40, %rdx
  401e79: 0f 84 00 01 00 00            	je	256 <submitr+0x7d3>
  401e7f: e9 f6 00 00 00               	jmp	246 <submitr+0x7ce>
  401e84: 48 8d 84 24 40 20 00 00      	leaq	8256(%rsp), %rax
  401e8c: 48 89 44 24 08               	movq	%rax, 8(%rsp)
  401e91: 4c 89 3c 24                  	movq	%r15, (%rsp)
  401e95: 4c 8b 4c 24 18               	movq	24(%rsp), %r9
  401e9a: 4c 8b 44 24 10               	movq	16(%rsp), %r8
  401e9f: b9 d0 26 40 00               	movl	$4204240, %ecx
  401ea4: ba 00 20 00 00               	movl	$8192, %edx
  401ea9: be 01 00 00 00               	movl	$1, %esi
  401eae: 48 8d 7c 24 40               	leaq	64(%rsp), %rdi
  401eb3: b8 00 00 00 00               	movl	$0, %eax
  401eb8: e8 b3 ed ff ff               	callq	-4685 <__sprintf_chk@plt>
  401ebd: 48 8d 7c 24 40               	leaq	64(%rsp), %rdi
  401ec2: b8 00 00 00 00               	movl	$0, %eax
  401ec7: 48 c7 c1 ff ff ff ff         	movq	$-1, %rcx
  401ece: f2 ae                        	repne		scasb	%es:(%rdi), %al
  401ed0: 48 f7 d1                     	notq	%rcx
  401ed3: 48 83 e9 01                  	subq	$1, %rcx
  401ed7: 49 89 cd                     	movq	%rcx, %r13
  401eda: 0f 84 f8 fc ff ff            	je	-776 <submitr+0x42c>
  401ee0: 48 89 cb                     	movq	%rcx, %rbx
  401ee3: 48 8d 6c 24 40               	leaq	64(%rsp), %rbp
  401ee8: e9 5d fc ff ff               	jmp	-931 <submitr+0x39e>
  401eed: 48 b8 45 72 72 6f 72 3a 20 52	movabsq	$5917794173535285829, %rax
  401ef7: 49 89 06                     	movq	%rax, (%r14)
  401efa: 48 b8 65 73 75 6c 74 20 73 74	movabsq	$8391086215129297765, %rax
  401f04: 49 89 46 08                  	movq	%rax, 8(%r14)
  401f08: 48 b8 72 69 6e 67 20 63 6f 6e	movabsq	$7957688057412348274, %rax
  401f12: 49 89 46 10                  	movq	%rax, 16(%r14)
  401f16: 48 b8 74 61 69 6e 73 20 61 6e	movabsq	$7953674097058734452, %rax
  401f20: 49 89 46 18                  	movq	%rax, 24(%r14)
  401f24: 48 b8 20 69 6c 6c 65 67 61 6c	movabsq	$7809636914145552672, %rax
  401f2e: 49 89 46 20                  	movq	%rax, 32(%r14)
  401f32: 48 b8 20 6f 72 20 75 6e 70 72	movabsq	$8246212367049977632, %rax
  401f3c: 49 89 46 28                  	movq	%rax, 40(%r14)
  401f40: 48 b8 69 6e 74 61 62 6c 65 20	movabsq	$2334391151659085417, %rax
  401f4a: 49 89 46 30                  	movq	%rax, 48(%r14)
  401f4e: 48 b8 63 68 61 72 61 63 74 65	movabsq	$7310577365311121507, %rax
  401f58: 49 89 46 38                  	movq	%rax, 56(%r14)
  401f5c: 66 41 c7 46 40 72 2e         	movw	$11890, 64(%r14)
  401f63: 41 c6 46 42 00               	movb	$0, 66(%r14)
  401f68: 44 89 e7                     	movl	%r12d, %edi
  401f6b: e8 e0 eb ff ff               	callq	-5152 <close@plt>
  401f70: b8 ff ff ff ff               	movl	$4294967295, %eax
  401f75: e9 ee fe ff ff               	jmp	-274 <submitr+0x6bc>
  401f7a: e8 b1 eb ff ff               	callq	-5199 <__stack_chk_fail@plt>
  401f7f: 48 81 c4 68 a0 00 00         	addq	$41064, %rsp
  401f86: 5b                           	popq	%rbx
  401f87: 5d                           	popq	%rbp
  401f88: 41 5c                        	popq	%r12
  401f8a: 41 5d                        	popq	%r13
  401f8c: 41 5e                        	popq	%r14
  401f8e: 41 5f                        	popq	%r15
  401f90: c3                           	retq

0000000000401f91 init_timeout:
  401f91: 53                           	pushq	%rbx
  401f92: 89 fb                        	movl	%edi, %ebx
  401f94: 85 ff                        	testl	%edi, %edi
  401f96: 74 1e                        	je	30 <init_timeout+0x25>
  401f98: be 60 16 40 00               	movl	$4200032, %esi
  401f9d: bf 0e 00 00 00               	movl	$14, %edi
  401fa2: e8 e9 eb ff ff               	callq	-5143 <signal@plt>
  401fa7: 85 db                        	testl	%ebx, %ebx
  401fa9: bf 00 00 00 00               	movl	$0, %edi
  401fae: 0f 49 fb                     	cmovnsl	%ebx, %edi
  401fb1: e8 8a eb ff ff               	callq	-5238 <alarm@plt>
  401fb6: 5b                           	popq	%rbx
  401fb7: c3                           	retq

0000000000401fb8 init_driver:
  401fb8: 55                           	pushq	%rbp
  401fb9: 53                           	pushq	%rbx
  401fba: 48 83 ec 28                  	subq	$40, %rsp
  401fbe: 48 89 fd                     	movq	%rdi, %rbp
  401fc1: 64 48 8b 04 25 28 00 00 00   	movq	%fs:40, %rax
  401fca: 48 89 44 24 18               	movq	%rax, 24(%rsp)
  401fcf: 31 c0                        	xorl	%eax, %eax
  401fd1: be 01 00 00 00               	movl	$1, %esi
  401fd6: bf 0d 00 00 00               	movl	$13, %edi
  401fdb: e8 b0 eb ff ff               	callq	-5200 <signal@plt>
  401fe0: be 01 00 00 00               	movl	$1, %esi
  401fe5: bf 1d 00 00 00               	movl	$29, %edi
  401fea: e8 a1 eb ff ff               	callq	-5215 <signal@plt>
  401fef: be 01 00 00 00               	movl	$1, %esi
  401ff4: bf 1d 00 00 00               	movl	$29, %edi
  401ff9: e8 92 eb ff ff               	callq	-5230 <signal@plt>
  401ffe: ba 00 00 00 00               	movl	$0, %edx
  402003: be 01 00 00 00               	movl	$1, %esi
  402008: bf 02 00 00 00               	movl	$2, %edi
  40200d: e8 6e ec ff ff               	callq	-5010 <socket@plt>
  402012: 89 c3                        	movl	%eax, %ebx
  402014: 85 c0                        	testl	%eax, %eax
  402016: 79 4f                        	jns	79 <init_driver+0xaf>
  402018: 48 b8 45 72 72 6f 72 3a 20 43	movabsq	$4836930262966366789, %rax
  402022: 48 89 45 00                  	movq	%rax, (%rbp)
  402026: 48 b8 6c 69 65 6e 74 20 75 6e	movabsq	$7959303600887654764, %rax
  402030: 48 89 45 08                  	movq	%rax, 8(%rbp)
  402034: 48 b8 61 62 6c 65 20 74 6f 20	movabsq	$2337214414117954145, %rax
  40203e: 48 89 45 10                  	movq	%rax, 16(%rbp)
  402042: 48 b8 63 72 65 61 74 65 20 73	movabsq	$8295742064141103715, %rax
  40204c: 48 89 45 18                  	movq	%rax, 24(%rbp)
  402050: c7 45 20 6f 63 6b 65         	movl	$1701536623, 32(%rbp)
  402057: 66 c7 45 24 74 00            	movw	$116, 36(%rbp)
  40205d: b8 ff ff ff ff               	movl	$4294967295, %eax
  402062: e9 0a 01 00 00               	jmp	266 <init_driver+0x1b9>
  402067: bf 60 27 40 00               	movl	$4204384, %edi
  40206c: e8 2f eb ff ff               	callq	-5329 <gethostbyname@plt>
  402071: 48 85 c0                     	testq	%rax, %rax
  402074: 75 68                        	jne	104 <init_driver+0x126>
  402076: 48 b8 45 72 72 6f 72 3a 20 44	movabsq	$4908987857004294725, %rax
  402080: 48 89 45 00                  	movq	%rax, (%rbp)
  402084: 48 b8 4e 53 20 69 73 20 75 6e	movabsq	$7959303596504273742, %rax
  40208e: 48 89 45 08                  	movq	%rax, 8(%rbp)
  402092: 48 b8 61 62 6c 65 20 74 6f 20	movabsq	$2337214414117954145, %rax
  40209c: 48 89 45 10                  	movq	%rax, 16(%rbp)
  4020a0: 48 b8 72 65 73 6f 6c 76 65 20	movabsq	$2334402189959849330, %rax
  4020aa: 48 89 45 18                  	movq	%rax, 24(%rbp)
  4020ae: 48 b8 73 65 72 76 65 72 20 61	movabsq	$6998719601038222707, %rax
  4020b8: 48 89 45 20                  	movq	%rax, 32(%rbp)
  4020bc: c7 45 28 64 64 72 65         	movl	$1701995620, 40(%rbp)
  4020c3: 66 c7 45 2c 73 73            	movw	$29555, 44(%rbp)
  4020c9: c6 45 2e 00                  	movb	$0, 46(%rbp)
  4020cd: 89 df                        	movl	%ebx, %edi
  4020cf: e8 7c ea ff ff               	callq	-5508 <close@plt>
  4020d4: b8 ff ff ff ff               	movl	$4294967295, %eax
  4020d9: e9 93 00 00 00               	jmp	147 <init_driver+0x1b9>
  4020de: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  4020e6: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  4020ef: 66 c7 04 24 02 00            	movw	$2, (%rsp)
  4020f5: 48 63 50 14                  	movslq	20(%rax), %rdx
  4020f9: 48 8b 40 18                  	movq	24(%rax), %rax
  4020fd: 48 8d 7c 24 04               	leaq	4(%rsp), %rdi
  402102: b9 0c 00 00 00               	movl	$12, %ecx
  402107: 48 8b 30                     	movq	(%rax), %rsi
  40210a: e8 a1 ea ff ff               	callq	-5471 <__memmove_chk@plt>
  40210f: 66 c7 44 24 02 3b 6e         	movw	$28219, 2(%rsp)
  402116: ba 10 00 00 00               	movl	$16, %edx
  40211b: 48 89 e6                     	movq	%rsp, %rsi
  40211e: 89 df                        	movl	%ebx, %edi
  402120: e8 0b eb ff ff               	callq	-5365 <connect@plt>
  402125: 85 c0                        	testl	%eax, %eax
  402127: 79 32                        	jns	50 <init_driver+0x1a3>
  402129: 41 b8 60 27 40 00            	movl	$4204384, %r8d
  40212f: b9 20 27 40 00               	movl	$4204320, %ecx
  402134: 48 c7 c2 ff ff ff ff         	movq	$-1, %rdx
  40213b: be 01 00 00 00               	movl	$1, %esi
  402140: 48 89 ef                     	movq	%rbp, %rdi
  402143: b8 00 00 00 00               	movl	$0, %eax
  402148: e8 23 eb ff ff               	callq	-5341 <__sprintf_chk@plt>
  40214d: 89 df                        	movl	%ebx, %edi
  40214f: e8 fc e9 ff ff               	callq	-5636 <close@plt>
  402154: b8 ff ff ff ff               	movl	$4294967295, %eax
  402159: eb 16                        	jmp	22 <init_driver+0x1b9>
  40215b: 89 df                        	movl	%ebx, %edi
  40215d: e8 ee e9 ff ff               	callq	-5650 <close@plt>
  402162: 66 c7 45 00 4f 4b            	movw	$19279, (%rbp)
  402168: c6 45 02 00                  	movb	$0, 2(%rbp)
  40216c: b8 00 00 00 00               	movl	$0, %eax
  402171: 48 8b 4c 24 18               	movq	24(%rsp), %rcx
  402176: 64 48 33 0c 25 28 00 00 00   	xorq	%fs:40, %rcx
  40217f: 74 05                        	je	5 <init_driver+0x1ce>
  402181: e8 aa e9 ff ff               	callq	-5718 <__stack_chk_fail@plt>
  402186: 48 83 c4 28                  	addq	$40, %rsp
  40218a: 5b                           	popq	%rbx
  40218b: 5d                           	popq	%rbp
  40218c: c3                           	retq

000000000040218d driver_post:
  40218d: 53                           	pushq	%rbx
  40218e: 48 83 ec 10                  	subq	$16, %rsp
  402192: 48 89 cb                     	movq	%rcx, %rbx
  402195: 85 d2                        	testl	%edx, %edx
  402197: 74 27                        	je	39 <driver_post+0x33>
  402199: 48 89 f2                     	movq	%rsi, %rdx
  40219c: be 78 27 40 00               	movl	$4204408, %esi
  4021a1: bf 01 00 00 00               	movl	$1, %edi
  4021a6: b8 00 00 00 00               	movl	$0, %eax
  4021ab: e8 50 ea ff ff               	callq	-5552 <__printf_chk@plt>
  4021b0: 66 c7 03 4f 4b               	movw	$19279, (%rbx)
  4021b5: c6 43 02 00                  	movb	$0, 2(%rbx)
  4021b9: b8 00 00 00 00               	movl	$0, %eax
  4021be: eb 3e                        	jmp	62 <driver_post+0x71>
  4021c0: 48 85 ff                     	testq	%rdi, %rdi
  4021c3: 74 2b                        	je	43 <driver_post+0x63>
  4021c5: 80 3f 00                     	cmpb	$0, (%rdi)
  4021c8: 74 26                        	je	38 <driver_post+0x63>
  4021ca: 48 89 0c 24                  	movq	%rcx, (%rsp)
  4021ce: 49 89 f1                     	movq	%rsi, %r9
  4021d1: 41 b8 ec 22 40 00            	movl	$4203244, %r8d
  4021d7: 48 89 f9                     	movq	%rdi, %rcx
  4021da: ba 8f 27 40 00               	movl	$4204431, %edx
  4021df: be 6e 3b 00 00               	movl	$15214, %esi
  4021e4: bf 60 27 40 00               	movl	$4204384, %edi
  4021e9: e8 be f5 ff ff               	callq	-2626 <submitr>
  4021ee: eb 0e                        	jmp	14 <driver_post+0x71>
  4021f0: 66 c7 03 4f 4b               	movw	$19279, (%rbx)
  4021f5: c6 43 02 00                  	movb	$0, 2(%rbx)
  4021f9: b8 00 00 00 00               	movl	$0, %eax
  4021fe: 48 83 c4 10                  	addq	$16, %rsp
  402202: 5b                           	popq	%rbx
  402203: c3                           	retq
  402204: 90                           	nop
  402205: 90                           	nop
  402206: 90                           	nop
  402207: 90                           	nop
  402208: 90                           	nop
  402209: 90                           	nop
  40220a: 90                           	nop
  40220b: 90                           	nop
  40220c: 90                           	nop
  40220d: 90                           	nop
  40220e: 90                           	nop
  40220f: 90                           	nop

0000000000402210 __libc_csu_init:
  402210: 48 89 6c 24 d8               	movq	%rbp, -40(%rsp)
  402215: 4c 89 64 24 e0               	movq	%r12, -32(%rsp)
  40221a: 48 8d 2d df 0b 20 00         	leaq	2100191(%rip), %rbp
  402221: 4c 8d 25 d0 0b 20 00         	leaq	2100176(%rip), %r12
  402228: 4c 89 6c 24 e8               	movq	%r13, -24(%rsp)
  40222d: 4c 89 74 24 f0               	movq	%r14, -16(%rsp)
  402232: 4c 89 7c 24 f8               	movq	%r15, -8(%rsp)
  402237: 48 89 5c 24 d0               	movq	%rbx, -48(%rsp)
  40223c: 48 83 ec 38                  	subq	$56, %rsp
  402240: 4c 29 e5                     	subq	%r12, %rbp
  402243: 41 89 fd                     	movl	%edi, %r13d
  402246: 49 89 f6                     	movq	%rsi, %r14
  402249: 48 c1 fd 03                  	sarq	$3, %rbp
  40224d: 49 89 d7                     	movq	%rdx, %r15
  402250: e8 6b e8 ff ff               	callq	-6037 <_init>
  402255: 48 85 ed                     	testq	%rbp, %rbp
  402258: 74 1c                        	je	28 <__libc_csu_init+0x66>
  40225a: 31 db                        	xorl	%ebx, %ebx
  40225c: 0f 1f 40 00                  	nopl	(%rax)
  402260: 4c 89 fa                     	movq	%r15, %rdx
  402263: 4c 89 f6                     	movq	%r14, %rsi
  402266: 44 89 ef                     	movl	%r13d, %edi
  402269: 41 ff 14 dc                  	callq	*(%r12,%rbx,8)
  40226d: 48 83 c3 01                  	addq	$1, %rbx
  402271: 48 39 eb                     	cmpq	%rbp, %rbx
  402274: 75 ea                        	jne	-22 <__libc_csu_init+0x50>
  402276: 48 8b 5c 24 08               	movq	8(%rsp), %rbx
  40227b: 48 8b 6c 24 10               	movq	16(%rsp), %rbp
  402280: 4c 8b 64 24 18               	movq	24(%rsp), %r12
  402285: 4c 8b 6c 24 20               	movq	32(%rsp), %r13
  40228a: 4c 8b 74 24 28               	movq	40(%rsp), %r14
  40228f: 4c 8b 7c 24 30               	movq	48(%rsp), %r15
  402294: 48 83 c4 38                  	addq	$56, %rsp
  402298: c3                           	retq
  402299: 0f 1f 80 00 00 00 00         	nopl	(%rax)

00000000004022a0 __libc_csu_fini:
  4022a0: f3 c3                        	rep		retq
  4022a2: 90                           	nop
  4022a3: 90                           	nop

Disassembly of section .fini:

00000000004022a4 _fini:
  4022a4: 48 83 ec 08                  	subq	$8, %rsp
  4022a8: 48 83 c4 08                  	addq	$8, %rsp
  4022ac: c3                           	retq
