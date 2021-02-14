# 4.	Реализуйте базовый класс Car.
# ●	у класса должны быть следующие атрибуты: speed, color, name, is_police (булево). А также методы: go, stop,
# turn(direction), которые должны сообщать, что машина поехала, остановилась, повернула (куда);
# ●	опишите несколько дочерних классов: TownCar, SportCar, WorkCar, PoliceCar;
# ●	добавьте в базовый класс метод show_speed, который должен показывать текущую скорость автомобиля;
# ●	для классов TownCar и WorkCar переопределите метод show_speed. При значении скорости свыше 60 (TownCar) и 40
# (WorkCar) должно выводиться сообщение о превышении скорости.
# Создайте экземпляры классов, передайте значения атрибутов. Выполните доступ к атрибутам, выведите результат. Вызовите
# методы и покажите результат.
# my solution ####
class Car:
    def __init__(self, name, color, speed, is_police=False):
        self.name = name
        self.color = color
        self.speed = speed
        self.is_police = is_police
        print(f'New car {self.name}, color {self.color} police car - {self.is_police}')

    def go(self):
        print(f'{self.name} car start')

    def stop(self):
        print(f'{self.name} car stop')

    def turn(self, direction):
        print(f'{self.name} car turn {"left" if direction == 0 else "right"}')

    def show_speed(self):
        return f'{self.name} car speed is {self.speed}'


class TownCar(Car):
    def show_speed(self):
        return f'Over speed limit! {self.name} car speed is {self.speed}' if self.speed > 60 \
            else f'{self.name} car speed is {self.speed}'


class WorkCar(Car):
    def show_speed(self):
        return f'Over speed limit! {self.name} car speed is {self.speed}' if self.speed > 40 \
            else f'{self.name} car speed is {self.speed}'


class SportCar(Car):
    """Sport Car"""


class PoliceCar(Car):
    def __init__(self, name, color, speed, is_police=True):
        super().__init__(name, color, speed, is_police)


police_1 = PoliceCar('Police', 'blue', 75)
police_1.go()
print(police_1.show_speed())
police_1.turn(1)
police_1.stop()
print()

work_1 = WorkCar('Work', 'brown', 35)
work_1.go()
work_1.turn(0)
work_1.turn(1)
work_1.turn(0)
print(work_1.show_speed())
work_1.stop()
print()

sport_1 = SportCar('Sport', 'red', 120)
sport_1.go()
sport_1.turn(1)
sport_1.turn(1)
sport_1.turn(0)
sport_1.turn(1)
print(sport_1.show_speed())
sport_1.stop()
print()

town_1 = TownCar('Town', 'grey', 70)
town_1.go()
print(town_1.show_speed())
town_1.turn(0)
town_1.stop()
print()
