FROM node:24.5.0@sha256:dd5c5e4d0a67471a683116483409d1e46605a79521b000c668cff29df06efd51

WORKDIR /workspace

COPY package.json package-lock.json .
RUN npm ci

ENTRYPOINT ["npx", "prettier", "--write"]
CMD ["."]
