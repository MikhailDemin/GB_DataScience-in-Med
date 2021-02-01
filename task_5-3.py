# 3.	Создать текстовый файл (не программно). Построчно записать фамилии сотрудников и величину их окладов
# (не менее 10 строк). Определить, кто из сотрудников имеет оклад менее 20 тысяч, вывести фамилии этих сотрудников.
# Выполнить подсчёт средней величины дохода сотрудников.
# Пример файла:
# Иванов 23543.12
# Петров 13749.32
# my solution ####
with open('text_3.txt', 'r', encoding='utf-8') as f_obj:
    employee = {entry.split()[0]: float(entry.split()[1]) for entry in f_obj}
    print(f'average {round(sum(employee.values()) / len(employee), 3)}\n'
          f'low_cost {[i[0] for i in employee.items() if i[1] < 20000]}')
