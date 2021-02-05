# 5.	Реализовать класс Stationery (канцелярская принадлежность).
# ●	определить в нём атрибут title (название) и метод draw (отрисовка). Метод выводит сообщение «Запуск отрисовки»;
# ●	создать три дочерних класса Pen (ручка), Pencil (карандаш), Handle (маркер);
# ●	в каждом классе реализовать переопределение метода draw. Для каждого класса метод должен выводить уникальное
# сообщение;
# ●	создать экземпляры классов и проверить, что выведет описанный метод для каждого экземпляра.
# my solution ####
# Задачу решил, но не понял логики такой реализации: зачем делать 3 наследуемых класса если по сути они являются
# уникальными? Можно же просто сделать 3 класса с методом draw
# my solution ####
class Stationery:
    title = 'канцелярская принадлежность'

    def draw(self):
        print(f"Запуск отрисовки {self.title}")


class Pen(Stationery):
    title = 'Ручка'

    def draw(self):
        print(f"{self.title} пишет")


class Pencil(Stationery):
    title = 'Карандаш'

    def draw(self):
        print(f"{self.title} рисует")


class Handle(Stationery):
    title = 'Маркер'

    def draw(self):
        print(f"{self.title} выделяет текст")


s = Stationery()
s.draw()

pen = Pen()
pen.draw()

pcl = Pencil()
pcl.draw()

h = Handle()
h.draw()
#  ------------------------------------------- вариант решения ---------------------------------------------------------
class Stationery:
    def __init__(self, title="Something that can draw"):
        self.title = title

    def draw(self):
        print(f"Just start drawing! {self.title}))")


class Pen(Stationery):
    def draw(self):
        print(f"Start drawing with {self.title} pen!")


class Pencil(Stationery):
    def draw(self):
        print(f"Start drawing with {self.title} pencil!")


class Marker(Stationery):
    def draw(self):
        print(f"Start drawing with {self.title} marker!")


stat = Stationery()
stat.draw()
pen = Pen("Parker")
pen.draw()
pencil = Pencil("Faber-Castell")
pencil.draw()
marker = Marker("COPIC")
marker.draw()
