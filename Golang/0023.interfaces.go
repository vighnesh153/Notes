package main

import (
	"fmt"
	"math"
)

type geometry interface {
	area() float64
	perim() float64
}

type rect struct {
	name string
	width, height float64
}
type circle struct {
	name string
	radius float64
}

func (r rect) area() float64 {
	return r.width * r.height
}
func (r rect) perim() float64 {
	return 2*r.width + 2*r.height
}

func (c circle) area() float64 {
	return math.Pi * c.radius * c.radius
}
func (c circle) perim() float64 {
	return 2 * math.Pi * c.radius
}

func measure(g geometry) {
	fmt.Println(g)
	fmt.Println(g.area())
	fmt.Println(g.perim())

	switch g.(type) {
	case circle:
		println("I am a", g.(circle).name)
	case rect:
		println("I am a", g.(rect).name)
	}
}

func main() {
	r := rect{width: 3, height: 4, name: "rectangle"}
	c := circle{radius: 5, name: "circle"}

	measure(r)
	measure(c)
}
