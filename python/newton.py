import sys

def main():
    try:
        if len(sys.argv) == 1:
            n = int(input('Podaj pierwszy argument: '))
            k = int(input('Podaj drugi argument: '))
        elif len(sys.argv) == 3:
            n = int(sys.argv[1])
            k = int(sys.argv[2])
        else:
            print('Niepoprawna liczba argumentów')
            return
    except ValueError:
        print('Niepoprawny format argumentów')
        return

    if k > n-k: k = n-k

    t = [1, 1]
    for i in range(2, n+1):
        t.append(0)
        for j in range(i if i<k else k, 0, -1):
            t[j] += t[j-1]

    print(t[k])

    
if __name__ == '__main__':
    main()
