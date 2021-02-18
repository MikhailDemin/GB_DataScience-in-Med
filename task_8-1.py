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
