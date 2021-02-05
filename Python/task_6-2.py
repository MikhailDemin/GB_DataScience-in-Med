# 2.	Реализовать класс Road (дорога).
# ●	определить атрибуты: length (длина), width (ширина);
# ●	значения атрибутов должны передаваться при создании экземпляра класса;
# ●	атрибуты сделать защищёнными;
# ●	определить метод расчёта массы асфальта, необходимого для покрытия всей дороги;
# ●	использовать формулу: длина*ширина*масса асфальта для покрытия одного кв. метра дороги асфальтом, толщиной
# в 1 см*число см толщины полотна;
# ●	проверить работу метода.
# Например: 20 м*5000 м*25 кг*5 см = 12500 т.
# my solution ####
class Road:

    def __init__(self, _length, _width):
        self._l = _length
        self._wd = _width
        self.weight = 25
        self.thick = 5

    def asphalt(self):
        mass = int((self._l * self._wd * self.weight * self.thick) / 1000)
        print(f"Масса асфальта {mass} тонн")


road_1 = Road(20, 5000)
road_1.asphalt()

road_2 = Road(24, 17000)
road_2.weight = 30
road_2.asphalt()
#  ------------------------------------------- вариант решения ---------------------------------------------------------
class Road:
    def __init__(self, length, width):
        self._length = length
        self._width = width

    def get_full_profit(self):
        return f"{self._length} м * {self._width} м * 25 кг * 5 см = {(self._length * self._width * 25 * 5) / 1000} т"


road_1 = Road(5000, 20)
print(road_1.get_full_profit())
#  ------------------------------------------- вариант решения ---------------------------------------------------------
class Road:
    def __init__(self, _lenght, _width):
        self._lenght = _lenght
        self._width = _width

    def calc(self):
        print(f"Масса асфальта - {self._lenght * self._width * 25 * 5 / 1000} тонн")


def main():
    while True:
        try:
            road_1 = Road(int(input("Enter width of road in m: ")), int(input("Enter lenght of road in m: ")))
            road_1.calc()
            break
        except ValueError:
            print("Only integer!")
