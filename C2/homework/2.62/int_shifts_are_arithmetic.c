#include <stdio.h>

int int_shifts_are_arithmetic() {
    int x = (int)0x80000000 >> 31;
    return !(x ^ ~0);
}
int main(){
    printf("%d", int_shifts_are_arithmetic());
    return 0;
}