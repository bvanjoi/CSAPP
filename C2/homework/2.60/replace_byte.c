#include <stdio.h>

unsigned replace_byte( unsigned x, int i, unsigned char b) {
    if( i < 0) {
      printf("error: i is negative\n");
      return x;
    } 
    unsigned mask1 = b<<(i<<3);
    unsigned mask2 = 0xFF << (i<<3);
    return (x & (~mask2)) | mask1;
}

int main() {
    printf("%x", replace_byte(0x12345678, 3, 0xAB));
    return 0;
}