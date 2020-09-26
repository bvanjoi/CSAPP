#include <stdio.h>

int saturating_add(int x, int y) {
    int TMin =  1<<31;
    int TMax = TMin + ~0;
    int res = x + y;
    int sign_x = (x>>31) & 0x1;
    int sign_y = (y>>31) & 0x1;
    int sign_res = (res>>31) & 0x1;
    int positive_overflow = !sign_x && !sign_y && sign_res;
    int negative_overflow = sign_x && sign_y && !sign_res;
    (positive_overflow && (res = TMax));
    (negative_overflow && (res = TMin));
    return res;
}


int main(){
    printf("%x", saturating_add(((1<<31) + (~0)), 0x1234));
    return 0;
}