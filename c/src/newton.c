#include <stdio.h>

int input(unsigned *n, unsigned *k, int argc, char const *argv[]) {
    switch (argc) {
    case 1:
        printf("Podaj pierwszy argument: ");
        if (scanf("%u", n) != 1) {
            printf("Niepoprawny pierwszy argument\n");
            return -1;
        }
        printf("Podaj drugi argument: ");
        if (scanf("%u", k) != 1 || *k > *n) {
            printf("Niepoprawny drugi argument\n");
            return -1;
        }
        break;

    case 3:
        if (sscanf(argv[1], "%u", n) != 1) {
            printf("Niepoprawny pierwszy argument\n");
            return -1;
        }
        if (sscanf(argv[2], "%u", k) != 1 || *k > *n) {
            printf("Niepoprawny drugi argument\n");
            return -1;
        }
        break;
    
    default:
        printf("Niepoprawna liczba argumentów\n");
        return -1;
    }

    return 0;
}


unsigned newton(unsigned m, unsigned l) {
    if (l > m) { return 0; }

    unsigned n = m, k = l;
    if (k > n-k) { k = n-k; }

    unsigned t[k+1];
    t[0] = 1;
    t[1] = 1;

    for (unsigned i = 2; i <= n; i++) {
        t[i] = 0;
        if (i < k) {
            for (unsigned j = i; j > 0; j--) {
                t[j] += t[j-1];
            }
        } else {
            for (unsigned j = k; j > 0; j--) {
                t[j] += t[j-1];
            }
        }
    }

    return t[k];
}


int main(int argc, char const *argv[]) {
    unsigned n, k, ans;
    if (input(&n, &k, argc, argv) == -1) { return -1; }

    ans = newton(n, k);
    if (ans == 0) {
        printf("Niepoprawne argumenty funkcji (k>n)");
    } else {
        printf("(%u %u) = %u\n", n, k, ans);
    }

    return 0;
}
