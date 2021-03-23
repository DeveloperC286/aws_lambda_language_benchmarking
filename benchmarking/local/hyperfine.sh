#!/usr/bin/env bash

command -v 'hyperfine' >/dev/null 2>&1 || { echo >&2 "The 'hyperfine' command is not installed. Aborting."; exit 1; }

RUST_VERSION=`rustc --version | awk '{print $2}'`
GO_VERSION=`go version | awk '{print $3}' | cut -c 3-`
NODEJS_VERSION=`node --version | cut -c 2-`
PYTHON3_VERSION=`python3 --version | awk '{print $2}'`

DATE=`date '+%d-%m-%Y'`
INPUT="12345"
WARMUP=100
ITERATIONS=1000

hyperfine --warmup $WARMUP --min-runs $ITERATIONS '../../rust/local/target/release/aws_lambda_language_benchmarking --input "'$INPUT'"' --export-json "rust-$RUST_VERSION-$DATE.json"

hyperfine --warmup $WARMUP --min-runs $ITERATIONS 'node ../../nodejs/local/src/main.js --input "'$INPUT'"' --export-json "nodejs-$NODEJS_VERSION-$DATE.json"

hyperfine --warmup $WARMUP --min-runs $ITERATIONS '../../go/local/aws_lambda_language_benchmarking --input "'$INPUT'"' --export-json "go-$GO_VERSION-$DATE.json"

hyperfine --warmup $WARMUP --min-runs $ITERATIONS 'python3 ../../python3/local/src/main.py --input "'$INPUT'"' --export-json "python3-$PYTHON3_VERSION-$DATE.json"
