# 5.	Реализовать структуру «Рейтинг», представляющую собой набор натуральных чисел,
# который не возрастает. У пользователя нужно запрашивать новый элемент рейтинга.
# Если в рейтинге существуют элементы с одинаковыми значениями, то новый элемент с тем
# же значением должен разместиться после них.
# Подсказка. Например, набор натуральных чисел: 7, 5, 3, 3, 2.
# Пользователь ввёл число 3. Результат: 7, 5, 3, 3, 3, 2.
# Пользователь ввёл число 8. Результат: 8, 7, 5, 3, 3, 2.
# Пользователь ввёл число 1. Результат: 7, 5, 3, 3, 2, 1.
# Набор натуральных чисел можно задать сразу в коде, например, my_list = [7, 5, 3, 3, 2].
# my solution ####
rating = [7, 5, 3, 3, 2]
user_in = float(input('enter rating number'))
# user_in = float(user_in) if user_in.isfloat() else user_in = int(user_in) не работает по идее нужна проверка типа
# if user_in.isfloat():
# можно реализовать замену на число через dict() если пользователь вводит например "два", "пять"
for i in rating:
    if user_in > i:
        pos = rating.index(i)
        rating.insert(pos, user_in)
        print(rating)
        break
    else:
        pass
#  ------------------------------------------- вариант решения ---------------------------------------------------------
my_list = [7, 5, 3, 3, 2]

while True:
    print(f'Current rating: {my_list}')
    number = input('enter rating number or 111 to finish - ')
    if number.lstrip('-').isdigit() and number != '111':
        number = int(number)
        if my_list.count(number):
            my_list.insert(my_list.index(number) + my_list.count(number), float(number))
        else:
            param = 0
            n_param = 0
            for n, i in enumerate(my_list):
                if number > i:
                    if param < i:
                        param = i
                        n_param = n
                else:
                    n_param = n + 1
            my_list.insert(n_param, number)
    elif not number.isdigit():
        print('Enter number please')
    else:
        break
#  ------------------------------------------- вариант решения ---------------------------------------------------------
my_list = [7, 5, 3, 3, 2]
new_number = int(input('enter rating number'))
i = 0
for n in my_list:
    if new_number <= n:
        i += 1
my_list.insert(i, new_number)
print(my_list)
#  ------------------------------------------- вариант решения ---------------------------------------------------------
my_list = [7, 5, 3, 3, 2]

n = int(input('enter count'))
for i in range(n):
    number = int(input('enter rating number'))
    i = 0
    for val in my_list:
        if number > val:
            break
        i += 1
    my_list.insert(i, float(number))
    print(my_list)