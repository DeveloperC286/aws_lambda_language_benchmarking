FROM python:3.13.5-alpine3.21@sha256:763eee4b5cf4dfcfbf76a5a5f8177317ac531c635b855cdc5a95e17fe1e4a44d

WORKDIR /workspace

ENTRYPOINT ["find", ".", "-type", "f", "-name", "*.py", "-exec", "python3", "-m", "py_compile", "{}", ";"]
