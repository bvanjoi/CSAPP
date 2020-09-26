# Shift Operations in C

C provides a set of **shift** operations for shifting bit patterns to the left and to the right.

if x having bit representation [$x_{w-1}$, $x_{w-2}$, ..., $x_0$]

- left shift: x << k yields a value with bit representation [$x_{w-k-1}$, $x_{w-k-2}$, ...,$x_0$, 0,..,0]
- logical right shift: A logical right shift fills the left each with k zeros, giving a result [0, ...,0,$x_{w-1}$, $x_{w-2}$, ..., $x_k$]
- arithmetic right shift: An arithmetic right shift fills the left end with k repetitions of the most significant bit, giving a result [$x_{w-1}$, ..., $x_{w-1}$, $x_{w-2}$, ..., $x_k$]

Here a example:

| Operation | value1 | value2|
| - | - | - |
|     x                  | [01100011] | [10010101]|
|  x << 4                | [00110000] | [01010000]|
|  x >> 4 (logical)      | [00000110] | [00001001]|
|  x >> 4 (arithmetic)   | [00000110] | [11111001]|

Pay attention: the C standards do not precisely define which type of right shift should be used with signed numbers, either arithmetic or logical shifts may be used. In practice, however, **almost all compiler/machine combinations use arithmetic right shifts for signed data**, and many programmers assume this to be the case.

There is a practice: [2.16](../../practice/2.16/README.md)

## Shifting by k, for large values of k

For a data ype consisting of w bits, what should be the effect of shifting by some value k >= w?

The C standards carefully avoid stating what should be done in such a case. On many machine, **the shift amount is computed as k mod w**.
