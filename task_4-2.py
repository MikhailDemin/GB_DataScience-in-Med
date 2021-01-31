# 2.	Представлен список чисел. Необходимо вывести элементы исходного списка, значения которых больше предыдущего
# элемента. Подсказка: элементы, удовлетворяющие условию, оформить в виде списка. Для его формирования используйте
# генератор.
# Пример исходного списка: [300, 2, 12, 44, 1, 1, 4, 10, 7, 1, 78, 123, 55].
# Результат: [12, 44, 4, 10, 78, 123].
# my solution ####
my_list = [300, 2, 12, 44, 1, 1, 4, 10, 7, 1, 78, 123, 55]
new_list = [my_list[i] for i in range(1, len(my_list)) if my_list[i] > my_list[i - 1]]

print(new_list)
#  ------------------------------------------- вариант решения ---------------------------------------------------------


import random

original_list = [random.randint(0, 1000) for i in list(range(0, random.randint(2, 20)))]
answer_list = [i for num, i in enumerate(original_list[1:]) if i > original_list[num]]

print(original_list)
print(answer_list)
