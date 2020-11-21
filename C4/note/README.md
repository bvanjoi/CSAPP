# Chapter4: Processor Architecture

Different "families" of processors, such as Intel IA32 and x86-64, IBM/Freescale Power, and the ARM processor family, have **different** ISAs(instruction set architecture), so *a program compiled for one type of machine will not run on another*.

There are many different models of processors within a single family, each manufacturer produces processors of ever-growing performance and complexity, but the different models **remain compatible** at the ISA level. Thus, the ISA provides a conceptual layer of abstraction between compiler writers, who need only know what instructions are permitted and how they are encoded, and processor designers, who must build machines that execute those instructions.

In this chapter, we take a brief look at the design of processor hardware. We study the way a hardware system can execute the instructions of a particular ISA. **One important concept is that the actual way a modern processor operates can be different from the model of computation implied by the ISA**. The ISA model would seem to imply **sequential** instructions simultaneously, the processor can achieve higher performance than if it executed just one instruction at a time. By executing different parts of multiple instructions simultaneously, the processor can achieve higher performance than if it executed just one instruction at a time. Special mechanisms are used to make sure the processor computes the same results as it would with sequential execution.

In this chapter, we start by *defining* a simple instruction set that we use as a running example for our processor implementations. We call this the "Y86-64" instruction set. Compared with x86-64, the Y86-64 instruction set has fewer data types, instructions, and addressing modes. It also has a simple byte-level encoding, making the machine code less compact than the comparable x86-64 code, but also much easier to design the CPU's decoding logic.

A function correct, but somewhat impractical: Y86-64 processor based on **sequential** operation.

With the sequential design as a basis, we then apply a series of transformations to create a **pipelined** processor. The processor breaks the execution of each instruction into five steps, each of which is handled by a separate section or **stage** of the hardware. Instructions progress through the stages of the pipeline, with one instruction entering the pipeline on each clock cycle. As a result, the processor can be executing the different steps of up to five instructions simultaneously. Making this processor preserve the sequential behavior of the Y86-64 ISA requires handling a variety of hazard conditions, where the location or operands of one instruction depend on those of other instructions that are still in the pipeline.

- [The Y86-64 Instruction Set Architecture](./Y86-64ISA/README.md)
- [Hardware Control Language](./HCL/README.md)
- [Sequential Y86-64 Implementations](./sequential/README.md)
- [General Principles of Pipelining](./pipelining/principles.md)
- [Pipelined Y86-64 Implementations](./pipelining/implementations.md)
