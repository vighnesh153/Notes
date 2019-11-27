# Given a matrix of 1s and 0s, find a path from (0, 0) to (n-1, n-1) if any exists

# Algorithm: If next horizontal element is 1, then move to that position, and
#            recursively check is path is possible from that point. If yes, then
#            prefix the current position to the remaining path and return. If not, then
#            backtrack and check if the next vertical element is 1. If it is 1,
#            then move to that position, and recursively check if path is possible
#            from that point then return the remaining path. If path is not
#            possible, then return None.

from typing import List, Tuple


class PathFinder:

    def __init__(self, _maze: List[List[int]]):
        self.maze: List[List[int]] = _maze

    def find_path_from(self, position: Tuple[int, int]):
        # Assuming (n - 1, n - 1) as destination and (0, 0) as source
        n = len(self.maze)
        if position == (n - 1, n - 1):
            return [position]

        _x, _y = position
        remaining_path = None

        # If we don't cross horizontal border
        if _x + 1 < n:
            if self.maze[_x + 1][_y] == 1:
                remaining_path = self.find_path_from((_x + 1, _y))

        # If we don't cross vertical border
        if _y + 1 < n and remaining_path is None:
            if self.maze[_x][_y + 1] == 1:
                remaining_path = self.find_path_from((_x, _y + 1))

        if remaining_path is not None:
            return [position] + remaining_path

        # no path exists
        return None


path_finder = PathFinder([
    [1, 0, 1, 0, 0],
    [1, 0, 0, 1, 0],
    [1, 1, 1, 1, 0],
    [1, 0, 0, 1, 0],
    [1, 0, 1, 1, 1]
])
solution = path_finder.find_path_from((0, 0))

if solution is None:
    print('No path exists')
else:
    for path in solution:
        print(path)
