# 1.	Реализовать скрипт, в котором должна быть предусмотрена функция расчёта заработной платы сотрудника. Используйте
# в нём формулу: (выработка в часах*ставка в час) + премия. Во время выполнения расчёта для конкретных значений
# необходимо запускать скрипт с параметрами.
# my solution ####
from sys import argv


def salary():
    try:
        hours, fee, bonus = map(float, argv[1:])
        print(f'Salary - {hours * fee + bonus}')
    except ValueError:
        print('Enter numbers please')
