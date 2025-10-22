FROM node:24.10.0@sha256:0a687f450869e3eafc9e719ce2a4873c601818562108bf03b4f030c6c8cf4245

WORKDIR /workspace

COPY package.json package-lock.json .
RUN npm ci

ENTRYPOINT ["npx", "prettier", "--write"]
CMD ["."]
