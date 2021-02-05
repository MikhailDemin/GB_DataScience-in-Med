# 1.	Создать класс TrafficLight (светофор).
# ●	определить у него один атрибут color (цвет) и метод running (запуск);
# ●	атрибут реализовать как приватный;
# ●	в рамках метода реализовать переключение светофора в режимы: красный, жёлтый, зелёный;
# ●	продолжительность первого состояния (красный) составляет 7 секунд, второго (жёлтый) — 2 секунды, третьего (зелёный)
# — на ваше усмотрение;
# ●	переключение между режимами должно осуществляться только в указанном порядке (красный, жёлтый, зелёный);
# ●	проверить работу примера, создав экземпляр и вызвав описанный метод.
# Задачу можно усложнить, реализовав проверку порядка режимов. При его нарушении выводить соответствующее сообщение и
# завершать скрипт.
# my solution ####
from time import sleep


class TrafficLight:
    __color = 'Цвет сигнала'

    def running(self):
        while True:
            print("\033[30m\033[41m {}".format(TrafficLight.__color))
            sleep(5.0)
            print("\033[30m\033[43m {}".format(TrafficLight.__color))
            sleep(2.0)
            print("\033[30m\033[42m {}".format(TrafficLight.__color))
            sleep(7.0)
            print("\033[30m\033[43m {}".format(TrafficLight.__color))
            sleep(2.0)
            # цвет текста почему-то на черный \033[30m не меняется(


traffic_l = TrafficLight()
traffic_l.running()
#  ------------------------------------------- вариант решения ---------------------------------------------------------
import time
import itertools


class TrafficLight:
    __color = [["red", [7, 31]], ["yellow", [2, 33]], ["green", [7, 32]], ["yellow", [2, 33]]]

    def running(self):
        for light in itertools.cycle(self.__color):
            print(f"\r\033[{light[1][1]}m\033[1m{light[0]}\033[0m", end="")
            time.sleep(light[1][0])


trafficlight_1 = TrafficLight()
trafficlight_1.running()
#  ------------------------------------------- вариант решения ---------------------------------------------------------
from time import sleep


class TrafficLight:
    __color = "Черный"

    def running(self):
        while True:
            print("Trafficlight is red now")
            sleep(7)
            print("Trafficlight is yellow now")
            sleep(2)
            print("Trafficlight is green now")
            sleep(7)
            print("Trafficlight is yellow now")
            sleep(2)


trafficlight = TrafficLight()
trafficlight.running()
#  ------------------------------------------- вариант решения ---------------------------------------------------------
import time
import itertools


class TrafficLight:
    __color = [["red", [7, 31]], ["yellow", [2, 33]], ["green", [7, 32]], ["yellow", [2, 33]]]

    def __init__(self, light_list):
        self.light_list = light_list

    def running(self):
        if len([i for i in self.light_list if i in ["red", "yellow", "green"]]) >= 3:
            for light in itertools.cycle(self.__color):
                print(f"\r\033[{light[1][1]}m\033[1m{light[0]}\033[0m", end="")
                time.sleep(light[1][0])
        else:
            print("Your color list is incorrect.")


trafficlight_1 = TrafficLight(["lilac", "green", "lime", "white", "black", "yellow"])
trafficlight_1.running()
#  ------------------------------------------- вариант решения ---------------------------------------------------------
from time import sleep
from itertools import cycle

class TrafficLight:
    #    __color = [[' RED ', 'YELLOW', 'GREEN'], [7, 2, 4],
    __color = ["   ", [7, 2, 4], ["\033[41m\033[1m", "\033[43m\033[1m", "\033[42m\033[1m"]]

    def running(self):
        col_lst = ["", ""]
        for n in cycle((0, 1, 2)):
            col_lst[1] = self.__color[2][n]
            print(f"\r({col_lst[int(n == 0)]}{self.__color[0]}\033[0m)"
                  f"({col_lst[int(n == 1)]}{self.__color[0]}\033[0m)"
                  f"({col_lst[int(n == 2)]}{self.__color[0]}\033[0m)", end='')
            sleep(self.__color[1][n])

tr_light = TrafficLight()
tr_light.running()
#  ------------------------------------------- вариант решения ---------------------------------------------------------
from time import sleep
import colorama
import sys

colorama.init()


class TrafficLight:
    # Запуск в терминале
    def running(self):
        while True:
            print(f'\r\033[31m{chr(11035)} ', end='')
            sleep(4)
            print(f'\r\033[30m{chr(11035)} ')
            print(f'\r\033[33m{chr(11035)} ', end='')
            sleep(2)
            print(f'\r\033[30m{chr(11035)} ')
            print(f'\r\033[32m{chr(11035)} ', end='')
            sleep(4)
            print(f'\r\033[30m{chr(11035)} ', end='')
            sys.stdout.write('\r\x1b[2A')


trafficLight = TrafficLight()
trafficLight.running()
#  ------------------------------------------- вариант решения ---------------------------------------------------------
import tkinter as tk
from PIL import ImageTk, Image
from itertools import cycle


class TrafficLight:
    def __init__(self, working_algorithm):
        self.sec_count = 0
        self.working_algorithm = working_algorithm
        self.img_dict = {'red': Image.open('pic/tl_red.jpg').resize((350, 400)),
                         'yellow': Image.open('pic/tl_yellow.jpg').resize((350, 400)),
                         'green': Image.open('pic/tl_green.jpg').resize((350, 400)),
                         'red+yellow': Image.open('pic/tl_red_yellow.jpg').resize((350, 400)),
                         'off': Image.open('pic/tl_off.jpg').resize((350, 400))}
        self.iterator = cycle(self.working_algorithm)
        self.cur_state = next(self.iterator)

        self.root = tk.Tk()
        self.root.attributes("-topmost", True)
        self.root.geometry('300x400')
        image = ImageTk.PhotoImage(self.img_dict[self.cur_state[0]])
        self.label = tk.Label(image=image)
        self.label.pack(side="top", fill="both", expand="yes")
        self.running()
        self.root.mainloop()

    def running(self):
        self.sec_count += 1
        if self.sec_count == self.cur_state[1]:
            self.cur_state = next(self.iterator)
            self.sec_count = 0
            cur_img = ImageTk.PhotoImage(self.img_dict[self.cur_state[0]])
            self.label.configure(image=cur_img)
            self.label.photo_ref = cur_img
            self.label.pack()
        self.root.after(100, self.running)


mode = input("Enter traffic-light mode (0 - simple, 1-advanced):")
if mode == '0':
    app = TrafficLight([('red', 70), ('yellow', 20), ('green', 50), ('yellow', 20)])
elif mode == '1':
    app = TrafficLight([('red', 70),
                        ('red+yellow', 20),
                        ('green', 50),
                        ('off', 5),
                        ('green', 5),
                        ('off', 5),
                        ('green', 5),
                        ('off', 5),
                        ('green', 5),
                        ('yellow', 20)])
else:
    print('Wrong choice!')
