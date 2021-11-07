# 1. Пользователь вводит данные о количестве предприятий, их наименования и прибыль за четыре квартала для каждого
# предприятия. Программа должна определить среднюю прибыль (за год для всех предприятий) и отдельно вывести наименования
# предприятий, чья прибыль выше среднего и ниже среднего.
# ------------------------------------------------------
# Решение:
import collections

n = int(input('Введите количество компаний: '))
companies = collections.defaultdict()
prof_c = collections.deque()
unprof_c = collections.deque()
all_profit = 0
QUARTER = 4

for i in range(n):
    name = input(f'\nВведите название {i + 1}-й компании: ')
    profit = 0
    q = 1
    while q <= QUARTER:
        profit += float(input(f'Введите прибыль за {q}-й квартал: '))
        q += 1
    companies[name] = profit
    all_profit += profit

mid_profit = all_profit / n
for i, item in companies.items():
    if item >= mid_profit:
        prof_c.append(i)
    else:
        unprof_c.append(i)
print(f'Средняя годовая прибыль по всем компаниям составляет: {mid_profit}')
print(f'Прибыль выше среднего у {len(prof_c)} компаний, а именно:')
for name in prof_c:
    print(name)
print(f'Прибыль ниже среднего у {len(unprof_c)} компаний, а именно:')
for name in unprof_c:
    print(name)
