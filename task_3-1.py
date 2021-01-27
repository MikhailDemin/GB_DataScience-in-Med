# 1.	Реализовать функцию, принимающую два числа (позиционные аргументы) и выполняющую их деление. Числа запрашивать
# у пользователя, предусмотреть обработку ситуации деления на ноль.
# my solution ####
def my_f(p_1, p_2):
    """Возвращает частное от деления 2 аргументов"""

    if p_2 != 0:
        div = p_1 / p_2
        print(f'Div: {div}')
    else:
        print('Error! Zero division!')


my_f(int(input('p_1: ')), int(input('p_2: ')))
#  ------------------------------------------- вариант решения ---------------------------------------------------------
v1 = input('Enter number: ')
v2 = input('Enter divider: ')

try:
    print(float(v1) / float(v2))
except ZeroDivisionError:
    print('Error! Zero division!')
# Здесь не понятно: поставил except v2 = 0 - получил синтакс еррор. Убрал - заработало. Почему? ведь зеро дивижн не
# указан в качестве исключения?
# Это потом я уже ZeroDivisionError добавил
#  ------------------------------------------- вариант решения ---------------------------------------------------------
def div(s_1, s_2):
    try:
        s_1, s_2 = int(s_1), int(s_2)
        div_num = s_1 / s_2
    except ValueError:
        return "Value Error"
    except ZeroDivisionError:
        return "Division by zero forbidden!!!"
    return round(div_num, 4)


print(div(input("Enter first number - "), input("Enter second - ")))
