#include <stdio.h>

long fun_a(unsigned long x) {
    long val = 0;
    while(x) {
        val = x ^ val;
        x = x >> 1;
    }
    return val & 1;
}

int main() {
    long n = 5;
    printf("%ld\n", fun_a(n));
    return 0;
}