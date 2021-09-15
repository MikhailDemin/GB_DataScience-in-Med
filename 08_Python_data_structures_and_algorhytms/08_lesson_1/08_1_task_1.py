# 1. Выполнить логические побитовые операции «И», «ИЛИ» и другие над числами 5 и 6.
# Выполнить над числом 5 побитовый сдвиг вправо и влево на два знака.


a = 5
b = 6

print(f'Даны два числа: a = {a} и b = {b}')
print('Логические побитовые операции выполняются не над самими числами, а над их двоичным представлением.Например,\n '
      'число 5 в двоичной системе счисления выражается, как 101, а число 6 - как 110. Выполняя логическую побитовую \n '
      'операцию "И" получим число 4, т.к. в младшим разряде числа 5 стоит 1, а числа 6-0. Выражение "1 и 0" '
      'возвращает 0. Продолжая поразрядно выполнять логическое "И" в среднем разряде получим 0, а в старшем 1.\n'
      'При сдвиге биты просто сдвигаются на указанное количество ячеек в освободившиеся ячейки дописываются нули '
      'или единицы\n')

c = a & b
d = a | b
e = a ^ b
f = ~ a
g = ~ b
h = a << 2
i = a >> 2


print(f'a = {a} | ({bin(a)})\n'
      f'b = {b} | ({bin(b)})\n'
      f'c = a & b = {c}    | ({bin(a)}) & ({bin(b)}) = ({bin(c)})  |  Побитовое И для a и b\n'
      f'd = a | b = {d}    | ({bin(a)}) | ({bin(b)}) = ({bin(d)})  |  Побитовое ИЛИ для a и b\n'
      f'e = a ^ b = {e}    | ({bin(a)}) ^ ({bin(b)}) = ({bin(e)})   |  Исключающее ИЛИ для a и b\n'
      f'f = ~  a = {f}    | ~ ({bin(a)}) = ({bin(f)})         |  Инверсия битов для a\n'
      f'g = ~  b = {g}    | ~ ({bin(b)}) = ({bin(g)})         |  Инверсия битов для b\n'
      f'h = a >> 2 = {h}  | ({bin(a)}) << 2 = ({bin(h)})     |  Побитовый сдвиг влево для a на b\n'
      f'i = a << 2 = {g}  | ({bin(a)}) >> 2 = ({bin(i)})         |  Побитовый сдвиг вправо для a на b\n')