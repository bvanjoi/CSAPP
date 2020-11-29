# Enhancing Parallelism

## Multiple Accumulators

Applying 2 * 2 loop unrolling:

```cpp
void combine6(vec_ptr v, data_t *dest) {
    long i;
    long length = vec_length(v);
    long limit = length - 1;

    data_t *data = get_vec_start(v);
    data_t acc0 = IDENT;
    data_t acc1 = IDENT;

    for (i = 0; i < limit; i += 2) {
        acc0 = acc OP data[i];
        acc1 = acc1 OP data[i+1];
    }

    for (; i < length; i++) {
        acc0 = acc0 OP data[i];
    }

    *dest = acc0 OP acc1;
}
```

The critical path:

```txt
 %xmm0  %rax     %xmm1     %rbp   %rdx
   |    |   |      |         |      |
   |   load | <----| ----    | ---- x
            x -->  | load <- | ---- x
      mul          |         |      |
   |               mul       |     add
   |               |         |      |
   |               |        cmp <---|
   |               |         |      |
   |               |        jg      |
  %xmm0           %xmm1           %rdx
```

## Reassociation Transformation

Changed the elements are combined in the inner loop:

```cpp
acc = acc OP (data[i] OP data[i+1]);
```

so, the `combine7` is:

```cpp
// 2 * 1a loop unrolling
void combine7(vec_ptr v, data_t *dest) {
    long i;
    long length = vec_length(v);
    long limit = length - 1;

    data_t *data = get_vec_start(v);
    data_t acc = IDENT;
    // combine 2 elements at a time
    for (i = 0; i < limit; i += 2) {
        acc = acc OP (data[i] OP data[i+1]);
    }
    // Finish any remaining elements
    for(; i< length; i++) {
        acc = acc OP data[i];
    }
    *dest = acc;
}
```

The critical path is:

```txt
  %xmm1  %rax     %rdx  %rdp
  |      |  |        |     |
  |      | load  <-- |     |
  |      |  |        |     |
  |    load <------  |     |
  |      |  |        |     |
  |       mul       add    |
  |       |          |     |
     mul             |     |
  |                  |--> cmp
  |                  |     |
  |                  |     jg
  %xmm1             %rdx  
```

Practice:

- [5.8](../../practice/5.8/README.md)
