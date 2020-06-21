package main

import "fmt"

func main() {
	// short declaration operator (can't be used to declare global variables)
	x := 42
	println(x)

	// long declaration (can be used to declare global variables)
	var y = 42
	println(y)

	// declaring variables (assigns a default value of datatype)
	var z int

	println(z)							// 0
	z = 100
	println(z)							// 100
	fmt.Printf("%T\n", z)		// int

	const myString string = "some string"
	// declaring a constant

	const (
		aaaaa = 100
		bbbbb = true
	)

	a := "I am a string"
	println(a)
	fmt.Printf("%T\n", a)		// string
	// More on formatting: https://godoc.org/fmt

	n, err := fmt.Printf("%T\n", a)
	println(n)		// number of bytes written
	println(err)	// error if any else nil

	type someType int
	var abc someType = 100
	println(abc)
	fmt.Printf("%T\n", abc)		// main.someType
	// var aaa int = abc				// throws error
	var aaa int = int(abc)				// works. type conversion
	println(aaa)
}
