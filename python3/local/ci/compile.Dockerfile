FROM python:3.13.5-alpine3.21@sha256:c9a09c45a4bcc618c7f7128585b8dd0d41d0c31a8a107db4c8255ffe0b69375d

WORKDIR /workspace

ENTRYPOINT ["find", ".", "-type", "f", "-name", "*.py", "-exec", "python3", "-m", "py_compile", "{}", ";"]
