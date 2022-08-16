# 4.	Представлен список чисел. Определите элементы списка, не имеющие повторений. Сформируйте итоговый массив чисел,
# соответствующих требованию. Элементы выведите в порядке их следования в исходном списке. Для выполнения задания
# обязательно используйте генератор.
# Пример исходного списка: [2, 2, 2, 7, 23, 1, 44, 44, 3, 2, 10, 7, 4, 11].
# Результат: [23, 1, 3, 10, 4, 11]
from random import randint

my_list = [randint(-10, 10) for _ in range(20)]
uniq_list = [el for el in my_list if my_list.count(el) == 1]
print(f"Source list\n{my_list}\nNo repetition list\n{uniq_list}")
#  ------------------------------------------- вариант решения ---------------------------------------------------------
# my solution ####
s_list = [2, 2, 2, 7, 23, 1, 44, 44, 3, 2, 10, 7, 4, 11]
new_list = [n for n in s_list if s_list.count(n) == 1]
print(new_list)
#  ------------------------------------------- вариант решения ---------------------------------------------------------
print(a := [randint(0, 9) for _ in range(20)], '\n', [i for i in a if a.count(i) == 1], sep="")