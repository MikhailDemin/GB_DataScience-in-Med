# try:
#     number = float(input('Введите число: '))
#     print("Correct")
# except ValueError:
#     print("Ввод только числа")

num = input('enter mumber')
temp = num.replace('.', '', 1).replace('-', '', 1)

if temp.isdigit():
    print("Correct")
else:
    print('Wrong')