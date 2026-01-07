.PHONY: default
default: compile

.PHONY: check-python-formatting
check-python-formatting:
	autopep8 --exit-code --diff --aggressive --aggressive --max-line-length 120 --recursive .

.PHONY: fix-python-formatting
fix-python-formatting:
	autopep8 --in-place --aggressive --aggressive --max-line-length 120 --recursive .

.PHONY: check-python-linting
check-python-linting:
	ruff check --line-length 120 .

.PHONY: fix-python-linting
fix-python-linting:
	ruff check --fix --line-length 120 .

.PHONY: compile
compile:
	find . -type f -name "*.py" -exec python3 -m py_compile {} \;
