FROM python:3.14.1-alpine3.21@sha256:fd8407cacb1028c803566276ae25eb7c2a00fbaa210a0a5670994f6866e29278

WORKDIR /workspace

ENTRYPOINT ["find", ".", "-type", "f", "-name", "*.py", "-exec", "python3", "-m", "py_compile", "{}", ";"]
