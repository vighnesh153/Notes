# An efficient way to solve a 9 x 9 sudoku puzzle.

# In the 3-by-3 version, I substitute all numbers from 1 to 9 in the empty cell and
# check if the board is solvable for each value from 1 to 9 in that cell by recursively
# calling the board. But the time complexity of that approach is very high. It can't
# be used to solve a 9 x 9 sudoku problem.

# So, here is a better approach. For every empty cell, check what all values can
# fit in that empty cell. Then, try to solve the board for each of the empty cells.
# This way, we don't have to check for the validity of the board because if the board
# is going to be invalid, we will get 0 possible numbers for a particular empty cell.
# Now, we have an empty cell but no numbers can fit in there. So, we know that the
# current configuration of the board is invalid. So, we backtrack.
# Base case: If no empty cells exists, then the board is solved.

class Sudoku:

    def __init__(self, board):
        self.board = board

    def _is_cell_empty(self, i, j):
        return self.board[i][j] == 0

    def _get_numbers_that_can_be_placed_on_cell(self, cell_row_index, cell_column_index):
        # initialize with all numbers
        possible = set(range(1, 10))

        # remove numbers that are on same row
        for elem in self.board[cell_row_index]:
            if elem in possible:
                possible.remove(elem)

        # remove numbers that are on same column
        for row_index in range(9):
            elem = self.board[row_index][cell_column_index]
            if elem in possible:
                possible.remove(elem)

        # remove numbers that are in the same cubicle
        offset_x = (cell_row_index // 3) * 3
        offset_y = (cell_column_index // 3) * 3
        for x in range(3):
            for y in range(3):
                elem = self.board[offset_x + x][offset_y + y]
                if elem in possible:
                    possible.remove(elem)

        return tuple(possible)

    def solve(self):
        for i in range(9):
            for j in range(9):
                if not self._is_cell_empty(i, j):
                    continue

                possible_numbers = self._get_numbers_that_can_be_placed_on_cell(i, j)

                if len(possible_numbers) == 0:
                    return False

                for elem in possible_numbers:
                    # place the element
                    self.board[i][j] = elem

                    # check if the board can be solved by placing the 'elem' from possible_numbers
                    if self.solve():
                        return True

                    # if it cannot be solved, backtrack and try next number
                    self.board[i][j] = 0

                # if none amongst the possible numbers fit in the position, go back to the
                # previous guess and try the next number in the previous guess
                return False

        # if no cell is empty, then the sudoku is solved
        return True


def driver(board):
    sudoku = Sudoku(board)
    if not sudoku.solve():
        print "The board doesn't have a solution."
        return

    for row in board:
        print row


# if 'element == 0' it means that the cell at that position is empty
sample_board = [
    [0, 0, 0, 2, 6, 0, 7, 0, 1],
    [6, 8, 0, 0, 7, 0, 0, 9, 0],
    [1, 9, 0, 0, 0, 4, 5, 0, 0],
    [8, 2, 0, 1, 0, 0, 0, 4, 0],
    [0, 0, 4, 6, 0, 2, 9, 0, 0],
    [0, 5, 0, 0, 0, 3, 0, 2, 8],
    [0, 0, 9, 3, 0, 0, 0, 7, 4],
    [0, 4, 0, 0, 5, 0, 0, 3, 6],
    [7, 0, 3, 0, 1, 8, 0, 0, 0]
]
driver(sample_board)
