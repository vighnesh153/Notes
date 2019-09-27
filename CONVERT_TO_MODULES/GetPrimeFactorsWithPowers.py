def get_prime_factors_with_powers(_number):
    _prime_factors = dict()

    if _number == 1:
        return _prime_factors

    if _number % 2 == 0:
        _prime_factors[2] = 0
        while _number % 2 == 0:
            _prime_factors[2] += 1
            _number //= 2

    k = 3

    while k * k <= _number:
        loop_completed = False
        while _number % k == 0:
            if not _prime_factors.get(k, False):
                _prime_factors[k] = 1
            else:
                _prime_factors[k] += 1
            _number //= k
            loop_completed = True

        if loop_completed:
            if is_prime(_number):
                _prime_factors[_number] = 1
                return _prime_factors

        k += 2
        if _number == 1:
            break

    return _prime_factors
