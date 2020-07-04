package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"path/filepath"
)

func check(e error) {
	if e != nil {
		panic(e)
	}
}

func main() {
	// Throughout program execution, we often want to
	// create data that isn’t needed after the program
	// exits. Temporary files and directories are useful
	// for this purpose since they don’t pollute the
	// file system over time.

	f, err := ioutil.TempFile("", "sample")
	check(err)

	fmt.Println("Temp file name:", f.Name())

	defer os.Remove(f.Name())

	_, err = f.Write([]byte{1, 2, 3, 4})
	check(err)

	// If we intend to write many temporary files, we may
	// prefer to create a temporary directory. ioutil
	dirName, err := ioutil.TempDir("", "sampledir")
	check(err)
	fmt.Println("Temp dir name:", dirName)

	defer os.RemoveAll(dirName)

	filePath := filepath.Join(dirName, "file1")
	err = ioutil.WriteFile(filePath, []byte{1, 2}, 0666)
	check(err)
}
