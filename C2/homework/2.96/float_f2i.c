#include <stdio.h>

typedef unsigned float_bits;

/* compute (int)f. if f is NaN or cause overflow, then return 0x80000000*/
int float_f2i(float_bits f) {
    unsigned sign = f >> 31;
    unsigned exp = f>>23 & 0xFF;
    unsigned frac = f & 0x7fffff;
    int res;
    if( exp == 0xff) {
        return 0x80000000;
    } else if( exp < 127) { //denormalized
        // less 0
        res = 0;
    } else if( exp >= 158) {
        return 0x80000000;
    } else if( exp - 127 > 23) {
        res = (frac | 0x8000000) >> (exp - 127 - 23);
    } else {
        res = (frac | 0x8000000) >> (23 - (exp - 127));
    }
    return sign ? -res : res;
} 

int main(){
    return 0;
}