# Program Encodings

Suppose we write a C program as two files *p1.c* and *p2.c*, we can then compile this code using command line:

```bash
gcc -Og -o p p1.c p2.c
```

If you want to learn more about gcc, you can look here: [GCC](../../../C1/note/GCC/README.md)

THe gcc command invokes an entire sequence of programs to turn the source code into executable code. And the process is that: [program life](../../../C1/note/hello/hello.c)

## Machine-Level Code

Computer systems employ several different forms of abstraction, hiding details of an implementation through the use of a simpler abstract model. Two of these are especially important for machine-level programming.

- First, the format and behavior of a machine-level program is defined by the **instruction set architecture**, or ISA, defining the processor state, the formate of the instructions, and the effect each of these instructions will have on the state.
- Second, hte memory addresses used by a machine-level program are **virtual addresses**, providing a memory model that appears to be a very large byte array. The operating system manages this virtual address space, translating virtual addresses into the physical addresses of values in the actual processor memory.

The compiler does THe assembly-code representation is very close to machine code. Its main feature is that it is in a more readable textual formate, as compared to the binary format of machine code. Being able to understand assembly code and how it related to the original C code is a key step in understanding how computers execute programs.

And the machine code for x86-64 differs greatly from the original C code. Parts of the processor state are visible that normally are hidden from the C programmer:

- The **program counter**(called *%rip* in x86-64) indicates the address in memory of the **next** instruction to be executed.
- The integer **register file** contains 16 named locations storing 64-bit values.
- The condition code **register** hold status information about hte most recently executed arithmetic or logical instruction.
- A set of vector register can each hold one or more integer of floating-point values.

## Code Examples

We write a C code file [mstore.c](./mstore.c), and in order to see the assembly code generated by the C compiler, we can use the `-S` option on the command line:

```bash
gcc -Og -S mstore.c
```

This will generating an assembly file `mstore.s`, and go **no** further.

Then, we see [mstore.s](./mstore.s), the assembly-code file contains various declarations, including the following set of lines:

```x86asm
mulstore:
  pushq   %rbx
  movq    %rdx, %rbx
  call    mult2
  movq    %rax, (%rbx)
  popq    %rbx
  ret
```

Each indented line in the code corresponds to a single machine instruction.

If we use the `-c` command-line option, gcc will both compile and assemble the code:

```bash
gcc -Og -c mstore.c
```

This will generate an object-code file `mstore.o`, which is in binary format and hence can't be viewed directly. To inspect the contents of machine-code files, a class of programs known as *disassemblers* can be invaluable.  These programs generate a formate similar to assembly code from the machine code. The disassembler determines the assembly code based purely on the byte sequences in the machine-code file, it dose not require access to the source or assembly-code versions of the program.

With Linux systems, the program **OBJDUMP**(object dump) can serve this role given the `-d` command-line flag:

```bash
objdump -d mstore.o
```

The result is as follows:

```x86asm
Disassembly of section __TEXT,__text:

0000000000000000 _multstore:
       0: 55                            pushq   %rbp
       1: 48 89 e5                      movq    %rsp, %rbp
       4: 53                            pushq   %rbx
       5: 50                            pushq   %rax
       6: 48 89 d3                      movq    %rdx, %rbx
       9: e8 00 00 00 00                callq   0 <_multstore+0xe>
       e: 48 89 03                      movq    %rax, (%rbx)
      11: 48 83 c4 08                   addq    $8, %rsp
      15: 5b                            popq    %rbx
      16: 5d                            popq    %rbp
      17: c3                            retq
```

On the left we see the hexadecimal byte values, which the assembly-language **equivalent** shown on the right.

And now, in order to generating the actual executable code, it requires running a liker on the set of object-code files., one of which must contain a function `main`. And this file is [main.c](./main.c).

Then we could generate an executable program *prog* as follows:

```bash
gcc -Og -o prog main.c mstore.c
```

We can disassemble the file *prog*:

