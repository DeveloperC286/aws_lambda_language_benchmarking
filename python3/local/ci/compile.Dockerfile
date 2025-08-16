FROM python:3.13.6-alpine3.21@sha256:4358f4bd970e6005fb09893ea7efea3491a132ca758b2cd2cde4e0bc07ec56b9

WORKDIR /workspace

ENTRYPOINT ["find", ".", "-type", "f", "-name", "*.py", "-exec", "python3", "-m", "py_compile", "{}", ";"]
