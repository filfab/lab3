import sys

def main():
    try:
        if len(sys.argv) == 1:
            n = int(input('Podaj liczbę: '))
        elif len(sys.argv) == 2:
            n = int(sys.argv[1])
        else:
            print('Niepoprawna liczba argumentów')
            return
        if (n <= 0): raise ValueError
    except ValueError:
        print('Niepoprawny format argumentu')
        return

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

    if n%10==1:
        print(f'{n}-sza liczba pierwsza: {primes[-1]}')
    elif n%10==2:
        print(f'{n}-ga liczba pierwsza: {primes[-1]}')
    elif n%10==3:
        print(f'{n}-cia liczba pierwsza: {primes[-1]}')
    elif n%100==0:
        print(f'{n}-na liczba pierwsza: {primes[-1]}')
    else:
        print(f'{n}-sza liczba pierwsza: {primes[-1]}')

    
if __name__ == '__main__':
    main()
