# 4.	Создать (не программно) текстовый файл со следующим содержимым:
# One — 1
# Two — 2
# Three — 3
# Four — 4
# Напишите программу, открывающую файл на чтение и считывающую построчно данные. При этом английские числительные
# должны заменяться на русские. Новый блок строк должен записываться в новый текстовый файл.
# my solution ####
rus = {'One': 'Один', 'Two': 'Два', 'Three': 'Три', 'Four': 'Четыре'}

with open('text_4.txt', 'w', encoding='utf-8') as trans:
    with open('text_5_4_1.txt', 'w', encoding='utf-8') as f_obj:
        trans.writelines([entry.replace(entry.split()[0], rus.get(entry.split()[0])) for entry in f_obj])
