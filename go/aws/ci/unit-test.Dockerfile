FROM golang:1.25.1@sha256:bb979b278ffb8d31c8b07336fd187ef8fafc8766ebeaece524304483ea137e96

WORKDIR /workspace

ENTRYPOINT ["go", "test", "-v"]
CMD ["./..."]
