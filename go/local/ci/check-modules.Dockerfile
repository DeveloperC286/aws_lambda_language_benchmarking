FROM golang:1.24.5@sha256:ef5b4be1f94b36c90385abd9b6b4f201723ae28e71acacb76d00687333c17282

WORKDIR /workspace

ENTRYPOINT ["go", "mod", "tidy", "-diff"]
