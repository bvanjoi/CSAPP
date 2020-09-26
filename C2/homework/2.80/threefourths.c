#include <stdio.h>

int threefourths(int x) {
    int64_t mul_res = ((int64_t)x << 1) + x;
    int sign_x = (x>>31) & 0x1;
    int bias = (~sign_x+1) & ((1<<2)-1);
    int res = (mul_res + bias)>>2;
    return res;
}

int main(){
    int TMin = 1<<31;
    int TMax = TMin + ~0;
    printf("%d\n", threefourths(TMax));
    printf("%x\n", 3 * (TMax) / 4);
    return 0;
}