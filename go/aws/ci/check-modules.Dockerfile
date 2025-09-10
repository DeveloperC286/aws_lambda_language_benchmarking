FROM golang:1.25.1@sha256:1fd7d46f956287d1856b92add5cc5ab8b87c07a1ed766419bb603a8620746b4a

WORKDIR /workspace

ENTRYPOINT ["go", "mod", "tidy", "-diff"]
