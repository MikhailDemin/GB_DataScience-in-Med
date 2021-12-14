# 2. Отсортируйте по возрастанию методом слияния одномерный вещественный массив, заданный случайными числами на
# промежутке [0; 50). Выведите на экран исходный и отсортированный массивы.
# ------------------------------------------------------
# Решение:
import random


def merge_sort(array):
    def merge(a, b):
        i = 0
        j = 0
        length_a = len(a)
        length_b = len(b)
        result = []
        while i != length_a and j != length_b:
            if a[i] < b[j]:
                result.append(a[i])
                i += 1
            elif a[i] > b[j]:
                result.append(b[j])
                j += 1
            else:
                result.append(a[i])
                result.append(b[j])
                i += 1
                j += 1
        if i < length_a:
            result.extend(a[i:])
        if j < length_b:
            result.extend(b[j:])
        return result

    if len(array) < 2:
        return array

    idx = len(array) // 2
    return merge(merge_sort(array[:idx]), merge_sort(array[idx:]))


lst = [random.uniform(0, 50) for _ in range(10)]
print(f'Список до сортировки:\n{lst}')
new_list = merge_sort(lst)
print(f'Список после сортировки:\n{lst}')
