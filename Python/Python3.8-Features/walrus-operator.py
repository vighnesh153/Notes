# Using walrus operator, we can both, assign to a variable and return that value at the same time:

# Old fashioned way:
def some_function(a, b, c):
	result = a + b + c

	if result > 10:
		print("It is a really big number")
	else:
		print("It is a very small number")
	print(result)

some_function(1, 2, 3)
# Outputs:
# It is a very small number
# 6



# Python 3.8+ way:
def some_function(a, b, c):
	if (result := a + b + c) > 10:
		print("It is a really big number")
	else:
		print("It is a very small number")
	print(result)

some_function(1, 2, 3)
# Outputs:
# It is a very small number
# 6
