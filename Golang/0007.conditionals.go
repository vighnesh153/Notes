package main

import "fmt"

func main() {

	if 7 % 2 == 0 {
		fmt.Println("7 is even")
	} else if 7 + 1 < 9 {
		fmt.Println("8 < 9")
	} else {
		fmt.Println("this should not be printed")
	}

	// A statement can precede conditionals;
	// any variables declared in this statement are available in all branches.
	if num := 9; num < 0 {
		fmt.Println(num, "is negative")
	} else if num < 10 {
		fmt.Println(num, "has 1 digit")
	} else {
		fmt.Println(num, "has multiple digits")
	}
}
