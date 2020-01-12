partitions = dict()
NOT_FOUND = 'Partition Not Computed'


def get_partitions(n, blacklist=None):
    if n == 0:
        return [],
    if n == 1:
        return [1],

    if blacklist is None:
        blacklist = set()

    if partitions.get(n, NOT_FOUND) != NOT_FOUND:
        return partitions[n]

    all_parts_of_n = set()
    for i in range(1, n + 1):
        if i in blacklist:
            continue

        for partition in get_partitions(n - i, blacklist):
            all_parts_of_n.add(tuple(sorted([i, *partition])))

        blacklist.add(i)
        for partition in get_partitions(n, blacklist):
            all_parts_of_n.add(tuple(sorted(partition)))
        blacklist.remove(i)

    partitions[n] = all_parts_of_n
    return all_parts_of_n


with open("file.txt", "w") as file:
    parts = get_partitions(int(input()))
    for part in sorted(parts):
        print(part, file=file)

    # Count of partitions
    print(len(parts))
