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
