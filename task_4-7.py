# 7.	Реализовать генератор с помощью функции с ключевым словом yield, создающим очередное значение. При вызове
# функции должен создаваться объект-генератор. Функция вызывается следующим образом: for el in fact(n). Она отвечает
# за получение факториала числа. В цикле нужно выводить только первые n чисел, начиная с 1! и до n!.
# Подсказка: факториал числа n — произведение чисел от 1 до n. Например, факториал четырёх 4! = 1 * 2 * 3 * 4 = 24.
# my solution ####
def fct_gen(num):
    f_num = 1
    if num == 0:
        yield f'{num}! = 1'
    for k in range(1, num + 1):
        f_num *= k
        yield f'{k}! = {f_num}'


for d in fct_gen(int(input('Fact. num: '))):
    print(d)
#  ------------------------------------------- вариант решения ---------------------------------------------------------
from functools import reduce


def fact(n):
    try:
        yield reduce(lambda x, y: x * y, list(el if el > 0 else 1 for el in range(n + 1)))
    except TypeError:
        yield 0


for i in fact(0):
    print(i)
#  ------------------------------------------- вариант решения ---------------------------------------------------------
from itertools import count
from math import factorial


def fact_gen():
    for el in count(1):
        yield factorial(el)


generator = fact_gen()
x = 0
for i in generator:
    if x == 15:
        break
    else:
        x += 1
        print(f"Factorial {x} = {i}")
