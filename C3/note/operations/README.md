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

### Condition Codes

- CF: carry flag. The most recent operation generated a carry out of the most significant bit. Used to detect overflow for unsigned operations.
- ZF: zero flag. The most recent operation yielded zero.
- SF: sign flag. The most recent operation yielded a negative value.
- OF: overflow flag. The most recent operation caused a two's-complement overflow, either negative or positive.
