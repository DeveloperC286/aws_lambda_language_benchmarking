package main

import (
	"context"
	"crypto/sha256"
	"encoding/hex"
	"github.com/aws/aws-lambda-go/lambda"
)

type LambdaEvent struct {
	Input string `json:"input"`
}

func HandleRequest(ctx context.Context, lambdaEvent LambdaEvent) (string, error) {
	hasher := sha256.New()
	hasher.Write([]byte(lambdaEvent.Input))

	return hex.EncodeToString(hasher.Sum(nil)), nil
}

func main() {
	lambda.Start(HandleRequest)
}
