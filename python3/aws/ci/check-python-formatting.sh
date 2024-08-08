#!/usr/bin/env sh

set -o errexit
set -o xtrace

find "." -type f | grep "[.]py$" | xargs -I {} autopep8 --exit-code --diff --aggressive --aggressive "{}"
