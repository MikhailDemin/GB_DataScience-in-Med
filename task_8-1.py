# 1.	Реализовать класс «Дата», функция-конструктор которого должна принимать дату в виде строки формата
# «день-месяц-год». В рамках класса реализовать два метода. Первый, с декоратором @classmethod. Он должен извлекать
# число, месяц, год и преобразовывать их тип к типу «Число». Второй, с декоратором @staticmethod, должен проводить
# валидацию числа, месяца и года (например, месяц — от 1 до 12). Проверить работу полученной структуры на
# реальных данных.
# my solution ####
# class Date:
#
#     def __init__(self, day, month, year):
#         self.day = day
#         self.month = month
#         self.year = year
#
#     @classmethod
#     def numdata(cls, data):
#         data = map(int, data)
#         d, m, y = data
#         return cls(d, m, y)
#
# x = input('введите дату в формате dd-mm-yyyy: ').split("-")
#
# set_day = Date.numdata(x)

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
    def valid(d, m, y):
        if 1 <= d <= 31 and 1 <= m <= 12 and 1970 <= y <= 2099:
            return f"число: {day} месяц: {month} год: {year}"


date_input = input("Enter date in format: dd-mm-yyyy").split("-")

test = Date.extract(date_input)
# print(test.day, test.month, test.year)
# print(test.__dict__)
print(Date.valid(test))
