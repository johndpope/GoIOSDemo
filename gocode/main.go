package main

import "C"

func main() {
}

//export Add
func Add(x int, y int) int {
    return x + y
}
