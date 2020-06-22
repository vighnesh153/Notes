package main

import "fmt"

func main() {
	const (
		a = iota
		b
		c
		d
	)

	println(a)		// 0
	println(b)		// 1
	println(c)		// 2
	println(d)		// 3

	const (
		_ = iota
		kb = 1 << (iota * 10)
		mb = 1 << (iota * 10)
		gb = 1 << (iota * 10)
	)

	fmt.Printf("Decimal: %d\t\t, Binary: %b\n", kb, kb)
	fmt.Printf("Decimal: %d\t, Binary: %b\n", mb, mb)
	fmt.Printf("Decimal: %d\t, Binary: %b\n", gb, gb)
}
