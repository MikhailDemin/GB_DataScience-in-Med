# 5.	Создать (программно) текстовый файл, записать в него программно набор чисел, разделённых пробелами. Программа
# должна подсчитывать сумму чисел в файле и выводить её на экран.
# my solution ####
from random import randint
with open('text_5_5.txt', 'w', encoding='utf-8') as f_obj:
    gen_list = [randint(1, 100) for _ in range(100)]
    f_obj.write(' '.join(map(str, gen_list)))

print({sum(gen_list)})
#  ------------------------------------------- вариант решения ---------------------------------------------------------
from random import randint


with open('task_5_file.txt',  mode='w+', encoding='utf-8') as the_file:
    the_file.write(" ".join([str(randint(1, 1000)) for _ in range(100000)]))
    the_file.seek(0)
    print(sum(map(int, the_file.readline().split())))
