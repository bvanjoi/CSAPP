# The Y86-64 Instruction Set Architecture

## Programmer-Visible State

RF, 64 bits program registers: `%rax`, `%rcx`, `%rbx`, `%rsi`, `%rdi`, `%rsp`, `%rbp`, `%r8`, `%r9`, `%r10`, `%r11`, `%r12`, `%r8`, `%r12`, `%r13`, `R14`. `%rsp` is used as a stack pointer by the push, pop, call and a 64-bit word.

CC, condition code: `ZF`, `SF`, `OF`. Those store information about the effect of the most recent arithmetic or logical instruction.

`PC`: holds the address of the instruction currently being executed.

`Memory`: Y86-64 programs reference memory locations using **virtual addresses**.

`Stat`: indicating the overall state of program execution, and the possible values for this code are shown following:

| Value | Name  | Meaning |
| -     |  -    |   -     |
| 1     | `AOK` | Normal Operation                |
| 2     | `HLT` | `halt` instruction encountered  |
| 3     | `ADR` | Invalid address encountered     |
| 4     | `INS` | Invalid instruction encountered |

## Y86-64 Instructions

The set of Y86-64 instructions is largely a subset of the x86-64 instruction set. But Y86-64 includes *only 8-byte* integer operations.

And following figure shows the byte-level encoding of the instructions. Each instruction requires between 1 and 10 bytes, depending on which fields are required.

Every instruction has an initial byte identifying the instruction type.

This byte is split into two 4-bit parts:

- the high-order, or code.
- the low-order, or function.

![Y86-64 ISA](https://img-blog.csdnimg.cn/20201031160831824.png)

- `irmovq`: immediate -> register
- `rrmovq`: register -> register
- `mrmovq`: memory -> register
- `rmmovq`: register -> memory
- `OPq`: `addq`, `subq`, `andq`, `xorq`, and these operate only on register data in Y86-64(whereas x86-64 also allows operations on memory data), and these instructions set the three condition ZF, SF, and OF.
- `jXX`: `jmp`, `jle`, `jl`, `je`, `jne`, `jge`, `jg`, branches are taken according to the type of branch and the settings of the condition codes.
- `cmovXX`: `cmovle`, `cmovl`, `cmove`, `cmovne`, `cmovge`, `cmovg`, updated only if the condition code satisfy the required constraints.
- `call`: pushed the return address on the stack and jumps to the destination address.
- `ret`: return from `call`.
- `pushq` and `popq`: just as they do in x86-64, you can see [pushq and popq in x86-64](../../../C3/note/formats/README.md)
- `halt`: stops instruction execution.(x86-64 has a comparable instruction called `hlt`, it cause the entire system to suspend operation)

Some tips:

- And note that branch and call destinations are given as *absolute addresses*, rather than using the PC-relative addressing seen in x86-64.
- As with x86-64, all integer have a *little-endian* encoding.
- Y86-64 instruction set includes attributes of both CISC and RISC instruction set. On CISC side, it has condition codes and variable-length instructions, and it uses the stack to store return addresses. On the RISC side, it uses a load/store architecture and a regular instruction encoding, and it passes procedure arguments through registers.

## Instruction Encoding

One important property of any instruction set is that **the byte encodings must have a unique interpretation**.

Following figure shows the specific encodings of the integer operation, branch, and conditional move instructions.

![FUnction codes for Y86-64 instruction set](https://img-blog.csdnimg.cn/20201031163855106.png)

And following show **register identifier** ranging from 0 to 0xE. The program registers are stored within the CPU in a register file, a small random access memory where the register IDs serve as addresses.

| Number | Register name |
| -      |    -          |
| 0      | `%rax`        |
| 1      | `%rcx`        |
| 2      | `%rdx`        |
| 3      | `%rbx`        |
| 4      | `%rsp`        |
| 5      | `%rbp`        |
| 6      | `%rsi`        |
| 7      | `%rdi`        |
| 8      | `%r8`         |
| 9      | `%r9`         |
| A      | `%r10`        |
| B      | `%r11`        |
| C      | `%r12`        |
| D      | `%r13`        |
| E      | `%r14`        |
| F      | No Register   |

Practices:

- [4.1](../../practice/4.1/README.md)
- [4.2](../../practice/4.2/README.md)
- [4.3](../../practice/4.3/README.md)
- [4.4](../../practice/4.4/README.md)
- [4.5](../../practice/4.5/README.md)
- [4.6](../../practice/4.6/README.md)

## Some Y86-64 Instruction Details

Most Y86-64 instructions transform the program state in a straightforward manner, and so defining the intended effect of each instruction effect of each instruction is not difficult.

However, two unusual instruction combinations require special attention: the `pushq` instruction both decrements the stack pointer by 8 and write a register value to memory. It's therefore not totally clear what the processor should do when executing the instruction `pushq %rsp`, since the register being pushed is being changed by the same instruction. Two different conventions are possible:

1. push the original value of `%rsp`;
2. push the decremented value of `%rsp`.

A similar ambiguity occurs for the instruction `popq %rsp`.

Practices:

- [4.7](../../practice/4.7/README.md)
- [4.8](../../practice/4.8/README.md)

## Addition: RISC vs CISC

| CISC(complex instruction set computer)    |  *Early* RISC(reduced instruction set computer) |
| -     |  -          |
|A large number of instructions             | Many fewer instructions, typically less than 100 |
|Some instruction with long execution times | No instruction with a long execution time        |
|Variable-size encodings                    | Fixed-length encodings                           |
|Multiple formats for specifying operands   | Simple addressing formats                        |
|Arithmetic and logical operations can be applied to both memory and register operands  | Arithmetic and logical operations only use register operands |
|Implementation artifacts hidden from machine-level programs |Implementation artifacts exposed to machine-level programs |
|Condition codes                            |No condition codes                                |
|Stack-intensive procedure linkage          |Register-intensive procedure linkage              |

More recent CISC machines also take advantage of high-performance pipeline structures. Since the dynamic translation can generally be performed well in advance of the actual instruction execution, the processor can sustain a very high execution rate.

But RISC processors have done very well in the market for embedded processor. Because in theses application, saving on cost and power is more important than maintaining backward compatibility.
