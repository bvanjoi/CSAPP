#include <stdio.h>

unsigned srl(unsigned x, int k) {
    unsigned xsra = (int)x >> k;
    int w = sizeof(int)<<3;
    int mask = ((int)-1 << (w-k));
    return xsra & ~mask;
}
int sra(int x, int k) {
    int xsrl = (unsigned)x >> k;
    int w = sizeof(int) << 3;
    int mask = ((int)-1 << (w-k));
    mask = mask & (!(x&(1<<(w-1)))-1);
    return mask | xsrl;
}
int main(){
    return 0;
}