# 5.	Создать (программно) текстовый файл, записать в него программно набор чисел, разделённых пробелами. Программа
# должна подсчитывать сумму чисел в файле и выводить её на экран.
# my solution ####
from random import randint
with open('text_5_5.txt', 'w', encoding='utf-8') as f_obj:
    gen_list = [randint(1, 100) for _ in range(100)]
    f_obj.write(' '.join(map(str, gen_list)))

print({sum(gen_list)})
