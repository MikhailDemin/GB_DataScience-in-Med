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
