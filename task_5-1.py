# 1. Создать программно файл в текстовом формате, записать в него построчно данные, вводимые пользователем. Об окончании
# ввода данных свидетельствует пустая строка.
# my solution ####
with open('task_5-1.txt', 'a', encoding='utf-8') as report:
    while (user_in := input('Enter something or nothing for exit')) != '':
        print(user_in, file=task_5_1.txt)
#  ------------------------------------------- вариант решения ---------------------------------------------------------
with open('text_1.txt', 'w', encoding='utf-8') as f:
    while True:
        line = input('Input new string or empty string to done: ')
        if not line:
            break
        # f.write(f"{line}\n")
        print(line, file=f)
#  ------------------------------------------- вариант решения ---------------------------------------------------------
my_file = open("text_1.txt", 'w', encoding='utf-8')

line = " "
while line:
    line = input("пишите или не пишите!: ")
    my_file.write(f"{line}\n") if line != '' else my_file.close()
