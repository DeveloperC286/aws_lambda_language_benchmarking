FROM node:24.11.1@sha256:aa648b387728c25f81ff811799bbf8de39df66d7e2d9b3ab55cc6300cb9175d9

WORKDIR /workspace

COPY package.json package-lock.json .
RUN npm ci

ENTRYPOINT ["npx", "prettier", "--write"]
CMD ["."]
