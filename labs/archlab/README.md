# Architecture

## Build lab

Firstly, we need build the lab.

1. In the root directory of this lab, install some tools: `sudo apt install tcl tcl-dev tk tk-dev` and `sudo apt-get install flex bison`.
2. Modify the version of tcl in *Makefile*: `sed -i "s/tcl8.5/tcl8.6/g" Makefile`, `sed -i "s/CFLAGS=/CFLAGS=-DUSE_INTERP_RESULT /g" Makefile`.
3. Then `tar xf sim.tar`.
4. `cd sim`, and `make clean`, and `make`.

## Structure of sim

The directory *sim* contains the following subdirectories:

- misc: source code files for utilities such as YAS(the Y86-64 assembler), YIS(the Y86-64 instruction set simulator) and the HCL2C(HCL to C translator). It also contains the *isa.c* source file that is used by all of the processor simulators.
- seq: source code for the SEQ and SEQ+ simulators.
- pipe: source code for the PIPE simulator.
- y86-84: Y86-64 assmbly code for many of the example programs shown in the chapter. It can automatically test the modified simulators on these benchmark programs. See file *README* for instructions on how to run these tests.
- ptest: scripts that generate systematic regression tests of the different instructions, the different jump possibilities, and different hazard possibilities. These scripts are very good at finding bugs in our homeword solutions. See file *README* for instructions on how to run these tests.

## solution

### PartA

This part, we will be working in directory *sim/misc*, and the task is to write and simulate the floowing three Y86-64 programs. 

This task is simple, you can imiate the figure 4.7.

And we write code in *sim/misc*, called [sum.ys](./sim/misc/sum.ys), *rsum.ys*, *copy.ys*.

And then build *misc*, we should input `make`,`make clean` in *src/misc*.

First, we test *sum.ys*, we should assembling it by command `./yas sum.ys` and get a new file named `sum.yo`, and then run by `./yis sum.ro`, get the result:

Some tips:

- if you get `Missing end-of-line on final line` after exectue `./yas sum.ys`, It means you must input a blank line in the last.

```txt
Stopped in 32 steps at PC = 0x13.  Status 'HLT', CC Z=1 S=0 O=0
Changes to registers:
%rax:   0x0000000000000000      0x0000000000000cba
%rsp:   0x0000000000000000      0x0000000000000100
%rsi:   0x0000000000000000      0x0000000000000c00

Changes to memory:
0x00f0: 0x0000000000000000      0x000000000000005b
0x00f8: 0x0000000000000000      0x0000000000000013
```

Then, repeat these steps for *rsum.ys*, the result is:

```txt
Changes to registers:
%rax:   0x0000000000000000      0x0000000000000cba
%rsp:   0x0000000000000000      0x0000000000000100

Changes to memory:
0x00b8: 0x0000000000000000      0x0000000000000c00
0x00c0: 0x0000000000000000      0x0000000000000088
0x00c8: 0x0000000000000000      0x00000000000000b0
0x00d0: 0x0000000000000000      0x0000000000000088
0x00d8: 0x0000000000000000      0x000000000000000a
0x00e0: 0x0000000000000000      0x0000000000000088
0x00f0: 0x0000000000000000      0x000000000000005b
0x00f8: 0x0000000000000000      0x0000000000000013
```

And last, repeat above steps for *copy_block*, the result is:

```txt
Changes to registers:
%rax:   0x0000000000000000      0x0000000000000cba
%rsp:   0x0000000000000000      0x0000000000000100
%rsi:   0x0000000000000000      0x0000000000000048
%rdi:   0x0000000000000000      0x0000000000000030

Changes to memory:
0x0030: 0x0000000000000111      0x000000000000000a
0x0038: 0x0000000000000222      0x00000000000000b0
0x0040: 0x0000000000000333      0x0000000000000c00
0x00f0: 0x0000000000000000      0x000000000000006f
0x00f8: 0x0000000000000000      0x0000000000000013
```

### PartB

This part, we will working in directory *sim/seq*, and out task is to extend the SEQ processor to support the *iaddq*.

To add this instructions, we will modify the file *seq-full.hcl*, which implements the version of SEQ described in the CS:APP3e textbook. 


`iaddq` format:

| Byte          | 0    | 1     | 2 - 9 |
| -             | -    | -     | -     |
|`iaddq V, rB`  | `C 0`| `F rB`| `V`   | 

The process of `iaddq`:

| Stage          | `iaddq V, rB` |
| -              |       -       |
| Fetch          | icode:ifun <- M1[PC]     |
|                | rA:rB      <- M1[PC + 1] |
|                | valC       <- M8[PC+2]   |
|                | valP       <- PC + 10    |
| Decode         | valB       <- R[rB]      |
| Execute        | valE       <- valC + valB|
| Memory         | |
| Write back     | R[rB]      <- valE       |
| PC update      | PC         <- valP       | 
 
And Then, modify the *seq-full.hcl* to add `IIADDQ` in right place. 

Also, because we don't have Tcl/Tk on our system, so we comment corresponding line in *Makefile*.

Then, input command `make clean`, `make VERSION=full` to build *ssim*, and input `./ssim -t ../y86-code/asumi.yo` to test the result.

If success, the output has `ISA Check Succeeds`.

And then, retesing the solution using the benchmark programs, we should input `cd ../y86-cide`, `make testssim`.

And last, do the regression test, the command is `cd ../ptest`, `make SIM=../seq/ssim`.

## Part C

The task is in direcotry `sim/pipe`, and we shoud modify *ncopy.ys* and *pipe-full.hcl* to make program run faster, 

The C version of `ncopy.ys` is:

```cpp
// copy len-elemnt integer array src to a no-overlapping dst, retrun a count of the number of positive integers contained in src
word_t ncopy(word_t *src, word_t *dst, word_t len) {
    word_t count = 0;
    word_t val;

    while (len > 0) {
        val = *src++;
        *dst++ = val;
        if (val > 0) {
            count++;
        }
        len--;
    }
    return count;
}
```

Some rules: our `ncopy.ys` function must work for arbitrary arry sizes.


First, we can unrolling the loop, for example :

```cpp
typedef int word_t;
word_t ncopy2(word_t* src, word_t* dst, word_t len) {
    word_t count = 0;
    word_t val;
    word_t val2;

    while (len > 1) {
        val = *src++;
        val2 = *src++;
        *dst++ = val;
        *dst++ = val2;
        if (val > 0) {
            count++;
        }
        if (val2 > 0) {
            count++;
        }
        len-=2;
    }
    while (len > 0) {
        val = *src;
        *dst = val;
        if (val > 0) {
            count++;
        }
        len--;
    }
    return count;
}
```

According that, we get the score `60/60`, by input command `./benchmark.pl`