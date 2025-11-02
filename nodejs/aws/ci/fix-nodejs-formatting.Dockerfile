FROM node:24.11.0@sha256:34af25027ee1b8bffd482ba995ec1e577fbd398db87beb4c60b80c2c9c025127

WORKDIR /workspace

COPY package.json package-lock.json .
RUN npm ci

ENTRYPOINT ["npx", "prettier", "--write"]
CMD ["."]
