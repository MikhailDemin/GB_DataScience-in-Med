from collections import deque

g = [
    [0, 1, 1, 0, 1, 0, 0, 0],
    [1, 0, 0, 0, 0, 0, 0, 0],
    [1, 0, 0, 0, 1, 0, 0, 0],
    [0, 0, 0, 0, 0, 1, 0, 0],
    [1, 0, 1, 0, 0, 0, 1, 0],
    [0, 0, 0, 1, 0, 0, 1, 1],
    [0, 0, 0, 0, 1, 1, 0, 1],
    [0, 0, 0, 0, 0, 1, 1, 0],
]


def bfs(graph, start, finish):
    parent = [None for _ in range(len(graph))]
    is_visited = [False for _ in range(len(graph))]

    deq = deque([start])
    is_visited[start] = True

    while len(deq) > 0:

        current = deq.pop()

        if current == finish:
            # return parent
            break

        for i, vertex in enumerate(graph[current]):
            if vertex == 1 and not is_visited[i]:

                is_visited[i] = True
                parent[i] = current
                deq.appendleft(i)

    else:
        return f"From {start} can't get {finish}"

    cost = 0
    way = deque([finish])
    i = finish

    while parent[i] != start:
        cost += 1
        way.appendleft(parent[i])
        i = parent[i]

    cost += 1
    way.appendleft(start)

    return f'Shortest way {list(way)} is {cost} conventional units long'


s = int(input('Set start point: '))
f = int(input('Set finish point: '))
print(bfs(g, s, f))
