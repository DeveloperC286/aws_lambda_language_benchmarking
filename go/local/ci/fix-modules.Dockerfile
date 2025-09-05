FROM golang:1.25.1@sha256:76a94c4a37aaab9b1b35802af597376b8588dc54cd198f8249633b4e117d9fcc

WORKDIR /workspace

ENTRYPOINT ["go", "mod", "tidy", "-v"]
