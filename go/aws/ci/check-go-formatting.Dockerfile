FROM golang:2.24.3@sha256:39d9e7d9c5d9c9e4baf0d8fff579f06d5032c0f4425cdec9e86732e8e4e374dc

WORKDIR /workspace

ENTRYPOINT ["ci/check-go-formatting.sh"]
