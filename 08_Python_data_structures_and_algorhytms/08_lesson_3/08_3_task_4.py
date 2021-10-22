# 4. Определить, какое число в массиве встречается чаще всего.
# ------------------------------------------------------
# Решение:

# Сгенерируем массив с помощью randint и size. Выведем на экран:
import random

size = 150
array = [random.randint(-15, 15) for _ in range(size)]
print(f'Получили массив:\n{array}')
print('*' * 30)

# В цикле for in будем сравнивать количество повторений текущего элемента со значением максимального количества
# вхождений:
num = array[0]
max_freq = 1
for i in range(size - 1):
    freq = 1
    # Во вложенном цикле for in будем перебирать все элементы массива и записывать в переменную-счетчик количество
    # вхождений текущего элемента:
    for k in range(i + 1, size):
        if array[i] == array[k]:
            freq += 1
    # Если количество повторов текущего элемента больше максимального, тогда переменной max_freq присваивается значение
    # повторов текущего элемента:
    if freq > max_freq:
        max_freq = freq
        num = array[i]

# Выведем полученный результат на экран:
if max_freq > 1:
    print(max_freq, 'раз(а) встречается число', num)
else:
    print('Все элементы уникальны')