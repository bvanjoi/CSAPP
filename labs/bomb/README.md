# Bomb

> os version: gcc version 7.3.0 (Ubuntu 7.3.0-16ubuntu3)

Before this lab, we need read some articles:

- [README](http://csapp.cs.cmu.edu/3e/README-bomblab)
- [Writeup](http://csapp.cs.cmu.edu/3e/bomblab.pdf)

PAY ATTENTION: because we just self-study, so we just need find the result of bomb, rather than care scores mentioned by [README](http://csapp.cs.cmu.edu/3e/README-bomblab).

## Structure

Initially, The directory only had three files:

- README: An introduce file, although it help nothing.
- bomb: A .exe file
- bomb.c: Source code for the main bomb routine

Then, we should execute `objdump -d bomb > bomb.asm` and get a assembly code file called `bomb.asm`. And execute `objdump -t bomb > bomb-symbol-table.asm` to get symbol table of bomb.

## begin with odjdump and gdb

One of the aim of bomb lab is teach us how to debug c file. So let us learn the basics tools:

- gdb: the GUN debugger, it can trace through a program line by line, examine memory and register, look at both the source code and assembly code, set breakpoints, set memory watch points, and write scripts.
- objdump: A command-line program for displaying various information about object files on Unix-like os.

## solve

### phase_1

Compare two strings, and in the file `bomb.asm`, we can find a function called `phase_1` which code is following:

```x86asm
0000000000400ee0 <phase_1>:
  400ee0: 48 83 ec 08           sub    $0x8,%rsp
  400ee4: be 00 24 40 00        mov    $0x402400,%esi
  400ee9: e8 4a 04 00 00        callq  401338 <strings_not_equal>
  400eee: 85 c0                 test   %eax,%eax
  400ef0: 74 05                 je     400ef7 <phase_1+0x17>
  400ef2: e8 43 05 00 00        callq  40143a <explode_bomb>
  400ef7: 48 83 c4 08           add    $0x8,%rsp
  400efb: c3                    retq
```

And we can infer the compared data is in `0x402400`, so we need view it's content.

Execute command `x/s 0x402400`, we get the result of `phase_1`:

> *Border relations with Canada have never been better.*

Input above strings, then get the info:

> Phase 1 defused. How about the next one?

Ok, Let's go!

### phase_2

Then we check function `phase_2`.

And the code is:

```x86asm
0000000000400efc <phase_2>:
  400efc: 55                    push   %rbp
  400efd: 53                    push   %rbx
  400efe: 48 83 ec 28           sub    $0x28,%rsp
  400f02: 48 89 e6              mov    %rsp,%rsi
  400f05: e8 52 05 00 00        callq  40145c <read_six_numbers>
  400f0a: 83 3c 24 01           cmpl   $0x1,(%rsp)
  400f0e: 74 20                 je     400f30 <phase_2+0x34>
  400f10: e8 25 05 00 00        callq  40143a <explode_bomb>
  400f15: eb 19                 jmp    400f30 <phase_2+0x34>
  400f17: 8b 43 fc              mov    -0x4(%rbx),%eax
  400f1a: 01 c0                 add    %eax,%eax
  400f1c: 39 03                 cmp    %eax,(%rbx)
  400f1e: 74 05                 je     400f25 <phase_2+0x29>
  400f20: e8 15 05 00 00        callq  40143a <explode_bomb>
  400f25: 48 83 c3 04           add    $0x4,%rbx
  400f29: 48 39 eb              cmp    %rbp,%rbx
  400f2c: 75 e9                 jne    400f17 <phase_2+0x1b>
  400f2e: eb 0c                 jmp    400f3c <phase_2+0x40>
  400f30: 48 8d 5c 24 04        lea    0x4(%rsp),%rbx
  400f35: 48 8d 6c 24 18        lea    0x18(%rsp),%rbp
  400f3a: eb db                 jmp    400f17 <phase_2+0x1b>
  400f3c: 48 83 c4 28           add    $0x28,%rsp
  400f40: 5b                    pop    %rbx
  400f41: 5d                    pop    %rbp
  400f42: c3                    retq
```

Firstly, from `400f05: e8 52 05 00 00   callq  40145c <read_six_numbers>` we can infer that we need input six number, otherwise we will trigger `bomb` in `read_six_number`.

Here, I think we need read the function `read_six_number`, we can infer that the `%rsp` point the first number lastly.

Secondly, the first number should be *1*(400f0a to 400f0e), because it not will meet `bomb`.

And then, because we can know that the second number should be more than twice of first number, so it's *2*(and store in `M[%rbx]`).

After, we know that `%rbp` is the number which not belong input(we can't control it value)! So there is a `loop` during 0x400f17 - 0x400f2c, and infer that we know the latter number is twice as large as the former.

So, the result is:

> *1 2 4 8 16 32*

Input above strings, then get the info:

> That's number 2.  Keep going!

Ok, Let's go!

### phase_3

From the code we can infer that it's a `swtich` statement.

Firstly, we should know function `__isoc99_sscanf` return the number of input items successfully matched and assigned([reference](https://stackoverflow.com/questions/22489434/how-does-call-isoc99-sscanf-work))

```x86asm
400f5b: e8 90 fc ff ff        callq  400bf0 <__isoc99_sscanf@plt>
400f60: 83 f8 01              cmp    $0x1,%eax
400f63: 7f 05                 jg     400f6a <phase_3+0x27>
400f65: e8 d0 04 00 00        callq  40143a <explode_bomb>
```

So, we should input two chars at least.

And then, `0x8(%rsp)` point at the third arguments. We know that it must less or equal 7.(because the number of branch is 7)

And then:

- input command `x/a 0x402470` in GDB( now, `%rax` is 0), we know `*0x402470`'s value is `0x400f7c`.
- input command `x/a 0x402478` in GDB( now, `%rax` is 1), we know `*0x402478`'s value is `0x400fb9`.
- input command `x/a 0x402480` in GDB( now, `%rax` is 2), we know `*0x402480`'s value is `0x400f83`.
- input command `x/a 0x402488` in GDB( now, `%rax` is 3), we know `*0x402488`'s value is `0x400f8a`.
- input command `x/a 0x402490` in GDB( now, `%rax` is 4), we know `*0x402490`'s value is `0x400f91`.
- input command `x/a 0x402498` in GDB( now, `%rax` is 5), we know `*0x402498`'s value is `0x400f98`.
- input command `x/a 0x4024a0` in GDB( now, `%rax` is 6), we know `*0x4024a0`'s value is `0x400f9f`.
- input command `x/a 0x4024a8` in GDB( now, `%rax` is 7), we know `*0x4024a8`'s value is `0x400fa6`.

so, the result is one of the following:

- 0 0xcf   -> 0 207
- 1 0x137  -> 1 311
- 2 0x2c3  -> 2 707
- 3 0x100  -> 3 256
- 4 0x185  -> 4 389
- 5 0xce   -> 5 206
- 6 0x2aa  -> 6 682
- 7 0x147  -> 7 327

So, we can input:

> *0 207*

Input above strings, then get the info:

> Halfway there!

### phase_4

Firstly, we should input two chars and the reason is same as `phase_3`.

And because:

```x86asm
40102e: 83 7c 24 08 0e        cmpl   $0xe,0x8(%rsp)
401033: 76 05                 jbe    40103a <phase_4+0x2e>
```

we know the first input is *14*.

And then:

```x86asm
40103a: ba 0e 00 00 00        mov    $0xe,%edx
40103f: be 00 00 00 00        mov    $0x0,%esi
401044: 8b 7c 24 08           mov    0x8(%rsp),%edi
401048: e8 81 ff ff ff        callq  400fce <func4>
```

means execute `func4(a,0,14);` where a <= 14, meanwhile, because

```x86asm
40104d: 85 c0                 test   %eax,%eax
40104f: 75 07                 jne    401058 <phase_4+0x4c>
401051: 83 7c 24 0c 00        cmpl   $0x0,0xc(%rsp)
401056: 74 05                 je     40105d <phase_4+0x51>
401058: e8 dd 03 00 00        callq  40143a <explode_bomb
```

we know the `func4` return value should be 0.

Look at `fun4(a,b,c)`, it's a recursive function.

and `a is %edi`, `b is %esi`, `c is %edx`， and the pseudo code is:

```cpp
// pay attention, it's reference value
func4( a, b ,c) {
    t1 = c - b;          // %eax
    t2 = t1>>31;         // %ecx, and it's logical right shift
    t1 = (t1 + t2) >> 1; // %eax, and it's arithmetic right shift
    t2 = b + t1;         // %ecx
    if( t2 == a) {
      return 0;
    }
    if( t2 < a) {
        a = t2 + 1;      // %esi
        func(a,b,c);
        t1 = 1 + 2 * t1; // %eax;
        return t1;
    }
    else {
        c = t2 - 1;      // %edx
        func4(a,b,c);
        t1 = t1 * 2;     // %eax
        return t1;
    }
}
```

And we can infer that `a` is 7, so the result of phase_4 is:

> *7 0*

And feedback:

> So you got that one.  Try this one.

### phase_5

First, from code:

```x86asm
40107f: 83 f8 06              cmp    $0x6,%eax
401082: 74 4e                 je     4010d2 <phase_5+0x70>
401084: e8 b1 03 00 00        callq  40143a <explode_bomb>
```

We know that input string length is 6.

And the function can write:

```cpp
phase_5(s){
    if( s.length != 6) {
        bomb();
        return ;
    }
    t1 = 0;                     // %eax
    while( t1 != 6) {
        t2 = &s;                // %rbx
        t3 = *(t2 + t1) & 0xff; // %ecx
        t4 = &%rsp;             // (%rsp)
        *t4 = t3;
        t5 = *t4 & 0xf;         // %rdx
        t5 = *(t5 + 0x4024b0) & 0xff // %edx
        t1 + 0x10 + t4 = t5;
        t1 = t1 + 1;
    }
    *(&%rsp + 0x16) = 0;
    if( strings_not_equal( *(&%rsp + 16), 'flyers' )) {
        bomb();
        return ;
    }
}
```

And we print the `0x4024b0` content by input command: `x/s 0x4024b0`, the output is: `maduiersnfotvbylSo you think you can stop the bomb with ctrl-c, do you?`

And the table is :

| b0 | b1 | b2 | b3 | b4 | b5 | b6 | b7 | b8 | b9 | ba | bb | bc | bd | be | bf|
| -  | -  | -  | -  | -  | -  | -  | -  | -  | -  | -  | -  | -  | -  | -  | - |
| m  | a  | d  | u  | i  | e  | r  | s  | n  | f  | o  | t  | v  | b  | y  | l |

The `flyers` is correspnding to `9fe567`.

And because of `f` and `e` ascii code are `0x66` and `0x65`, which result of `&0xf` is `6` and `5` respectively.

We can use char `?` and `>` (ascii code is `3f` and `3e`, which result of `&0xf` is `f` and `e` respectively), rather than `f` and `e`.

So the result is:

> *9?>567*

And the output is:

> Good work!  On to the next...

### phase_6

First, from the code `401106: e8 51 03 00 00   callq  40145c <read_six_numbers>` we know that need input six numbers.

And the flowchar is similar that:

```cpp
// input %rsi
phase_6(input) {
    a,b,c,d,e,f = read_six_numbers(input);
    // a        (%rsp), should less or equal 5
    // b     0x4(%rsp)
    // c     0x8(%rsp)
    // d     0xc(%rsp)
    // e    0x10(%rsp)
    // f    0x14(%rsp)

    //%rsp: 0x7fffffffe2d0
    t9 = %rsp;  // %r13
    t0 = &a;    // %r14
    t2 = 0;     // %r12d
    t8 = t9;    // %rbp, line3
    t1 = a - 1; // %eax
    if( t1 > 5) {
      bomb();
      return ;
    }
    t2 = t2 + 1;  // %12d
    if( t2 == 6) {
        t3 = (%rsp) + 0x18    // %rsi
        t4 = t0;              // %rax
        t5 = 7;               // %ecx
        do {
            // means:
            // a = 7 - a
            // b = 7 - b
            // c = 7 - c
            // d = 7 - d
            // e = 7 - e
            // f = 7 - f
            t6 = t5 - *t4;        // %edx
            *t4 = t6;             // (%rax) <-> a
            t4 = t4 + 4;          // %rax   <-> &b
        } while (t4 != t3);
        t3 = 0;              // %esi
        t5 = *(t3 + %rsp);   // %ecx
        if( t5 <= 1) {
            t6 = 0x6032d0;              // %edx
            *(%rsp + 0x20 + 2 * t3) = t6;
            t3 = t3 + 4;                // %rsi
            if( t3 === 0x18) {                  // line 4
                t7 = M[(%rsp) + 0x20]   // %rbx
                t4 = (%rsp) + 0x28      // %rax
                t3 = (%rsp) + 0x50      // %rsi
                t5 = t7;                // %rcx
                t6 = *t4;               // %rdx
                M[t5 + 8] = t6;
                t4 = t4 + 8             // %rax
                if( t4 == t3) {
                    M[t6 + 8] = 0;
                    t8 = 5;             // %ebp
                    t4 = M[t7 + 0x8];   // %rax, line1
                    t4 = *t4;           // %eax
                    if( *t7 >= t4) {
                        t7 = M[t7 + 0x8]; // %rbx
                        t8 = t8 - 1;      // %ebp
                        if( t8 != 0) {
                            goto line1;
                        }
                    }
                    else {
                        bomb();
                        return ;
                    }

                }
            }
        }
        else {  // t5 > 1
            t4 = 1;         // %eax
            t6 = 0x6032d0;  // %edx, 0x6032d0 is the begin of node
            do {
                t6 = *(t6 + 0x8);   // %rdx
                t4 = t4 + 1;        // %eax
            } while (t4 != t5)
            *(%rsp + 0x20 + 2 * t3) = t6;
            t3 = t3 + 1;    // %rsi
            goto line4;
        }
    }
    else {          // t2 != 6
        // means:
        // a != b
        // a != c
        // a != d
        // a != e
        // a != f
        // b != c
        // b != d
        // b != e
        // b != f
        // c != d
        // c != e
        // c != f
        // d != e
        // d != f
        t7 = t2;    // %ebx
        t4 = t7;    // %rax, line2
        t4 = *(4 * t4 + %rsp)  // %rax
        if( *(%rsp + 4 * t4) == *t8) {
            bomb();
            return ;
        }
        t7 = t7 + 1; // %ebx
        if( t7 <= 5) {
            goto line2;
        }
        t9 = t9 + 4;
        goto line3;
    }
}
```

In the line 0x41176, and the value of `$rdx`, we can infer there has a link. And the node length is 16.

And link infos:

| node name | address  |  first 4 bit  | second 4 bit | second 8 bit|
|     -     |     -    |      -        |     -        |      -      |
|   node1   | 0x6032d0 |     0x14c     |     1        |   0x6032e0  |
|   node2   | 0x6032e0 |     0x0a8     |     2        |   0x6032f0  |
|   node3   | 0x6032f0 |     0x39c     |     3        |   0x603300  |
|   node4   | 0x603300 |     0x2b3     |     4        |   0x603310  |
|   node5   | 0x603310 |     0x1dd     |     5        |   0x603320  |
|   node6   | 0x603320 |     0x1bb     |     6        |   0x0       |

So, the structure of node is:

```cpp
struct LinkNode{
    int data;
    int num;
    long* node;
};
```

And then 0x4011d0 reverse the list. Run after the line 0x40115e, from following code, we know the node is order by the largest to the smallest.

```x86asm
4011e7: 7d 05                 jge    4011ee <phase_6+0xfa>
```

And from above table we can infer that:

node3.data > node4.data > node5.data > node6.data > node1.data > node2.data.

And because $7 - x$, we so should input:

> *4 3 2 1 6 5*

And feedback information is:

> Congratulations! You've defused the bomb!

But we don't completed all.

### secret_phase

In the function `phase_defused`, we can find entry of `secret_phase`.

And set breakpoints `b *0x4015e1`, so that we can entry this function.

And look at following code:

```x86asm
4015f0: be 19 26 40 00        mov    $0x402619,%esi
4015f5: bf 70 38 60 00        mov    $0x603870,%edi
4015fa: e8 f1 f5 ff ff        callq  400bf0 <__isoc99_sscanf@plt>
```

and execute step by step(command `si`), we can get info:

`s=0x603870 <input_strings+240> "7 0 ", format=0x402619 "%d %d %s"`

so, the phase_4 input need add a new string argument.

And in line 0x401609, there has a string compare, we should look the value of `($rdi)`, and using command `x/s $rdi` get the value `DrEvil`.

so, modify input *7 0* to *7 0 DrEvil*.

Then output is:

> Curses, you've found the secret phase!
> But finding it and solving it are quite different...

In the function `secret_phase`, we need input a string which included a number infer from function `strtol`, and the number must greater than or equal to `1` and less or equal to `0x3e8`.( line 0x40125a ~ 0x401267).

Secondly, the address of `0x6030f0` pointer a tree struct because if we input command `x/60a 0x6030f0`, we can get:

```x86asm
0x6030f0 <n1>:  0x24    0x603110 <n21>
0x603100 <n1+16>:       0x603130 <n22>  0x0
0x603110 <n21>: 0x8     0x603190 <n31>
0x603120 <n21+16>:      0x603150 <n32>  0x0
0x603130 <n22>: 0x32    0x603170 <n33>
0x603140 <n22+16>:      0x6031b0 <n34>  0x0
0x603150 <n32>: 0x16    0x603270 <n43>
0x603160 <n32+16>:      0x603230 <n44>  0x0
0x603170 <n33>: 0x2d    0x6031d0 <n45>
0x603180 <n33+16>:      0x603290 <n46>  0x0
0x603190 <n31>: 0x6     0x6031f0 <n41>
0x6031a0 <n31+16>:      0x603250 <n42>  0x0
0x6031b0 <n34>: 0x6b    0x603210 <n47>
0x6031c0 <n34+16>:      0x6032b0 <n48>  0x0
0x6031d0 <n45>: 0x28    0x0
0x6031e0 <n45+16>:      0x0     0x0
0x6031f0 <n41>: 0x1     0x0
0x603200 <n41+16>:      0x0     0x0
0x603210 <n47>: 0x63    0x0
0x603220 <n47+16>:      0x0     0x0
0x603230 <n44>: 0x23    0x0
0x603240 <n44+16>:      0x0     0x0
0x603250 <n42>: 0x7     0x0
0x603260 <n42+16>:      0x0     0x0
0x603270 <n43>: 0x14    0x0
0x603280 <n43+16>:      0x0     0x0
0x603290 <n46>: 0x2f    0x0
0x6032a0 <n46+16>:      0x0     0x0
0x6032b0 <n48>: 0x3e9   0x0
0x6032c0 <n48+16>:      0x0     0x0
```

And the struct is:

![tree](https://img-blog.csdnimg.cn/20201012230856305.png)

And from the code:

```x86asm
401273: e8 8c ff ff ff        callq  401204 <fun7>
401278: 83 f8 02              cmp    $0x2,%eax
40127b: 74 05                 je     401282 <secret_phase+0x40>
40127d: e8 b8 01 00 00        callq  40143a <explode_bomb>
```

we know the result of `fun7` should be 2.

And then from `fun7`, the code can translate to:

```cpp
func7(a, b){
    // a %rdi
    // b %rsi, input number
    if( a == 0) {
        return -1;
    }
    t1 = *a; // %edx;
    if( t1 - b <= 0) {
        t2 = 0;  // %eax
        if( t1 - b == 0) {  // we can infer that we must input some lead node value
            return t2;
        }
        else {
            a = *(a + 16); // %rdi, a = a.right
            fun7(a,b);
            t2 = 1 + 2 * t2; // %eax
            return t2;
        }
        t2 = t2 + t2;   // %eax
        return t2;
    }
    else {
        a = *(a + 8);   // %eax,  a = a.left
        fun7(a,b);
        t2 = t2 + t2;
        return t2;
    }
}
```

In order to get return value 2, the path should be `left -> right -> right`.

Ok, the result if 0x14, namely 20.

> *20*

output:

> Wow! You've defused the secret stage!
> Congratulations! You've defused the bomb!
