class Placeholder:

    def __init__(self, start_x, start_y, end_x, end_y, length):
        self.start_x = start_x
        self.start_y = start_y
        self.end_x = end_x
        self.end_y = end_y
        self.length_of_placeholder = length


class Crossword:

    def __init__(self, board, words):
        self.board = board
        self.words = words
        self.placeholders = self._get_placeholders()
        self.filled_positions = []

    def solve(self, word_index=0, placeholders_blacklist=None):
        if word_index >= len(self.words):
            for row in self.board:
                print("".join(row))
            return "DONE"
        word = self.words[word_index]

        if placeholders_blacklist is None:
            placeholders_blacklist = set()

        for position in self.placeholders:
            if position.length_of_placeholder == len(word) and \
                    self._can_be_filled(word, position) and \
                    position not in placeholders_blacklist:
                placeholders_blacklist.add(position)
                self.filled_positions.append((word, position))
                self._fill_word_at_position(word, position)
                if self.solve(word_index + 1, placeholders_blacklist) == "DONE":
                    return "DONE"
                self._empty_position(position)
                placeholders_blacklist.remove(position)
                self.filled_positions.pop()

                self.refill_others()
                # We refill the remaining placeholders because while cleaning
                # the current placeholder, we may have cleared characters of other
                # placeholders as well.

    def refill_others(self):
        for word, position in self.filled_positions:
            self._fill_word_at_position(word, position)

    def _can_be_filled(self, word, placeholder):
        if placeholder.start_x == placeholder.end_x:
            x = placeholder.start_x
            for i in range(placeholder.start_y, placeholder.end_y + 1):
                word_ch = word[i - placeholder.start_y]
                if self.board[x][i] not in (word_ch, '-'):
                    return False
        else:
            y = placeholder.start_y
            for i in range(placeholder.start_x, placeholder.end_x + 1):
                word_ch = word[i - placeholder.start_x]
                if self.board[i][y] not in (word_ch, '-'):
                    return False
        return True

    def _empty_position(self, position):
        for i in range(position.start_x, position.end_x + 1):
            self.board[i][position.start_y] = '-'
        for i in range(position.start_y, position.end_y + 1):
            self.board[position.start_x][i] = '-'

    def _fill_word_at_position(self, word, position):
        if position.start_x == position.end_x:
            # fill horizontally
            x = position.start_x
            for i in range(position.length):
                self.board[x][i + position.start_y] = word[i]
        else:
            # fill vertically
            y = position.start_y
            for i in range(position.length):
                self.board[i + position.start_x][y] = word[i]

    def _get_placeholders(self):
        placeholders = []

        for start_x in range(10):
            for start_y in range(10):
                for end_x, end_y, length in self.__get_ends(start_x, start_y):
                    placeholder = Placeholder(start_x, start_y, end_x, end_y, length)
                    placeholders.append(placeholder)

        return placeholders

    def __get_ends(self, sx, sy):
        ends = []
        ex, ey = sx, sy

        if self.board[sx][sy] != '-':
            return ends

        # check for vertical placeholder
        if sx == 0 or self.board[sx - 1][sy] == '+':
            while ex < len(self.board) and \
                    self.board[ex][ey] == '-':
                ex += 1
            if sx != ex - 1:
                ends.append((ex - 1, ey, ex - sx))

        # check for horizontal placeholder
        if ey == 0 or self.board[sx][ey - 1] == '+':
            while ey < len(self.board) and \
                    self.board[sx][ey] == '-':
                ey += 1
            if sy != ey - 1:
                ends.append((sx, ey - 1, ey - sy))

        return ends


def main():
    board = [list(input()) for _ in range(10)]
    words = list(input().split())

    crossword = Crossword(board, words)
    crossword.solve()


if __name__ == '__main__':
    main()
