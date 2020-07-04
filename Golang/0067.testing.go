package main

import (
	"fmt"
	"testing"
)

// Name of the test file should end with _test
// eg. if source file is min.go, then test file
// should be min_test.go

// All test functions should start with 'Test' as
// shown below

// Best Practice: Tests should be in the same
// package as the source file's package

// To run all tests: go test -v

func IntMin(a, b int) int {
	if a < b {
		return a
	}
	return  b
}

// A test is created by writing a function
// with a name beginning with Test.
func TestIntMinBasic(t *testing.T) {
	ans := IntMin(2, -2)
	if ans != -2 {
		// t.Error* will report test failures but continue
		// executing the test. t.Fail* will report test
		// failures and stop the test immediately.
		t.Errorf("IntMin(2, -2) = %d; want -2", ans)
	}
}

// table-driven tests
func TestIntMinTableDriven(t *testing.T) {
	var tests = []struct {
		a, b int
		want int
	}{
		{0, 1, 0},
		{1, 0, 0},
		{2, -2, -2},
		{0, -1, -1},
		{-1, 0, -1},
	}

	// t.Run enables running “subtests”, one for
	// each table entry. These are shown separately
	// when executing go test -v
	for _, tt := range tests {
		testName := fmt.Sprintf("%d,%d", tt.a, tt.b)
		t.Run(testName, func(t *testing.T) {
			ans := IntMin(tt.a, tt.b)
			if ans != tt.want {
				t.Errorf("got %d, want %d", ans, tt.want)
			}
		})
	}
}
