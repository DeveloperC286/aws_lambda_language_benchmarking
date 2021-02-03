#!/usr/bin/env bash

command -v 'hyperfine' >/dev/null 2>&1 || { echo >&2 "The 'hyperfine' command is not installed. Aborting."; exit 1; }

DATE=`date '+%d-%m-%Y'`
RUST_VERSION=`rustc --version | awk '{print $2}'`
GO_VERSION=`go version | awk '{print $3}' | cut -c 3-`
NODEJS_VERSION=`node --version | cut -c 2-`
PYTHON3_VERSION=`python3 --version | awk '{print $2}'`

INPUT="12345"

hyperfine --warmup 100 --min-runs 1000 '../../rust/local/target/release/aws_lambda_benchmarking --input "'$INPUT'"' --export-json "rust-$RUST_VERSION-$DATE.json"

#hyperfine --warmup 100 --min-runs 1000 'node ../../nodejs/local/src/main.js --input "'$INPUT'"' --export-json "nodejs-$NODEJS_VERSION-$DATE.json"

#hyperfine --warmup 100 --min-runs 1000 '../../go/local/aws_lambda_benchmarking --input "'$INPUT'"' --export-json "go-$GO_VERSION-$DATE.json"

#hyperfine --warmup 100 --min-runs 1000 'python3 ../../python3/local/src/main.py --input "'$INPUT'"' --export-json "python3-$PYTHON3_VERSION-$DATE.json"
