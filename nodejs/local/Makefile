# So new files are owned by the user.
UID := $(shell id -u)
GID := $(shell id -g)

.PHONY: check-shell-formatting check-python-formatting fix-shell-formatting fix-python-formatting compile

check-shell-formatting:
	docker pull mvdan/shfmt:v3.11.0-alpine
	docker run --rm -v $(PWD):/workspace -w /workspace mvdan/shfmt:v3.11.0-alpine --simplify --diff ci/* 

check-nodejs-formatting:
	docker build -t check-nodejs-formatting -f ci/check-nodejs-formatting.Dockerfile .
	docker run --rm -v $(PWD):/workspace check-nodejs-formatting

fix-shell-formatting:
	docker pull mvdan/shfmt:v3.11.0-alpine
	docker run --rm -v $(PWD):/workspace -w /workspace -u $(UID):$(GID) mvdan/shfmt:v3.11.0-alpine --simplify --write ci/* 

fix-nodejs-formatting:
	docker build -t fix-nodejs-formatting -f ci/fix-nodejs-formatting.Dockerfile .
	docker run --rm -v $(PWD):/workspace -u $(UID):$(GID) fix-nodejs-formatting