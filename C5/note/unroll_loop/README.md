# Loop Unrolling

Loop unrolling is a program transformation that reduces the number of iterations for a loop by increasing the number of elements computed on each iteration.

Loop unrolling can improve performance inn two ways:

1. it reduces the number of operations that do not contribute directly to the program result, such as loop indexing and conditional branching.
2. it exposes ways in which we can further transform the code to reduce the number of operations in the critical paths of the overall computation.

For example:

```cpp
// 2 * 1 loop unrolling
void combine5(vec_ptr v, data_t *dest) {
    long i;
    long length = vec_length(v);
    long limit = length - 1;

    data_t *data = get_vec_start(v);
    data_t acc = IDENT;
    // combine 2 elements at a time
    for (i = 0; i < limit; i += 2) {
        acc = (acc OP data[i]) OP data[i+1];
    }
    // Finish any remaining elements
    for(; i< length; i++) {
        acc = acc OP data[i];
    }
    *dest = acc;
}
```

The machine-code:

```x86asm
; Inner loop of combine5. data_t = double, OP = *
; i in %rdx, data %rax, limit in %rbp, acc in %xmm0
.L35:
  vmulsd (%rax, %rdx, 8). %xmm0, %xmm0
  vmulsd 8(%rax, %rdx, 8). %xmm0, %xmm0
  addq $2, %rdx
  cmpq %rdx, %rbp
  jg .L35
```

The critical path:

```txt
  %xmm0   %rax    %rbx  %rdp
  |        |        |     |
  |       load  <-- |     |
  |        |        |     |
      mul           |     |
  |        |        |     |
  |       load  <-- |     |
  |        |       add    |
      mul           |--> cmp
  |                 |     |
  |                 |     jg
  %xmm0            %rbx  
```
