FROM node:24.8.0@sha256:3357ef4c358ae0f92e943fe51c0c8dfaaadb5d4ee3f989121f54b1aabab39009

WORKDIR /workspace

COPY package.json package-lock.json .
RUN npm ci

ENTRYPOINT ["npx", "prettier", "--write"]
CMD ["."]
