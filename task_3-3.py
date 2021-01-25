# 3. Реализовать функцию my_func(), которая принимает три позиционных аргумента, и возвращает сумму
# наибольших двух аргументов.
# my solution ####
def my_func(v1, v2, v3):
    """находим наименьший"""
    min_arg = min(v1, v2, v3)
    """убираем наименьший из суммы"""
    return v1 + v2 + v3 - min_arg


print(my_func(float(input('enter num')), float(input('enter num')), float(input('enter num'))))
