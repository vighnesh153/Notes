package main

func main() {
	// self executing anonymous function
	func() {
		println("I am a self executing anonymous function")
	}()

	// function as an expression
	myFunc := func() {
		println("I am a function as an expression")
	}
	myFunc()
}
