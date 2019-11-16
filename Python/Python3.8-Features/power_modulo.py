pow(x, y)
# x ** y


# For x, y, z belong to integers, pow supports power_modulo
a = pow(x, y, z)
# if y >= 0:
# a = (x ** y) % z

# else (cool feature)
# a = ((modular inverse of x, modulo z ) times |y|) modulo z
# in simple words, if y == -1, then a = modular inverse of x, modulo z
# and if |y| > 1, then let b = modular inverse of x, modulo z
#					   and a = (b * |y|), modulo z
