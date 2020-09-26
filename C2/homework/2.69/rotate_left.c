#include <stdio.h>

int rotate_left(unsigned x, int n) {
    int w = sizeof(int) << 3;
    int mask = (~((unsigned) -1 >> n) & x) >> (w-n);
    return (x << n) | mask;
}

int main(){
    printf("%x", rotate_left(0x12345678, 0));
    return 0;
}