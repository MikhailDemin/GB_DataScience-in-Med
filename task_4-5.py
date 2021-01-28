# 5.	Реализовать формирование списка, используя функцию range() и возможности генератора. В список должны войти
# чётные числа от 100 до 1000 (включая границы). Нужно получить результат вычисления произведения всех элементов списка.
# Подсказка: использовать функцию reduce().
# my solution ####
from functools import reduce
my_list = [n for n in range(100, 1001, 2)]
print(my_list)


def new_list(v1, v2):
    return v1 * v2


print(reduce(new_list, my_list))