```bash
objdump -d prog
```

Then the result is:

```x86asm
0000000100003f10 _main:
100003f10: 55                           pushq   %rbp
100003f11: 48 89 e5                     movq    %rsp, %rbp
100003f14: 48 83 ec 10                  subq    $16, %rsp
100003f18: 48 8d 55 f8                  leaq    -8(%rbp), %rdx
100003f1c: bf 02 00 00 00               movl    $2, %edi
100003f21: be 03 00 00 00               movl    $3, %esi
100003f26: e8 35 00 00 00               callq   53 <_multstore>
100003f2b: 48 8b 75 f8                  movq    -8(%rbp), %rsi
100003f2f: 48 8d 3d 64 00 00 00         leaq    100(%rip), %rdi
100003f36: 31 c0                        xorl    %eax, %eax
100003f38: e8 3b 00 00 00               callq   59 <dyld_stub_binder+0x100003f78>
100003f3d: 31 c0                        xorl    %eax, %eax
100003f3f: 48 83 c4 10                  addq    $16, %rsp
100003f43: 5d                           popq    %rbp
100003f44: c3                           retq
100003f45: 66 2e 0f 1f 84 00 00 00 00 00        nopw    %cs:(%rax,%rax)
100003f4f: 90                           nop

0000000100003f50 _mult2:
100003f50: 55                           pushq   %rbp
100003f51: 48 89 e5                     movq    %rsp, %rbp
100003f54: 48 89 f8                     movq    %rdi, %rax
100003f57: 48 0f af c6                  imulq   %rsi, %rax
100003f5b: 5d                           popq    %rbp
100003f5c: c3                           retq
100003f5d: 90                           nop
100003f5e: 90                           nop
100003f5f: 90                           nop

0000000100003f60 _multstore:
100003f60: 55                           pushq   %rbp
100003f61: 48 89 e5                     movq    %rsp, %rbp
100003f64: 53                           pushq   %rbx
100003f65: 50                           pushq   %rax
100003f66: 48 89 d3                     movq    %rdx, %rbx
100003f69: e8 e2 ff ff ff               callq   -30 <_mult2>
100003f6e: 48 89 03                     movq    %rax, (%rbx)
100003f71: 48 83 c4 08                  addq    $8, %rsp
100003f75: 5b                           popq    %rbx
100003f76: 5d                           popq    %rbp
100003f77: c3                           retq

Disassembly of section __TEXT,__stubs:

0000000100003f78 __stubs:
100003f78: ff 25 82 40 00 00            jmpq    *16514(%rip)

Disassembly of section __TEXT,__stub_helper:

0000000100003f80 __stub_helper:
100003f80: 4c 8d 1d 81 40 00 00         leaq    16513(%rip), %r11
100003f87: 41 53                        pushq   %r11
100003f89: ff 25 71 00 00 00            jmpq    *113(%rip)
100003f8f: 90                           nop
100003f90: 68 00 00 00 00               pushq   $0
100003f95: e9 e6 ff ff ff               jmp     -26 <__stub_helper>
```

We can focus the function `mulstore`, and there are some differences:

- one important difference is that the addresses listed along the left are different: the linker has shifted the location of this code to a different range of addresses.
- Second difference is that the linker has filled in the address that the `callq` instruction should use in calling the function `mul2`. One task for the linker is to match function calls with the locations of the executable code for those functions.
- A final difference is that we see two additional lines of code: `nop`, which will have no effect on the program, since they occur after the `retq`(return instruction). They have been inserted to grow the code for the function to 16 bytes, enabling a better placement of the next block of code in terms of memory system performance.

## Notes on Formatting

If you look [mstore.s](./mstore.s), you will know the assembly code generated by GCC is difficult for a human to read. Because it contains information with which we need not be concerned, and on the other hand, it does not provide any description of the program or how it works.

To provide a clearer presentation of assembly code, we will show it in a form that omits most of the directives, while including explanatory annotations.
