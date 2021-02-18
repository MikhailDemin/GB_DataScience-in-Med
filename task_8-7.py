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
#  ------------------------------------------- вариант решения ---------------------------------------------------------


class ComplexNumber:
    def __init__(self, real, imaginary):
        self.real = real
        self.img = imaginary

    def __str__(self):
        return f'{self.real}+{self.img}i' if self.img > 0 else f'{self.real}{self.img}i'

    def __add__(self, other):
        return ComplexNumber(self.real + other.real, self.img + other.img)

    def __mul__(self, other):
        return ComplexNumber((self.real * other.real - self.img * other.img),
                             (self.img * other.real + self.real * other.img))


cn = ComplexNumber(1, -2)
cn1 = ComplexNumber(3, 4)
print(cn + cn1)
print(cn * cn1)
print(complex(1, -2) * complex(3, 4))  # calculation check
