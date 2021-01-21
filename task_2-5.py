rating = [7, 5, 3, 3, 2]
user_in = float(input('enter rating number'))
# user_in = float(user_in) if user_in.isfloat() else user_in = int(user_in) не работает по идее нужна проверка типа
# if user_in.isfloat():
# можно реализовать замену на число через dict() если пользователь вводит например "два", "пять"
for i in rating:
    if user_in > i:
        pos = rating.index(i)
        rating.insert(pos, user_in)
        print(rating)
        break
    else:
        pass
