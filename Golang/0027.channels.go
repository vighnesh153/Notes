package main

import "fmt"

func main() {

	// Channels are the pipes that connect concurrent goroutines.
	// You can send values into channels from one goroutine and
	// receive those values into another goroutine.

	messages := make(chan string)

	go func() { messages <- "ping" }()

	// By default, channel sends and receives block until both the
	// sender and receiver are ready. This property allowed us
	// to wait at the end of our program for the "ping" message
	// without having to use any other synchronization.
	msg := <-messages
	fmt.Println(msg)
}
