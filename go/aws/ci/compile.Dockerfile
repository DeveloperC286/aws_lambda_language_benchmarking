FROM golang:1.25.5@sha256:20b91eda7a9627c127c0225b0d4e8ec927b476fa4130c6760928b849d769c149

WORKDIR /workspace
ENV GOCACHE=/workspace/.cache/go-build

ENTRYPOINT ["go", "build", "-o", "main"]
CMD ["./src"]
