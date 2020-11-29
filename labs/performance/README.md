# Performance

Before this lab, we need read some articles:

- [README](http://csapp.cs.cmu.edu/3e/README-perflab)
- [Writeup](http://csapp.cs.cmu.edu/3e/perflab.pdf)

PAY ATTENTION: because we just self-study, so we just need to optimize the `kernels.c`, rather than care scores mentioned by [README](http://csapp.cs.cmu.edu/3e/README-perflab).

## Structure

Initially, we look at the useful files::

- README: An introduce file, although it help nothing.
- kernels.c: This is the file you will be modifying and handing in. 

Then, we should execute `make clean` and `make` to build this lab.

## Introduction

Two process of image:

- rotate: totates an image counter-clockwise 90˚.
  - transpose: for each (i, j) pair, swap M[i][j] and M[j][i].
  - exchange rows: row i is exchanged with row N-1-i.
- smooth: replace every pixel value with teh average of all the pixels around it, and the special case is bound grids.

## Implementation Overview

Data Structures:

```cpp
typedef struct {
   unsigned short red;
   unsigned short green;
   unsigned short blue;
} pixel;
```

An image `I` is represented as a one-dimensional array of `pixel`s, where the (i,j)th pixel is `I[RIDX(i,j,n)]`.

where:

```cpp
#define RIDX(i,j,n) ((i)*(n)+(j))
```

## solution

From `dst[RIDX(dim-1-j, i, dim)] = src[RIDX(i, j, dim)];`

we know that: `dst[dim * dim - dim - j * dim + i] = src[i * dim + j];`

### Rotate

loop unrolling.

### Smooth

compute the grid one by one.


## Think

I think optimization too much is harmful...