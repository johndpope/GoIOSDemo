package main

/*
// adjust LDFLAGS if necessary
#cgo LDFLAGS: -Wl,-U,_iosmain
extern void iosmain(int argc, char *argv[]);
*/
import "C"

func main() {
    C.iosmain(0, nil)
}

//export Add
func Add(x int, y int) int {
    return x + y
}
