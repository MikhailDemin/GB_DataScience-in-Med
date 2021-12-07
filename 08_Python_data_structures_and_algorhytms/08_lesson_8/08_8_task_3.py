# 3. Написать программу, которая обходит не взвешенный ориентированный граф без петель, в котором все вершины связаны,
# по алгоритму поиска в глубину (Depth-First Search).
# Примечания:
# a. граф должен храниться в виде списка смежности;
# b. генерация графа выполняется в отдельной функции, которая принимает на вход число вершин.
# ------------------------------------------------------
# Решение:
def generate_graph(num):
    new_graph = {}

    for i in range(num):
        new_graph[i] = set(j for j in range(num) if j != i)

    return new_graph


def dfs(graph, start, visited=None):
    if visited is None:
        visited = set()
    visited.add(start)
    print(start)
    for next in graph[start] - visited:
        dfs(graph, next, visited)
    return visited


n = int(input("Количество вершин в графе: "))
s = int(input("Введите вершину начала: "))

g = generate_graph(n)
print(f'Созданный граф:', '\n', g)
print('*' * 70, '\n')
print(dfs(g, s))
