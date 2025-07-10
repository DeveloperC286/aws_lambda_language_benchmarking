DOCKER_RUN_OPTS := --rm -v $(PWD):/workspace -w /workspace

UID := $(shell id -u)
GID := $(shell id -g)
DOCKER_RUN_WRITE_OPTS := $(DOCKER_RUN_OPTS) -u $(UID):$(GID)

.PHONY: default
default: compile

.PHONY: check-python-formatting
check-python-formatting:
	docker build -t check-python-formatting -f ci/check-python-formatting.Dockerfile .
	docker run $(DOCKER_RUN_OPTS) check-python-formatting

# renovate: depName=mvdan/shfmt
SHFMT_VERSION=v3.11.0-alpine@sha256:394d755b6007056a2e6d7537ccdbdcfca01b9855ba91e99df0166ca039c9d422

.PHONY: check-shell-formatting
check-shell-formatting:
	docker run $(DOCKER_RUN_OPTS) mvdan/shfmt:$(SHFMT_VERSION) --simplify --diff ci/* 

.PHONY: fix-python-formatting
fix-python-formatting:
	docker build -t fix-python-formatting -f ci/fix-python-formatting.Dockerfile .
	docker run $(DOCKER_RUN_WRITE_OPTS) fix-python-formatting

.PHONY: fix-shell-formatting
fix-shell-formatting:
	docker run $(DOCKER_RUN_WRITE_OPTS) mvdan/shfmt:$(SHFMT_VERSION) --simplify --write ci/* 

.PHONY: compile
compile:
	docker build -t compile -f ci/compile.Dockerfile .
	docker run $(DOCKER_RUN_WRITE_OPTS) compile