#include <stdio.h>

typedef unsigned float_bits;

/* compute 2*f. if f is NaN, then return f*/
float_bits float_twice(float_bits f) {
    unsigned sign = f >> 31;
    unsigned exp = f>>23 & 0xFF;
    unsigned frac = f & 0x7fffff;
    if( exp == 0xff) {
        return f;
    } else if( exp == 0) { //denormalized
        frac <<= 1;
    } else if( exp == 0xfe) { // 2f is inf
        exp = 0xff;
        frac = 0;
    } else {
        exp += 1;
    }
    return (sign << 31)| (exp << 23) | frac;
} 

int main(){
    return 0;
}