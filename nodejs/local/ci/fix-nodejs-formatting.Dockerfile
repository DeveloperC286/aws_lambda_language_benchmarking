FROM node:24.11.1@sha256:7f80506b8225bcce2ce8202b1026fcde8f0bfb716b1b833f20250d79d4463276

WORKDIR /workspace

COPY package.json package-lock.json .
RUN npm ci

ENTRYPOINT ["npx", "prettier", "--write"]
CMD ["."]
