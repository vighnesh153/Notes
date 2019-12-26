# SHORT SOLUTION

# from copy import deepcopy
#
# class NQueens:
#
#     def __init__(self, number_of_queens):
#         self.number_of_queens = number_of_queens
#         self.solutions = []
#         self.queen_positions = []
#
#     def is_queen_position_valid(self, q_x, q_y):
#
#         for i, j in self.queen_positions:
#             if i == q_x:
#                 return False
#             if j == q_y:
#                 return False
#             if abs(i - q_x) == abs(j - q_y):
#                 return False
#
#         return True
#
#     def generate_solutions(self, row=0, number_of_queens=None):
#         if number_of_queens is None:
#             number_of_queens = self.number_of_queens
#
#         if number_of_queens == 0:
#             self.solutions.append(deepcopy(self.queen_positions))
#             return
#
#         for col in range(self.number_of_queens):
#             if self.is_queen_position_valid(row, col):
#                 self.queen_positions.append((row, col))
#                 self.generate_solutions(row + 1, number_of_queens - 1)
#                 self.queen_positions.pop()
#
#
# n_queens = NQueens(4)
# n_queens.generate_solutions()
# print len(n_queens.solutions)



# Find and print all possible ways in which, one can place n-queen on a N by N
# board


from typing import List, Tuple
from copy import deepcopy


class NQueens:

    def __init__(self, _number_of_queens: int):
        self._number_of_queens = _number_of_queens
        self._solutions = []

    def find_all_solutions(self):
        self._solutions = []

        for column in range(self._number_of_queens):
            # initiate the board by placing 1 queen in the first row
            # for every column, we might have a solution
            _solution = [(0, column)]

            # Solve for next row
            self.solve(_solution, 1, self._number_of_queens - 1)

        return self._solutions

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
            self._solutions.append(deepcopy(_solution))

        for _col in range(0, self._number_of_queens):
            _next_queen_position = (_row, _col)

            # try every column value for the specified row and if that is a valid spot, use
            # that spot and invoke the solve() method recursively to solve for next row
            if NQueens.is_valid_solution(_solution, _next_queen_position):
                _solution.append((_row, _col))
                self.solve(_solution, _row + 1, _queens_remaining - 1)

                # backtrack
                _solution.pop()

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
