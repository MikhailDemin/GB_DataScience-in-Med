import random


def bin_search(array, value):

    left = 0
    right = len(array) - 1
    pos = len(array) // 2

    while array[pos] != value and left <= right:

        if value > array[pos]:
            left = pos + 1
        else:
            right = pos - 1
        pos = (left + right) // 2

    return -1 if left > right else pos


a = [random.randint(0, 1000) for _ in range(200)]
a.sort()
print(a)

n = int(input("Какой элемент искать: "))
print(bin_search(a, n))
