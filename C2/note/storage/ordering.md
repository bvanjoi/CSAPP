# Addressing and Byte Ordering

For program objects that span multiple bytes, we must establish two conventions:

1. what the address of the object will be.
2. how we will order the bytes in memory. And there are two common conventions: 1. Big endian; 2. Little endian.

Suppose the variable `x` of type *int* and at address 0x100 has a hexadecimal value of 0x01234567. The ordering of the bytes within the address range 0x100 through 0x103 depends on the type of machine:

- Big endian: the most significant byte comes first.

|0x100|0x101|0x102|0x103|
|-|-|-|-|
|01|23|45|67|

- Little endian: the least significant byte comes first.

|0x100|0x101|0x102|0x103|
|-|-|-|-|
|67|45|23|01|

There is no technological reason to choose one byte ordering convention over the other. As long as one of the conventions is selected and adhered to consistently, the choice is arbitrary.

But there are some issue when using different byte ordering:

- First case: when binary data are communicated over a network between different machines. A common problem is for data produced by a little-endian machine to be sent to a big-endian machine, or vice versa, leading to the bytes within the words being in reverse order for the receiving program. To avoid such problems, code written for networking applications must follow established conventions for byte ordering to make sure the sending machine converts its internal representation to the network standard, while the receiving machine converts the network standard to its internal representation.
- Second case: where byte ordering becomes important is when looking at the byte sequences representing integer data. This occurs often when inspecting machine-level programs. For example, `4003d3: 01 05 43 0b 20 00, add %eax, 0x200b43(%rip)`, If we take the final 4 bytes of the sequence `43 0b 20 00` and write them in reverse order, we have `00 20 0b 43`.
- Third case: where byte ordering becomes visible is when programs are written that circumvent the normal type system. In the C language, this can be done using a `cast` or a `union` to allow an object to be referenced according to a different data type from which it was created. Such coding tricks are strongly discouraged for most application programming, but they can be quite useful and even necessary for system-level programming. For example: [Code to print the byte representation of program objects](./show_bytes.c), and there are some practices: [2.5](../../practice/2.5/README.md), [2.6](../../practice/2.6/README.md)
