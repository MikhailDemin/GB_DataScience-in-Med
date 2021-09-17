# 2. По введенным пользователем координатам двух точек вывести уравнение прямой вида y = kx + b,
# проходящей через эти точки.

print("Введите координаты 2 точек:")

x1 = float(input())
y1 = float(input())
x2 = float(input())
y2 = float(input())

if x1 == x2:
    print(f'Уравнение прямой: x = {x1:.2f}')
else:
    k = (y1 - y2) / (x1 - x2)
    b = y2 - k * x2
    print(f'k = {k:.2f}')
    print(f'b = {b:.2f}')
    if b != 0:
        if k != 0:
            print("Уравнение прямой: y = %.2f * x + %.2f" % (k, b))
        else:
            print("Уравнение прямой: y = %.2f" % b)
    else:
        if k != 0:
            print("Уравнение прямой: y = %.2f * x" % k)
        else:
            print("Уравнение прямой: y = 0")
