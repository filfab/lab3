import prime_count_src.primenumbers as pp
import prime_count_src.inout as io

def main():
    n, = io.get_input(int)
    s = []

    pp.create_sieve(s, n)
    pp.compute_sieve(s)
    c = pp.count_primes(s)
    print(c)


if __name__ == '__main__':
    main()
