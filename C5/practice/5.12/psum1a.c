void psum1a(float a[], float b[], long n) {
    long i;
    float last_value = 0;
    last_value = p[0] = a[0];
    for (i = 1; i < n; i++) {
        float val = last_value + a[i];
        p[i] = val;
        last_value = val;
    }
}