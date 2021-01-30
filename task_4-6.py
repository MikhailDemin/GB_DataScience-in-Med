# 6.	Реализовать два небольших скрипта:
# ●	итератор, генерирующий целые числа, начиная с указанного;
# ●	итератор, повторяющий элементы некоторого списка, определённого заранее.
# Подсказка: используйте функцию count() и cycle() модуля itertools. Обратите внимание, что создаваемый цикл не должен
# быть бесконечным. Предусмотрите условие его завершения.
# Например, в первом задании выводим целые числа, начиная с 3. При достижении числа 10 — завершаем цикл. Вторым пунктом
# необходимо предусмотреть условие, при котором повторение элементов списка прекратится.
# my solution ####
from itertools import count, cycle
n_cnt = count(10)
n_cycle = cycle('DIY')

for i in range(2, 10, 1):
    print('({}, {})'.format(next(n_cnt), next(n_cycle)))
#  ------------------------------------------- вариант решения ---------------------------------------------------------
from itertools import count, cycle

print('Программа генерирует целые числа, начиная с указанного. Для генерации следующего числа необходимо нажать Enter,'
      ' для выхода из программы - "q"')
for i in count(int(input('Введите стартовое число: '))):
    print(i, end='')
    quit = input()
    if quit == 'q':
        break

print(
    'Программа повторяет элементы списка. Для генерации следующего повторения необходимо нажать Enter, для выхода'
    ' из программы - "q"')
u_list = input('Введите список, разделяя элементы пробелом: ').split()
iter = cycle(u_list)
quit = None

while quit != 'q':
    print(next(iter), end='')
    quit = input()

#  ------------------------------------------- вариант решения ---------------------------------------------------------
from itertools import islice, cycle, count


def unexpected(start_el, stop_el, num_str):
    try:
        start_el, stop_el, num_str = int(start_el), int(stop_el), int(num_str)
        my_list = [el for el in islice(count(), start_el, stop_el + 1)]
        #  repeat_list = [el for el in islice(cycle(my_list), num_str)]
        r_list = iter(el for el in cycle(my_list))
        repeat_list = [next(r_list) for _ in range(num_str)]
        print(my_list)
        return repeat_list
    except ValueError:
        return "Value Error"
    except TypeError:
        return "TypeError"


print(unexpected(input("List starting at - "), input("from to - "), input("Number of repetition - ")))
#  ------------------------------------------- вариант решения ---------------------------------------------------------
from itertools import count, cycle

# а)
iterator = count(int(input('Введите целое число, начиная с которого будут генерироваться числа: ')))
print('Первые десять чисел начиная с введенного вами числа:')
for i in range(10):
    print(next(iterator), end=' ')

# б)
print('\n- cycle -')
lst = ['string', 101, 3.1415, 15.457]
iterator = cycle(lst)
# Перебираем элементы списка два раза.
for i in range(len(lst) * 2):
    print(next(iterator), end=' ')
