#include <stdio.h>

typedef unsigned float_bits;

/* compute |f|. if f is NaN, then return f*/
float_bits float_absval(float_bits f) {
    unsigned exp = f>>23 & 0xFF;
    unsigned frac = f & 0x7fffff;
    if( exp == 0xff && frac) {
        return f;
    }
    return (f & 0x7fffffff);
} 

int main(){
    return 0;
}