#include <stdio.h>

int divide_power2(int x, int k) {
    int sign = (x>>31) & 0x1;
    int bias = (1 << k) -1;
    bias = (~sign + 1) & bias;
    return  (x + bias) >> k;
}

int main(){
    int x  = 0x80000007;
    printf("%d\n",x);
    printf("%x\n", divide_power2(x,2));
    printf("%x\n", x / 4);
    return 0;
}