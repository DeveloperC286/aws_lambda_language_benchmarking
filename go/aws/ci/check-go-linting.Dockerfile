FROM golang:2.24.3@sha256:39d9e7d9c5d9c9e4baf0d8fff579f06d5032c0f4425cdec9e86732e8e4e374dc

WORKDIR /workspace

# Install golangci-lint
ENV GOLANGCI_LINT_VERSION="v2.1.6"
RUN go install github.com/golangci/golangci-lint/v2/cmd/golangci-lint@$GOLANGCI_LINT_VERSION

ENTRYPOINT ["golangci-lint", "run"]
CMD ["./..."]
