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
    @property
    def textile(self):
        return round(self.prop / 6.5) + 0.5


class Suit(Wear):
    @property
    def textile(self):
        return round((2 * self.prop + 0.3) / 100)


coat = Coat(45)
suit = Suit(175)
print(suit + coat)
