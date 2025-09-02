FROM node:24.7.0@sha256:701c8a634cb3ddbc1dc9584725937619716882525356f0989f11816ba3747a22

WORKDIR /workspace

COPY package.json package-lock.json .
RUN npm ci

ENTRYPOINT ["npx", "prettier", "--check"]
CMD ["."]
