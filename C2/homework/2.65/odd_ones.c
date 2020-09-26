#include <stdio.h>

int odd_ones(int x) {
    x ^= x>>16;
    x ^= x>>8;
    x ^= x>>4;
    x ^= x>>2;
    x ^= x>>1;
    return x & 0x1;
}

int main(){
    printf("%d",odd_ones(0x01010101));
    return 0;
}