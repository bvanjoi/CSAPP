#include <stdio.h>

unsigned another_unsigned_high_prod(unsigned x, unsigned y) {
    u_int64_t res = (u_int64_t)x * y;
    return res >> 32;
}

int signed_high_prod(int x, int y) {
    int64_t res = (int64_t)x * y;
    return res >> 32;
}

unsigned unsigned_high_prod(unsigned x, unsigned y) {
    int sign_x = x >> 31;
    int sign_y = y >> 31;
    return signed_high_prod(x, y) + (-sign_y & x) + (-sign_x & y);
}

int main(){
    unsigned x = 0x12345678;
	  unsigned y = 0xFFFFFFFF;
    printf("%x\n", unsigned_high_prod(x,y));
    printf("%x\n", another_unsigned_high_prod(x,y));
    
    printf("%d", unsigned_high_prod(x, y) == another_unsigned_high_prod(x, y));
    return 0;
}