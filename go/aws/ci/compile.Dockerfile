FROM golang:1.24.3@sha256:81bf5927dc91aefb42e2bc3a5abdbe9bb3bae8ba8b107e2a4cf43ce3402534c6

WORKDIR /workspace
ENV GOCACHE=/workspace/.cache/go-build

ENTRYPOINT ["go", "build", "-o", "main"]
CMD ["./src"]
