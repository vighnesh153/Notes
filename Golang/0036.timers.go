package main

import (
	"fmt"
	"time"
)

func main() {
	// We often want to execute Go code at some point in
	// the future, or repeatedly at some interval.
	// Go’s built-in timer and ticker features make both
	// of these tasks easy. We’ll look first at timers and
	// then at tickers.


	// Timers represent a single event in the future. You
	// tell the timer how long you want to wait, and it
	// provides a channel that will be notified at that time.
	// This timer will wait 2 seconds.
	timer1 := time.NewTimer(2 * time.Second)


	// The <-timer1.C blocks on the timer’s channel C
	// until it sends a value indicating that the timer fired.
	fmt.Println("Waiting for timer to fire (in 2 seconds)")
	<-timer1.C		// firing the timer
	// The following line will be executed after 2 seconds
	fmt.Println("Timer 1 fired")


	// If you just wanted to wait, you could have used time.Sleep.
	// One reason a timer may be useful is that you can cancel
	// the timer before it fires.
	timer2 := time.NewTimer(time.Second)
	go func() {
		<-timer2.C
		fmt.Println("Timer 2 fired")
	}()
	stop2 := timer2.Stop()
	if stop2 {
		fmt.Println("Timer 2 stopped")
	}

	// Give the timer2 enough time to fire, if it ever was
	// going to, to show it is in fact stopped.
	time.Sleep(2 * time.Second)
}