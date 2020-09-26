#include <stdio.h>

void inplace_swap(int* x, int* y) {
  *y = *x ^ *y; // Step 1
  *x = *x ^ *y; // Step 2
  *y = *x ^ *y; // Step 3
}

int main() {
  int a = 1, b = 1;
  inplace_swap(&a,&b);
  printf("%d, %d", a,b);
  // 1, 1
  return 0;
}
