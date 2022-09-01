def read_file(file):
    with open(file, 'r', encoding='utf-8') as f:
        text = f.read()
    # cleaning data
    text = text.lower()
    words = text.split()
    words = [word.strip('.,;!:()[]') for word in words]
    if '—' in words:
        words.remove('—')
    for word in words:
        if word.isdigit():
            words.remove(word)
    # finding unique
    unique = []
    for word in words:
        if word not in unique:
            unique.append(word)
    return unique


# if __name__ == '__main__':
#     load = read_file('06_lesson_task_data.txt')
#     print(len(load))


def save_file(file, words):
    with open(file, 'w', encoding='utf-8') as f:
        f.write(f'Всего уникальных слов: {len(words)}\n{"=" * 50}\n')
        words.sort()
        for word in words:
            f.write(word + '\n')


# if __name__ == '__main__':
#     save_file('count.txt', load)
