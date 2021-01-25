# 2.	Выполнить функцию, которая принимает несколько параметров, описывающих данные пользователя: имя, фамилия,
# год рождения, город проживания, email, телефон. Функция должна принимать параметры как именованные аргументы.
# Осуществить вывод данных о пользователе одной строкой.
# my solution ####
def id_info(**kwargs):
    return ' '.join(kwargs.values())


print(id_info(name=input('Enter Name'), surname=input('Enter Surname'), year=input("Year"), city=input('City'), email=input('e-mail'), phone=input('phone')))
