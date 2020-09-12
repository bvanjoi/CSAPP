# Concurrency and Parallelism

Throughout the history of digital computers, two demands have been constant forces in driving improvements: 1. to do more; 2. run faster.

- concurrency: the general concept of a system with multiple, simultaneous activities.
- parallelism: the use of concurrency to make a system run faster. Parallelism can be exploited at multiple levels of abstraction in a computer system.

## Thread-Level Concurrency

Building on the process abstraction, we are able to devise systems where multiple programs execute at the same time, leading to concurrency.

Traditionally, this concurrent execution was only simulated, **by having a ingle computer rapidly switch among its executing processes**. This form of concurrency allows multiple users to interact with a system at the same time, such as when many people want to get pages from a single Web server. It also allows a single user to engage in multiple tasks concurrently, such as having a Web browser in one window, a word processor in another, and streaming music playing at the same time.

Until recently, most actual computing was done by a single processor, even if that processor had to switch among multiple tasks. This configuration is known as a **uniprocessor system**.

When we construct a system consisting of multiple processors all under the control of a single operating system kernel, we have a **multiprocessor system**. Such systems have been available for large-scale computing since the 1980s, but they have more recently become commonplace with the advent of multi-core processors and **hyperthreading**.
![Categorizing different processor configurations](https://img-blog.csdnimg.cn/20200912095020104.png)

Multi-core processors have several CPUs(referred to as 'cores') integrated onto a single integrated-circuit chip. And the following figure illustrates the organization of a typical multi-core processor, where the chip has four CPU cores, each with its own L1 and L2 caches, and with each L1 cache split into two parts-one to hold recently fetched instructions and one to hold data. The cores  share higher levels of cache as well as the interface to main memory.
![Multi-core processor organization](https://img-blog.csdnimg.cn/20200912095356441.png)

Hyperthreading, sometimes called simultaneous multi-threading, is a technique that allows a single CPU execute multiple flows of control. It involves having multiple copies of some of the CPU hardware, such as program counters and register files, while having only single copies of other parts of the hardware, such as the units that perform floating-point arithmetic.

The use of multiprocessing can improve system performance in two ways: 1. First it reduces the need to simulate concurrency when performing multiple tasks. 2. Second, it can run a single application program faster, but only if that program is expressed in terms of multiple threads that can effectively execute in parallel.

## Instruction-Level Parallelism

At a much lower level of abstraction, modern processors can execute multiple instructions at one time, a property known as instruction-level parallelism.

- pipelining: the actions required to execute an instruction are partitioned into different steps and the processor hardware is organized as a series of stages, each performing one of these steps. The stages can operate in parallel, working on different parts of different instructions.
- superscalar: processors that can sustain execution rates faster than 1 instruction per cycle are known as superscalar processors.

## Single-Instruction, Multiple-Data(SIMD) Parallelism

- SIMD(single-instruction, multiple-data): a single instruction to cause multiple operations to be performed in parallel.
These SIMD instructions are provided mostly to speed up applications that process image, sound and video date.
