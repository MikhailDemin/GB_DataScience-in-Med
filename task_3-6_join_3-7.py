# 6. Реализовать функцию int_func(), принимающую слово из маленьких латинских букв и возвращающую его же, но с прописной
# первой буквой. Например, print(int_func(‘text’)) -> Text.
# 7. Продолжить работу над заданием. В программу должна попадать строка из слов, разделенных пробелом. Каждое слово
# состоит из латинских букв в нижнем регистре. Сделать вывод исходной строки, но каждое слово должно начинаться с
# заглавной буквы. Необходимо использовать написанную ранее функцию int_func().
# my solution ####
def int_func():
    for wrd in input("enter some text: ").split():
        letter = 0
        for letter in wrd:
            if 'a' <= letter <= 'z':
                letter += 1
        print(wrd.title() if letter == len(wrd) else f'{wrd}')


int_func()
# nice авп ъghj jапро hjjпаро вапрghgh cool

#  ------------------------------------------- вариант решения ---------------------------------------------------------


def int_func(word):
    latin_char = 'qwertyuiopasdfghjklzxcvbnm'
    return word.title() if not set(word).difference(latin_char) else False


words = input('Введите строку из слов разделнных пробелом: ').split()
for w in words:
    result = int_func(w)
    if result:
        print(int_func(w), ' ')


#  ------------------------------------------- вариант решения ---------------------------------------------------------


int_func = lambda word: word.title() if word.islower() and ascii(word)[1:-1].isalpha() else ''
print(' _ '.join(map(int_func, input("Enter phrase: ").split())))
