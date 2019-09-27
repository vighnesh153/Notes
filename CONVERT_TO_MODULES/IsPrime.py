def is_prime(_number):
    if _number <= 3:
        return _number > 1

    if _number % 2 == 0 or _number % 3 == 0:
        return False

    _k = 5
    while _k ** 2 <= _number:
        if _number % _k == 0 or _number % (_k + 2) == 0:
            return False
        _k += 6

    return True
