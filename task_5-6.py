# 6.	Сформировать (не программно) текстовый файл. В нём каждая строка должна описывать учебный предмет и наличие
# лекционных, практических и лабораторных занятий по предмету. Сюда должно входить и количество занятий. Необязательно,
# чтобы для каждого предмета были все типы занятий.
# Сформировать словарь, содержащий название предмета и общее количество занятий по нему. Вывести его на экран.
# Примеры строк файла: Информатика:   100(л)   50(пр)   20(лаб).
#                                         Физика:   30(л)   —   10(лаб)
#                                         Физкультура:   —   30(пр)   —
# Пример словаря: {“Информатика”: 170, “Физика”: 40, “Физкультура”: 30}
# my solution ####
sum_d = {}
with open('text_6.txt', encoding='utf-8') as f_obj:
    for entry in f_obj:
        name, stats = entry.split(':')
        n_sum = sum(map(int, ''.join([i for i in stats if i == ' ' or '9' >= i >= '0']).split()))
        sum_d[name] = n_sum
print(sum_d)
#  ------------------------------------------- вариант решения ---------------------------------------------------------
with open('text_6.txt', 'r', encoding='utf8') as text_file:
    a = text_file.readlines()
    for s in a:
        new_str = ''.join((i if i in '1234567890' else ' ') for i in s)
        new_2 = [int(i) for i in new_str.split()]
        print(f'{s.split()[0]} {sum(new_2)}')
#  ------------------------------------------- вариант решения ---------------------------------------------------------
dic = {}
numbers = "1234567890 "

with open("text_6.txt", "r", encoding="utf-8") as file:
    for line in file:
        head, hours = line.split(":")
        dic[head] = sum(map(int, "".join([num for num in hours if num in numbers]).split()))
print(dic)
#  ------------------------------------------- вариант решения ---------------------------------------------------------
subj = {}
with open('text_6.txt', 'r', encoding='utf-8') as file:
    for line in file:
        line = line.replace('-', '0').replace(':', '').replace('(л)', '') \
            .replace('(пр)', '').replace('(лаб)', '').split()
        subj[line[0]] = sum(map(int, line[1:]))
    print(f'Общее количество часов по предмету: \n{subj}')
#  ------------------------------------------- вариант решения ---------------------------------------------------------
result = {}
with open("text_6.txt", encoding="utf-8") as f_obj:
    for line in f_obj:
        lesson_timing = []
        lessons = ([el for el in line.split(" ")])
        for el in lessons:
            lesson_timing.append(''.join(i for i in list(el) if i.isdigit()))
        result[line.split(':')[0]] = sum([int(i) for i in lesson_timing if i.isdigit()])

print(result)
#  ------------------------------------------- вариант решения ---------------------------------------------------------
with open('text_6.txt', 'r', encoding='utf-8') as file:
    print({string.split(':')[0]: sum([int(s[:s.index('(')]) for s in string.split() if '(' in s]) for string in file})
#  ------------------------------------------- вариант решения ---------------------------------------------------------
import re

subs_total_hours = {}

with open("text_6.txt") as f:
    for line in f.readlines():
        subs_total_hours[re.findall(r'^\w+', line)[0]] = sum(map(int, re.findall(r'\d+', line)))
    print(subs_total_hours)
