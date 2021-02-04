# 5. Программа запрашивает у пользователя строку чисел, разделенных пробелом. При нажатии Enter должна выводиться
# сумма чисел. Пользователь может продолжить ввод чисел, разделенных пробелом и снова нажать Enter. Сумма вновь
# введенных чисел будет добавляться к уже подсчитанной сумме. Но если вместо числа вводится специальный символ,
# выполнение программы завершается. Если специальный символ введен после нескольких чисел, то вначале нужно добавить
# сумму этих чисел к полученной ранее сумме и после этого завершить программу.
# my solution ####
def my_f():
    c_sum = 0
    while True:
        put = input('enter space divided numbers or Q to finish - ').split()
        for i in put:
            if i == 'Q':
                return c_sum
            elif not i.isdigit():
                continue
            elif i.isdigit():
                c_sum += int(i)
        # return c_sum
        print(f'Total sum: {c_sum}')


print(my_f())
#  ------------------------------------------- вариант решения ---------------------------------------------------------


def sum_num():
    s = 0
    while True:
        in_list = input("Enter a number, input 'q' to exit: ").split()
        for num in in_list:
            if num == "q":
                return s
            else:
                try:
                    s += int(num)
                except ValueError:
                    print("To exit the program, enter - 'q'.")
        print(f"Sum of numbers = {s}")


print(sum_num())

#  ------------------------------------------- вариант решения ---------------------------------------------------------


def summary():
    result = 0
    while True:
        print(f"Текущая сумма = {result}")
        input_s = input("Введите строку чисел, разделенных пробелом для подсчета суммы (# - символ для завершения): ").split()
        for value in input_s:
            if value == "#":
                print(f"Окончательная сумма = {result}")
                break
            try:
                result += float(value)
            except ValueError:
                print(f"Значение {value} не было учтено при подсчете суммы - неверный тип")
        else:
            # если символа завершения программы не были то продолжаем ввод данных
            continue
        # сюда мы дойдем только если встретим символ завершения программы
        break
    return f"Окончательная сумма = {result}"


summary()

#  ------------------------------------------- вариант решения ---------------------------------------------------------


num = 0
try:
    while num != '#':
        for i in map(int, input("Для выхода наберите '#'\nВведите числа, используя пробел.\n").split()):
            num += i
        print(num)
except ValueError:
    print(num)
