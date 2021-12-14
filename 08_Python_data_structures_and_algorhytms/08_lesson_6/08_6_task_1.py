# 1. Подсчитать, сколько было выделено памяти под переменные в ранее разработанных программах в рамках первых трех
# уроков. Проанализировать результат и определить программы с наиболее эффективным использованием памяти.
# Примечание: По аналогии с эмпирической оценкой алгоритмов идеальным решением будет:
# a. выбрать хорошую задачу, которую имеет смысл оценивать по памяти;
# b. написать 3 варианта кода (один у вас уже есть); проанализировать 3 варианта и выбрать оптимальный;
# c. результаты анализа (количество занятой памяти в вашей среде разработки) вставить в виде комментариев в файл с
# кодом. Не забудьте указать версию и разрядность вашей ОС и интерпретатора Python;
# d. написать общий вывод: какой из трёх вариантов лучше и почему.
# Надеемся, что вы не испортили программы, добавив в них множество sys.getsizeof после каждой переменной, а проявили
# творчество, фантазию и создали универсальный код для замера памяти.
# ------------------------------------------------------
# Решение:
import sys


def show_sizeof(x, memory_list, level=0):
    print("\t" * level, x.__class__, sys.getsizeof(x), x)
    memory_list.append(sys.getsizeof(x))
    if hasattr(x, '__iter__'):
        if hasattr(x, 'items'):
            for key, value in x.items():
                show_sizeof(key, memory_list, level + 1)
                show_sizeof(value, memory_list, level + 1)
        elif not isinstance(x, str):
            for item in x:
                show_sizeof(item, memory_list, level + 1)


def memory_size(user_objects):
    sum_mem = 0
    for obj in user_objects:
        mem_list = []
        if obj.startswith('__'):
            continue
        elif hasattr(user_objects[obj], '__call__'):
            continue
        elif hasattr(user_objects[obj], '__loader__'):
            continue
        else:
            show_sizeof(user_objects[obj], mem_list)
            for item in mem_list:
                sum_mem += item
    return f'The total sum of memory is: {sum_mem} byte'


# Найти сумму n элементов следующего ряда чисел: 1 -0.5 0.25 -0.125 ...Количество элементов (n) вводится с клавиатуры.

if __name__ == '__main__':
    count_elements = int(input("Input n: "))
    element = 1
    sequence_sum = element
    for counter in range(1, count_elements):
        element /= -2
        sequence_sum += element
    print("For {0} elements, the total sum is {1}.".format(count_elements, sequence_sum))
    print(memory_size(locals()))

# n = 5
# <class 'int'> 28 5
# <class 'float'> 24 0.0625
# <class 'float'> 24 0.6875
# <class 'int'> 28 4
# The total sum of memory is: 3403 byte

if __name__ == '__main__':
    length = int(input("Input n: "))
    row = [1, ]
    summ = row[0]

    for i in range(1, length):
        row.append(row[i - 1] / -2)
        summ = summ + row[i]

    print(f'Sum {length} elements in line {row} \n = {summ}')
    print(memory_size(locals()))

# n = 5
#  <class 'int'> 28 5
#  <class 'list'> 120 [1, -0.5, 0.25, -0.125, 0.0625]
# 	 <class 'int'> 28 1
# 	 <class 'float'> 24 -0.5
# 	 <class 'float'> 24 0.25
# 	 <class 'float'> 24 -0.125
# 	 <class 'float'> 24 0.0625
#  <class 'float'> 24 0.6875
#  <class 'int'> 28 4
# The total sum of memory is: 3623 byte

if __name__ == '__main__':
    n = int(input("Input n: "))
    result = 1 * (1 - (-0.5) ** n) / (1 - (-0.5))
    print(result)

    print(f'Sum {n} elements = {result}')
    print(memory_size(locals()))

# n = 5
#  <class 'int'> 28 5
#  <class 'float'> 24 0.6875
# The total sum of memory is: 3351 byte

# Из 3 алгоритмов решения задачи наиболее оптимальным является 3 вариант, так как он потребляет меньше всего памяти в
# системе и использует меньшее количество переменных.
# ОС: Windows 10 64-bit
# Python 3.9.7