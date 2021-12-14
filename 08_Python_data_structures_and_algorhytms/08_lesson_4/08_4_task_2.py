# 2. Написать два алгоритма нахождения i-го по счёту простого числа. Функция нахождения простого числа должна принимать
# на вход натуральное и возвращать соответствующее простое число. Проанализировать скорость и сложность алгоритмов.
# Первый — с помощью алгоритма «Решето Эратосфена».
# Примечание. Алгоритм «Решето Эратосфена» разбирался на одном из прошлых уроков.
# Используйте этот код и попробуйте его улучшить/оптимизировать под задачу.
# Второй — без использования «Решета Эратосфена».
# Примечание. Вспомните классический способ проверки числа на простоту.
# ------------------------------------------------------
# Решение:
import cProfile


# def erat_num(n):
#     array = [i for i in range(n)]
#     array[1] = 0
#     for i in range(2, n):
#         if array[i] != 0:
#             j = i * 2
#
#             while j < n:
#                 array[j] = 0
#                 j += i
#
#     result = [i for i in array if i != 0]
#     print(f'Количество простых чисел в диапазоне до {n}: {len(result)}')


def search_prime(n):  # функция поиска простых чисел перебором проверкой деления на известные простые числа
    count = 1  # переменная для хранения последней позиции простого числа в последовательности.
    # В позиции 1 находится число 2
    number = 1  # переменная для хранения очередного проверямого числа из последовательности натуральных чисел
    prime = [2]  # инициализируем список для хранения простых чисел начальным значением = 2.

    if n == 1:
        return 2

    while count != n:
        number += 2  # очередное проверяемое число последовательности. Кратные 2 таким образом просеяли.

        for num in prime:
            if number % num == 0:
                break
        else:
            count += 1
            prime.append(number)

    return number


# cProfile.runctx("erat_num(10000000)", globals(), locals())

# Количество простых чисел в диапазоне до 10000000: 664579
#          8 function calls in 5.074 seconds
#    Ordered by: standard name
#    ncalls  tottime  percall  cumtime  percall filename:lineno(function)
#         1    4.194    4.194    5.009    5.009 08_4_task_2.py:15(erat_num)
#         1    0.530    0.530    0.530    0.530 08_4_task_2.py:16(<listcomp>)
#         1    0.285    0.285    0.285    0.285 08_4_task_2.py:26(<listcomp>)
#         1    0.065    0.065    5.074    5.074 <string>:1(<module>)
#         1    0.000    0.000    5.074    5.074 {built-in method builtins.exec}
#         1    0.000    0.000    0.000    0.000 {built-in method builtins.len}
#         1    0.000    0.000    0.000    0.000 {built-in method builtins.print}
#         1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}

cProfile.runctx("search_prime(10000)", globals(), locals())

# Количество простых чисел в диапазоне до 10000: 10000
#          10005 function calls in 2.429 seconds
#    Ordered by: standard name
#    ncalls  tottime  percall  cumtime  percall filename:lineno(function)
#         1    2.428    2.428    2.429    2.429 08_4_task_2.py:28(search_prime)
#         1    0.000    0.000    2.429    2.429 <string>:1(<module>)
#         1    0.000    0.000    2.429    2.429 {built-in method builtins.exec}
#         1    0.000    0.000    0.000    0.000 {built-in method builtins.len}
#         1    0.000    0.000    0.000    0.000 {built-in method builtins.print}
#      9999    0.001    0.000    0.001    0.000 {method 'append' of 'list' objects}
#         1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
# ------------------------------------------------------
# Вывод:
# Алгоритм поиска простых чисел с помощью решета Эратосфена работает значительно быстрее. Нашли значения до
# 10 000 000 за ~5 секунд, в то время как алгоритм без использования решета нашел значения до 10 000
# за ~2.5 секунды
