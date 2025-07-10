DOCKER_RUN_OPTS := --rm -v $(PWD):/workspace -w /workspace

UID := $(shell id -u)
GID := $(shell id -g)
DOCKER_RUN_WRITE_OPTS := $(DOCKER_RUN_OPTS) -u $(UID):$(GID)

.PHONY: default
default: compile

.PHONY: check-go-formatting
check-go-formatting:
	docker build -t check-go-formatting -f ci/check-go-formatting.Dockerfile .
	docker run $(DOCKER_RUN_OPTS) check-go-formatting

# renovate: depName=mvdan/shfmt
SHFMT_VERSION=v3.11.0-alpine@sha256:394d755b6007056a2e6d7537ccdbdcfca01b9855ba91e99df0166ca039c9d422

.PHONY: check-shell-formatting
check-shell-formatting:
	docker run $(DOCKER_RUN_OPTS) mvdan/shfmt:$(SHFMT_VERSION) --simplify --diff ci/* 

.PHONY: fix-go-formatting
fix-go-formatting:
	docker build -t fix-go-formatting -f ci/fix-go-formatting.Dockerfile .
	docker run $(DOCKER_RUN_WRITE_OPTS) fix-go-formatting

.PHONY: fix-shell-formatting
fix-shell-formatting:
	docker run $(DOCKER_RUN_WRITE_OPTS) mvdan/shfmt:$(SHFMT_VERSION) --simplify --write ci/* 

.PHONY: check-go-linting
check-go-linting:
	docker build -t check-go-linting -f ci/check-go-linting.Dockerfile .
	docker run $(DOCKER_RUN_OPTS) check-go-linting

.PHONY: check-modules
check-modules:
	docker build -t check-modules -f ci/check-modules.Dockerfile .
	docker run $(DOCKER_RUN_OPTS) check-modules

.PHONY: fix-modules
fix-modules:
	docker build -t fix-modules -f ci/fix-modules.Dockerfile .
	docker run $(DOCKER_RUN_WRITE_OPTS) fix-modules

.PHONY: compile
compile:
	docker build -t compile -f ci/compile.Dockerfile .
	docker run $(DOCKER_RUN_WRITE_OPTS) compile

.PHONY: unit-test
unit-test:
	docker build -t unit-test -f ci/unit-test.Dockerfile .
	docker run $(DOCKER_RUN_OPTS) unit-test