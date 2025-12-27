#!/usr/bin/env c -lm --
#include <stdio.h>
#include <math.h>

int main(void) {
    double x = 2.0;
    printf("pow(%.1f, 10) = %.0f\n", x, pow(x, 10));
    printf("sqrt(%.1f) = %.2f\n", x, sqrt(x));
    return 0;
}

