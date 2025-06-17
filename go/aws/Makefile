# So new files are owned by the user.
UID := $(shell id -u)
GID := $(shell id -g)

.PHONY: check-clean-git-history check-conventional-commits-linting check-rust-formatting check-python-formatting check-yaml-formatting fix-rust-formatting fix-python-formatting fix-yaml-formatting check-rust-linting check-github-actions-workflows-linting compile unit-test static-binary-test end-to-end-test publish-binary publish-crate

check-go-formatting:
	docker build -t check-go-formatting -f ci/check-go-formatting.Dockerfile .
	docker run --rm -v $(PWD):/workspace check-go-formatting

# renovate: depName=mvdan/shfmt
SHFMT_VERSION=v3.11.0-alpine@sha256:394d755b6007056a2e6d7537ccdbdcfca01b9855ba91e99df0166ca039c9d422

check-shell-formatting:
	docker pull mvdan/shfmt:$(SHFMT_VERSION)
	docker run --rm -v $(PWD):/workspace -w /workspace mvdan/shfmt:$(SHFMT_VERSION) --simplify --diff ci/* 

fix-go-formatting:
	docker build -t fix-go-formatting -f ci/fix-go-formatting.Dockerfile .
	docker run --rm -v $(PWD):/workspace -u $(UID):$(GID) fix-go-formatting

fix-shell-formatting:
	docker pull mvdan/shfmt:$(SHFMT_VERSION)
	docker run --rm -v $(PWD):/workspace -w /workspace -u $(UID):$(GID) mvdan/shfmt:$(SHFMT_VERSION) --simplify --write ci/* 

check-go-linting:
	docker build -t check-go-linting -f ci/check-go-linting.Dockerfile .
	docker run --rm -v $(PWD):/workspace check-go-linting

check-modules:
	docker build -t check-modules -f ci/check-modules.Dockerfile .
	docker run --rm -v $(PWD):/workspace check-modules

fix-modules:
	docker build -t fix-modules -f ci/fix-modules.Dockerfile .
	docker run --rm -v $(PWD):/workspace fix-modules

compile:
	docker build -t compile -f ci/compile.Dockerfile .
	docker run --rm -v $(PWD):/workspace compile

unit-test:
	docker build -t unit-test -f ci/unit-test.Dockerfile .
	docker run --rm -v $(PWD):/workspace unit-test