# 4. Пользователь вводит две буквы. Определить, на каких местах алфавита они стоят,
# и сколько между ними находится букв.

print('Введите 2 буквы:')

l1 = input('1-я буква: ')
l2 = input('2-я буква: ')
p1 = ord(l1) - ord('a') + 1
p2 = ord(l2) - ord('a') + 1
if p1 != p2:
    lbw = abs(p2 - p1)-1
else:
    lbw = abs(p2 - p1)
print(f'Позиция буквы {l1} - {p1}')
print(f'Позиция буквы {l2} - {p2}')
if 1 <= lbw <= 4:
    if lbw == 1:
        print(f'Между ними {lbw} буква')
    else:
        print(f'Между ними {lbw} буквы')
else:
    print(f'Между ними {lbw} букв')
