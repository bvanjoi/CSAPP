#include <stdio.h>

int fits_bits(int x, int n) {
    int w = sizeof(int) << 3;
    int offset = w - n; 
    return !(( x << offset >> offset) ^ x);
}

int main(){
    printf("%d",fits_bits(0b0110,3));
    return 0;
}