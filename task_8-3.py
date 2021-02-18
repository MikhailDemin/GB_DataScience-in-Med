# 3.	Создайте собственный класс-исключение, который должен проверять содержимое списка на наличие только чисел.
# Проверить работу исключения на реальном примере. Запрашивать у пользователя данные и заполнять список необходимо
# только числами. Класс-исключение должен контролировать типы данных элементов списка.
# Примечание: длина списка не фиксирована. Элементы запрашиваются бесконечно, пока пользователь сам не остановит работу
# скрипта, введя, например, команду «stop». При этом скрипт завершается, сформированный список с числами
# выводится на экран.
# Подсказка: для этого задания примем, что пользователь может вводить только числа и строки. Во время ввода
# пользователем # очередного элемента необходимо реализовать проверку типа элемента. Вносить его в список, только если
# введено число. # Класс-исключение должен не позволить пользователю ввести текст (не число) и отобразить
# соответствующее сообщение. При этом работа скрипта не должна завершаться.
# my solution ####
class OnlyNum(Exception):

    def __init__(self, *_):
        self.user_list = []

    def check(self):
        while True:
            put = input('enter numbers or q to finish - ')
            for num in put:
                if num.isdigit():
                    self.user_list.append(int(num))
                    print(f"Your list: {self.user_list}")
                else:
                    try:
                        if not num.isdigit():
                            raise OnlyNum("Enter only numbers please!!!")
                    except OnlyNum as error:
                        print(error)
            if put == 'q':
                print(f"Final list: {self.user_list}")
                break


OnlyNum().check()
#  ------------------------------------------- вариант решения --------------------------------------------------------


class OwnError(Exception):
    def __init__(self, txt):
        self.txt = txt


my_list = []

while True:
    inp_data = input("Введите число: ")
    if inp_data == "":
        break
    try:
        if inp_data.replace("-", "").replace(".", "").isdigit():
            my_list.append(float(inp_data))
        else:
            raise OwnError("введено не число")
    except OwnError as err:
        print(err)
        continue

print(my_list)

#  ------------------------------------------- вариант решения ---------------------------------------------------------


class MyList:
    print_list = []

    # Попробуем сделать исключение как класс в классе..
    @staticmethod
    class NotFloatExcept(Exception):
        def __init__(self, txt):
            self.txt = txt

    # Проверим что вновь введенная строка является числом, если да, перобразуем к числовому типу
    def __is_float(self, input_str):
        is_one_dot, is_one_minus = 0, 0
        for i in input_str:
            if ord(i) >= 48 and ord(i) <= 57:
                pass
            # В числе может быть одн точка
            elif ord(i) == 46 and is_one_dot == 0:
                is_one_dot += 1
            # А еще минус
            elif ord(i) == 45 and is_one_minus == 0:
                is_one_minus += 1
            else:
                raise self.NotFloatExcept('Введенная строка не является числом!')

        #  Если число целое, так и вернем
        if is_one_minus == 1 and len(input_str) == 2:
            return int(input_str)
        elif is_one_minus == 1:
            raise self.NotFloatExcept('Введенная строка не является числом!')
        elif is_one_dot == 0:
            return int(input_str)
        return float(input_str)

    # Добавляем новое число в список
    def __call__(self, new_str):
        try:
            self.print_list.append(self.__is_float(new_str))
        except self.NotFloatExcept as e:
            print(e)

    # Выводим на печать
    def __str__(self):

        return str(self.print_list)[1:-1]


list = MyList()

while True:
    print('Введите число: ', end='')
    n = input()
    if n == '':
        print('Окончание программы')
        break
    else:
        list(n)
        print(list)
