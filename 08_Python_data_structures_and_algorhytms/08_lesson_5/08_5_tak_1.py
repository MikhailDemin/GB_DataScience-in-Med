# 1. Пользователь вводит данные о количестве предприятий, их наименования и прибыль за четыре квартала для каждого
# предприятия. Программа должна определить среднюю прибыль (за год для всех предприятий) и отдельно вывести наименования
# предприятий, чья прибыль выше среднего и ниже среднего.
# ------------------------------------------------------
# Решение:
from collections import defaultdict


companies = defaultdict()
company_cnt = int(input("Введите количество предприятий: "))

while company_cnt:
    print("*" * 30)
    name = input("Введите название предприятия: ")
    companies[name] = float(input("Введите годовую прибыль предприятия: "))
    company_cnt -= 1


average = sum(companies.values()) / len(companies)

print(f"Среднегодовая прибыль {len(companies)} предприятий составляет {average} руб")

for name, profit in companies.items():
    if profit > average:
        print(f"Предприятие {name} имеет доход выше среднегодового")
    elif profit < average:
        print(f"Предприятие {name} имеет доход ниже среднегодового")

