# 4. Задание (в программе):
# Постройте на одном графике две кривые y(x) для функции двух переменной y(k,x)=cos(k∙x), взяв для одной кривой значение
# k=1, а для другой – любое другое k, не равное 1.
# my solution ####
import numpy
import matplotlib.pyplot as p

x = numpy.arange(-10, 10, 0.01)

k1 = 1
k2 = 3

p.plot(x, numpy.cos(k1*x))
p.plot(x, numpy.cos(k2*x))

p.title(f'две кривые y(k,x)=cos(k∙x), где k1 = {k1}, k2 = {k2}')

p.grid(True)

p.show()
