# 1.	Реализовать класс «Дата», функция-конструктор которого должна принимать дату в виде строки формата
# «день-месяц-год». В рамках класса реализовать два метода. Первый, с декоратором @classmethod. Он должен извлекать
# число, месяц, год и преобразовывать их тип к типу «Число». Второй, с декоратором @staticmethod, должен проводить
# валидацию числа, месяца и года (например, месяц — от 1 до 12). Проверить работу полученной структуры на
# реальных данных.
# my solution ####
class Date:

    def __init__(self, day, month, year):
        self.day = day
        self.month = month
        self.year = year

    @classmethod
    def extract(cls, date):
        date = map(int, date)
        d, m, y = date
        return cls(d, m, y)

    @staticmethod
    def valid(obj):
        if obj.day <= 31 and obj.day != 0 and obj.month <= 12 and obj.month != 0 and obj.year <= 2099\
                and obj.year > 1979:
            return f"число: {obj.day} месяц: {obj.month} год: {obj.year}"
        else:
            return "WARNING! Date is incorrect"


date_input = input("Enter date in format: dd-mm-yyyy").split("-")

test = Date.extract(date_input)
# print(test.day, test.month, test.year)
# print(test.__dict__)
print(Date.valid(test))
# Так и не понял как статик и класс взаимодействуют В классметоде переменные с другими именами.
#  ------------------------------------------- вариант решения ---------------------------------------------------------


class Data:
    def __init__(self, day_month_year):
        self.day_month_year = str(day_month_year)

    @classmethod
    def extract(cls, day_month_year):
        my_date = []

        for i in day_month_year.split():
            if i != '-': my_date.append(i)
        return int(my_date[0]), int(my_date[1]), int(my_date[2])

    @staticmethod
    def valid(day, month, year):

        if 1 <= day <= 31:
            if 1 <= month <= 12:
                if 2019 >= year >= 0:
                    return f'Всё в порядке'
                else:
                    return f'Неправильный год'
            else:
                return f'Неправильный месяц'
        else:
            return f'Неправильный день'

    def __str__(self):
        return f'Текущая дата {Data.extract(self.day_month_year)}'


today = Data('24 - 02 - 2020')
print(today)
print(Data.valid(11, 13, 2022))
print(today.valid(26, 10, 2020))
print(Data.extract('11 - 11 - 2011'))
print(today.extract('24 - 02 - 2020'))
print(Data.valid(24, 11, 2020))
#  ------------------------------------------- вариант решения ---------------------------------------------------------


class OwnError(Exception):
    def __init__(self, txt):
        self.txt = txt


class Date(object):
    def __init__(self, day=0, month=0, year=0):
        self.day = day
        self.month = month
        self.year = year

    @classmethod
    def from_string(cls, date_as_string):
        is_date = cls.is_date_valid(date_as_string)
        try:
            if is_date == False:
                raise OwnError("Wrong date!")
        except OwnError as err:
            print(err)
            return

        day, month, year = map(int, date_as_string.split('-'))
        date1 = cls(day, month, year)
        return date1

    @staticmethod
    def is_date_valid(date_as_string):
        day, month, year = map(int, date_as_string.split('-'))
        return day <= 31 and month <= 12 and year <= 3999


date2 = Date.from_string('11-10-2012')

try:
    print(date2.day, date2.month, date2.year)
except:
    print('OOps. Something wrong')


#  ------------------------------------------- вариант решения ---------------------------------------------------------

class Data:
    def __init__(self, data):
        self.data = data

    @classmethod
    def change_type(cls, data):
        return f'День {int(data[0]):02d}, Месяц {int(data[1]):02d}, Год {int(data[2])}'

    @staticmethod
    def validation(data):
        if not int(data[0]) in range(1, 32) or not int(data[1]) in range(1, 13) or int(data[2]) > 2020:
            return 'Введена некоррекная дата!'

    def data_func(self):
        result_1 = Data.change_type(self.data.split('-'))
        result_2 = Data.validation(self.data.split('-'))
        return result_2 if result_2 else f'Переформатированная дата (тип int)\n{result_1}'


user_data = input('Введите дату (чч-мм-гг): ')
mc = Data(user_data)
print(mc.data_func())
user_data = input('Введите дату (чч-мм-гг): ')
mc_2 = Data(user_data)
print(mc_2.data_func())
print(mc.data_func())
