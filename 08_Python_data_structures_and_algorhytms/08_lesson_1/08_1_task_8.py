# 8. Вводятся три разных числа. Найти, какое из них является средним (больше одного, но меньше другого).
from decimal import Decimal

print('Ведите 3 разных числа:')
a = Decimal(input('a = '))
b = Decimal(input('b = '))
c = Decimal(input('c = '))
print(f'a = {a}, b = {b}, c = {c}')

mid = a + b + c - max(a, b, c) - min(a, b, c)

print(f'Число {mid} - среднее')
