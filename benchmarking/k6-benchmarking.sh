#!/usr/bin/env bash

command -v 'k6' >/dev/null 2>&1 || { echo >&2 "The 'k6' command is not installed. Aborting."; exit 1; }

DATE=`date '+%d-%m-%Y'`

RUST_VERSION=`rustc --version | awk '{print $2}'` # Compiled on local machine and using provided runtime.
GO_VERSION='1.x'
NODEJS_VERSION='14.x'
PYTHON3_VERSION='3.8'

BASE_URL="https://f112ibizih.execute-api.eu-west-2.amazonaws.com/hashing"
SUMMARY_STATS="avg,med,p(25),p(75),min,max"
VUS=4
ITERATIONS=1000

k6 run -e URL=$BASE_URL/rust k6-benchmarking.js --iterations $ITERATIONS --vus $VUS --summary-trend-stats=$SUMMARY_STATS --summary-time-unit=ms --summary-export "rust-$RUST_VERSION-$DATE.json"

k6 run -e URL=$BASE_URL/go k6-benchmarking.js --iterations $ITERATIONS --vus $VUS --summary-trend-stats=$SUMMARY_STATS --summary-time-unit=ms --summary-export "go-$GO_VERSION-$DATE.json"

k6 run -e URL=$BASE_URL/nodejs k6-benchmarking.js --iterations $ITERATIONS --vus $VUS --summary-trend-stats=$SUMMARY_STATS --summary-time-unit=ms --summary-export "nodejs-$NODEJS_VERSION-$DATE.json"

k6 run -e URL=$BASE_URL/python3 k6-benchmarking.js --iterations $ITERATIONS --vus $VUS --summary-trend-stats=$SUMMARY_STATS --summary-time-unit=ms --summary-export "python3-$PYTHON3_VERSION-$DATE.json"
