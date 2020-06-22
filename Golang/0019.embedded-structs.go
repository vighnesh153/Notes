package main

import "fmt"

type person struct {
	name string
	age  int
}

type specialPerson struct {
	person
	speciality string
}

func newPerson(name string) person {
	p := person{name: name}
	p.age = 42
	return p
}

func main() {
	sP := specialPerson{
		person:     newPerson("Vighnesh"),
		speciality: "I am awesome",
	}

	fmt.Println(sP.name, sP.age, sP.speciality)
}
