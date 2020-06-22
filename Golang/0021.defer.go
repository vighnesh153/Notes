package main

func main() {
	// defer keyword executes the function call at the
	// end of the execution of the immediate parent
	// function block
	defer foo(1)
	defer foo(2)
	defer bar(1)
	bar(2)
	bar(3)
}

func foo(arg int) {
	println("foo", arg)
}

func bar(arg int) {
	println("bar", arg)
}
