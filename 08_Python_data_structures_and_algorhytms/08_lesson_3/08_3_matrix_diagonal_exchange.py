import random

size = 5

matrix = [[random.randint(-15, 15) for _ in range(size)] for _ in range(size)]
for line in matrix:
    for item in line:
       print(f'{item:>5}', end='')
    print()

for i in range(size):
    for j in range(size):
        if i == j:

            spam = matrix[i][j]
            matrix[i][j] = matrix[i][size - 1 - j]
            matrix[i][size - 1 - j] = spam

print('*' * 30)

for line in matrix:
    for item in line:
       print(f'{item:>5}', end='')
    print()
