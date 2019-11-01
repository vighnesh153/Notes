def some_function(a, b, c, /):
	print(a + b + c)

some_function(1, 2, 3)  		# valid
some_function(1, 2, c=3)  		# invalid
some_function(a=1, b=2, c=3)  	# valid


# NOTE: All the arguments before '/' in the function definition are treated as positional-only args,
# 	  and if anything is passed after it, then it can be either positional or keyword arg.

def some_function(a, b, c, /, d="lol", e="ok"):
	print(a + b + c)
	print(d)
	print(e)

some_function(1, 2, 3)  						# valid
some_function(1, 2, 3, "ok", "ok")  			# valid
some_function(1, 2, 3, d="123", e=31)  			# valid
# And if we try to treat a, b, or c as positional, it is not valid
