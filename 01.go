package main

import (
	"fmt"
	"sort"
	"strconv"
	"strings"
)

func main() {
	var input string = `1000
2000
3000

4000

5000
6000

7000
8000
9000

10000`

	// inputBytes, err := ioutil.ReadFile("data/input01.txt")
	// if err != nil {
	// 	log.Fatal(err)
	// }
	// input = string(inputBytes)

	var elves []string = strings.Split(input, "\n\n")

	var sums []int = []int{}

	for _, e := range elves {
		var calsString []string = strings.Split(e, "\n")
		var sum = 0
		for _, c := range calsString {
			var i, _ = strconv.Atoi(c)
			sum = sum + i
		}
		sums = append(sums, sum)
	}

	sort.Ints(sums)
	fmt.Println(sums[len(sums)-1])
	fmt.Println("Done!")

	max3 := sums[len(sums)-3:]
	var maxSums = 0
	for _, x := range max3 {
		maxSums = maxSums + x
	}
	fmt.Println(maxSums)
	fmt.Println("Done!")

}
