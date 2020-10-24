# Array Allocation and Access

Array in C are one means of aggregating scalar data into larger data types.

For example:

```cpp
char A[12];
char *B[8];
int  C[6];
double *D[5];
```

|Array | Element size| Total size| Start address| Element i |
| -    | -           | -         | -            |  -        |
| A    | 1           | 12        | x            |  x + i    |
| B    | 8           | 64        | x            |  x + 8 * i|
| C    | 4           | 24        | x            |  x + 4 * i|
| D    | 8           | 40        | x            |  x + 8 * i|

Practice:

- [3.36](../../practice/3.36/README.md)

## Pointer Arithmetic

Pay attention: the array reference `A[i]` is identical to the expression `*(A+i)`.

Practice:

- [3.37](../../practice/3.37/README.md)

## Nested Arrays

For an array declared as:

```cpp
T D[R][C];
```

Any element of `D[i][j]` is at memory address:

$\&D[i][j] = x_d + L(C * i + j)$

Practices:

- [3.38](../../practice/3.38/README.md)
- [3.39](../../practice/3.39/README.md)
- [3.40](../../practice/3.40/README.md)
