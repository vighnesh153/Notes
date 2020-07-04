package main

import (
	"fmt"
	"os"
	"strings"
)

// Golang has its own separate env section
// called GOENV. All the Golang env config
// are stored there instead of polluting the
// system's global env namespace (kinda cool)

func main() {
	_ = os.Setenv("FOO", "1")
	fmt.Println("FOO:", os.Getenv("FOO"))
	fmt.Println("BAR:", os.Getenv("BAR"))
	_ = os.Unsetenv("FOO")

	fmt.Println()
	for _, e := range os.Environ() {
		pair := strings.SplitN(e, "=", 2)
		fmt.Println(pair[0], pair[1])
	}
}
