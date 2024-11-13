import math

def create_sieve(s, n):
    s.append(False) #0
    s.append(False) #1
    s.append(True)  #2
    for i in range(3, n+1):
        s.append(i%2 != 0)


def compute_sieve(s):
    k = int(math.sqrt(len(s)))
    for i in range(3, k, 2):
        if s[i]:
            j = i + i
            while j < len(s):
                s[j] = False
                j = j + i


def count_primes(s):
    c = 0
    for i in s:
        if i:
            c += 1
    return c
