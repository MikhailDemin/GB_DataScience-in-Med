def sum_dig(num):
    return sum(map(int, str(num)))


sum_list = [8, 17, 26, 35, 44, 53, 62, 71, 80]

arr = []
s = 9999999
c = s
while c > 1111111:
    arr.append(c)
    c -= 1

arr_s = []

for i in arr:
    if sum_dig(i) in sum_list:
        if "0" not in str(i):
            arr_s.append(i)

arr_88 = []

for k in arr_s:
    if str(k).count('88') > 0:
        arr_88.append(k)

p_962 = []
p_963 = []
p_909 = []
p_900 = []
p_905 = []

sum_l = [7, 16, 25, 34, 43, 52, 61, 70]

for m_1 in arr_88:
    if (sum_dig(m_1) + sum_dig(962)) in sum_l:
        p_962.append(m_1)
for m_2 in arr_88:
    if (sum_dig(m_2) + sum_dig(963)) in sum_list:
        p_963.append(m_2)
for m_3 in arr_88:
    if (sum_dig(m_3) + sum_dig(909)) in sum_list:
        p_909.append(m_3)
for m_4 in arr_88:
    if (sum_dig(m_4) + sum_dig(905)) in sum_list:
        p_905.append(m_4)
for m_5 in arr_88:
    if (sum_dig(m_5) + sum_dig(900)) in sum_list:
        p_900.append(m_5)

print(arr_88)

arr_888 = []

# for q in arr_88:
#     if str(q).find("888", 4):
#         arr_888.append(q)

for q in arr_88:
    if str(q).count('888') > 0 and str(q).find("888", 4):
        arr_888.append(q)

print(f'\n\n\n\n{arr_888}')
