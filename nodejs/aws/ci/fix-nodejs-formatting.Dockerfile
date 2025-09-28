FROM node:24.9.0@sha256:a2ed436bacdcc9dd543202a327bbce2519c43e3755a41a186f8f51c037ef3342

WORKDIR /workspace

COPY package.json package-lock.json .
RUN npm ci

ENTRYPOINT ["npx", "prettier", "--write"]
CMD ["."]
