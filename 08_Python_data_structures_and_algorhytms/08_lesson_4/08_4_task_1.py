# 1. Проанализировать скорость и сложность одного любого алгоритма из разработанных в рамках домашнего задания первых
# трех уроков.
# Примечание. Идеальным решением будет:
# a. выбрать хорошую задачу, которую имеет смысл оценивать,
# b. написать 3 варианта кода (один у вас уже есть),
# c. проанализировать 3 варианта и выбрать оптимальный,
# d. результаты анализа вставить в виде комментариев в файл с кодом (не забудьте указать, для каких N вы проводили
# замеры),
# e. написать общий вывод: какой из трёх вариантов лучше и почему.
# ------------------------------------------------------
# Решение:

# Используем решение задачи №5 из 3 урока. Условие задачи:
# 5. В массиве найти максимальный отрицательный элемент. Вывести на экран его значение и позицию в массиве.
# Примечание к задаче: пожалуйста не путайте «минимальный» и «максимальный отрицательный». Это два абсолютно разных
# значения.

import random
import cProfile

size = 1000000
array = [random.randint(-100000, 1000) for _ in range(size)]
# print(f'Получили массив:\n{len(array)} элементов')
# print('*' * 30)


def find_min_max_1():
    i = 0
    index = -1

    while i < size:
        if array[i] < 0 and index == -1:
            index = i
        elif array[i] < 0 and array[i] > array[index]:
            index = i
        i += 1

    print(f'Максимальный отрицательный элемент = {array[index]}, его индекс: {index}')


def find_min_max_2():
    numbers = array
    my_list = []
    for i in range(len(numbers)):
        if numbers[i] < 0:
            my_list.append(abs(numbers[i]))
    # print(numbers)
    max_element = my_list[0]
    for i in range(len(my_list)):
        if my_list[i] < max_element:
            max_element = my_list[i]
    print((max_element * -1), i)


def find_min_max_3():
    new_list = []
    for k in range(len(array)):
        if array[k] < 0:
            new_list.append(array[k])
    max_of_min = max(new_list)
    print(max_of_min, k)


# Замерить время цикла с помощью timeit не смог. Получил вот такую ошибку:
# -------------------------------------------------------------------------
# PS C:\***********\GB_DataScience-in-Med> python -m timeit -n 100 -s "import 08_4_task_1" "08_4_task_1.find_min_max"
# Traceback (most recent call last):
#   File "C:\***********\Anaconda3\envs\reshape.py\lib\runpy.py", line 197, in _run_module_as_main
#     return _run_code(code, main_globals, None,
#   File "C:\***********\Anaconda3\envs\reshape.py\lib\runpy.py", line 87, in _run_code
#     exec(code, run_globals)
#   File "C:\***********\Anaconda3\envs\reshape.py\lib\timeit.py", line 375, in <module>
#     sys.exit(main())
#   File "C:\***********\Anaconda3\envs\reshape.py\lib\timeit.py", line 314, in main
#     t = Timer(stmt, setup, timer)
#   File "C:\***********\Anaconda3\envs\reshape.py\lib\timeit.py", line 110, in __init__
#     compile(setup, dummy_src_name, "exec")
#   File "<timeit-src>", line 1
#     import 08_4_task_1
#                ^
# SyntaxError: invalid decimal literal
# -------------------------------------------------------------------------
# Буду благодарен за комментарии и объяснение в чем ошибка, и как исправить.

cProfile.runctx("find_min_max_1()", globals(), locals())

# Максимальный отрицательный элемент = -1, его индекс: 47743
#          5 function calls in 0.290 seconds
#    Ordered by: standard name
#    ncalls  tottime  percall  cumtime  percall filename:lineno(function)
#         1    0.290    0.290    0.290    0.290 08_4_task_1.py:22(find_min_max_1)
#         1    0.000    0.000    0.290    0.290 <string>:1(<module>)
#         1    0.000    0.000    0.290    0.290 {built-in method builtins.exec}
#         1    0.000    0.000    0.000    0.000 {built-in method builtins.print}
#         1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}

cProfile.runctx("find_min_max_2()", globals(), locals())

# -1 990165
#          1980339 function calls in 0.514 seconds
#    Ordered by: standard name
#    ncalls  tottime  percall  cumtime  percall filename:lineno(function)
#         1    0.352    0.352    0.506    0.506 08_4_task_1.py:41(find_min_max_2)
#         1    0.009    0.009    0.514    0.514 <string>:1(<module>)
#    990166    0.062    0.000    0.062    0.000 {built-in method builtins.abs}
#         1    0.000    0.000    0.514    0.514 {built-in method builtins.exec}
#         2    0.000    0.000    0.000    0.000 {built-in method builtins.len}
#         1    0.000    0.000    0.000    0.000 {built-in method builtins.print}
#    990166    0.092    0.000    0.092    0.000 {method 'append' of 'list' objects}
#         1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}

cProfile.runctx("find_min_max_3()", globals(), locals())

# -1 999999
#          990031 function calls in 0.313 seconds
#    Ordered by: standard name
#    ncalls  tottime  percall  cumtime  percall filename:lineno(function)
#         1    0.211    0.211    0.308    0.308 08_4_task_1.py:55(find_min_max_3)
#         1    0.005    0.005    0.313    0.313 <string>:1(<module>)
#         1    0.000    0.000    0.313    0.313 {built-in method builtins.exec}
#         1    0.000    0.000    0.000    0.000 {built-in method builtins.len}
#         1    0.014    0.014    0.014    0.014 {built-in method builtins.max}
#         1    0.000    0.000    0.000    0.000 {built-in method builtins.print}
#    990024    0.082    0.000    0.082    0.000 {method 'append' of 'list' objects}
#         1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}

# ------------------------------------------------------
# Вывод:
# Сравнивая время работы разных вариантов решения задачи видим, что первый вариант Наиболее оптимальный. Это связано с
# тем, что в первом варианте не создается дополнительных переменных в которые помещаются отобранные куски исходного
# массива. В одном цикле производится перебор значений массива по условиям. Итоговые переменные содержат только
# требуемый элемент и его индекс в исходном массиве. Второй вариант ниболее медленный, так как в нем используется 2
# цикла: в первом формируется список отрицательных элементов, а во втором происходит поиск решения задачи.
