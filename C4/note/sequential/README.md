# Sequential Y86-64 Implementations

As a first step, we describe a processor called SEQ(for sequential processor).

On each clock cycle, SEQ performs all the step required to process a complete instruction. This would require a very long cycle time, however, and so the clock rate would be unacceptably low.

Our purpose in developing SEQ is to provide a first step toward our ultimate goal of implementing an efficient pipelined processor.

## Organizing Processing into Stages

In general, processing an instruction involves a number of operations:

![Abstract view of SEQ, a sequential implementation](https://img-blog.csdnimg.cn/20201101195037434.png)

- Fetch. The fetch stage reads the bytes of an instruction from memory, using the PC as the memory address. The PC incrementer computes `valP`, the incremented program counter.
- Decode. The register file has two read ports: A and B, via which register values `valA` and `valB` are read simultaneously.
- Execute. In the execute stage, the ALU either performs the operation specified by the instruction(according to the value of `ifun`), computes the effective address of a memory reference, or increments or decrements the stack pointer. We refer to the resulting value as `valE`. The condition codes are possibly set. For a conditional move instruction, the stage will evaluate the condition codes and move condition(given by `ifun`) and enable the updating of  the destination register only if the condition holds. The condition code register holds the three condition code bits, new values for the condition codes are computed by the ALU.
- Memory. Write data to memory, or it may read data from memory. We refer to the value read as `valM`.
- Write Back. The write-back stage writes up to two results to the register file. Port E is used to write values computed by the ALU, while port M is used to write values read from the data memory.
- PC update. the new value of PC is selected to be either `valP`, the address of the next instruction. `valC`, the destination address specified by a call or jump instruction. Or `valM`, the return address read from memory.

## SEQ Hardware Structure

More detailed view of the hardware:

![Hardware structure of SEQ, a sequential implementation](https://img-blog.csdnimg.cn/20201101200452705.png)

## SEQ Timing

Our implementation of SEQ consists of combinational logic and two forms of memory devices:

1. clocked register(the program counter and condition code register)
2. random access memories(the register file, the instruction memory and the data memory)

Combinational logic does not require any sequencing or control, values propagate through a network of logic gates whenever the inputs change.

As we have described, we also assume that reading from a random access memory operates much like combinational logic, with the output word generated based on the addressing input. This is a reasonable assumption for smaller memories(such as the register file), and we can mimic this effect for larger circuits using special clock circuits. Since our instruction memory is only used to read instructions, we can therefore treat this unit as if it were combinational logic.

We are left with just four hardware units that require an explicit control over their sequencing:

1. PC; it's loaded with a new instruction address every clock cycle.
2. the condition code register; it's loaded only when an integer operation instruction is executed.
3. the data memory; it's written only when an `rmmovq`, `pushq`, `call` instruction is executed.
4. the register file. The two write ports of the register file allow two program registers to be updated on every cycle, but we can use the special register ID `0xF` as a port address to indicate that no write should be performed for this port.

PRINCIPLE:

- No reading back: The processor never needs to read back the state updated by an instruction in order to complete the processing of this instruction.

## SEQ Stage Implementations

In this section, we devise HCL descriptions for the control logic blocks required to implement SEQ.

Define some constants:

| Name     | Value | Meaning |
| -        |  -    |   -     |
|`IHALT`   | 0     | code for `halt` instruction |
|`INOP`    | 1     | code for `nop` instruction  |
|`IRRMOVQ` | 2     | code for `rrmovq` instruction  |
|`IIRMOVQ` | 3     | code for `irmovq` instruction  |
|`IRMMOVQ` | 4     | code for `rmmovq` instruction  |
|`IMRMOVQ` | 5     | code for `mrmovq` instruction  |
|`IOPQ`    | 6     | code for integer operation instructions |
|`IJXX`    | 7     | code for jump instructions   |
|`ICALL`   | 8     | code for `call` instructions |
|`IRET`    | 9     | code for `ret` instructions  |
|`IPUSHQ`  | A     | code for `pushq` instructions  |
|`IPOPQ`   | B     | code for `popq` instructions   |
|`FNONE`   | 0     | Default function code        |
|`RRSP`    | 4     | Register ID for `%rsp`       |
|`RNONE`   | F     | Indicates no register file access    |
|`ALUADD`  | 0     | Function for addition operation    |
|`SAOK`    | 1     | Status code for normal operation    |
|`SADR`    | 2     | Status code for address exception    |
|`SINS`    | 3     | Status code for illegal instruction exception    |
|`SHLT`    | 4     | Status code for `halt`    |

### Fetch Stage

![SEQ Fetch Stage](https://img-blog.csdnimg.cn/20201103092159274.png)

As shown in above, the fetch stage includes the instruction memory hardware unit. This unit reads 10 bytes from memory at a time, using hte PC as the address of the first byte(byte 0). The bytes is interpreted as the instruction byte and is split into two 4-bit quantities. The control logic blocks labeled "incode" and "ifun" then compute the instruction and function codes as equaling either the values read from memory or, in the event that the instruction address is not valid(as indicated by the signal `imem_error`), the value corresponding to a `nop` instruction. Based on the value of `icode`, we can compute three  1-bit signals:

- `instr_valid`: Does this byte correspond to a legal Y86-64 instruction? This signal is used to detect an illegal instruction.
- `need_regids`: Does this instruction include a register specifier byte?
- `need_valC`: Does this instruction include a constant word?

The signals `instr_valid` and `imem_error` are used to generate the status code in the memory stage.

The HCL description for `need_regids` simply determines whether the value of `icode` is one of the instructions that has a register specifier byte:

```cpp
bool need_regids = icode in { IRRMOVQ, IOPQ, IPUSHQ, IPOPQ, IIRMOVQ, IRMMOVQ, IMRMOVQ };
```

The HCL code for the signal `need_valC` in the SEQ implementation:

```cpp
bool need_valC = icode in { IIRMOVQ, IRMMOVQ, IMRMOVQ, IJXX, ICALL };
```

### Decode and Write-Back Stages

![SEQ decode and write-back stage](https://img-blog.csdnimg.cn/20201104090247117.png)

Above picture provide a detailed view of logic that implements both the decode and write-back stages in SEQ. These two stages are combined because they both access the register file.

The register file has four ports. It supports up to two simultaneous reads(on ports A and B) and two simultaneous writes(on ports E and M). Each prot has both an address connection and a data connection, where the address connection is a register ID, and the data connection is a set of 64 wires serving as either an output word(for a read port)or an input word(for a write prot) of the register file. The two read ports have address inputs `srcA` and `srcB`, while the two write ports have address inputs `dstE` and `dstM`.

```cpp
word srcA = [
    icode in {IRRMOVQ, IRMVOQ, IOPQ, IPUSHQ} : rA;
    icode in { IPOPQ, IRET } : RRSP;
    1 : RNONE;
]

word src B = [
    icode in { IOPQ, IRMMOVQ, IMRMOVQ } : rB;
    icode in { IPUSHQ, IPOPQ, ICALL, IRET } : RRSP;
    1 : RNONE;
]

word dstE = [
    icode in { IRRMOVQ } : rB;
    icode in { IIRMOVQ, IOPQ} : rB;
    icode in { IPUSHQ, IPOPQ, ICALL, IRET } : RRSP;
    1 : RNONE;
]

word dstM = [
    icode in { IMRMOVQ, IPOPQ } : rA;
    1 : RNONE;
]
```

### Execute Stage

The execute stage includes the ALU. This unit performs the operation `ADD`, `SUBTRACT`, `AND` or `EXCLUSIVE-OR` on inputs `aluA` and `aluB` based on the setting of the `alufun` signal. These data and control signals are generated by three control block, as diagrammed following:

![SEQ execute stage](https://img-blog.csdnimg.cn/20201104092506942.png)

The ALU computation for each instruction is shown as the first step in execute stage. The operands are listed with `aluB` first, followed by `aluA` to make sure the `subq` instruction subtracts `valA` from `valB`. We can see that the value of `aluA` can be `valA`, `valC`, or either `-8` or `+8`, depending on the instruction type.

```cpp
word aluA = [
    icode in { IRRMOVQ, IOPQ } : valA;
    icode in { IIRMOVQ, IRMMOVQ, IMRMOVQ } : valC;
    icode in { ICALL, IPUSHQ } : -8;
    icode in { IRET, IPOPQ } : 8;
];

word aluB = [
    icode in { IRMMOVQ, IMRMOVQ, IOPQ, ICALL, IPUSHQ, IRET, IPOPQ } : valB;
    icode in { IRRMOVQ, IIRMOVQ } : 0;
];

word alufun = [
    icode == IOPQ : ifun;
    1 : ALUADD;
]

bool set_cc = icode in {IOPQ};

word dstE = [
    icode in { IRRMOVQ } && Cnd : rB;
    icode in { IIRMOVQ, IOPQ } : rB;
    icode in { IPUSHQ, IPOPQ, ICALL, IRET } : RRSP;
    1 : RNONE;
];
```

### Memory Stage

![SEQ memory stage](https://img-blog.csdnimg.cn/20201105085341407.png)

The memory stage has the task of either reading or writing program data. As shown above, two control blocks generate the values for the memory address and the memory input data. Two other blocks generate the control signals indicating whether to perform a read or a write operation.

```cpp
word mem_addr = [
    icode in { IRMMOVQ, IPUSHQ, ICALL, IMRMOVQ } : valE;
    icode in { IPOPQ, IRET } : valA;
];

word mem_data = [
    icode in {IRMMOVQ, IPUSHQ} : valA;
    icode == ICALL : valP;
];

bool mem_read = icode in { IMRMOVQ, IPOPQ, IRET };

bool mem_write = icode in { IRMMOVQ, IPUSHQ, ICALL };

word Stat = [
    imem_error || dmem_error : SADR;
    !instr_valid: SINS;
    icode == IHALT : SHLT;
    1 : SAOK;
]
```

### PC Update Stage

![SEQ PC update stage](https://img-blog.csdnimg.cn/20201105090440690.png)

The final stage in SEQ generates the new value of the program counter,  The new PC will be `valC`, `valM`, or `valP`, depending on the instruction type and whether or not a branch should be taken.

```cpp
word new_pc = [
    icode == ICALL : valC;
    icode == IJXX && Cnd : valC;
    icode == IRET : valM;
    1 : valP;
]
```

Practices:

- [4.13](../../practice/4.13/README.md)
- [4.14](../../practice/4.14/README.md)
- [4.15](../../practice/4.15/README.md)
- [4.16](../../practice/4.16/README.md)
- [4.17](../../practice/4.17/README.md)
- [4.18](../../practice/4.18/README.md)
- [4.19](../../practice/4.19/README.md)
- [4.20](../../practice/4.20/README.md)
- [4.21](../../practice/4.21/README.md)
- [4.22](../../practice/4.22/README.md)
- [4.23](../../practice/4.23/README.md)
- [4.24](../../practice/4.24/README.md)
- [4.25](../../practice/4.25/README.md)
- [4.26](../../practice/4.26/README.md)
- [4.27](../../practice/4.27/README.md)
