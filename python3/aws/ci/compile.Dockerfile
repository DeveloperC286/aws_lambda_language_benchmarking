FROM python:3.14.0-alpine3.21@sha256:f1ac9e01293a18a24919826ea8c7bb8f7bbc25497887a0a1cade58801bb83d1c

WORKDIR /workspace

ENTRYPOINT ["find", ".", "-type", "f", "-name", "*.py", "-exec", "python3", "-m", "py_compile", "{}", ";"]
