# Pipelined Y86-64 Implementations

## SEQ+: Rearranging the Computation Stages

As a transitional step toward a pipelined design, we must slightly rearrange the order of five stages in SEQ so that the PC update stage comes at the beginning of the clock cycle, rather than at the end. We refer to this modified design as SEQ+.

The differ in PC computation between SEQ and SEQ+:

![Shifting the timing of the PC computation](https://img-blog.csdnimg.cn/20201109085436703.png)

With SEQ, the PC computation takes place at the end of the clock cycle, computing the new value for the PC register based on the values of signals computed during the current clock cycle.

With SEQ+, we create state registers to hold the signals computed during an instruction. Then, as a new clock begins, the values propagate through the exact same logic to compute the PC for the now-current instruction. There is no hardware register storing the program counter. Instead the PC is computed dynamically based on some state information stored form the previous instruction. We label the registers "pIcode" and "pCnd" and son on, to indicate that on any given cycle, they hold the control signals generated during the previous cycle.

More detailed view of the SEQ+ hardware:

![SEQ+ hardware structure](https://img-blog.csdnimg.cn/20201109090640336.png)

## Inserting Pipeline Registers

The structure of PIPE- is following:

![Hardware structure of PIPE-, an initial pipelined implementation](https://img-blog.csdnimg.cn/20201109091202150.png)

- F: holds a predicted value of the program counter.
- D: sits between the fetch and decode stages. It holds information about the most recently fetched instruction for processing by the decode stage.
- E: sits between decode and execute stages. It holds information about the most recently decoded instruction and the values reads from the register file for processing by the execute stage.
- M: sits between the execute and memory stages. It holds the results of the most recently executed instruction for processing by the memory stage. It also holds information about branch conditions and branch targets for processing conditional jumps.
- W: sits between the memory stage and the feedback paths that supply the computed results to the register file for writing and the return address to the PC selection logic when completing a `ret` instruction.

For example:

```x86asm
                  # cycle: 1  2  3  4  5  6  7  8  9  
irmovq $1, %rax   # I1     F  D  E  M  W
irmovq $2, %rbx   # I2        F  D  E  M  W
irmovq $3, %rcx   # I3           F  D  E  M  W
irmovq $4, %rdx   # I4              F  D  E  M  W
halt              # I5                 F  D  E  M  W
```

## Pipeline Hazards

Our structure PIPE- is a good start at creating a pipelined Y86-64 processor.

But the feedback of pipelining can lead to problems when there are dependencies between successive instructions. Theses dependencies an take two forms:

- data dependencies, where the results computed by one instruction are used as the data for a following instruction.
- control dependencies, where one instruction determines the location of the following instruction, such as when executing a jump, call or return.

When such dependencies have the potential to cause an erroneous computation by the pipeline, they are called **hazards**.

For example. Let us assume in this example and successive ones that the program register initially all have value 0. In cycle 6, the incorrect value zero would be read for register `%rax`. (If we add one `nop`, this problem will solved.)

```x86asm
                      # cycle  1  2  3  4  5  6  7  8  9  10  11
irrmovq $10, %rdx              F  D  E  M  W
irrmovq  $3, %rax                 F  D  E  M  W
nop                                  F  D  E  M  W
nop                                     F  D  E  M  W
addq   %rdx, %rax                          F  D  E  M  W
halt                                          F  D  E  M  W
```

### Avoid Data Hazards

- Avoiding Data Hazards by Stalling. For example, `addq` get the right value in cycle7.

  ```x86asm
                        # cycle  1  2  3  4  5  6  7  8  9  10  11
  irrmovq $10, %rdx              F  D  E  M  W
  irrmovq  $3, %rax                 F  D  E  M  W
  nop                                  F  D  E  M  W
  nop                                     F  D  E  M  W
  bubble                                           E  M  W
  addq   %rdx, %rax                          F  D  D  E  M  W
  halt                                          F  F  D  E  M   W
  ```

- Avoiding Data Hazards by Forwarding. Our design for PIPE- reads source operands from the register file in the decode stage, but there can also be a pending write to one of these source registers in the write-back stage. For example:

  ```x86asm
                        # cycle  1  2  3  4  5  6  7  8  9  10
  irrmovq $10, %rdx              F  D  E  M  W
  irrmovq  $3, %rax                 F  D  E  M  W
  nop                                  F  D  E  M  W
  nop                                     F  D  E  M  W
  addq   %rdx, %rax                          F  D  E  M  W
  halt                                          F  D  E  M  W

                                              W:
                                              W_dstE = %rax
                                              W_valE = 3 ---------
                                                                  |
                                                                  |
                                                                  \/
                                              D:
                                              srcA = %rdx valA <- R[%rdx] = 10
                                              srcB = %rax valB <- W_valE = 3
  ```

### Avoiding Control Hazards

Control hazards arise when the processor can't reliably determine the address of the next instruction based on the current instruction in the fetch stage. It only occur for `ret` and jump instructions.

The method to avoiding control hazards is **cancel**(sometimes called **instruction squashing**).

## PIPE Stage Implementations

- Fetch Stage: this stage must also select a current value for the program counter and predict the next PC value.

![PIPE PC selection and fetch logic](https://img-blog.csdnimg.cn/20201119091848244.png)

```python
word f_pc = [
    # Mispredicted branch. Fetch at incremented PC
    M_icode == IJXX && !M_Cnd : M_valA;
    # Completion of RET instruction
    W_icode == IRET : W_valM;
    # Default: Use predicted value of PC
    1: F_predPC;
]

word f_predPC = [
    f_icode in { IJXX, ICALL } : f_valC;
    1 : f_valP;
]

word f_stat = [
    imem_error: SADR;
    !instr_valid: SINS;
    f_icode == IHALT : SHLT;
    1 : SAOK;
]
```

- Decode and Write Stage:

![PIPE decode and write-back stage logic](https://img-blog.csdnimg.cn/20201121113854802.png)

```python
word d_dstE = [
    D_icode in { IRRMOVQ, IIRMOVQ, IOPQ } : D_rB;
    D_icode in { IPUSHQ, IPOPQ, ICALL, IRET } : RRSP;
    1 : RNONE;
]

word d_valA = [
    D_icode in { ICALL, IJXX } : D_valP;
    d_srcA == e_dstE : e_valE; # Forward valE from execute
    d_srcA == M_dstM : m_valM; # Forward valM from memory
    d_srcA == M_dstE : M_valE; # Forward valE form memory
    d_srcA == W_dstM : W_valM; # Forward valM from write back
    d_srcA == W_dstE : W_valE; # Forward valE from write back
    1 : d_rvalA; # Use value read from register file
]

word d_valB = [
    d_srcB == e_dstE : e_valE;  # Forward valE from execute
    d_srcB == M_dstM : m_valM;  # Forward valM from memory
    d_srcB == M_dstE : M_valE;  # Forward valE from memory
    d_srcB == W_dstM : W_valM;  # Forward valM from write back
    d_srcB == W_dstE : W_valE;  # Forward valE from write back
    1 : d_rvalB;
]

word Stat = [
    W_Stat = SBUB : SAOK;
    1 : W_stat;
]
```

- Execute Stage:

![PIPE execute stage logic](https://img-blog.csdnimg.cn/20201121121414283.png)

- Memory Stage:

![PIPE memory stage logic](https://img-blog.csdnimg.cn/2020112112263086.png)

```python
word m_stat = [
    dmem_error: SADR;
    1 : M_stat;
]
```

Some practices:

- [4.30](../../practice/4.30/README.md)
- [4.31](../../practice/4.31/README.md)
- [4.32](../../practice/4.32/README.md)
- [4.33](../../practice/4.33/README.md)
- [4.34](../../practice/4.34/README.md)
- [4.35](../../practice/4.35/README.md)
- [4.36](../../practice/4.36/README.md)

## Pipeline Control Logic

Pipeline control logic must handle the following four control cases for which other mechanisms, such as data forwarding and branch prediction, do not suffice:

| Condition | Trigger |
| -         | -       |
| Load/use hazards | `IRET in {D_icode, E_icode, M_icode}` |
| Processing ret   | `E_icode in {IMRMOVQ, IPOPQ} && E_dstM in {d_srcA, d_srcB}`|
| Mispredicted branch | `E_icode == IJXX && !e_Cnd` |
| Exception | `m_stat in {SADR, SINS, SHLT} || W_stat in {SADR SINS, SHLT}` |

### Pipeline Control Mechanisms

![Additional pipeline register operation](https://img-blog.csdnimg.cn/20201121130712274.png)

Suppose that each pipeline register has two control inputs stall and buddle. The settings of these signals determine how the pipeline register is updated as the clock rise.

And following table shows the actions the different pipeline stages should take for each of the three special condition.

| Condition | F | D | E | M | W |
| -         | - | - | - | - | - |
| Processing ret   | stall | bubble | normal | normal | normal |
| Load/use hazard  | stall | stall  | buddle | normal | normal |
| Mispredicted branch | normal | bubble | bubble | normal | normal |

Some practices:

- [4.37](../../practice/4.37/README.md)
- [4.38](../../practice/4.38/README.md)

## Control Logic Implementation

```python
bool F_stall =
  E_icode in { IMRMOVQ, IPOPQ } &&
  E_dstM in { d_srcA, d_srcB } ||
  IRET in { D_icode, E_icode, M_icode};

bool D_stall =
  E_icode in { IMRMOVQ, IPOPQ } &&
  E_dstM in { d_srcA, d_srcB };

bool D_bubble =
  (E_icode == IJXX && !e_Cnd) ||
  !(E_icode in { IMRMOVQ, IPOPQ } &&
    E_dstM in { d_srcA, d_srcB } &&
    IRET in { D_icode, E_icode, M_icode }
  );

bool E_bubble =
  (E_icode == IJXX && !e_Cnd) ||
  !(E_icode in { IMRMOVQ, IPOPQ } &&
    E_dstM in { d_srcA, d_srcB }
  );

bool set_cc =
  E_icode == IOPQ &&
  !m_stat in { SADR, SINS, SHLT } &&
  !W_stat in { SADR, SINS, SHLT };

bool M_bubble =
  m_stat in { SADR, SINS, SHLT } ||
  W_stat in { SADR, SINS, SHLT };

bool W_stall = W_stat in { SADR, SINS, SHLT };
```

Some practices:

- [4.39](../../practice/4.39/README.md)
- [4.40](../../practice/4.40/README.md)
- [4.41](../../practice/4.41/README.md)
- [4.42](../../practice/4.42/README.md)

## Performance Analysis

$CPI = (C_i + C_b) / C_i$

where $C_b$ is number of bubbles; $C_i$ is the number of instruction.

or: $CPI = 1.0 + lp + mp + rp$.

where lp is load penalty, mp is mispredicted branch penalty, rp is return penalty.

Some practices:

- [4.43](../../practice/4.43/README.md)
- [4.44](../../practice/4.44/README.md)
