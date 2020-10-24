# Operations

## Arithmetic and Logical Operations

Some of the x86-64 integer and logic operations:

| Instruction | Effect      | Description             |
|     -       |   -         |    -                    |
| `leaq S, D` | D <- &S     | Load effective address  |
| `INC D`     | D <- D + 1  | Increment               |
| `DEC D`     | D <- D - 1  | Decrement               |
| `NEG D`     | D <- -D     | Negate                  |
| `NOT D`     | D <- ~D     | Complement              |
| `ADD S, D`  | D <- D + S  | Add                     |
| `Sub S, D`  | D <- D - S  | Subtract                |
| `IMUL S, D` | D <- D * S  | Multiply                |
| `XOR S, D`  | D <- D ^ S  | Exclusive-or            |
| `OR S, D`   | D <- D | S  | Or                      |
| `AND S, D`  | D <- D & S  | And                     |
| `SAL k, D`  | D <- D << k | Left shift              |
| `SHL k, D`  | D <- D << k | Left shift(same as SAL) |
| `SAR k, D`  | D <- D >>> k| Arithmetic right left   |
| `SHR k, D`  | D <- D >> k | Logical right left      |
| `imulq S`   | R[%rdx]: R[%rax] <- s * R[%rax]| Signed full multiply  |
| `mulq S`    | R[%rdx]: R[%rax] <- s * R[%rax]| Unsigned full multiply|
| `cqto`      | R[%rdx]: R[%rax] <- SignExtend(R[%rax])| Convert to oct word|
| `idivq S`   | R[%rdx] <- R[%rdx]: R[%rax] mod s; R[%rax] <- R[%rdx]: R[%rax] / S| Signed divide  |
| `divq S`    | R[%rdx] <- R[%rdx]: R[%rax] mod s; R[%rax] <- R[%rdx]: R[%rax] / S| Unsigned divide  |

- `leaq` is actually a variant of the `movq` instruction(But `leaq` has no other size variants). It has the form of an instruction that reads from memory to a register, but it does not reference memory at all.
- The different shift instructions can specify the shift amount either as **an immediate value or with the single-byte register `%cl`**(These instructions are unusual in only allowing this specific register as the operand). With x86-64, a shift instruction operation on data values that are $w$ bits long determines the shift amount from the low-order $m$ bits, where $2^m = w$.
- oct word: Intel refers to a 16-byte quantity as an *oct word*.

Some practices:

- [3.6](../../practice/3.6/README.md)
- [3.7](../../practice/3.7/README.md)
- [3.8](../../practice/3.8/README.md)
- [3.9](../../practice/3.9/README.md)
- [3.10](../../practice/3.10/README.md)
- [3.11](../../practice/3.11/README.md)
- [3.12](../../practice/3.12/README.md)

## Control

Machine code provides two basic low-level mechanisms for implementing conditional behavior: **it tests data values and then alters either the control flow or the data flow based on the results(condition codes) of theses tests.**

### Condition Codes

Condition codes registers describing attributes of the most **recent** arithmetic or logical operation.

- CF: carry flag. The most recent operation generated a carry out of the most significant bit. Used to detect overflow for unsigned operations.
- ZF: zero flag. The most recent operation yielded zero.
- SF: sign flag. The most recent operation yielded a negative value.
- OF: overflow flag. The most recent operation caused a two's-complement overflow, either negative or positive.

|Instruction | Based on| Description         |
|    -       |    -    |     -               |
|`CMP S1,S2` |  S2 - S1|  Compare            |
|`compb`     |         |  Compare byte       |
|`compw`     |         |  Compare word       |
|`compl`     |         |  Compare double word|
|`compq`     |         |  Compare quad word  |
|`TEST S1,S2`|  S2 & S1|  Test               |
|`testb`     |         |  Test byte          |
|`testw`     |         |  Test word          |
|`testl`     |         |  Test double word   |
|`testq`     |         |  Test quad word     |

- `CMP` instructions set the condition codes according to the differences of their two operands. It behave in the same way as the `SUB` instructions, except that they set the condition codes without updating their destinations.
- `TEST` instructions behave in the same manner s the `AND` instructions, except that they set the condition codes without altering their destinations.

### Accessing the Condition Codes

Three ways of using the conditions codes:

- Set a single byte to 0 or 1 depending on some combination of the condition codes.
- Conditionally jump to some other part of the program.
- Conditionally transfer data.

The first case:

|Instruction | Synonym | Effect                   | Set condition       |
|    -       |    -    |    -                     |    -                |
| `sete D`   | `setz`  | D <- ZF                  | Equal/zero          |
| `setne D`  | `setnz` | D <- ~ZF                 | Not Equal/ not zero |
| `sets D`   |         | D <- SF                  | Negative            |
| `setns D`  |         | D <- ~SF                 | Nonnegative         |
| `setg D`   | `setnle`| D <- ~(SF ^ OF) & ~ZF    | signed >            |
| `setge D`  | `setnl` | D <- ~(SF ^ OF)          | signed >=           |
| `setl D`   | `setnge`| D <- SF ^ OF             | signed <            |
| `setle D`  | `setng` | D <- (SF ^ OF) \| ZF     | signed <=           |
| `seta D`   | `setnbe`| D <- ~CF & ~ZF           | above (unsigned >)  |
| `setae D`  | `setnb` | D <- ~CF                 | unsigned >=         |
| `setb D`   | `setnae`| D <- C F                 | Below (unsigned <)  |
| `setbe D`  | `setna` | D <- CF | ZF             | unsigned <=         |

It's important to recognize that the suffixes for suffixes for these instructions denote different conditions and not different operand sizes. For example, instructions `setl` and `setb` denote "set less" and "set below", not "set long word" or "set byte".

