# 2.11

First, please read the c file: [inplace_swap](../2.10/inplace_swap.c)

consider following program:

```cpp
void reverse_array(int a[], int cnt) {
  int first, last;
  for ( first = 0, last = cnt - 1; first <= last; first++, last--) {
    inplace_swap(&a[first], &a[last]);
  }
}
```

A. The value of `first` and `last` both is `k`.

B. When cnt = 2k+1, in the finally, `a[first]` and `a[last]` have same address, and due to a ^ a = 0, after run step1 in `inplace_swap`, the value of `a[first]` and `a[last]` become 0.

C. modify `first <= last` to `first < last`.
