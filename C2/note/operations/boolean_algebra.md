# Boolean Algebra

The simplest Boolean Algebra is defined over the two-element set {0,1}.

Following defines several operations in this algebra.

- not:

|p|~p|
|-|-|-|
|0|1|
|1|0|

- or:

|p|q|p \| q|
|-|-|-|
|0|0|0|
|0|1|1|
|1|0|1|
|1|1|1|

- and:

|p|q|p & q|
|-|-|-|
|0|0|0|
|0|1|0|
|1|0|0|
|1|1|1|

- xor:

|p|q|p ^ q|
|-|-|-|
|0|0|0|
|0|1|1|
|1|0|1|
|1|1|0|

## extends Boolean Algebra on bit vectors

Assume a and b are bit vectors and both length is w, define a & b to also be a bit vector of length w, where the ith element equals $a_i \& b_i$.

As example, a = [0110], b = [1100]. Then:

- a & b = [0100]
- a | b = [1110]
- ~b = [0011]
- a^b= [1010]

There are some practices: [2.8](../../practice/2.8/README.md), [2.9](../../practice/2.9/README.md).

## Bit-Level Operations in C

One useful feature of C is that it supports bitwise Boolean operations.

And there are some funny practice:

- [2.10](../../practice/2.10/README.md)
- [2.11](../../practice/2.11/README.md)

Also, one common use of the bit-level operations is to implement **masking** operations, where a mask is a bit pattern that indicates a selected set of bits within a word. As a example, the operation x & 0xFF yields a value consisting of the least significant byte of x, but with all other bytes set to 0. With x = 0x89ABCDEF, the expression would yield 0x000000EF. Here are some practices: [2.12](../../practice/2.12/README.md), [2.13](../../practice/2.13/README.md), s
