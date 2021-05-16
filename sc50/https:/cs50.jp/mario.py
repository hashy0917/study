def mario(height):
    for i in range(height):
        for a in range(height - i):
            print(" ", end='')
        for b in range(i + 1):
            print("#", end='')
        print("")

mario(int(input("height:"))
