# Integer Arithmetic

Firstly, from [2.26](../../practice/2.26/README.md) we know that the comparison `x<y` can yield a different result than the comparison `x-y<0`.

This because programming languages support fixed-size arithmetic, and hence operations such as "addition" and "multiplication" differ from their counterpart operations over integers.

- abelian group: it's **commutative** and **associative**.

## Unsigned Addition

For x and y such that $0 \le x, y < 2^w$:

- $x + y = x + y$, if $x + y < 2^w$
- $x + y = x + y - 2^w$, if $2^w \le x + y < 2^{w+1}$, overflow.

There are some practices:

- [2.27](../../practice/2.27/README.md)
- [2.28](../../practice/2.28/README.md)

## Two's-Complement Addition

For x and y such that $-2^{w-1} \le x, y \le 2^{w-1} -1$:

- $x + y = x + y - 2^w$, if $2^{w-1} \le x + y$, positive overflow.
- $x + y = x + y$, if $-2^{w-1} \le x + y < 2^{w-1}$
- $x + y = x + y + 2^w$, if $x + y < -2^{w-1}$, negative overflow.

There are some practices:

- [2.29](../../practice/2.29/README.md)
- [2.30](../../practice/2.30/README.md)
- [2.31](../../practice/2.31/README.md)
- [2.32](../../practice/2.32/README.md)

## Two's-Complement Negation

For x in the range $TMin \le x \le TMax$, then:

- $-x = TMin$, if $x = TMin$
- $-x = -x$, if $x > TMin$

TMin is its own additive inverse, while other values are negated by integer negation.

And also, you can think `-x` equal `~x+1`, this is a easily way to memory it.

There is a practice:

- [2.33](../../practice/2.33/README.md)

## Unsigned Multiplication

For x and y in the range $0 \le x, y \le 2^w - 1$, their product in the range $0 \le xy \le 2^{2w} + 2^{w+1} - 1$.

Truncating an unsigned number to w bits is equivalent to computing its value modulo $2^w$, so:

$x *y = (x* y) mod 2^w$

## Two's-Complement Multiplication

For x and y such that $TMin \le x,y \le TMax$:

$x *y = U2T(( x* y ) mod 2^w)$

There are some practices:

- [2.34](../../practice/2.34/README.md)
- [2.35](../../practice/2.35/README.md)
- [2.36](../../practice/2.36/README.md)
- [2.37](../../practice/2.37/README.md)

## Multiplying by Constants

Historically, the integer multiply instruction on many machines was fairly slow, requiring 10 or more clock cycles, whereas other integer operations, such as addition subtraction, bit-level operations, and shifting, required only 1 clock cycle.

As a consequence, one important optimization used by compilers is to attempt to replace multiplications by constant factors with combinations of shift and addition operations.

For example, $x *2^k$ yields the value $x << k$; $x* 14$, recognizing that $14 = 8 + 4 + 2$, so the compiler can rewrite the multiplication as $(x<<3) + (x<<2) + (x<<1)$.

There are some practices:

- [2.38](../../practice/2.38/README.md)
- [2.39](../../practice/2.39/README.md)
- [2.40](../../practice/2.40/README.md)
- [2.41](../../practice/2.41/README.md)

## Dividing by Powers of 2

Integer division on most machines is even slower than integer multiplication, requiring 30 or more clock cycles.

Dividing by a power of 2 can also be performed using right shift operations. The two different right shifts——logical and arithmetic——serve this purpose for unsigned and two's-complement numbers, respectively.

And integer division always rounds toward zero.

- Unsigned division by a power of 2, $x>>k$ yields the value $\lfloor x/2^k \rfloor$.
- Two's-complement division by a power of 2, rounding down, the C expression `x>>k`, when the shift is performed arithmetically, yields the value $\lfloor x/2^k \rfloor$.
- Two's-complement division by a power of 2, rounding up, the C expression `(x + (1<<k) - 1)>>k`, when the shift is performed arithmetically, yields the value $\lceil x/2^k \rceil$.

Unlike multiplication, we can't express division by arbitrary constants K in terms of division by powers of 2.

There are some practices:

- [2.42](../../practice/2.42/README.md)
- [2.43](../../practice/2.43/README.md)
- [2.44](../../practice/2.44/README.md)
