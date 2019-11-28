# Find and print all possible ways in which, one can place n-queen on a N by N
# board


from typing import List, Tuple


class NQueens:

    def __init__(self, _number_of_queens: int):
        self._number_of_queens = _number_of_queens

    def find_all_solutions(self):
        _solutions = []

        for column in range(self._number_of_queens):
            # initiate the board by placing 1 queen in the first row
            # for every column, we might have a solution
            _solution = [(0, column)]

            # Solve for next row
            if self.solve(_solution, 1, self._number_of_queens - 1):
                _solutions.append(_solution)

        return _solutions

    def print_all_solutions_neatly(self):
        _all_solutions = self.find_all_solutions()
        print(f'Number of solutions: {len(_all_solutions)}')

        for _solution in _all_solutions:
            _board = [[0 for _ in range(self._number_of_queens)] for _ in range(self._number_of_queens)]

            for __row, _col in _solution:
                _board[__row][_col] = 1

            print('*' * 40)
            for _row in _board:
                print(' '.join(map(str, _row)))
            print('*' * 40)

    def solve(self, _solution: List[Tuple[int, int]], _row: int, _queens_remaining: int):
        if _queens_remaining == 0:
            return True

        for _col in range(0, self._number_of_queens):
            _next_queen_position = (_row, _col)

            # try every column value for the specified row and if that is a valid spot, use
            # that spot and invoke the solve() method recursively to solve for next row
            if NQueens.is_valid_solution(_solution, _next_queen_position):
                _solution.append((_row, _col))
                if self.solve(_solution, _row + 1, _queens_remaining - 1):
                    return True

                # backtrack
                _solution.pop()

        return False

    @classmethod
    def is_valid_solution(cls, _solution: List[Tuple[int, int]], position: Tuple[int, int]):
        _x, _y = position

        for _already_x, _already_y in _solution:
            # in same row
            if _already_x == _x:
                return False

            # in same column
            if _already_y == _y:
                return False

            # on same diagonal
            if abs(_already_y - _y) == abs(_already_x - _x):
                return False

        return True


NQueens(8).print_all_solutions_neatly()
