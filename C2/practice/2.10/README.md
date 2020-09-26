# 2.10

consider following program:

```cpp
void inplace_swap(int* x, int* y) {
  *y = *x ^ *y; // Step 1
  *x = *x ^ *y; // Step 2
  *y = *x ^ *y; // Step 3
}
```

We claim that the effect of this procedure is to swap the values stored at the locations denoted by pointer variables x and y. Note that unlike the usual technique for wapping two value while we are moving the other.

There is no performance advantage to this way of swapping, it's merely an intellectual amusement.

Fill the chart, giving the values stored at the two locations **after** each step of the procedure.

| step | *x |*y |
| ---- | -- | -- |
| initially | a | b |
| step1     | a | a^b|
| step2     | b | a^b|
| step3     | b | a |
