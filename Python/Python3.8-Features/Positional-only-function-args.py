def some_function(a, b, c, /):
	print(a + b + c)

some_function(1, 2, 3)  		# valid
some_function(1, 2, c=3)  		# invalid
some_function(a=1, b=2, c=3)  	# valid
