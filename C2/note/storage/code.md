# Representing Code

Considering the following C function:

```cpp
int sum(int x, int y) {
    return x + y;
}
```

When compiled on our sample machines. we generate machine code having the following byte representations:

- Linux 32: `55 89 e5 8b 45 0c 03 45 08 c9 c3`
- Windows: `55 89 e5 8b 45 0c 03 45 08 5d c3`
- Sun: `81 c3 e0 08 90 02 00 09`
- Linux 64: `55 48 89 e5 89 7d fc 89 75 f8 03 45 fc c9 c3`

Hence we find that the instruction codings are different. Different machine types use different instructions and encodings, so `binary code is seldom portable across different combinations of machine and operating system`.
