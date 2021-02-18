# 7. Реализовать проект «Операции с комплексными числами». Создайте класс «Комплексное число», реализуйте перегрузку
# методов сложения и умножения комплексных чисел. Проверьте работу проекта, создав экземпляры класса (комплексные числа)
# и выполнив сложение и умножение созданных экземпляров. Проверьте корректность полученного результата.
# my solution ####
class MyComplex:

    def __init__(self, re, im, *_):
        self.re = re
        self.im = im

    def __add__(self, other):
        return print(f'complex add = {self.re + other.re} + {self.im + other.im}j')

    def __mul__(self, other):
        return print(f'complex mul = {self.re * other.re - (self.im * other.im)} +'
                     f'{self.im * other.re + (self.re * other.im)}j')


a = MyComplex(1, 3)
b = MyComplex(-2, 2)

c = a + b
d = a * b

