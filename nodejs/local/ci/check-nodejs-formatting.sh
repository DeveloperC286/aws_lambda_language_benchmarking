#!/usr/bin/env sh

set -o errexit
set -o xtrace

temp=$(mktemp)

for i in $(du -a "./src/" | awk '{print $2}' | grep -i "[.]js$"); do
	npx js-beautify "$i" >"${temp}"
	cmp "$i" "${temp}" || (echo "$i needs formatted." && exit 1)
done
