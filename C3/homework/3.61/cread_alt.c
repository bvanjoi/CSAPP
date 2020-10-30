#include<stdio.h>

long cread_alt(long *xp) {
  int result = 0;
  if (!xp) {
    return 0;
  }
  return *xp;
}

int main() {
  long* xp = 1;
  cread_alt(xp);
  return 0;
}