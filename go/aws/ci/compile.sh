#!/usr/bin/env sh

set -o errexit
set -o xtrace

go build -o main "./src/"