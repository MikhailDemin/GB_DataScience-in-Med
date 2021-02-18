# 2.	Создайте собственный класс-исключение, обрабатывающий ситуацию деления на ноль. Проверьте его работу на данных,
# вводимых пользователем. При вводе нуля в качестве делителя программа должна корректно обработать эту ситуацию и не
# завершиться с ошибкой.
# my solution ####
class OnZeroDelenie(Exception):
    def __init__(self, txt):
        self.txt = txt


x = int(input('enter number'))
y = int(input('enter divider'))

try:
    if y == 0:
        raise OnZeroDelenie("Деление на ноль может выполнять только специально обученный персонал 'Black Mesa'!!!")
except OnZeroDelenie as error:
    print(error)
else:
    result = x / y
    print(result)
#  ------------------------------------------- вариант решения ---------------------------------------------------------


class MyZeDiEr(Exception):
    def __init__(self, txt):
        self.txt = txt


def div(s_1, s_2):
    try:
        s_1, s_2 = int(s_1), int(s_2)
        if s_2 == 0:
            raise MyZeDiEr("Division by zero forbidden!!!")
        return round(s_1 / s_2, 3)
    except ValueError:
        return "Value Error"
    except MyZeDiEr as my:
        return my


print(div(input("Enter first number - "), input("Enter first second - ")))


#  ------------------------------------------- вариант решения ---------------------------------------------------------


class MyDivisionZeroError(Exception):
    def __init__(self, txt):
        self.txt = txt


div = lambda x, y: x / y if y != 0 else MyDivisionZeroError('Ошибка дедения на 0!!')

print(div(1, 0))

print(div(4, 2))
