FROM golang:1.25.1@sha256:d7098379b7da665ab25b99795465ec320b1ca9d4addb9f77409c4827dc904211

WORKDIR /workspace
ENV GOCACHE=/workspace/.cache/go-build

ENTRYPOINT ["go", "build", "-o", "main"]
CMD ["./src"]
