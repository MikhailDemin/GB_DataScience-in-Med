# 4.	Пользователь вводит строку из нескольких слов, разделённых пробелами. Вывести каждое слово с новой строки.
# Строки нужно пронумеровать. Если слово длинное, выводить только первые 10 букв в слове.
# my solution ####
user_input = input('enter something').split(' ')
for ind, el in enumerate(user_input):
    ind += 1
    if len(el) > 10:
        print(ind, el[:10])
    else:
        print(ind, el)
#  ------------------------------------------- вариант решения ---------------------------------------------------------
string = input('enter something').split()
for n, i in enumerate(string, 1):
    print(n, i) if len(i) <= 10 else print(n, (i[:10]))
#  ------------------------------------------- вариант решения ---------------------------------------------------------
my_string = input('enter something').split()
for  i, word in enumerate(my_string, 1):
    print(f'{i}, {word[:10]}')
