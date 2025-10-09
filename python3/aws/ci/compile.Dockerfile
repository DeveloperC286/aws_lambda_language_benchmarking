FROM python:3.14.0-alpine3.21@sha256:c2410fbf9690a8c4ee6482dd0da61cd0b5ee78bcbd3b3b0855a5295a35da0089

WORKDIR /workspace

ENTRYPOINT ["find", ".", "-type", "f", "-name", "*.py", "-exec", "python3", "-m", "py_compile", "{}", ";"]
