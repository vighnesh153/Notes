package main

import (
	"fmt"
	"sort"
)

type byLength []string

func (s byLength) Len() int {
	return len(s)
}
func (s byLength) Swap(i, j int) {
	s[i], s[j] = s[j], s[i]
}
func (s byLength) Less(i, j int) bool {
	return len(s[i]) < len(s[j])
}

func main() {
	fruits := []string{"peach", "banana", "kiwi"}
	sort.Sort(byLength(fruits))
	fmt.Println(fruits)

	// Better way
	fruits = []string{"peach", "banana", "kiwi"}
	sort.Slice(fruits, func(i, j int) bool {
		return len(fruits[i]) < len(fruits[j])
	})
	fmt.Println(fruits)

	// Guarantees stability
	fruits = []string{"peach", "banana", "kiwi"}
	sort.SliceStable(fruits, func(i, j int) bool {
		return len(fruits[i]) < len(fruits[j])
	})
	fmt.Println(fruits)
}
