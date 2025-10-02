FROM golang:1.25.1@sha256:ab1f5c47de0f2693ed97c46a646bde2e4f380e40c173454d00352940a379af60

WORKDIR /workspace

ENTRYPOINT ["go", "mod", "tidy", "-diff"]
