#include <stdio.h>

typedef unsigned float_bits;

/* compute 0.5*f. if f is NaN, then return f*/
float_bits float_half(float_bits f) {
    unsigned sign = f >> 31;
    unsigned exp = f>>23 & 0xFF;
    unsigned frac = f & 0x7fffff;
    unsigned rest = f & 0x7fffffff;
    int addition = (frac & 0x3) == 0x3;
    
    if( exp == 0xff) {
        return f;
    } else if( exp == 0) { //denormalized
        frac >>= 1;
        frac += addition;
    } else if( exp == 1) {
        rest >>= 1;
        rest += addition;
        exp = rest >> 23 & 0xFF;
        frac = rest & 0x7fffff;
    }
    else {
        exp -= 1;
    }
    return (sign << 31)| (exp << 23) | frac;
} 

int main(){
    return 0;
}