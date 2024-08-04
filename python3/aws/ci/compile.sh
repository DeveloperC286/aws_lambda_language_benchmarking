#!/usr/bin/env sh

set -o errexit
set -o xtrace

find "." -type f | grep "[.]py$" | xargs -I {} python3 -m py_compile "{}"
