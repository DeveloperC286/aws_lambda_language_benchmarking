FROM golang:1.25.5@sha256:97be07314ef2af5f56d22c3bb608c4cffa2a92b3c8252e9f674081ed8217f75b

WORKDIR /workspace

ENTRYPOINT ["go", "test", "-v"]
CMD ["./..."]
