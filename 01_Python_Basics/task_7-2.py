# 2)	Реализовать проект расчета суммарного расхода ткани на производство одежды. Основная сущность (класс) этого
# проекта — одежда, которая может иметь определенное название. К типам одежды в этом проекте относятся пальто и костюм.
#     У этих типов одежды существуют параметры: размер (для пальто) и рост (для костюма). Это могут быть обычные числа:
# V и H, соответственно.
# Для определения расхода ткани по каждому типу одежды использовать формулы: для пальто (V/6.5 + 0.5), для костюма
# (2*H + 0.3). Проверить работу этих методов на реальных данных.
# Реализовать общий подсчет расхода ткани. Проверить на практике полученные на этом уроке знания: реализовать
# абстрактные классы для основных классов проекта, проверить на практике работу декоратора @property.
# my solution ####
from abc import ABC, abstractmethod


class Wear(ABC):
    textile = 0

    def __init__(self, prop):
        self.prop = prop

    @property
    @abstractmethod
    def rate(self):
        pass

    def __add__(self, other):
        Wear.textile += self.rate + other.rate
        return Suit(0)

    def __str__(self):
        return f'{Wear.textile}'


class Coat(Wear):
    @abstractmethod
    @property
    def textile(self):
        return round(self.prop / 6.5) + 0.5


class Suit(Wear):
    @abstractmethod
    @property
    def textile(self):
        return round((2 * self.prop + 0.3) / 100)


coat = Coat(45)
suit = Suit(175)
print(suit + coat)

#  ------------------------------------------- вариант решения ---------------------------------------------------------


from abc import ABC, abstractmethod


class Clothes(ABC):
    def __init__(self):
        pass

    @property
    @abstractmethod
    def raschet(self):
        pass

    def __add__(self, other):
        return self.raschet + other.raschet


class Coat(Сlothes):
    def __init__(self, size):
        super().__init__()
        self.size = size

    @property
    def size(self):
        return self.__size

    @size.setter
    def size(self, size):
        if size < 40:
            print('На детей не шьем. Начнем с сорокового.')
            self.__size = 40
        elif size > 58:
            print('Не многовато ли? 58 - МАКСИМУМ, для него и посчитаем')
            self.__size = 58
        else:
            self.__size = size

    @property
    def raschet(self):
        return self.__size / 6.5 + 0.5


class Costume(Сlothes):
    def __init__(self, height):
        super().__init__()
        self.height = height

    @property
    def height(self):
        return self.__height

    @height.setter
    def height(self, height):
        if height < 100:
            print('На детей не шьем.')
            self.__height = 150
        elif height > 240:
            print('Не многовато ли? 240 - МАКСИМУМ, для него и посчитаем')
            self.__height = 240
        else:
            self.__height = height

    @property
    def raschet(self):
        return 2 * (self.__height / 100) + 0.3


coat_1 = Coat(int(input('Введите размер пальто для рассчета:')))
print(f'Вам потребуется {coat_1.raschet:.2f} метров ткани на пальто {coat_1.size} размера ')
costume_1 = Сostume(int(input('Введите рост для костюма для рассчета (как обычно, в сантиметрах):')))
print(f'Вам потребуется {costume_1.raschet:.2f} метров ткани на костюм {costume_1.height} роста ')
print(f'Всего вам потребуется {coat_1 + costume_1:.2f} метров ткани')

#  ------------------------------------------- вариант решения ---------------------------------------------------------


from abc import ABC, abstractmethod


class MyAbstractClass(ABC):
    @abstractmethod
    def consumption(self):
        pass


class Clothes(MyAbstractClass):
    def __init__(self, param=100):
        self.param = param

    @property
    def consumption_Coat(self, param):
        pass

    @property
    def consumption_Costume(self, param):
        pass

    @property
    def consumption(self):
        return self.consumption_Coat + self.consumption_Costume


class Coat(Clothes):
    @property
    def consumption(self):
        result = round(self.param / 6.5 + 0.5, 2)
        Clothes.consumption_Coat = result
        return f'Расход ткани для пальто - {self.param} размера = {round(self.param / 6.5 + 0.5, 2)}'


class Costume(Clothes):
    @property
    def consumption(self):
        result = round(2 * self.param + 0.3, 2)
        Clothes.consumption_Costume = result
        return f'Расход ткани для костюм - на рост {self.param} = {round(2 * self.param + 0.3, 2)}'


my_1 = Clothes()
my_2 = Coat(35)
print(my_2.consumption)
my_3 = Costume(183)
print(my_3.consumption)
print(f'Общий расход ткани = {my_1.consumption}')
