profit = int(input('Введите сумму выручки'))
costs = int(input('Затараты'))
if profit > costs:
    employee = int(input('Число сотрудников'))
    growth = int(((profit - costs) / profit) * 100)
    share = (profit - costs) / employee
    print('Прибыль ' + str(growth) + '%' + ' + ' + str(share) + ' на сотрудника')
else:
    print('Убыток ' + str(profit - costs))