#!/usr/bin/env bash

command -v 'hyperfine' >/dev/null 2>&1 || { echo >&2 "The 'hyperfine' command is not installed. Aborting."; exit 1; }

RUST_VERSION=`rustc --version | awk '{print $2}'`
GO_VERSION=`go version | awk '{print $3}' | cut -c 3-`
NODEJS_VERSION=`node --version | cut -c 2-`
PYTHON3_VERSION=`python3 --version | awk '{print $2}'`

INPUT="12345"

#hyperfine --warmup 100 --min-runs 1000 '../rust/aws_lambda_benchmarking/target/release/aws_lambda_benchmarking --input "'$INPUT'"' --export-json "rust-$RUST_VERSION.json"

#hyperfine --warmup 100 --min-runs 1000 'node ../nodejs/aws_lambda_benchmarking/src/main.js --input "'$INPUT'"' --export-json "nodejs-$NODEJS_VERSION.json"

#hyperfine --warmup 100 --min-runs 1000 '../go/aws_lambda_benchmarking/aws_lambda_benchmarking --input "'$INPUT'"' --export-json "go-$GO_VERSION.json"

hyperfine --warmup 100 --min-runs 1000 'python3 ../python3/aws_lambda_benchmarking/src/main.py --input "'$INPUT'"' --export-json "python3-$PYTHON3_VERSION.json"
