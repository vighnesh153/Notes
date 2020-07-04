package main

import (
	"fmt"
	"path/filepath"
	"strings"
)

func main() {
	p := filepath.Join("dir1", "dir2", "filename")
	fmt.Println("p:", p)
	// p: dir1/dir2/filename

	fmt.Println(filepath.Join("dir1//", "filename"))
	// dir1/filename

	fmt.Println(filepath.Join("dir1/../dir1", "filename"))
	// dir1/filename

	fmt.Println("Dir(p):", filepath.Dir(p))
	// Dir(p): dir1/dir2

	fmt.Println("Base(p):", filepath.Base(p))
	// Base(p): filename

	fmt.Println(filepath.IsAbs("dir/file"))
	// false

	fmt.Println(filepath.IsAbs("/dir/file"))
	// true

	filename := "config.json"
	ext := filepath.Ext(filename)
	fmt.Println(ext)
	// .json

	fmt.Println(strings.TrimSuffix(filename, ext))
	// config

	// To find relative path to base
	rel, err := filepath.Rel("a/b", "a/b/t/file")
	if err != nil {
		panic(err)
	}
	fmt.Println(rel)
	// t/file

	rel, err = filepath.Rel("a/b", "a/c/t/file")
	if err != nil {
		panic(err)
	}
	fmt.Println(rel)
	// ../c/t/file
}
