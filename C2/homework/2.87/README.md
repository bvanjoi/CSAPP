# 2.87

1 sign bit, 5 exp bits, 10 fractions bits, bias is 2^4 - 1 = 15.

| Description         | Hex     | M          | E   | V          |  D           |
|      -              |  -      | -          | -   | -          | -            |
|     -0              | 0x8000  | 0          | -14 | -0         | -0.0         |
| Smallest value > 2  | 0x0401  | 1025/1024  | 1   | 1025/512   | 2.00195312   |
| 512                 | 0x6000  | 1          | 9   | 512        | 512.0        |
| Largest denormalized| 0x03ff  | 1023/1024  | -14 | 1025/2^{24}| 6.09755516e-5|
| -inf                | 0xfc00  | -          | -   | -inf       | -inf         |
| Number with Hex     | 0x3bb0  | 123/64     | -1  | 123/128    | 0.9609375    |
