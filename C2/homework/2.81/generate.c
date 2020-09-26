#include <stdio.h>

int generate_A(int k) {
    return ~((1<<k) + ~0);
}

int generate_B(int k, int j) {
    return ~(~((1<<j) + ~0) ^ ((1<<k) + ~0));
} 

int main(){
    printf("%x\n",0x80000001>>2<<2);
    printf("%x\n", generate_A(8));
    printf("%x\n", generate_B(16,8));
    return 0;
}