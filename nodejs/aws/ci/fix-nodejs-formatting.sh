#!/usr/bin/env sh

set -o errexit
set -o xtrace

find './src' -type f -exec npx js-beautify --replace "{}" \;
