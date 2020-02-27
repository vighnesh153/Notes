from heapq import *


def solve(count_of_nodes, connections, src):
    graph = dict()

    for s1, d1, dist in connections:
        graph[s1] = graph.get(s1, dict())
        graph[d1] = graph.get(d1, dict())

        graph[s1][d1] = dist
        graph[d1][s1] = dist

    distance = [float('inf')] * count_of_nodes
    visited = [False] * count_of_nodes
    distance[src] = 0

    h = [(0, src)]

    while h:
        dist, source = heappop(h)
        if visited[source]:
            continue

        visited[source] = True
        distance[source] = min(distance[source], dist)
        for child in graph[source]:
            if not visited[child]:
                heappush(h, (graph[source][child] + dist, child))

    return [-1 if i == float('inf') else i for i in distance]


A = 5
B = [
    [0, 3, 4],
    [2, 3, 3],
    [0, 1, 9],
    [3, 4, 10],
    [1, 3, 8]
]
C = 4
print(solve(A, B, C))
