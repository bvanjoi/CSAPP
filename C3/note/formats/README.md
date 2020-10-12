# Data Formats

- word: 16-bit(2 bytes) type.
- double words: 32-bit type.
- qual words: 64 bit type.

And following is a sizes of C data types in x86-64:

| C declaration | intel data type | assembly-code suffix | size(bytes) |
|       -       |       -         |       -              |    -        |
|     char      |      Byte       |       b              |    1        |
|     short     |      Word       |       w              |    2        |
|     int       |   Double Word   |       l              |    4        |
|     long      |    Quad Word    |       q              |    8        |
|    char *     |    Quad Word    |       q              |    8        |
|     float     | Single precision|       s              |    4        |
|    double     | Double precision|       l              |    8        |

Although the suffix `l`, to denote a 4-byte integer as well as an 8-byte double-precision floating-point number. THis causes no ambiguity, since floating-point code involves an entirely different set of instructions and registers.

# Accessing Information

An x86-64 CPU contains a set of 16 **general-purpose registers** storing 64-bit values. Theses register are used to store integer data as well as pointers.

| 63 - 0 | 31 - 0 | 15 - 0 | 7 - 0|  description   |
| -      |  -     | -      | -    |     -          |
| %rax   | %eax   | %ax    | %al  |  return value  |
| %rbx   | %ebx   | %bx    | %bl  |  callee saved  |
| %rcx   | %ecx   | %cx    | %cl  |  4th argument  |
| %rdx   | %edx   | %dx    | %dl  |  3rd argument  |
| %rsi   | %esi   | %si    | %sil |  2nd argument  |
| %rdi   | %edi   | %di    | %dil |  1st argument  |
| %rbp   | %ebp   | %bp    | %bpl |  callee saved  |
| %rsp   | %esp   | %sp    | %spl |  stack pointer |
| %r8    | %r8d   | %r8w   | %r8b |  5th argument  |
| %r9    | %r9d   | %r9w   | %r9b |  6th argument  |
| %r10   | %r10d  | %r10w  | %r10b|  callee saved  |
| %r11   | %r11d  | %r11w  | %r11b|  callee saved  |
| %r12   | %r12d  | %r12w  | %r12b|  callee saved  |
| %r13   | %r13d  | %r13w  | %r13b|  callee saved  |
| %r14   | %r14d  | %r14w  | %r14b|  callee saved  |
| %r15   | %r15d  | %r15w  | %r15b|  callee saved  |

## Operand Specifiers

| Type         |Form                 |Operand value                    | Name              |
|  -           |-                    |-                                |  -                |
|  Immediate   |$Imm                 |Imm                              |  Immediate        |
|  Register    |$r_a$                |R[$r_a$]                         |  Register         |
|  Memory      |Imm                  |M[Imm]                           |  Absolute         |
|  Memory      |($r_a$)              |M[R[$r_a$]]                      |  Indirect         |
|  Memory      |Imm($r_b$)           |M[Imm + R[$r_b$]]                |Base + displacement|
|  Memory      |($r_b$,$r_i$)        |M[R[$r_i$]] + R[$r_b$]]          |  Indexed          |
|  Memory      |Imm($r_b$,$r_i$)     |M[Imm + R[$r_i$]] + R[$r_b$]]    |  Indexed          |
|  Memory      |(,$r_i$, $s$)        |M[R[$r_i$]] * s]                 |  Scaled indexed   |
|  Memory      |Imm(,$r_i$, $s$)     |M[Imm + R[$r_i$]] * s]           |  Scaled indexed   |
|  Memory      |($r_b$,$r_i$, $s$)   |M[R[$r_b$] + R[$r_i$]] * s]      |  Scaled indexed   |
|  Memory      |Imm($r_b$,$r_i$, $s$)|M[Imm + R[$r_b$] + R[$r_i$]] * s]|  Scaled indexed   |

And the scaling factor $s$ must be either 1, 2, 4, or 8.

A practice:

- [3.1](../../practice/3.1/README.md)

## Data Movement

| Instruction  |Effect          |Description       |
|  -           |-               |-                 |
|  `mov  S, D` | D <- S         | Move             |
|  movb        |                | Move Byte        |
|  movw        |                | Move Word        |
|  movl        |                | Move double word |
|  movq        |                | Move quad word   |
|`movabsq I, R`| R <- I         | Move absolute quad word|

- The source operand designates a value that is *immediate*, *stored in register*, or *stored in memory*.
- The destination operand designates a location that is either *a register* or *a memory address*.

