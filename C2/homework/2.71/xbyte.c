#include <stdio.h>

typedef unsigned packed_t;

int xbyte(packed_t word, int bytenum) {
    int w = sizeof(packed_t)<<3;
    int left_shift = w - 8 - (bytenum<<3);
    int right_shift = w - 8;
    return (int) word << left_shift >> right_shift;
}

int main(){
    printf("%x", xbyte(0x00812233, 2));
    return 0;
}