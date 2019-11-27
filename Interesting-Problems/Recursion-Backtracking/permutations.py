# To find all the permutations of a list. To find all permutations of a string,
# convert it to a list, and then do it


# Algorithm: if list is 1, 2, 3, 4:
#               then for every element in the list, permute all the remaining (n-1) elements
#               example:
#                   Permute(1, 2, 3, 4) =
#                       [1] + Permute(2, 3, 4)
#                       [2] + Permute(1, 3, 4)
#                       [3] + Permute(1, 2, 4)
#                       [4] + Permute(1, 2, 3)
#               Also, to avoid copy the subset of the array every time we invoke Permute, we can just
#               use start index in the function so that the function knows from which index it has to
#               start permuting.


class PermutationInator:

    def __init__(self, array: list):
        self._numbers: list = array

    def find_all_permutations(self):
        return PermutationInator._permute(self._numbers, 0)

    def print_all_permutations(self):
        for _permutation in self.find_all_permutations():
            print(_permutation)

    def get_count_of_permutations(self):
        return len(self.find_all_permutations())

    @classmethod
    def _permute(cls, numbers: list, start_index: int):
        if start_index == len(numbers) - 1:
            return [numbers.copy()]

        solutions: list = []
        for index in range(start_index, len(numbers)):
            numbers[start_index], numbers[index] = numbers[index], numbers[start_index]
            solutions += PermutationInator._permute(numbers, start_index + 1)
            numbers[start_index], numbers[index] = numbers[index], numbers[start_index]

        return solutions


permutationInator = PermutationInator([1, 2, 3, 4, 5])

print(f'Count: {permutationInator.get_count_of_permutations()}')

for permutation in permutationInator.find_all_permutations():
    print(permutation)

# OR
permutationInator.print_all_permutations()
