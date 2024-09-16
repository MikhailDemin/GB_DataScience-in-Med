import lesson_06_text_parser as tp

text = tp.read_file('06_lesson_task_data.txt')

print(text)
print(len(text))

tp.save_file('06_lesson_task_data_count.txt', text)

with open('06_lesson_task_data_count.txt', 'r', encoding='utf-8') as file:
    data = file.read()
    print(data)
