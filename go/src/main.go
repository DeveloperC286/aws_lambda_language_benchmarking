package main

import (
	"context"
	"crypto/sha256"
	"encoding/hex"
	"encoding/json"
	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
	"strings"
)

type requestBody struct {
	Input string `json:"input"`
}

func handleRequest(ctx context.Context, request events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	var trimmedRequestBody = strings.TrimSpace(request.Body)
	if trimmedRequestBody != "{}" && trimmedRequestBody != "" {
		var requestBody requestBody
		err := json.Unmarshal([]byte(trimmedRequestBody), &requestBody)

		if err != nil {
			return events.APIGatewayProxyResponse{Body: "The request body is not valid JSON.", StatusCode: 400}, nil
		}

		if requestBody.Input != "" {
			return events.APIGatewayProxyResponse{Body: hashInput(requestBody.Input), StatusCode: 200}, nil
		}

		return events.APIGatewayProxyResponse{Body: "No input within the request body.", StatusCode: 400}, nil
	}

	return events.APIGatewayProxyResponse{Body: "Empty request body.", StatusCode: 400}, nil
}

func main() {
	lambda.Start(handleRequest)
}

func hashInput(input string) string {
	output := sha256.Sum256([]byte(input))

	for i := 1; i < 100000; i++ {
		output = sha256.Sum256(output[:])
	}

	return hex.EncodeToString(output[:])
}
