# Combining Control and Data in Machine-Level Programs

So far, we have looked separately at how machine-level code implements the control aspects of a program and how it implements different data structures.

In this section, we look at ways in which data and control interact with each other.

## Pointers

Pointers are a central feature of the C programming language. They server as a uniform way to generate references to elements within different data structures.

Some key principles of pointers.

- Every pointer hahs an associated type. This type indicates what kind of object the pointer points to. For example, `int* p;` means the variable `p`  is a pointer to an object of type `int`. The special `void*` type represents a generic pointer, which is converted to a typed pointer via either an explicit cast or by the implicit casing of the assignment operation.
- Every pointer has a value. The value is an address of some object of the designated type.
- Pointers are created with the `&` operator. THe machine code realization of the `&` operator often uses the `leaq` instruction to compute the address.
- Arrays and pointers are closely related. For example, `int a[3];`, the var `a` has the exact same effect as pointer arithmetic and dereferencing.
- Casting from one type of pointer to another changes its type but not its value. One effect of casting it to change any scaling of pointer arithmetic. For example, if `char* p`, then expression `(int *)p + 7;` computes `p + 28;`, while `(int*)(p+7);` computes `p+7;`.
- Pointers can also point to functions. For example, if we have a function defined by the prototype: `int fun(int x, int* p);`, then we can declare and assign a pointer `fp` to this function by the following code sequence: `int (*fp)(int, int*); fp = fun;`, we can then invoke the function using this pointer: `int y = 1; int result = fp(3, &y)`.

## Out-of-Bounds Memory References and Buffer Overflow

**C does not perform any bounds checking for array references**, and that local variables are stored on the stack along with state information such as saved register values and return addresses.

This combination can lead to serious program errors, where the state stored on the stack get corrupted by a write to an out-of-bounds array element.

A particularly common source of state corruption is known as **buffer overflow**. Typically, some character array is allocated on the stack to hold a string, but the size of the string exceeds the space allocated for the array.

For example:

```cpp
char* gets(char* s) {
    // It copies this string to the location designated by argument `s` and terminates the string with a null character.
    int c;
    char* dest = s;
    while ((c = getchar()) != '\n' && c != EOF) {
        *dest++ = c;
    }
    if (c == EOF && dest == s) {
        return NULL;
    }
    *dest++ = '\0'; // Terminate string
    return s;
}

void echo() {
    char buf[8];
    gets(buf);
    puts(buf);
}
```

`echo` function has a serious problem, It reads a line from the standard input, stopping when either a terminating newline character or some condition is encountered. Te problem with `gets` is that it has no way to determine whether sufficient space has been allocated to hold the entire string, any string longer than the len of `buf` will cause an out-of-bounds write.

![stack organization for echo function](https://img-blog.csdnimg.cn/20201021085029540.png)

The above picture illustrates the stack organization during the execution fo `echo`, if the user type long characters more than seven, it will case `gets` to overwrite some of the information stored on the stack.

| Character typed | Additional corrupted state |
|        -        |             -              |
|     0 - 7       |      None                  |
|     8 - 23      |      Unused stack space    |
|    24 - 31      |      Return address        |
|       32+       |      Saved state in caller |

Practice:

- [3.46](../../practice/3.46/README.md)

### Thwarting Buffer Overflow Attacks

- Stack Randomization: make the position of the stack vary from one run of a program to another. However, a persistent attacker can overcome randomization by brute force, repeatedly attempting attacks with different addresses.
- Stack Corruption Detection: store a special canary value in stack frame between any local buffer and the rest of the stack state.
- Limiting Executable Code Regions:

Practices:

- [3.47](../../practice/3.47/README.md)
- [3.48](../../practice/3.48/README.md)
- [3.49](../../practice/3.49/README.md)
