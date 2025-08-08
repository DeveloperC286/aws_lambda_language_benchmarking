FROM python:3.13.6-alpine3.21@sha256:f5f25747d6589917174824189a07ed31051ec6312a7e069a7c3498bbc935f0c3

WORKDIR /workspace

ENTRYPOINT ["find", ".", "-type", "f", "-name", "*.py", "-exec", "python3", "-m", "py_compile", "{}", ";"]
