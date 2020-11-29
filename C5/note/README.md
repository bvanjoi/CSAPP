# Chapter5: Optimizing Program Performance

The primary objective in writing a program must be to make it work correctly under all possible conditions.

On the other hand, there are many occasions when making a program run fast is also an important consideration.

Writing an efficient program requires several types of activities:

1. select an appropriate set of algorithms and data structures.
2. write source code that the compiler can effectively optimize to turn into efficient executable code.(So, it's important to understand the capabilities and limitations of optimizing compilers).
3. divide a task into portions that can be computed in parallel, on some combination of multiple cores and multiple processors.

In approaching program development and optimization, we must consider how the code will be used and what critical factors affect.

- In general, programmers must make a trade-off between how easy a program is to implement and maintain, and how fast it runs.
- At an algorithmic level, a simple insertion sort can be programmed in a matter of minutes, whereas a highly efficient sort routine may take a day or more implement and optimize.
- At the coding level, many low-level optimizations tend to reduce code readability and modularity, making the programs more susceptible to bugs and more difficult to modify or extend.(For code that will be executed repeatedly in a performance-critical environment, extensive optimization may be appropriate).

One challenge is to maintain some degree of elegance and readability in the code despite extensive transformations.

Ideally, a compiler would be able to take whatever code we write and generate the most efficient possible machine-level program having the specified behavior. Modern compilers employ sophisticated forms of analysis and optimization, and they keep getting better.

However, even the best compilers can be thwarted by optimization blocker - aspects of the program's behavior that depend strongly on the execution environment. Programmers must assist the compiler by writing code that can be optimized readily.

- [Capabilities and Limitations of Optimizing Compilers](./limitations/README.md)
- [Expressing Program Performance](./performance/README.md)
- [Optimizing Program Performance](./example/README.md)
- [Understanding Modern Processors](./processors/README.md)
- [Loop Unrolling](./unroll_loop/README.md)
- [Enhancing Parallelism](./parallelism/README.md)

## Performance Improvement Techniques  Summary

- High-Level Design: Choose appropriate algorithms and data structures.
- Basic coding principles:
  - Eliminate excessive function calls.
  - Eliminate unnecessary memory references.
- Low-level optimizations:
  - Unroll loops to reduce overhead and to enable further optimizations.
  - Find ways to increase instruction-level parallelism.
  - Rewrite condition operations in a functional style to enable compilation via conditional data transfers.
