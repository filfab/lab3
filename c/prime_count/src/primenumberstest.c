#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include "primenumbers.h"

int main(int argc, char const *argv[]) {
    unsigned long n,c;
    bool *s;

    switch (argc) {
        case 1:
            printf("Podaj liczbę: ");
            if (scanf("%lu", &n) != 1) {
                printf("Zły format argumentu\n");
                return -1;
            }
            break;

        case 2:
            if (sscanf(argv[1], "%lu", &n) != 1) {
                printf("Zły format argumentu\n");
                return -1;
            }
            break;

        default:
            printf("Zła liczba argumentów\n");
            return -1;
    }

    s = malloc((n+1)*sizeof(bool));
    compute_sieve(s, n);
    c = count_primes(s, n);
    free(s);
    printf("%lu\n", c);
    return 0;
}
