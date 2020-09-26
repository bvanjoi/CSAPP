#include <stdio.h>

int mul3div4(int x) {
    int mul_res = (x << 1) + x;
    int sign_x = (x>>31) & 0x1;
    int bias = (~sign_x+1) & ((1<<2)-1);
    int res = (mul_res + bias)>>2;
    return res;
}

int main(){
    int TMin = 1<<31;
    int TMax = TMin + ~0;
    printf("%x\n", mul3div4(-4));
    printf("%x\n", 3 * (-4) / 4);
    return 0;
}