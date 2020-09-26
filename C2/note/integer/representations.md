# Integer Representations

First, one important feature to note is that the ranges of two's complement are **not** symmetric. The range of negative numbers extends one further than the range of positive numbers.

For example: int has minimum number -2147483648, but maximum number is 2147483647.

Then, there are some mathematical terminology:

If x = [$x_{w-1}$, $x_{w-2}$, ..., $x_0$].

- B2U(binary to unsigned): $\sum_{i=0}^{w-1} x_i 2^i$, and the UMax = $2^w - 1$, UMin = 0.
- U2B(unsigned to binary): inverse of B2U, that maps each number in the range 0 to $2^w - 1$ to a unique pattern of $w$ bits.
- B2T(Binary to two's complement): $-x_{w-1} 2^{w-1} + \sum_{i=0}^{w-2} x_i 2^i$, And the TMin = $-2^{w-1}$, TMax = $2^{w-1}-1$.
- T2B(two's complement to binary): inverse of B2T, that is, for a number x such that TMin <= x <= TMax, T2B(x) is the unique w-bit pattern that encodes x.

nd lastly, although there also have some alternative representations of signed numbers, such as *ones' complement' and 'sign magnitude', almost all modern machines use **two's complement'.

There are some practice:

- [2.17](../../practice/2.17/README.md)
- [2.18](../../practice/2.18/README.md)

## conversions between signed and unsigned

C allows casting between different numeric data types.

For example:

```cpp
#include <stido.h>
int main() {
    unsigned u = 4294967295; // unsigned max number
    int tu = (int)u;
    printf("u = %u, tu = %d\n", u,tu);
    // u = ffffffff, tu = -1
    return 0;
}
```

From above example: the unsigned of `u` is `0xffffffff`, and `tu` has same component with `u`, and we know **casting from unsigned to int only changed the numeric value, but not the bit representation**.

So, we can conclude such relation between two's component and unsigned:

- T2U = $x + 2^w$, if $x < 0$
- T2U = $x$, if $x \ge 0$

There are some practice:

- [2.19](../../practice/2.19/README.md)
- [2.20](../../practice/2.20/README.md)

Also, we can state the relationship between an unsigned number u and its signed counterpart U2T(u):

- U2T(u) = $u$, if $u \le TMax$
- U2T(u) = $u - w^w$, if $u > TMax$

## some problems

Because of the casting between signed and unsigned, we had to face some problems. For example, C implicitly casts the signed argument to unsigned and performs the operations assuming the numbers are nonnegative.

And following figure shows some sample relational expressions and their resulting evaluations, when data type int has a 32-bit two's-complement representation.

|Expression                      | Type    | evaluation|
|                               -|        -|          -|
| 0 == 0U                        | unsigned| 1         |
| -1 < 0                         | signed  | 1         |
| -1 < 0U                        | unsigned| 0         |
| 2147483647  > -2147483647 - 1  | signed  | 1         |
| 2147483647u > -2147483647 - 1  | unsigned| 0         |
| 2147483647  > (int)2147483648u | signed  | 1         |
| -1 > -2                        | signed  | 1         |
| (unsigned)-1 > -2              | unsigned| 1         |

And It's a practice: [2.21](../../practice/2.21/README.md)

## Expanding the Bit Representation of a Number

- To convert an *unsigned number* to a larger data type, we can simply and leading zeros to the representation. This operation is known as **zero extension**.
- To convert a *two's complement number* to a larger data type, the rule is to perform a **sign extension**, adding copies of the most significant bit to the representation.

As a example:

```cpp
int main() {
    short sx = -12345;  
    unsigned short usx = sx;
    int x = sx;
    unsigned ux = usx;
    printf("sx = %d, hex-sx = %x\n", sx, sx);       // sx  = -12345, hex-sx = ffffcfc7
    printf("usx = %u, hex-usx = %x\n", usx, usx);   // usx = 53191, hex-usx = cfc7
    printf("x = %d, hex-x = %x\n", x, x);           // x   = -12345, hex-x  = ffffcfc7
    printf("ux = %u, hex-ux = %x\n", ux, ux);       // ux  = 53191, hex-ux  = cfc7
    return 0;
}
```

But there has a point worth making is that the relative order of conversion from one data size to another and between unsigned and signed can affect the behavior of a program, for example:

```cpp
int main() {
    short sx = -12345;  
    unsigned  usx = sx;
    printf("sx = %d, hex-sx = %x\n", sx, sx);       // sx = -12345, hex-sx = ffffcfc7
    printf("usx = %u, hex-usx = %x\n", usx, usx);   // usx = 4294954951, hex-usx = ffffcfc7
    return 0;
}
```

Above example shows that: when converting from `short` to `unsigned`, the program first changed the size and then the type.

And there are some practices about expanding:

- [2.22](../../practice/2.22/README.md)
- [2.23](../../practice/2.23/README.md)

## Truncating Numbers

Suppose that, rather than extending a value with extra bits, we reduce the number of bits representing a number.

For example:

```cpp
int main() {
    int x = 53191;
    short sx = (short)x;    // -12345
    int y = sx;             // -12345
    return 0;
}
```

We can known from above, when truncating a w-bit number x to a k-bit number, we drop the high-order w-k bits.

And there are some practices about expanding:

- [2.24](../../practice/2.24/README.md)
- [2.25](../../practice/2.25/README.md)
- [2.26](../../practice/2.26/README.md)
