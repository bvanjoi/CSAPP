# General Principles oof Pipelining

In section [Sequential Y86-64 Implementations](../sequential/README.md), we had stepped through a complete design for a Y86-64 processor. But this style of implementation does not make very good use of our hardware units, since each unit is only active for a fraction of the total clock cycle. We will see that we can achieve much better performance by introducing pipelining.

But before attempting to design a **pipelined** Y86-64 processor, let us consider some general properties and principles of pipelined systems.

A key feature of pipelining is that it increase the **throughput** of the system, but it may also slightly increase tha **latency**.

## A Detailed Look at Pipeline Operation

Let us look in some detail at the timing and operation of pipeline computations.

First, following is a unpipeleined computation hardware.

![Unpipelined computation hardware](https://img-blog.csdnimg.cn/20201107195742410.png)

We could divide the computation performed into three stages, A, B, C:

![Three-stage pipelined computation hardware](https://img-blog.csdnimg.cn/20201107200106377.png)

The following picture traces the circuit activity between times 240 and 360, as instruction I1 propagates through stage C; I2 propagates through stage B; and I3 propagates through stage A.( I1, shown in dark gray; I2, shown in blue; I3, shown in light gray.)

![One clock cycle of pipeline operation](https://img-blog.csdnimg.cn/20201107200302929.png)

## Limitations of Pipelining

Above picture shows an ideal pipelined system. Unfortunately, other factors often arise that diminish the effectiveness of pipelining.

- nonuniform partitioning: following picture shows a system in which we divide the computation into three stages as before, but the delays through the stages range from 50ps to 150ps, so that we must setting the clock cycle is `max(50,150,100) + 20 = 170`.
![Limitations of pipelining due to nonuniform stage delays](https://img-blog.csdnimg.cn/20201107205338791.png)
- diminishing returns of deep pipelining: in the following picture, we have divided the computation into six stages, each requiring 50ps. Although throughput had improved, but doubling the number of pipeline stages, we improve the performance by a factor of 14.29/8.33 = 1.71. And the delay becomes a limiting factor.
![Limitations of pipelining due to overhead](https://img-blog.csdnimg.cn/20201107212911660.png)

Practices:

- [4.28](../../practice/4.28/README.md)
- [4.29](../../practice/4.29/README.md)

## Pipelining a System with Feedback

Up to this point, we have considered only systems in which the objects passing through the pipeline are completely independent of oen another.

For a system that executes machine programs, however, there are potential dependencies between successive instructions.

For example:

```x86asm
irrmovq $50, %rax
addq %rax, %rbx         ; %rax had used line1
mrmovq 100(%rbx), %rdx  ; %rbx had used line2
```

There is a *data dependency* between each successive pair of instructions.

Another example is *control dependency*:

```x86asm
loop:
    subq %rdx, %rbx
    jne targ            ; CC had used the result of above line
    irmovq $10, %rdx
    jmp loop
targ:
    halt
```
