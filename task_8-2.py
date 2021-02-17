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
except (OnZeroDelenie) as error:
    print(error)
else:
    result = x / y
    print(result)
