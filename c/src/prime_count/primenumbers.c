#include <math.h>
#include "primenumbers.h"

void compute_sieve(bool s[], unsigned n) {
    unsigned i, j, k;
    for (i=3; i<=n; i++) { s[i] = i%2!=0; }
    s[0] = false;
    s[1] = false;
    s[2] = true;
    k = sqrt(n);

    for (i=3; i<=k; i+=2) {
        if (s[i]) {
            for (j=i*i; j<=n; j+=i) {
                s[j] = false;
            }
        }
    }
}

unsigned count_primes(bool s[], unsigned n) {
    int i, c = 0;
    if (n >= 2) {
        c++;
        for (i=3; i<=n; i+=2) {
            if (s[i]) { c++; }
        }
    } 
    return c;
}
