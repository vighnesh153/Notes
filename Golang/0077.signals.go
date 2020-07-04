package main

import (
	"fmt"
	"os"
	"os/signal"
	"syscall"
)

// Sometimes we’d like our Go programs to intelligently
// handle Unix signals. For example, we might want a server
// to gracefully shutdown when it receives a SIGTERM,
// or a command-line tool to stop processing input if it
// receives a SIGINT. Here’s how to handle signals
// in Go with channels.

func main() {

	signals := make(chan os.Signal, 1)
	done := make(chan bool, 1)

	// notify the signals channel in interrupt or terminate
	// signal from the system
	signal.Notify(signals, syscall.SIGINT, syscall.SIGTERM)

	go func() {
		sig := <-signals
		fmt.Println()
		fmt.Println(sig)
		done <- true
	}()

	fmt.Println("awaiting signal")
	<-done
	fmt.Println("exiting")
}
