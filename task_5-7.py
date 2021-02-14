# 7.	Создать вручную и заполнить несколькими строками текстовый файл, в котором каждая строка будет содержать данные о
# фирме: название, форма собственности, выручка, издержки.
# Пример строки файла: firm_1   ООО   10000   5000.
# Необходимо построчно прочитать файл, вычислить прибыль каждой компании, а также среднюю прибыль. Если фирма получила
# убытки, в расчёт средней прибыли её не включать.
# Далее реализовать список. Он должен содержать словарь с фирмами и их прибылями, а также словарь со средней прибылью.
# Если фирма получила убытки, также добавить её в словарь (со значением убытков).
# Пример списка: [{“firm_1”: 5000, “firm_2”: 3000, “firm_3”: 1000}, {“average_profit”: 2000}].
# Итоговый список сохранить в виде json-объекта в соответствующий файл.
# Пример json-объекта:
# [{"firm_1": 5000, "firm_2": 3000, "firm_3": 1000}, {"average_profit": 2000}]
# Подсказка: использовать менеджер контекста.
# my solution ####
import json

with open('task_5-7.json', 'w', encoding='utf-8') as out:
    with open('text_7.txt', encoding='utf-8') as f_obj:
        profit = {line.split()[0]: int(line.split()[2]) - int(line.split()[3]) for line in f_obj}
        result = [profit, {'average': round(sum([int(i) for i in profit.values() if int(i) > 0]) /
                                            len([int(i) for i in profit.values() if int(i) > 0]))}]
    json.dump(result, out, ensure_ascii=False, indent=4)
#  ------------------------------------------- вариант решения ---------------------------------------------------------
from json import dump

with open('text_7.txt', 'r', encoding='utf-8') as read_file:
    with open('text_77.json', 'w', encoding='utf-8') as write_file:
        dictionary = {string.split()[0]: int(string.split()[2]) - int(string.split()[3]) for string in read_file}
        average_profit_lst = []
        for n in dictionary.values():
            if n > 0:
                average_profit_lst.append(n)
        dump([dictionary, {"average_profit": sum(average_profit_lst) / len(average_profit_lst)}],
             write_file, ensure_ascii=False, indent=4)