And `SET` instruction has either one of the **low-order single-byte register** elements or a **single-byte memory location** as its destination, setting this byte to either 0 or 1.

Some practices:

- [3.13](../../practice/3.13/README.md)
- [3.14](../../practice/3.14/README.md)

The second case:

|Instruction     | Synonym | Jump condition           | Description         |
|    -           |    -    |    -                     |    -                |
| `jmp Label`    |         | 1                        | Direct jump         |
| `jmp *Operand` |         | 1                        | Indirect jump       |
| `je Label`     | `jz`    | ZF                       | Equal/zero          |
| `jne Label`    | `jnz`   | ~ZF                      | Not Equal/ not zero |
| `js Label`     |         | SF                       | Negative            |
| `jns Label`    |         | ~SF                      | Nonnegative         |
| `jg Label`     | `jnle`  | ~(SF^OF) & ~ZF           | signed >            |
| `jge Label`    | `jnl`   | ~(SF^OF)                 | signed >=           |
| `jl Label`     | `jnge`  | SF^OF                    | signed <            |
| `jle Label`    | `jng`   | (SF^OF) | ZF             | signed <=           |
| `ja Label`     | `jnbe`  | ~CF & ~ZF                | unsigned >          |
| `jae Label`    | `jnb`   | ~CF                      | unsigned >=         |
| `jb Label`     | `jnae`  | CF                       | unsigned <          |
| `jbe Label`    | `jna`   | CF | ZF                  | unsigned <=         |

In assembly coe, jump targets are written using **symbolic labels**.

And **PC relative** is very commonly used.

Practice:

- [3.15](../../practice/3.15/README.md)

Third case: translate conditional expressions and statements from C into machine code is to use combinations of conditional and unconditional jumps. The general form is given by the template:

```c
if (test-expr) {  // test-expr is an integer expression that evaluates either to zero or to a nonzero value
    then-statement
}
else {
    else-statement;
}
```

For above general form, the assembly implementation typically adheres to the following form, where we use C syntax to describe the control flow:

```c
    t = test-expr;
    if (!t) {
        goto false;
    }
    then-statement;
    goto done;
false:
    else-statement;
done:
```

Some practices:

- [3.16](../../practice/3.16/README.md)
- [3.17](../../practice/3.17/README.md)
- [3.18](../../practice/3.18/README.md)

### Transfer of Data to instead of Transfer of Control

THe conventional way to implement conditional operations is through a conditional transfer of control, Where the program follows one execution path when a condition holds and another when it does not.

It's simple, but it can be very inefficient on modern processors.

An alternate strategy is through a conditional transfer of data.(but it can only be used in restricted cases)

For example, the original C code is :

```cpp
long absdiff(long x, long y) {
    long result;
    if (x < y) {
        result = y - x;
    }
    else {
        result = x - y;
    }
    return result;
}
```

And implementation using conditional assignment:

```cpp
long cmovdiff(long x, long y) {
    long rval = y - x;
    long eval = x - y;
    long ntest = x >= y;
    if (ntest) {
        rval = eval;
    }
    return rval;
}
```

TO understand why code based on conditional data transfers can outperform code based on conditional control transfers, we must understand something about how modern processor operate.

Processors achieve high performance through **pipelining**, where an instruction is processed via a sequence of stages, each performing one small portion of the required operations. This approach achieves high performance by overlapping the steps of the successive instructions. To do this requires being able to determine the sequence of instructions to be executed well ahead of time in order to keep the pipeline full of instructions to be executed. When the machine encounter a conditional jump, it can't determine which way the branch will go until it has evaluated the branch condition. Processors employ sophisticated branch prediction logic to guess whether or not each jump instruction will be followed. As long as it can guess reliably(modern microprocessor designs try to achieve success rates on the order of 90%), the instruction pipeline will ke kept full of instructions. Mispredicting a jump, on the other hand, requires that the processor discard much of the work it has already done on future instruction and then begin filling the pipeline with instructions starting at the correct location. As we will see, such a misprediction can incur a serious penalty, say, 15-30 clock cycles of wasted effort, causing a serious degradation of program performance.

Practice:

- [3.19](../../practice/3.19/README.md)

But **not** all conditional expressions can be compiled using conditional moves.

For example:

```cpp
v = test-expr ? then-expr : else-expr;
```

If one of the `the-expr` or `else-expr` could possibly generate an error condition or a side effect, this could lead a invalid behavior.

For example:

```cpp
long cread(long* xp) {
    return xp ? *xp : 0;
}
```

if `xp` is `NULL`, and we also use condition data, then it will cause a dereferencing error.(because `NULL` point nothing.)

Some practices:

- [3.20](../../practice/3.20/README.md)
- [3.21](../../practice/3.21/README.md)

### Loop

C provide several lopping constructs: `do-while`, `while`, `for`. **No corresponding instructions exist in machine code**.

Instead, combination of conditional tests and jumps are used to implement the effect of loops.

Some practices:

- [3.22](../../practice/3.22/README.md)
- [3.23](../../practice/3.23/README.md)
- [3.24](../../practice/3.24/README.md)
- [3.25](../../practice/3.25/README.md)
- [3.26](../../practice/3.26/README.md)
- [3.27](../../practice/3.27/README.md)
- [3.28](../../practice/3.28/README.md)
- [3.29](../../practice/3.29/README.md)

### Switch

Switch statements not only make the C code more readable, but they also allow an efficient implementation using a data structure called a **jump table**.

- jump table: an array where entry `i` is the address of a code segment implementing the action the action the program should take when the switch index equals `i`.

The advantage of using a jump table over a long sequence of if-else statement is that the time taken to perform the switch is independent of the number of switch case.

Some practices:

- [3.30](../../practice/3.30/README.md)
- [3.31](../../practice/3.31/README.md)
