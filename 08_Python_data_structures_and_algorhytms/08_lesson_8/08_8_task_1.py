# 1. На улице встретились N друзей. Каждый пожал руку всем остальным друзьям (по одному разу).
# Сколько рукопожатий было?
# Примечание. Решите задачу при помощи построения графа.
# ------------------------------------------------------
# Решение:
s = int(input("Enter the number of friends shaking hands with each other: "))

# генерируем матрицу смежности:
graph = []
for i in range(s):
    row = [1] * s
    row[i] = 0
    graph.append(row)

print(graph)

# считаем количество ребер:
handshakes = 0
for row in graph:
    for i in row:
        handshakes += i

handshakes //= 2

print(f"Всего было произведено {handshakes} рукопожатий")

