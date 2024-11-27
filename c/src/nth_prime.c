#include <stdio.h>
#include <stdbool.h>

bool input(unsigned *n, int argc, char const *argv[]) {
    switch (argc) {
        case 1:
            printf("Podaj liczbę: ");
            if (scanf("%u", n)!=1 || *n<=0) {
                printf("Niepoprawna forma argumentu\n");
                return false;
            };
            break;

        case 2:
            if (sscanf(argv[1], "%u", n)!=1 || *n<=0) {
                printf("Niepoprawna forma argumentu\n");
                return false;
            }
            break; 
        
        default:
            printf("Niepoprawna liczba argumentów\n");
            return false;
    }
    return true;
}

void output(unsigned n, unsigned primes) {
    switch (n % 10) {
        case 1:
            printf("%d-sza liczba pierwsza: %d\n", n, primes);
            break;
        
        case 2:
            printf("%d-ga liczba pierwsza: %d\n", n, primes);
            break;

        case 3:
            printf("%d-cia liczba pierwsza: %d\n", n, primes);
            break;

        default:
            if (n%10 == 0) {
                printf("%d-na liczba pierwsza: %d\n", n, primes);
                break;
            }
            printf("%d-ta liczba pierwsza: %d\n", n, primes);
            break;
    }
}

unsigned nth_prime(unsigned m) {
    unsigned n = m;
    unsigned primes[n], suspected = 3, counter = 1;
    primes[0] = 2;
    bool sus_is_prime;

    while (counter < n) {
        sus_is_prime = true;
        for (int i = 1; i < counter; i++) {
            if (suspected % primes[i] == 0) {
                sus_is_prime = false;
                break;
            }
        }

        if (sus_is_prime) {
            primes[counter] = suspected;
            counter++;
        }
        suspected += 2;
    }

    return primes[counter-1];
}

int main(int argc, char const *argv[])
{
    unsigned n;
    if (!input(&n, argc, argv)) { return -1; }

    unsigned prime = nth_prime(n);

    output(n, prime);
    return 0;
}
