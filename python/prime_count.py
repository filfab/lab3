import sys
import prime_count_src.primenumbers as pp

def main():
    try:
        if len(sys.argv) == 1:
            n = int(input('Podaj liczbę: '))
        elif len(sys.argv) == 2:
            n = int(sys.argv[1])
        else:
            print('Niepoprawna liczba argumentów')
            return
    except ValueError:
        print('Niepoprawny format argumentów')
        return

    s = []

    pp.create_sieve(s, n)
    pp.compute_sieve(s)
    c = pp.count_primes(s)
    print(c)


if __name__ == '__main__':
    main()
