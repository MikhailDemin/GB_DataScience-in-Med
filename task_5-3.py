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
#  ------------------------------------------- вариант решения ---------------------------------------------------------
def task_3():
    wages = {}
    try:
        with open('task_3.txt', 'r', encoding='utf-8') as file:
            for line in file:
                wages[line.split()[0]] = float(line.split()[1])
        print('Меньше 20000 получают:')
        for name, wage in wages.items():
            if wage < 20000:
                print(name)
        print(f'Средняя зарплата равна {sum(wages.values()) / len(wages)}')
    except IOError:
        print('Бухгалтер сбежал с ведомостью. Зарплаты не будет')
    except:
        print('Что-то пошло не так')


task_3()
print('Итого как всегда меньше всех работал и больше всех получает )))')
