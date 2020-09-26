# 2.24

Suppose we truncate 4-bit value to 3-bit value.

Hex:

| Hex Original| Hex Truncated| Unsigned Original | Unsigned Truncated| Two's complement Original| Two's complement Truncated|
| -           | -            | -                 |      -            |              -           |              -            |
|0            |       0      |       0           |      0            |              0           |              0            |
|2            |       2      |       2           |      2            |              2           |              2            |
|9            |       1      |       9           |      1            |              -7          |              1            |
|B            |       3      |       11          |      3            |              -5          |              3            |
|F            |       7      |       15          |      7            |              -1          |             -1            |
