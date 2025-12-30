FROM golang:1.25.5@sha256:6396b3d8039d2050ab7a3c5c6e1cbeed8bf6d2ddc0403e1ab39d78749227ca19

WORKDIR /workspace
ENV GOCACHE=/workspace/.cache/go-build

ENTRYPOINT ["go", "build", "-o", "main"]
CMD ["./src"]
