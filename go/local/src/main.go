package main

import (
	"crypto/sha256"
	"encoding/hex"
	"flag"
	"fmt"
	"os"
)

func main() {
	inputPtr := flag.String("input", "", "")

	flag.Parse()

	if *inputPtr == "" {
		flag.PrintDefaults()
		os.Exit(1)
	}

	fmt.Println(hashInput(*inputPtr))
}

func hashInput(input string) string {
	output := sha256.Sum256([]byte(input))

	for i := 1; i < 100000; i++ {
		output = sha256.Sum256(output[:])
	}

	return hex.EncodeToString(output[:])
}
