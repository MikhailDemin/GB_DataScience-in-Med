# 6. В одномерном массиве найти сумму элементов, находящихся между минимальным и максимальным элементами.
# Сами минимальный и максимальный элементы в сумму не включать.
# ------------------------------------------------------
# Решение:

# Сгенерируем массив с помощью randint и size. Выведем его на экран:
import random

size = int(input('Введите размер массива: '))
array = [random.randint(0, 10000) for _ in range(size)]
print(f'Получили массив:\n{array}')
print('*' * 30)

# Возьмем механизм поиска мин и макс элементов из решения задачи №3 к данному уроку. Создадим 2 переменные, куда будем
# записывать значения индексов мин и макс элементов массива:
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

# Так как мы при создании массива не знаем в какой последовательности будут идти мин и макс элементы в массиве друг за
# другом, нам может понадобиться суммировать элементы между ними от начала к концу массива, либо от конца к началу.
# В 3-й задаче мы меняли мин и макс элементы безусловно. В контексте текущей задачи мы применим этот код с целью
# снижения сложности программы. Введем условие перестановки элементов только в случае если мин элемент окажется в
# массиве после макс элемента. Результат и скорость работы алгоритма не поменяется, но кода будет меньше.
if min_item > max_item:
    min_item, max_item = max_item, min_item
    print(f'\nПоменяем их местами:')
    print(f'min элемент = {array[min_item]}, его индекс: {min_item}')
    print(f'max элемент = {array[max_item]}, его индекс: {max_item}')

# Теперь вычислим сумму элементов с помощью цикла for in:
summa = 0
for i in range(min_item+1, max_item):
    summa += array[i]
print(f'Сумма элементов между максималным и минимальным элементами: {summa}')
