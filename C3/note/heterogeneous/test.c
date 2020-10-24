#include <stdio.h>

int main() {
    double d = 2.2;
    unsigned long l = (unsigned long)d;
    printf("l = %ld\n", l);

    union
    {
      double t;
      unsigned long u;
    } temp;
    temp.t  = 2.2;
    printf("temp.u = %ld\n", temp.u);
}