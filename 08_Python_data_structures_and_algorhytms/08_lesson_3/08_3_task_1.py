# 1. В диапазоне натуральных чисел от 2 до 99 определить, сколько из них кратны каждому из чисел в диапазоне от 2 до 9.
# Примечание: 8 разных ответов.
# ------------------------------------------------------

# Решение:
# Создадим список из 8 ячеек и заполним их нулями:
lst = [0] * 8

# Далее создадим два цикла: в первом будем перебирать числа от 2 до 99:
for num in range(2, 100):
    # А второй вложим в первый и будем в нем проверять текущее число из первого цикла на кратность
    # числам от 2 до 9:
    for item in range(2, 10):
        # Если текущее число из 1-го цикла кратно одному из чисел 2-го цикла, будем увеличивать на 1 значение
        # ячейки списка:
        if num % item == 0:
            lst[item - 2] += 1

# Выведем полученные значения:
print(lst)

# Не понятно что значат эти числа, поэтому будем выводить каждое число списка в паре с его индексом + 2.
# Так будет наглядно видно сколько чисел кратны каждому числу от 2 до 9:
i = 0
while i < len(lst):
    print(f'Числу {i + 2} кратны {lst[i]} чисел')
    i += 1
