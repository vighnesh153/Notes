package main

import (
	"encoding/json"
	"fmt"
	"os"
)

type response1 struct {
	Page   int
	Fruits []string
}

type response2 struct {
	Page   int      `json:"page"`
	Fruits []string `json:"fruits"`
}

func main() {

	bolB, _ := json.Marshal(true)
	fmt.Println(1, string(bolB))

	intB, _ := json.Marshal(1)
	fmt.Println(2, string(intB))

	fltB, _ := json.Marshal(2.34)
	fmt.Println(3, string(fltB))

	strB, _ := json.Marshal("gopher")
	fmt.Println(4, string(strB))

	slcD := []string{"apple", "peach", "pear"}
	slcB, _ := json.Marshal(slcD)
	fmt.Println(5, string(slcB))

	mapD := map[string]int{"apple": 5, "lettuce": 7}
	mapB, _ := json.Marshal(mapD)
	fmt.Println(6, string(mapB))

	res1D := &response1{
		Page:   1,
		Fruits: []string{"apple", "peach", "pear"}}
	res1B, _ := json.Marshal(res1D)
	fmt.Println(7, string(res1B))

	res2D := &response2{
		Page:   1,
		Fruits: []string{"apple", "peach", "pear"}}
	res2B, _ := json.Marshal(res2D)
	fmt.Println(8, string(res2B))

	byt := []byte(`{"num":6.13,"strs":["a","b"]}`)
	var dat map[string]interface{}
	if err := json.Unmarshal(byt, &dat); err != nil {
		panic(err)
	}
	fmt.Println(9, dat)

	num := dat["num"].(float64)
	fmt.Println(10, num)

	strs := dat["strs"].([]interface{})
	str1 := strs[0].(string)
	fmt.Println(11, str1)

	str := `{"page": 1, "fruits": ["apple", "peach"]}`
	res := response2{}
	_ = json.Unmarshal([]byte(str), &res)
	fmt.Println(12, res)
	fmt.Println(13, res.Fruits[0])

	enc := json.NewEncoder(os.Stdout)
	d := map[string]int{"apple": 5, "lettuce": 7}
	_ = enc.Encode(d)
}
