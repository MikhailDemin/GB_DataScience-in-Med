# 3. В массиве случайных целых чисел поменять местами минимальный и максимальный элементы.
# ------------------------------------------------------
# Решение:

# Как и в решении задачи №2 для генерации массива используем randint. Количество элементов будет задавать
# пользователь путем ввода числа в переменную size:
import random

size = int(input('Введите размер массива: '))
array = [random.randint(-100, 100) for _ in range(size)]

# Выведем полученный массив:
print(f'Получили массив:\n{array}')
print('*' * 30)

# Создадим 2 переменные, куда будем записывать значения индексов мин и макс элементов массива:
min_item = 0
max_item = 0

# Индексы мин и макс элементы будем искать с помощью цикла for in:
for i in range(size):
    if array[i] < array[min_item]:
        min_item = i
    elif array[i] > array[max_item]:
        max_item = i

# Выведем значения и индексы min и max элементов:
print(f'min элемент = {array[min_item]}, его индекс: {min_item}')
print(f'max элемент = {array[max_item]}, его индекс: {max_item}')

# Поменяем элементы местами и вновь выведем их значения и индексы:
min_item, max_item = max_item, min_item
print(f'\nПоменяем их местами:')
print(f'min элемент = {array[min_item]}, его индекс: {min_item}')
print(f'max элемент = {array[max_item]}, его индекс: {max_item}')
