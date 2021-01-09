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

	hasher := sha256.New()
	hasher.Write([]byte(*inputPtr))
	fmt.Println(hex.EncodeToString(hasher.Sum(nil)))
}
