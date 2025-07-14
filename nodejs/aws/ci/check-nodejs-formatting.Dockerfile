FROM node:24.4.0@sha256:e7db48bc35ee8d2e8d1511dfe779d78076966bd101ab074ea2858da8d59efb7f

WORKDIR /workspace

COPY package.json package-lock.json .
RUN npm ci

ENTRYPOINT ["npx", "prettier", "--check"]
CMD ["."]
