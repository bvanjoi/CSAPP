# Optimizing Program Performance

## Program Example

To demonstrate how an abstract program can be systematically transformed into more efficient code, we will use a running example based on the vector data structure.

A vector is represented with two blocks of memory: the header and the dta array.

```cpp
typedef struct {
    long len;
    data_t *data;
} vec_rec, *vec_ptr;
```

Implementation of vector abstract data type:

```cpp
/* Create vector of specified length*/
vec_ptr new_vec(long len) {
    // Allocate header structure;
    vec_ptr result = (vec_ptr)malloc(sizeof(vec_rec));
    data_t *data = NULL;
    if (!result) {
        return NULL;  // Couldn't allocate storage
    }
    result->len = len;
    // Allocate array
    if (len > 0) {
        data = (data_t *)calloc(len, sizeof(data_t));
        if (!data) {
            free((void *)result);
            return NULL; // Couldn't allocate storage
        }
    }
    // Data will either be NULL or allocated array;
    result->data = data;
    return result;
}

/**
 *
 * Retrieve vector element and store at dest
 * Return 0 (out of bounds) or 1 (successful)
 */
int get_vec_element(vec_ptr v, long index, data_t* dest) {
    if (index < 0 || index >= v->len) {
        return 0;
    }
    *dest = v->data[index];
    return 1;
}

/**
 * Return the Length of vector;
 */
long vec_length(vec_ptr v) {
    return v->len;
}
```

Then define:

```cpp
#define IDENT 0;
#define OP +;

void combine1(vec_ptr v, data_t* dest) {
    long i;
    *dest = IDENT;
    for (i = 0; i < vec_length(v); i++) {
        data_t val;
        get_vec_element(v, i, &val);
        *dest = *dest OP val;
    }
}
```

## Eliminating Loop Inefficiencies

Observe that procedure `combine1`, calls function `vec_length` as the test condition of the `for` loop.

Recall from the discussion of how to translate code containing loops into machine-level programs that the test condition must be evaluated on every iteration of the loop. On the other hand, the length of the vector does not change as the loop proceeds. We could therefore compute the vector length only **once**  and use this value in our test condition:

```cpp
void combine2(vec_ptr v, data_t* dest) {
    long i;
    long length = vec_length(v);

    *dest = IDENT;
    for (i = 0; i < length; i++) {
        data_t val;
        get_vec_element(v, i, &val);
        *dest = *dest OP val;
    }
}
```

practice:

- [5.3](../../practice/5.3/README.md)

## Reducing Procedure Calls

In the code for `combine2`, the `get_vec_element` is called on every loop iteration to retrieve the next vector element.

But in `get_vec_element`, the function checks the vector index `i` against the loop bounds with every vector reference, a clear source of inefficiency.(Bounds checking might be a useful feature when dealing with arbitrary array accesses, but a simple analysis of the code for `combine2` shows that all references will be valid).

So we write the procedure shown following, which having no function calls in the inner loop.

```cpp
data_t *get_vec_start(vec_ptr v) {
    return v->data;
}

void combine3(vec_ptr v, data_t *dest) {
    long i;
    long length = vec_length(v);
    data_t *data = get_vec_start(v);

    *dest = IDENT;
    for (i = 0; i < length; i++) {
        *dest = *dest OP data[i];
    }
}
```

## Eliminating Unneeded Memory References

For data type `double` and with multiplication as the, in the loop of `combine3`, the x86-64 code generated is:

```
.L17
  vmovsd (%rdx), %xmm0            ; read dest
  vmulsd (%rdx), %xmm0, %xmm0     ; multiply
  vmovsd %xmm0, (%rbx)            ; store result at dest
  addq   $8, %rdx
  cmpq   %rax, %rdx
  jne    .L17
```

We can see that the accumulated value is read from and written to memory on each iteration. This reading and writing is wasteful.

we can eliminate this needless reading and writing of memory by rewriting the code in the style of `combine4`:

```cpp
void combine4(vec_ptr v, data_t *dest) {
    long i;
    long length = vec_length(v);
    data_t *data = gec_vec_start(v);
    data_t acc = IDENT;

    for (i = 0; i < length; i++) {
        acc = acc OP data[i];
    }
    *dest = acc;
}
```

The assembly code that follows show:

```x86asm
.L25
  vmulsd (%rdx), %xmm0, %xmm0
  addq   $8, %rdx
  cmpq   %rax, %rdx
  jne    .L25
```

practice:

- [5.4](../../practice/5.4/README.md)
