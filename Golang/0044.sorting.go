package main

import (
	"fmt"
	"sort"
)

func main() {
	strings := []string{"c", "a", "b"}
	sort.Strings(strings)
	fmt.Println("Strings:", strings)

	integers := []int{7, 2, 4}
	sort.Ints(integers)
	fmt.Println("Integers:", integers)

	s := sort.IntsAreSorted(integers)
	fmt.Println("Sorted:", s)
}
