# 2. Во втором массиве сохранить индексы четных элементов первого массива.
# Например, если дан массив со значениями 8, 3, 15, 6, 4, 2, второй массив надо заполнить значениями
# 0, 3, 4, 5 (помните, что индексация начинается с нуля), т. к. именно в этих позициях первого массива
# стоят четные числа.
# ------------------------------------------------------
# Решение:

# Задача похожа на пример с сортировкой на '+' и '-' числа. Для генерации первого массива используем randint.
# Количество элементов будет задавать пользователь путем ввода числа в переменную size:
import random

size = int(input('Введите размер массива: '))
first_arr = [random.randint(-100, 100) for _ in range(size)]

# Второй массив будем заполнять индексами четных элементов первого массива с помощью тернарного оператора:
second_arr = [i for i, item in enumerate(first_arr) if item % 2 == 0]

# Выведем полученный результат. Сначала первый массив:
print(first_arr)
# А затем и второй массив:
print(f'Индексы четных элементов: \n{second_arr}')