# 2.	Для списка реализовать обмен значений соседних элементов. Значениями обмениваются элементы с
# индексами 0 и 1, 2 и 3 и т. д. При нечётном количестве элементов последний сохранить на своём месте.
# Для заполнения списка элементов нужно использовать функцию input()
# my solution ####
# list_1 = input('enter something').split()
# list_2 = []
# for i in list_1:
#    tmp_list = [list_1.pop(0) + list_1.pop(1)]
#    list_2 = list_2.append(tmp_list.reverse())
# print(list_2)
list_in = input('enter something').split()
list_out = []
for i in range(len(list_in) // 2):
    v_1 = list_in.pop(0)
    v_2 = list_in.pop(0)
#    v_1, v_2 = tmp[0], tmp[1]
    v_1, v_2 = v_2, v_1
    list_out += v_1, v_2
if (len(list_in) % 2) == 1:
    list_out += list_in
print(list_out)
#  ------------------------------------------- вариант решения ---------------------------------------------------------
my_list = list(input('enter something without space'))
for i in range(1, len(my_list), 2):
    my_list[i - 1], my_list[i] = my_list[0], my_list[i - 1]
print(my_list)
#  ------------------------------------------- вариант решения ---------------------------------------------------------
in_list = input('enter something').split()
print('Income list: ', in_list)

idx = len(in_list) if len(in_list) % 2 == 0 else len(in_list) - 1

in_list[:idx:2], in_list[1:idx:2] = in_list[1:idx:2], in_list[:idx:2]
print('Changed list: ', in_list)
#  ------------------------------------------- вариант решения ---------------------------------------------------------
new_list = input('enter something').split()

for i in range(1, len(new_list), 2):
    new_list.insert(i - 1, new_list.pop(i))

print(new_list)
