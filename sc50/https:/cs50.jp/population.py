def population(n):
    born = n / 3
    deth = n / 4
    now = n + born - deth
    print(now)
    return now

i = 0
n = int(input("NUM"))

while(i<3):
    n = population(n)
    i += 1
