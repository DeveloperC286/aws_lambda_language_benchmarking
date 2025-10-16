FROM golang:1.25.3@sha256:6ea52a02734dd15e943286b048278da1e04eca196a564578d718c7720433dbbe

WORKDIR /workspace

ENTRYPOINT ["go", "test", "-v"]
CMD ["./..."]
