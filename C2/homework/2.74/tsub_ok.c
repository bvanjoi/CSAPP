#include <stdio.h>

int tsub_ok(int x, int y) {
    int sub = x - y;
    int sign_x = (x>>31) & 0x1;
    int sign_y = (y>>31) & 0x1;
    int sign_sub = (sub>>31) & 0x1;
    int positive_overflow = !sign_x && sign_y && sign_sub;
    int negative_overflow = sign_x && !sign_y && !sign_sub;
    int y_is_TMin = !(y ^ (1<<31));
    return !y_is_TMin && !(positive_overflow || negative_overflow);
}

int main(){
    int TMin = 1 << 31;
    int TMax = TMin + ~0;
    printf("%x", tsub_ok(TMax, -0x01));
    return 0;
}