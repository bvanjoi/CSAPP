#include <stdio.h>

typedef unsigned float_bits;

int bits_length(int rest_i) {
    int length = 0;
    while( rest_i) {
        rest_i >>= 1;
        length += 1;
    }
    return length;
}
/* compute (float)i. */
float_bits float_i2f(int i) {
    if( i == 0) {
        return i;
    }
    int sign = (i >> 31) & 0x1;
    if( sign) {
        i = ~i + 1;
    }
    int rest_i = i & (1<<31 + ~0);
    int rest_i_length = bits_length(rest_i);
    unsigned exp = 127 + rest_i_length - 1;
    unsigned frac = (1<<rest_i_length + ~0) & rest_i;
    return (sign << 31) | (exp<<23) | frac;
} 

int main(){
    return 0;
}