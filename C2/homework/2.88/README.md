# 2.88

based on IEEE floating-pointing format.

Format A:

- 1 sign bit.
- 5 epx bits. bias = 15.
- 3 fraction bits.

| Bits | Value             |
|   -  |   -               |
| 1 01111 001 | -9/8       |
| 0 10110 011 | 176        |
| 1 00111 010 | -5/1024    |
| 0 00000 111 |  7/2^{14}  |
| 1 11100 000 | -2^{13}    |
| 0 10111 100 | 384        |

Format B:

- 1 sign bit.
- 4 epx bits. bias = 7.
- 4 fraction bits.

| Bits | Value             |
|   -  |   -               |
| 1 0111 0010 | -9/8       |
| 0 1110 0110 | 176        |
| 1 0000 0101 | -5/1024    |
| 0 0000 0001 |  1/2^{10}  |
| 1 1111 0000 | -inf       |
| 0 1111 0000 | inf        |
