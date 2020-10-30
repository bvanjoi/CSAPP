#include<stdio.h>

long cread_alt(long *xp) {
  return xp ? *xp : 0;
}

int main() {
  long* xp = 1;
  cread_alt(xp);
  return 0;
}