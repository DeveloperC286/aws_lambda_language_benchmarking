# Use --locked in CI to ensure reproducible builds
GO_LOCKED := $(if $(CI),--locked,)

.PHONY: default
default: compile

.PHONY: check-go-formatting
check-go-formatting:
	gofmt -d .
	test -z "$$(gofmt -l .)"

.PHONY: fix-go-formatting
fix-go-formatting:
	gofmt -w -s .

.PHONY: check-go-linting
check-go-linting:
	golangci-lint run ./...

.PHONY: check-go-dependencies
check-go-dependencies:
	go mod tidy -diff

.PHONY: fix-go-dependencies
fix-go-dependencies:
	go mod tidy -v

.PHONY: compile
compile:
	go build -o main ./src

.PHONY: unit-test
unit-test:
	go test -v ./...
