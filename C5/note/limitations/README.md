# Capabilities and Limitations of Optimizing Compilers

Compiler must be careful to apply only **safe** optimizations to a program, meaning that the resulting program will have the exact same behavior as would an unoptimized version for all possible cases the program may encounter, up to the limits of the guarantees provided by C language standards.

To appreciate the challenges of deciding which program transformations are safe or not, consider the following two procedures:

```cpp
void twiddle1(long* xp, long* yp) {
    *xp += *yp;
    *xp += *yp;
}

void twiddle2(long* xp, long* yp) {
    *xp = 2 * *yp;
}
```

At first glance, both procedures seem to have identical behavior. But if `xp` and `yp` are equal, the function had different result!

Another example: **memory aliasing**:

```cpp
x = 1000, y = 3000;
*q = y;
*p = x;
t = *q; // t is 1000 or 3000, because maybe q equals p.
// if a compiler can't determine whether or not two pointers may be aliased, it must assume that either case is possible, limiting the set of possible optimizations.
```

Practice:

- [5.1](../../practice/5.1/README.md)

Another optimization blocker is due to functions calls. For example, consider the following two procedures:

```cpp
long f();

long func1() {
    return f() + f() + f() + f();
}

long func2() {
    return 4 * f();
}
```

It might seem at first that both compute the same result, but if `f()` is, then the result of `func1()` is 6, but `func2()` is 0.

```cpp
long count = 0;
long f() { // this function has a side effect, it caused func1 difference with func2.
    return counter++;
}
```

---

Assume that a program requires a total of $N$ computations of some operation, that the microprocessor has $C$ functional units capable of performing that operation, and that these units have an issue time of $I$. Then the program will require at least $N * I / C$ cycles to execute.

## Register Spilling

The benefits of loop parallelism are limited by the ability to express the computation in assembly code. If a program has a degree of parallelism P that exceeds the number of available registers, then the computer will resort to spilling, storing some of the temporary values in memory, typically by allocating space on the run-time stack.

## Branch Prediction and Misprediction Penalties

In a processor that employs speculative execution, the processor begins executing the instructions at the predicted branch target. It does this in a way that avoids modifying any actual register or memory locations until the actual outcome has been determined.

If the prediction is correct, the processor can then "commit" the results of the speculatively executed instructions by storing then in registers or memory.

But if the prediction is incorrect, the processor must discard all of the speculatively executed results and restart the instruction fetch process at the correct location.

The misprediction penalty is incurred in doing this, because the instruction pipeline must be refilled before useful results are generated.

Practice:

- [5.9](../../practice/5.9/README.md)
