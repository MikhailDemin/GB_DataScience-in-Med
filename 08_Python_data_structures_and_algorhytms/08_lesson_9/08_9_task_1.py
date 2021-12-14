# 1. Определение количества различных подстрок с использованием хеш-функции. Пусть на вход функции дана строка.
# Требуется вернуть количество различных подстрок в этой строке.
# Примечания:
# * в сумму не включаем пустую строку и строку целиком;
# * без использования функций для вычисления хэша (hash(), sha1() или любой другой из модуля hashlib задача
# считается не решённой.
# ------------------------------------------------------
# Решение:
import hashlib


def substring_count(string: str):
    str_length = len(string)
    assert str_length, "Строка не может быть пустой"

    is_counted = [
        string
    ]
    substrings = {}

    # формируем подстроки
    for pos in range(str_length):
        for width in range(pos + 1, str_length + 1):
            subs = string[pos:width]
            if subs not in is_counted and subs not in substrings:
                substrings[subs] = 0

    for patt in substrings:
        patt_length = len(patt)
        patt_hash = hashlib.sha1(patt.encode("utf-8")).hexdigest()
        for i in range(str_length - patt_length + 1):
            subs_hash = hashlib.sha1(string[i:i + patt_length].encode("utf-8")).hexdigest()
            if subs_hash == patt_hash:
                substrings[patt] += 1

    return substrings


s = input("Введите строку: ")

result = substring_count(s)
print(result)
print(f"Количество подстрок {sum(x for x in result.values())}")
# ------------------------------------------------------
# Реализация №2:


def get_count_subs(s: str):
    assert len(s) > 0, 'Строка не может быть пустой'
    count_all = 0
    subs_lst = []
    count_lst = []

    while True:
        subs = input('Введите подстроку для поиска: ')
        assert len(s) >= len(subs), 'Подстрока не может быть длиннее строки'

        len_sub = len(subs)
        h_subs = hashlib.sha1(subs.encode('utf-8')).hexdigest()
        count = 0
        subs_lst.append(subs)

        if subs != '' and subs != s:
            for i in range(len(s) - len_sub + 1):
                if h_subs == hashlib.sha1(s[i:i + len_sub].encode('utf-8')).hexdigest():

                    if s[i:i + len_sub] == subs:
                        count += 1

            if count > 0:
                print(f'В строке "{s}" подстрока "{subs}" найдена {count} раз\n')
            else:
                print(f'В строке "{s}" подстрока "{subs}" не найдена\n')

            count_all += count
            count_lst.append(count)

        else:
            print(f'Для пустых строк или строк равных "{s}" подсчет не ведется!\n')
            count_lst.append(count)

        next_it = input('Если хотите продолжить поиск подстрок, то нажмите любую клавишу, если нет, то наберите 0: ')
        if next_it == '0':
            break

    print(f'\nПоиск закончен. В строке "{s}" найдено: ')
    for i, sub in enumerate(subs_lst):
        print(f'Подстрока "{sub}": {count_lst[i]}')
    else:
        print(f'Всего подстрок найдено {count_all}')


s_1 = input('Введите строку 1: ')
get_count_subs(s_1)
