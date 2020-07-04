package main

import (
	"fmt"
	"os"
)

type point struct {
	x, y int
}

func main() {
	p := point{1, 2}

	fmt.Printf("{1 2} -> %v\n", p)

	fmt.Printf("{x:1 y:2} -> %+v\n", p)

	fmt.Printf("main.point{x:1, y:2} -> %#v\n", p)

	fmt.Printf("main.point -> %T\n", p)

	fmt.Printf("true -> %t\n", true)

	fmt.Printf("123 -> %d\n", 123)

	fmt.Printf("1110 -> %b\n", 14)

	fmt.Printf("! -> %c\n", 33)

	fmt.Printf("1c8 -> %x\n", 456)

	fmt.Printf("78.900000 -> %f\n", 78.9)

	fmt.Printf("1.234000e+08 -> %e\n", 123400000.0)
	fmt.Printf("1.234000E+08 -> %E\n", 123400000.0)

	fmt.Printf("\"string\" -> %s\n", "\"string\"")

	// "\"string\""
	fmt.Printf("raw string -> %q\n", "\"string\"")

	fmt.Printf("6865782074686973 -> %x\n", "hex this")

	// To print a representation of a pointer
	fmt.Printf("0xc0000b6010 -> %p\n", &p)

	// |    12|   345|
	fmt.Printf("|%6d|%6d|\n", 12, 345)

	// |  1.20|  3.45|
	fmt.Printf("|%6.2f|%6.2f|\n", 1.2, 3.45)

	// |1.20  |3.45  |
	fmt.Printf("|%-6.2f|%-6.2f|\n", 1.2, 3.45)

	// |   foo|     b|
	fmt.Printf("|%6s|%6s|\n", "foo", "b")

	// |foo   |b     |
	fmt.Printf("|%-6s|%-6s|\n", "foo", "b")

	s := fmt.Sprintf("a %s", "string")
	fmt.Println(s)

	_, _ = fmt.Fprintf(os.Stderr, "an %s\n", "error")
}
