FROM python:3.13.6-alpine3.21@sha256:ae6439a27c05140111b240c4ff1ec49c29281470bdde8945a4dfa4ac2fee19f9

WORKDIR /workspace

ENTRYPOINT ["find", ".", "-type", "f", "-name", "*.py", "-exec", "python3", "-m", "py_compile", "{}", ";"]
