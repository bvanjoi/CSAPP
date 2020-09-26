#include <stdio.h>

typedef unsigned char *byte_pointer;  // len: 8

void show_bytes( byte_pointer start, size_t len) {
    size_t i;
    for( i = 0; i < len; i++) {
        printf("%.2x", start[i]); // $.2x indicates that an interger should be printed in hex.
    }
    printf("\n");
}

void show_short(short x) {
    show_bytes((byte_pointer) &x, sizeof(short));
}

void show_long(long x) {
    show_bytes((byte_pointer) &x, sizeof(long));
}

void show_double(double x) {
    show_bytes((byte_pointer) &x, sizeof(double));
}

int main() {
    short x = 0x0123;
    long y = 0x0123456789ABCDEF;
    double z = 1234.56789;

    show_short(x);
    show_long(y);
    show_double(z);
return 0;}