# 1. Создать программно файл в текстовом формате, записать в него построчно данные, вводимые пользователем. Об окончании
# ввода данных свидетельствует пустая строка.
# my solution ####
with open ('task_5-1.txt', 'a', encoding='utf-8') as report:
    while (user_in := input('Enter something or nothing for exit')) != '':
        print(user_in, file=task_5_1.txt)
