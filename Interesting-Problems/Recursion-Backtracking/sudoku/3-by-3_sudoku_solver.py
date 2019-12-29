# Solve a 3 by 3 sodoku. Some of the 9 elements will be given

# Algorithm: Let the number of rows and columns be 3. So, available pieces are [1, 2, 3].
#            In the board, if any cell's value is 0, then it is empty.
#            The algorithm is to iterate over all the empty values and for each
#            value in [1, 2, 3], substitute it in the empty cell and if the board
#            is valid after substitution, then solve for the remaining values
#            recursively. If the board is invalid, then return False =>
#            which would backtrack and try the board for the next possible value in the empty cell


from typing import List, Set


class SudokuSolver:

    def __init__(self, board: List[List[int]]):
        self.board: List[List[int]] = board
        self._board_length: int = len(board)

    def solve(self):
        number_of_empty_positions = sum([_row.count(0) for _row in self.board])

        # If no empty positions, then return isValid(board)
        if number_of_empty_positions == 0:
            return SudokuSolver.is_valid_board(self.board)

        for row_index in range(self._board_length):
            for col_index in range(self._board_length):

                # Skip if already filled
                if self.board[row_index][col_index] != 0:
                    continue

                # Try the empty cell with each value
                for value in range(1, self._board_length + 1):
                    self.board[row_index][col_index] = value
                    if SudokuSolver.is_valid_board(self.board) and self.solve():
                        return True
                    self.board[row_index][col_index] = 0

        return False

    @classmethod
    def is_valid_board(cls, _board: List[List[int]]):
        # row-wise
        for _row in _board:
            if not SudokuSolver.is_valid_row(_row):
                return False

        # column-wise
        for _col in range(len(_board)):

            # Build column
            column: List[int] = []
            for _row_index in range(len(_board)):
                column.append(_board[_row_index][_col])

            # check column validity
            if not SudokuSolver.is_valid_row(column):
                return False

        return True

    @classmethod
    def is_valid_row(cls, _row: List[int]):
        already_occurred: Set[int] = set()

        for number in _row:

            # ignore 0s
            if number == 0:
                continue

            # If duplicate number, return False => which indicates invalidity
            if number in already_occurred:
                return False
            already_occurred.add(number)

        return True


# assume 0 to be an empty cell
sudokuSolver = SudokuSolver([
    [0, 0, 2],
    [0, 0, 0],
    [0, 1, 0]
])

if sudokuSolver.solve():
    for row in sudokuSolver.board:
        print(row)
else:
    print('Given board is invalid and hence unsolvable')
