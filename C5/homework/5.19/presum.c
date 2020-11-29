/* version 4*1a */
void psum_4_1a(float a[], float p[], long n) {
  long i;
  float val, last_val;
  float tmp, tmp1, tmp2, tmp3;
  last_val = p[0] = a[0];

  for (i = 1; i < n - 4; i++) {
    tmp = last_val + a[i];
    tmp1 = tmp + a[i+1];
    tmp2 = tmp1 + a[i+2];
    tmp3 = tmp2 + a[i+3];

    p[i] = tmp;
    p[i+1] = tmp1;
    p[i+2] = tmp2;
    p[i+3] = tmp3;

    /* key point */
    last_val = last_val + (a[i] + a[i+1] + a[i+2] + a[i+3]);
  }

  for (; i < n; i++) {
    last_val += a[i];
    p[i] = last_val;
  }
}