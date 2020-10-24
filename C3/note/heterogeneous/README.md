# Heterogeneous Data Structure

C provide two mechanisms for creating data types by combining objects of different types:

- `struct`
- `union`

## structure

`structure` declaration creates a data type that groups objects of possibly different types into a single object.

For example:

```cpp
struct rec {
    int i;
    int j;
    int a[2];
    int* p;
}
```

Practices:

- [3.41](../../practice/3.41/README.md)
- [3.42](../../practice/3.42/README.md)

## union

Unions provide a way to circumvent the type system of C, allowing a single objet to be referenced according to multiple types.

The syntax of a union declaration is identical to that for structures, but its semantics are very different.

For example:

```cpp
union U3 {
    char c;
    int i[2];
    double v;
}
```

And Unions can used to access the bit patterns of different data types.

For example:

```cpp
#include <stdio.h>

int main() {
    double d = 2.2;
    unsigned long l = (unsigned long)d;
    printf("l = %ld\n", l);

    union
    {
      double t;
      unsigned long u;
    } temp;
    temp.t  = 2.2;
    printf("temp.u = %ld\n", temp.u);
}
```

Output is:

> l = 2
>
> temp.u = 4612136378390124954

Because the result will be that `temp.u` will have the same bit representation as `temp.t`.

Practice:

- [3.43](../../practice/3.43/README.md)

## Data Alignment

Many computer system place restrictions on the allowable addresses for the primitive data types, requiring that the address for some objects must be multiple of some value K.

The x86-64 hardware will work correctly regardless of the alignment of data. However, Intel recommends that data be aligned to improve memory system performance. Their alignment rule is based on the principle that **primitive object of K bytes must have an address that is a multiple of K**.

| K | types               |
| - | -                   |
| 1 | char                |
| 2 | short               |
| 4 | int, float          |
| 8 | long, double, char* |

Code `.align 8` ensures that the data following it will start with an address that is a multiple of 8.

Practices:

- [3.44](../../practice/3.44/README.md)
- [3.45](../../practice/3.45/README.md)
