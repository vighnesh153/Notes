package main

import (
	"fmt"
	"os"
)

func main() {
	// Defer is used to ensure that a function call is
	// performed later in a program’s execution, usually
	// for purposes of cleanup. defer is often used
	// where e.g. ensure and finally would be used
	// in other languages.

	f := createFile("/tmp/defer.txt")
	defer closeFile(f)
	writeFile(f)
}

func createFile(p string) *os.File {
	fmt.Println("creating")
	f, err := os.Create(p)
	if err != nil {
		panic(err)
	}
	return f
}

func writeFile(f *os.File) {
	fmt.Println("writing")
	_, _ = fmt.Fprintln(f, "data")
}

func closeFile(f *os.File) {
	fmt.Println("closing")
	err := f.Close()

	if err != nil {
		_, _ = fmt.Fprintf(os.Stderr, "error: %v\n", err)
		os.Exit(1)
	}
}
