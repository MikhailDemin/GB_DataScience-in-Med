# 3.	Пользователь вводит месяц в виде целого числа от 1 до 12. Сообщить, к какому времени года
# относится месяц (зима, весна, лето, осень). Напишите решения через list и dict.
# my solution ####
# вариант решения через list()
spring = [3, 4, 5]
summer = [6, 7, 8]
autumn = [9, 10, 11]
winter = [1, 2, 12]
# можно задать сезоны из общего списка через slice[]
user_in = int(input('enter month number'))
if user_in in spring:
    print('Весна')
if user_in in summer:
    print('Лето')
if user_in in autumn:
    print('Осень')
if user_in in winter:
    print('Зима')

# вариант решения через dict()
seasons = {"Весна": [3, 4, 5], "Лето": [6, 7, 8], "Осень": [9, 10, 11], "Зима": [1, 2, 12]}
user_in = int(input('enter month number'))
for key, value in seasons.items():
    for i in value:
        if i / user_in == 1:
            print(key)
#  ------------------------------------------- вариант решения ---------------------------------------------------------
month = int(input('enter month number from 1 till 12: '))

month_dict = {1: 'jan', 2: 'feb', 3: 'mar', 4: 'apr', 5: 'may', 6: 'jun', 7: 'jul',
              8: 'aug', 9: 'sep', 10: 'oct', 11: 'nov', 12: 'dec'}

month_list = ['jan', 'feb', 'mar', 'apr', 'may', 'jun', 'jul', 'aug', 'sep',
              'oct', 'nov', 'dec']

if month in month_dict:
    print(f"{month}-й месяц года - это {month_dict[month]}")
    print(f"{month}-й месяц года - это {month_list[month - 1]}")
else:
    print('Error')

#  ------------------------------------------- вариант решения ---------------------------------------------------------
while True:
    user_month = input('enter month number from 1 till 12: ')
    if user_month.isdigit() and 0 < int(user_month) <= 12:
        season_1 = ['winter', 'spring', 'summer', 'autumn', 'winter']
        season_2 = {0: 'winter', 1: 'spring', 2: 'summer', 3: 'autumn', 4: 'winter'}
        print(f'Season list - {season_1[int(user_month) // 3]}\nSeason dictionary - {season_2[int(user_month) // 3]}')
        break
    else:
        print('Error')
