#include <stdio.h>

int fact_int(long n) {
    if (n == 1) {
        return 1;
    }
    return n * fact_int(n-1);
}

long fact_long(long n) {
    if (n == 1) {
        return 1;
    }
    return n * fact_long(n-1);
}

int main() {
    long n = 21;
    printf("int:  %d\n", fact_int(n));
    printf("long: %ld\n", fact_long(n));
    return 0;
}