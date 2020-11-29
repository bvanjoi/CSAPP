# Understanding Modern Processors

To understand ways to improve performance, we require a basic understanding of the microarchitectures of modern processors.

Due to the large number of transistors that can be integrated onto a single chip, modern microprocessors employ complex hardware that attempts to maximize program performance. One result is that their actual operation is far different from the view that is perceived by looking at machine-level programs.

At **code level**, ite appears as if instructions are executed one at a time, where each instructions involves fetching values from registers or memory, performing an operation, and storing results back to a register or memory location. In the actual processor, a number of instructions are evaluated simultaneously, a phenomenon referred  to as **instruction-level parallelism**.

- latency bound: a series of operations must be performed in strict sequence, because the result of one operation is required before the next one can begin.
- throughput bound: characterizes the raw computing capacity of the processor's functional units.

- ICU: instruction control unit, which is responsible for reading a sequence of instructions from memory and generating from theses a set of primitive operations to perform on program data.
- CU: execution unit, which then executes theses operations.

The ICU reads the instructions from an **instruction cache** — a special high-speed memory containing the most recently accessed instruction. In general, the ICU fetches well ahead of the currently executing instructions, so that it has enough time to decode these and send operations down to the EU.

One problem, is that when a program hits a branch, there are two possible directions the program might go. Modern processors employ a technique known as **branch prediction**, in which they guess whether or not a branch will be taken and also predict the target address for the branch.

## Functional Unit Performance

- latency: meaning the total time required to perform the operation.
- issue time: meaning the minimum number of clock cycles between two independent operations of the same type.
- capacity: indicating the number of functional units capable of performing that operation.

Computing the product or sum of $n$ elements requires around $L * n + K$ clock cycles, where $L$ is the latency of the combining operation and $K$ represents the overhead of calling the function and initiating and terminating the loop. The CPE is therefore equal to the latency bound $L$.

## From machine-Level Code to Data-Flow Graphs

Our data-flow representation of programs is informal. We use it as a way to visualize how the data dependencies in a program dictate its performance.

For code `combine4`:

```cpp
void combine4(vec_ptr v, data_t *dest) {
    long i;
    long length = vec_length(v);
    data_t *data = gec_vec_start(v);
    data_t acc = IDENT;

    for (i = 0; i < length; i++) {
        acc = acc OP data[i];
    }
    *dest = acc;
}
```

The assembly code that follows show:

```x86asm
; Inner loop of combine4, data_t = double, OP = *
; acc in %xmm0, data + i in %rdx, data + length in %rax.
.L25
  vmulsd (%rdx), %xmm0, %xmm0
  addq   $8, %rdx
  cmpq   %rax, %rdx
  jne    .L25
```

The graphical representation of inner-loop code for combine4:

```txt
 %xmm0          %rdx   %rax
   |             |      |
   |   load <----|      |
   |    |        |      |
    mul         add     |
     |           |----> cmp
     |           |      |
     |           |      jne
   %xmm0        %rdx
```

For a code segment forming a loop, we can classify the register that are accessed into four categories:

- Read-only: These are used as source value, either as data or to compute memory addresses, but they are not modified within the loop. The only read-only register for the loop in `combine4` is `%rax`.
- Write-only: These are used as the destinations of data-movement operations, there are no such registers in this loop.
- Local: These are updated and used within the loop, but there is no dependency form one iteration to another.
- Loop: THeses are used both as source values and as destinations for the loop, with the value generated in one iteration being used in another.

Practices:

- [5.5](../../practice/5.5/README.md)
- [5.6](../../practice/5.6/README.md)
