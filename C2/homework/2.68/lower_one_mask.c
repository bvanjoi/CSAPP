#include <stdio.h>

int lower_one_mask(int n) {
    return (unsigned) -1 >> ((sizeof(int) << 3) - n);
}
int main(){
  printf("%x",lower_one_mask(32));
  return 0;
}