# 3. Реализовать функцию my_func(), которая принимает три позиционных аргумента, и возвращает сумму
# наибольших двух аргументов.
# my solution ####
def my_func(v1, v2, v3):
    """находим наименьший"""
    min_arg = min(v1, v2, v3)
    """убираем наименьший из суммы"""
    return v1 + v2 + v3 - min_arg


print(my_func(float(input('enter num')), float(input('enter num')), float(input('enter num'))))
#  ------------------------------------------- вариант решения ---------------------------------------------------------


def my_func(num_1, num_2, num_3):
    my_list = [num_1, num_2, num_3]
    try:
        my_list.remove(min(my_list))
        return sum(my_list)
    except TypeError:
        return "Enter only a numbers!"


print(my_func(2, 11, -30))

#  ------------------------------------------- вариант решения ---------------------------------------------------------


def my_func(arg1, arg2, arg3):
    return sum(sorted([arg1, arg2, arg3])[1:])


print(my_func(1978, 1, 2))

#  ------------------------------------------- вариант решения ---------------------------------------------------------


my_func = lambda arg_1, arg_2, arg_3: (arg_1 + arg_2 + arg_3) - min(arg_1, arg_2, arg_3)

print(my_func(8, 7, 9))
