#!/usr/bin/env sh

set -o errexit
set -o xtrace

gofmt -d .
test -z "$(gofmt -l .)"
