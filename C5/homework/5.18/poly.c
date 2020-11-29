/* calculate a0 + a1*x + a2*x^2 + ... + an*x^n */
double poly(double a[], double x, long degree) {
  long i;
  double result = a[0];
  double xpwr = x;
  for (i = 1; i <= degree; i++) {
    result += a[i] * xpwr;
    xpwr = x * xpwr;
  }
  return result;
}

/* version 6*3a */
double poly_6_3a(double a[], double x, long degree) {
  long i = 1;
  double result = a[0];
  double result1 = 0;
  double result2 = 0;

  double xpwr = x;
  double xpwr1 = x * x * x;
  double xpwr2 = x * x * x * x * x;

  double xpwr_step = x * x * x * x * x * x;
  for (; i <= degree - 6; i+=6) {
    result = result + (a[i]*xpwr + a[i+1]*xpwr*x);
    result1 = result1 + (a[i+2]*xpwr1 + a[i+3]*xpwr1*x);
    result2 = result2 + (a[i+4]*xpwr2 + a[i+5]*xpwr2*x);

    xpwr *= xpwr_step;
    xpwr1 *= xpwr_step;
    xpwr2 *= xpwr_step;
  }

  for (; i <= degree; i++) {
    result = result + a[i]*xpwr;
    xpwr *= x;
  }

  return result + result1 + result2;
}

/* apply horner's method */
double polyh(double a[], double x, long degree) {
  long i;
  double result = a[degree];
  for (i = degree-1; i >= 0; i--) {
    result = a[i] + x*result;
  }
  return result;
}
