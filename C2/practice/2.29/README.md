# 2.29

w = 5, two's-complement.

| x       | y       | x + y        | x + y after deal overflow |
| -       | -       |   -          |   -                       |
| -12     |  -15    |   -27        |   5                       |
| [10100] | [10001] |   [100101]   |   [00101]                 |
| -8      |  -8     |   -16        |   -16                     |
| [11000] | [11000] |   [110000]   |   [10000]                 |
| -9      |  8      |   -1         |   -1                      |
| [10111] | [01000] |   [11111]    |   [11111]                 |
| 2       |  5      |   7          |   7                       |
| [00010] | [00101] |   [00111]    |   [00111]                 |
| 12      |  4      |   -16        |   -16                     |
| [01100] | [00100] |   [10000]    |   [10000]                 |
