#include <stdio.h>

int main(int argc, char const *argv[])
{
    unsigned n, k;

    switch (argc) {
    case 1:
        printf("Podaj pierwszy argument: ");
        if (scanf("%u", &n) != 1) {
            printf("Niepoprawny pierwszy argument\n");
            return -1;
        }
        printf("Podaj drugi argument: ");
        if (scanf("%u", &k) != 1 || k > n) {
            printf("Niepoprawny drugi argument\n");
            return -1;
        }
        break;

    case 3:
        if (sscanf(argv[1], "%u", &n) != 1) {
            printf("Niepoprawny pierwszy argument\n");
            return -1;
        }
        if (sscanf(argv[2], "%u", &k) != 1 || k > n) {
            printf("Niepoprawny drugi argument\n");
            return -1;
        }
        break;
    
    default:
        printf("Niepoprawna liczba argumentów\n");
        return -1;
    }


    if (k > n-k) { k = n-k; }

    unsigned t[n+1];
    t[0] = 1;
    t[1] = 1;

    for (unsigned i = 2; i <= n; i++) {
        t[i] = 0;
        for (unsigned j = (i<k ? i : k); j > 0; j--) {
            t[j] += t[j-1];
        }
    }

    printf("%u\n", t[k]);

    return 0;
}
