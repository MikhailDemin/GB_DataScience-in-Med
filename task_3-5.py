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
                return c_sum
        print(f'Total sum: {c_sum}')
        """Почему - то выводит только первое число"""


print(my_f())
