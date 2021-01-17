a = int(input('a'))
b = int(input('b'))
i = 1
while a < b:
    a = a * 1.1
    i += 1
print('На ' + str(i) + '-й день спортсмен достиг результата — не менее ' + str(b) + ' км.')