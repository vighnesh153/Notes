package main

import "fmt"

func main() {

	// maps are like default dicts in Python
	// map[keyType]valueType
	m := make(map[string]int)

	m["k1"] = 7
	m["k2"] = 13

	fmt.Println("map:", m)

	v1 := m["k1"]
	fmt.Println("v1: ", v1)

	fmt.Println("len:", len(m))

	delete(m, "k2")
	fmt.Println("map:", m)

	// second values is a bool. It is true if the key exists,
	// else is false
	_, prs := m["k2"]
	fmt.Println("prs:", prs)

	// example usage
	if value, keyExists := m["some key"]; keyExists {
		fmt.Println(value)
	}

	// adding some key-values when declaring a map
	n := map[string]int{"foo": 1, "bar": 2}
	fmt.Println("map:", n)

	// iterating over the key-value pairs
	for key, value := range m {
		fmt.Println(key, value)
	}
}
