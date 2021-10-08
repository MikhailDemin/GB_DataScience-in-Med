# 4. Определить, какое число в массиве встречается чаще всего.
# ------------------------------------------------------
# Решение:

# Сгенерируем массив с помощью randint и size. Выведем на экран:
import random

size = 150
array = [random.randint(-15, 15) for _ in range(size)]
print(f'Получили массив:\n{array}')
print('*' * 30)

# С помощью цикла for in будем перебирать все элементы массива и записывать в переменную-счетчик количество
# повторяющихся элементов:
num = array[0]
max_freq = 1
for i in range(size - 1):
    freq = 1
    for k in range(i + 1, size):
        if array[i] == array[k]:
            freq += 1
    if freq > max_freq:
        max_freq = freq
        num = array[i]

if max_freq > 1:
    print(max_freq, 'раз(а) встречается число', num)
else:
    print('Все элементы уникальны')
