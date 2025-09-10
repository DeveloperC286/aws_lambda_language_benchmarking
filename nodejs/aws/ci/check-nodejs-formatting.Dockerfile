FROM node:24.7.0@sha256:12affdc046489e63450191d69b5a093302f487eb140a2075022475f94dc39037

WORKDIR /workspace

COPY package.json package-lock.json .
RUN npm ci

ENTRYPOINT ["npx", "prettier", "--check"]
CMD ["."]
