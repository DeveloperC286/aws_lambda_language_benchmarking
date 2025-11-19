FROM golang:1.25.4@sha256:f60eaa87c79e604967c84d18fd3b151b3ee3f033bcdade4f3494e38411e60963

WORKDIR /workspace

ENTRYPOINT ["go", "mod", "tidy", "-diff"]
