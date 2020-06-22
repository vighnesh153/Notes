package main

import "fmt"

func main() {
	p1 := struct {
		name string
		age  int
	}{
		name: "Vighnesh",
		age:  42,
	}
	fmt.Println(p1)
}
