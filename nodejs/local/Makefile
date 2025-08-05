DOCKER_RUN_OPTS := --rm -v $(PWD):/workspace -w /workspace

UID := $(shell id -u)
GID := $(shell id -g)
DOCKER_RUN_WRITE_OPTS := $(DOCKER_RUN_OPTS) -u $(UID):$(GID)

.PHONY: default
default: 
	echo "No default target."

.PHONY: check-nodejs-formatting
check-nodejs-formatting:
	docker build -t check-nodejs-formatting -f ci/check-nodejs-formatting.Dockerfile .
	docker run $(DOCKER_RUN_OPTS) check-nodejs-formatting

# renovate: depName=mvdan/shfmt
SHFMT_VERSION=v3.12.0-alpine@sha256:204a4d2d876123342ad394bd9a28fb91e165abc03868790d4b39cfa73233f150

.PHONY: check-shell-formatting
check-shell-formatting:
	docker run $(DOCKER_RUN_OPTS) mvdan/shfmt:$(SHFMT_VERSION) --simplify --diff ci/* 

.PHONY: fix-nodejs-formatting
fix-nodejs-formatting:
	docker build -t fix-nodejs-formatting -f ci/fix-nodejs-formatting.Dockerfile .
	docker run $(DOCKER_RUN_WRITE_OPTS) fix-nodejs-formatting

.PHONY: fix-shell-formatting
fix-shell-formatting:
	docker run $(DOCKER_RUN_WRITE_OPTS) mvdan/shfmt:$(SHFMT_VERSION) --simplify --write ci/* 