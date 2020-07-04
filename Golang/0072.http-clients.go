package main

import (
	"bufio"
	"fmt"
	"net/http"
)

// The Go standard library comes with excellent support
// for HTTP clients and servers in the net/http package.
// In this example we’ll use it to issue simple HTTP requests.

func main() {
	resp, err := http.Get("http://gobyexample.com")
	if err != nil {
		panic(err)
	}
	defer resp.Body.Close()

	fmt.Println("Response status:", resp.Status)

	scanner := bufio.NewScanner(resp.Body)
	// Print the first 5 lines of the response body.
	for i := 0; scanner.Scan() && i < 5; i++ {
		fmt.Println(scanner.Text())
	}

	if err := scanner.Err(); err != nil {
		panic(err)
	}
}
