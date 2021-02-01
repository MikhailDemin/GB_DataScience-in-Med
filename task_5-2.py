# 2.	Создать текстовый файл (не программно), сохранить в нём несколько строк, выполнить подсчёт строк и слов
# каждой строке.
# my solution ####
with open ('task_5-1.txt', encoding='utf-8') as f_obj:
    my_str = f_obj.readlines()
    for ind, val in enumerate(my_str, 1):
        words = len(val.split())
        print(f'{ind} contains {words} words')