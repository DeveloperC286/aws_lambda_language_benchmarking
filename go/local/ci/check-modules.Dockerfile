FROM golang:1.25.3@sha256:7d73c4c57127279b23f3f70cbb368bf0fe08f7ab32af5daf5764173d25e78b74

WORKDIR /workspace

ENTRYPOINT ["go", "mod", "tidy", "-diff"]
