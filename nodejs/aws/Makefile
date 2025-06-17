# So new files are owned by the user.
UID := $(shell id -u)
GID := $(shell id -g)

.PHONY: check-shell-formatting check-python-formatting fix-shell-formatting fix-python-formatting compile

# renovate: depName=mvdan/shfmt
SHFMT_VERSION=v3.11.0-alpine@sha256:394d755b6007056a2e6d7537ccdbdcfca01b9855ba91e99df0166ca039c9d422

check-shell-formatting:
	docker pull mvdan/shfmt:$(SHFMT_VERSION)
	docker run --rm -v $(PWD):/workspace -w /workspace mvdan/shfmt:$(SHFMT_VERSION) --simplify --diff ci/* 

check-nodejs-formatting:
	docker build -t check-nodejs-formatting -f ci/check-nodejs-formatting.Dockerfile .
	docker run --rm -v $(PWD):/workspace check-nodejs-formatting

fix-shell-formatting:
	docker pull mvdan/shfmt:$(SHFMT_VERSION)
	docker run --rm -v $(PWD):/workspace -w /workspace -u $(UID):$(GID) mvdan/shfmt:$(SHFMT_VERSION) --simplify --write ci/* 

fix-nodejs-formatting:
	docker build -t fix-nodejs-formatting -f ci/fix-nodejs-formatting.Dockerfile .
	docker run --rm -v $(PWD):/workspace -u $(UID):$(GID) fix-nodejs-formatting