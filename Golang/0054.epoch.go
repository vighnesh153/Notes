package main

import (
	"fmt"
	"time"
)

func main() {

	now := time.Now()
	fmt.Println(now)

	secs := now.Unix()
	fmt.Println(secs)

	nanoSeconds := now.UnixNano()
	fmt.Println(nanoSeconds)

	millis := nanoSeconds / 1000000
	fmt.Println(millis)

	fmt.Println(time.Unix(secs, 0))
	fmt.Println(time.Unix(0, nanoSeconds))
}
