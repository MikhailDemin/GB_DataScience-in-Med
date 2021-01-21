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
