FROM golang:1.24.6@sha256:e155b5162f701b7ab2e6e7ea51cec1e5f6deffb9ab1b295cf7a697e81069b050

WORKDIR /workspace
ENV GOCACHE=/workspace/.cache/go-build

ENTRYPOINT ["go", "build", "-o", "main"]
CMD ["./src"]
