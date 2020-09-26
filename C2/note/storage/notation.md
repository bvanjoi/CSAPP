# Storage notation

- bytes: Most computers use blocks of eight bits, called **bytes**, as the smallest addressable unit of memory.
- address: A machine-level program views memory as a very large array of bytes, referred to as virtual memory. And every byte of memory is identified by a unique number, known as its **address**. And the set of all possible addresses is known as the **virtual address space**.
- virtual address space: as indicated by its name, this virtual address space is just a conceptual image presented to the machine-level program. The actual implementation uses a combination of dynamic random access memory, flash memory, disk storage, special hardware, and operating system software to provide the program with what appears to be a monolithic byte array.
- program objects: program data, instructions, and control information.

A single bytes consists of 8 bits. In binary notation, its value range from 0000000 - 11111111. When viewed as a decimal integer, its value ranges form 0 - 255. But neither notation is convenient. Instead, we write bit patterns as base-16, called **hexadecimal** numbers.

And digits can be converted by referring to a chart:

|Decimal|Binary|Hex|
|      -|     -|  -|
|      0|  0000|  0|
|      1|  0001|  1|
|      2|  0010|  2|
|      3|  0011|  3|
|      4|  0100|  4|
|      5|  0101|  5|
|      6|  0110|  6|
|      7|  0111|  7|
|      8|  1000|  8|
|      9|  1001|  9|
|     10|  1010|  A|
|     11|  1011|  B|
|     12|  1100|  C|
|     13|  1101|  D|
|     14|  1110|  E|
|     15|  1111|  F|

And there are some practice: [2.1](../../practice/2.1/README)

Then, if a value x is a power of 2, that is $x = 2^n$ for some nonegative integer n, we can readily write x in hexadecimal form by remembering that the binary representation of x is simply 1 followed by n zeros. And the practice is here: [2.2](../../practice/2.2/README.md)

Also, converting between decimal and hexadecimal representations requires using multiplication or division to handle the general case. We just need repeatedly divide x by 16, giving a quotient q and a remainder r, such that x = q * 16 + r. And to convert a hex number to decimal, we need multiply each of the hex digits by the appropriate power of 16. The practice is here: [2.3](../../practice/2.3/README.md)

Lastly, there are some arithmetic problems: [2.4](../../practice/2.4/README.md)