(But the final instruction `movabsq` can only have *immediate* source operands, and can only have a *register* as a destination.)

And x86 imposes the restriction that a move instruction **can't** have both operands refer to memory locations.

For most cases, the `MOV` instructions will only update the specific register bytes or memory locations indicated by the destination operand. The only exception is that when `movl` has a register as the destination, it will also set the hight-order 4 bytes of the register to 0.

When copying a smaller source value to a larger destination. All of these instruction copy data from a source, which can be either a *register* or *stored in memory*, to *register* destination.

| Instruction  |Effect               |Description                             |
|  -           |-                    |-                                       |
|  `movz S, R` | R <- ZeroExtend(S)  | Move with zero extension               |
|  movzbw      |                     | Move zero-extended byte to word        |
|  movzbl      |                     | Move zero-extended byte to double word |
|  movzwl      |                     | Move zero-extended word to double word |
|  movzbq      |                     | Move zero-extended byte to quad word   |
|  movzwq      |                     | Move zero-extended word to quad word   |

| Instruction  |Effect               |Description                                |
|  -           |-                    |-                                          |
|  `movs S, R` | R <- SignExtend(S)  | Move with sign extension                  |
|  movsbw      |                     | Move sign-extended byte to word           |
|  movsbl      |                     | Move sign-extended byte to double word    |
|  movswl      |                     | Move sign-extended word to double word    |
|  movsbq      |                     | Move sign-extended byte to quad word      |
|  movswq      |                     | Move sign-extended word to quad word      |
|  movslq      |                     | Move sign-extended long word to quad word |

| Instruction |Effect                     |Description                  |
|  -          |-                          |-                            |
| `cltq`      | %rax <- SignExtend(%eax)  |  sign-extend %eax to %rax   |

Pay attention, `mozlq` **not** exist, and this type of data movement can be implemented using `movl` instruction having a register as the destination.

| Instruction  |Effect               |Description                                |
|  -           |-                    |-                                          |
|  `movs S, R` | R <- SignExtend(S)  | Move with sign extension                  |

There are some practices:

- [3.2](../../practice/3.2/README.md)
- [3.3](../../practice/3.3/README.md)

Following is an example:

```cpp
long exchange(long* xp, long y) {
    long x = *xp;
    *xp = y;
    return x;
}
```

Then, we input command:

```bash
gcc -Og -c exchange.c
objdump -d exchange.o
```

The result is:

```x86asm
0000000000000000 _exchange:
    0: 55              pushq   %rbp
    1: 48 89 e5        movq    %rsp, %rbp
    4: 48 8b 07        movq    (%rdi), %rax
    7: 48 89 37        movq    %rsi, (%rdi)
    a: 5d              popq    %rbp
    b: c3              retq
```

steps:

1. When the procedure begins execution, procedure parameters `xp` and `y` are stored register `%rdi` and `%rsi`, respectively.
2. Then line 4 read `x` from memory and store the value in register `%rax`, a direct implementation of the operation `x = *xp`. Later, register `%rax` will be used to return a value from the function, and so the return value will be `x`.
3. And line 7 writes `y` to the memory location designated by `xp` in register `%rdi`， a direct implementation of the operation `*xp = y`.

There are some practices:

- [3.4](../../practice/3.4/README.md)
- [3.5](../../practice/3.5/README.md)

## Pushing and Popping Stack

A stack is a data structure where values can be added or deleted, but only according to a 'last-int, first out' discipline.

A stack can be implemented as an array, where we always insert and remove elements from one **end** of the array. And this end is called the **top** of the stack(With x86-64, the program stack is stored in some region of memory).

The document of program stack is following:

| Instruction | Effect                                   | Description      |
|     -       |   -                                      |      -           |
| `pushq S`   | R[%rsp]  <- R[%rsp] - 8; M[R[%rsp]] <- S;|  push *quad* word|
| `popq D`    | D <- M[R[%rsp]]; R[%rsp]  <- R[%rsp] + 8;|  pop  *quad* word|

- `pushq`: provides the ability to push data onto the stack.
- `popq`: pops it.

Therefore, the behavior of the instruction pushq `%rbp` is equivalent to that of the pair of instructions:

```x86asm
subq 8, %rsp
movq %rbp, (%rsp)
```

And the instruction popq `%rax` is equivalent to the following pair of instrcutions:

```x86asm
movq (%rsp), %rax
addq $8, %rsp
```

The stack play a vital role in the handing of procedure calls.

![Illustration of stack operation](https://img-blog.csdnimg.cn/20201009083154481.png)
