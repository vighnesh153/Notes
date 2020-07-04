package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

// echo 'hello'   > /tmp/lines
// echo 'filter' >> /tmp/lines
// cat /tmp/lines | go run file.go

func main() {
	scanner := bufio.NewScanner(os.Stdin)

	for scanner.Scan() {
		// ucl -> upper-cased line
		ucl := strings.ToUpper(scanner.Text())
		fmt.Println(ucl)
	}

	if err := scanner.Err(); err != nil {
		_, _ = fmt.Fprintln(os.Stderr, "error:", err)
		os.Exit(1)
	}
}
