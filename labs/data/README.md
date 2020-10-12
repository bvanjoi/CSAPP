# Data

Before this lab, we need read README carefully.

## begin with README

In this lab, our goal is to modify *bits.c* so that it passes all the tests in btest. And we can't violating any of the coding guidelines.

### dlc

We can use *dlc* compiler to automatically check our version fo bits.c for compliance with the coding guidelines.

If there are no problems with code, `./dlc bits.c` returns silently. Otherwise it prints messages that flag any problem.

And we can run `./dlc -e bits.c` to print counts of the number of operators used by each functions.

### btest

Then, Testing with btest, which will test our code for correctness by running millions of test case on each function.

```bash
make btest
./btest
```

And we will need to recompile btest each time we change our bits.c program.

If we want to get rid of the old version of btest and generate a new one, we could use the commands: `make clean`.

But btest does not check code for compliance with the coding guidelines. Use dlc to do that.

#### NOTIFICATION

I write a shell script `auto_test.sh` so that you can test quickly by run this script.

And I limited the time is 20 seconds, because the last function may exceed time in some environment if limits is 10.

Also, I suggest you change the var `TIMEOUT_LIMIT` of `btest.c` from 10 to 20.

### helper

`ishow` and `fshow` programs to help we decipher integer and floating point representations respectively.

## bits.c

### FOR INTEGER

ONLY can use following:

1. Integer constants 0 through 0xFF, inclusive. Not allowed to use big constants such as 0xFFFFFFFF.
2. Function arguments and local variables.
3. Unary integer operations ! ~
4. Binary integer operations & ^ | + << >>

And FORDID to:

1. Use any control constructs such as: if, do, while, for, switch, etc.
2. Define or use any macros.
3. Define any additional functions in this file.
4. Call any function.
5. Use any other operations, such as ||, &&, -, ?:
6. Use any form of casting.
7. Use any data type other than int.

And ASSUME that machine:

1. Uses 2s complement, 32-bit representations of integers.
2. Performs right shifts arithmetically.
3. Has unpredictable behavior when shifting if the shift amount is less than 0 or greater than 31.

### FOR FORDID

1. Allowed to use looping and conditional control.
2. Allowed to use both ints and unsigneds.
3. Allowed to use any arithmetic, logical, or comparison operations.
4. Forbidden to define or use any macros.
5. Forbidden to define any additional functions.
6. Forbidden to call any functions.
7. Forbidden to use any form of casting.
8. Forbidden to use any data type other than int or unsigned.
9. Forbidden to use any floating point data types, operations, or constant.
