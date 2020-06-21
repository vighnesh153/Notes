package main

import "runtime"

func main() {
	println(runtime.GOOS)			   // linux
	println(runtime.GOARCH)			 // amd64
}
