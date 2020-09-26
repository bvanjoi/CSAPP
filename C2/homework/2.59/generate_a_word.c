#include <stdio.h>

int main() {
    int x = 0x89ABCDEF;
    int y = 0x76543210;
    int res = (x & 0xFF) | (y & (~0xFF));
    printf("%x",res);
    return res;
}