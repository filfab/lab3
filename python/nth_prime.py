import inout as io

def prime(n):
    primes = [2]
    suspected = 3

    while len(primes) < n:
        sus_is_prime = True
        for i in primes[1:]:
            if suspected % i == 0:
                sus_is_prime = False
                break
        
        if sus_is_prime:
            primes.append(suspected)
        suspected += 2

    return primes[-1]


def write(n, ans):
    if n%10==1:
        print(f'{n}-sza liczba pierwsza: {ans}')
    elif n%10==2:
        print(f'{n}-ga liczba pierwsza: {ans}')
    elif n%10==3:
        print(f'{n}-cia liczba pierwsza: {ans}')
    elif n%100==0:
        print(f'{n}-na liczba pierwsza: {ans}')
    else:
        print(f'{n}-sza liczba pierwsza: {ans}')


def main():
    n, = io.get_input(int)
    ans = prime(n)

    write(n, ans)

    
if __name__ == '__main__':
    main()
