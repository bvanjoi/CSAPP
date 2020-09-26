# 2.52

7-bit floating-point representations based on the IEEE floating-point format.

Format A: k = 3 exp bits, bias is 3, n = 4 fraction bits.

| Bits     | Value  |
| 011 0000 |   1    |
| 101 1110 | 15/2   |
| 010 1001 | 25/32  |
| 110 1111 | 31/2   |
| 000 0001 |  1/64  |

Format B: k = 4 exp bits, bias is 7, n = 3 fraction bits.

| Bits     | Value |
| 0111 000 |   1   |
| 1001 111 | 15/2  |
| 0110 100 |  3/4  |
| 1011 000 |  16   |
| 0001 000 |  1/64 |
