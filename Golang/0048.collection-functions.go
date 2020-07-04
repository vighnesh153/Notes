package main

import (
	"fmt"
	"strings"
)

func Index(vs []string, t string) int {
	for i, v := range vs {
		if v == t {
			return i
		}
	}
	return -1
}

func Include(vs []string, t string) bool {
	return Index(vs, t) >= 0
}

func Any(vs []string, f func(string) bool) bool {
	for _, v := range vs {
		if f(v) {
			return true
		}
	}
	return false
}

func All(vs []string, f func(string) bool) bool {
	for _, v := range vs {
		if !f(v) {
			return false
		}
	}
	return true
}

func Filter(vs []string, f func(string) bool) []string {
	vsf := make([]string, 0)
	for _, v := range vs {
		if f(v) {
			vsf = append(vsf, v)
		}
	}
	return vsf
}

func Map(vs []string, f func(string) string) []string {
	vsm := make([]string, len(vs))
	for i, v := range vs {
		vsm[i] = f(v)
	}
	return vsm
}

func main() {
	// Go does not support generics; in Go it’s common
	// to provide collection functions if and when they
	// are specifically needed for your program and data types.
	// Note that in some cases it may be clearest to just
	// inline the collection-manipulating code directly,
	// instead of creating and calling a helper function.

	var myStrings = []string{"peach", "apple", "pear", "plum"}

	fmt.Println(Index(myStrings, "pear"))

	fmt.Println(Include(myStrings, "grape"))

	fmt.Println(Any(myStrings, func(v string) bool {
		return strings.HasPrefix(v, "p")
	}))

	fmt.Println(All(myStrings, func(v string) bool {
		return strings.HasPrefix(v, "p")
	}))

	fmt.Println(Filter(myStrings, func(v string) bool {
		return strings.Contains(v, "e")
	}))

	fmt.Println(Map(myStrings, strings.ToUpper))

}
