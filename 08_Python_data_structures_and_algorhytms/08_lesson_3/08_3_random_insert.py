import random

array = [random.randint(-100, 100) for _ in range(100)]
print(array)

num = int(input("Введите целое число для вставки: "))
pos = int(input("На какую позицию вставить число: "))

# inside insert method:
# array.append(None)
# i = len(array) - 1
#
# while i > pos:
#     array[i], array[i - 1] = array[i - 1], array[i]
#     i -= 1

#array_new = array[:pos] + [num] + array[pos:]

array.insert(num, pos)

array[pos] = num
print(array)
