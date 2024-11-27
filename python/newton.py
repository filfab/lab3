import inout as io

def newton(m, l):
    if l > m:
        print(f'n ({m}) must be greater than k ({l})')
        exit(-1)

    n, k = m, l
    if k > n-k:
        k = n-k

    t = [0 for _ in range(k+1)]
    t[0] = 1
    t[1] = 1

    for i in range(2, n+1):
        if i < k:
            for j in range(i, 0, -1):
                t[j] += t[j-1]
        else:
            for j in range(k, 0, -1):
                t[j] += t[j-1]

    return t[k]


def main():
    n, k = io.get_input(int, int)

    print(newton(n, k))

    
if __name__ == '__main__':
    main()
