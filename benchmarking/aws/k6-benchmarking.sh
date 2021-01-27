#!/usr/bin/env bash

command -v 'k6' >/dev/null 2>&1 || { echo >&2 "The 'k6' command is not installed. Aborting."; exit 1; }

DATE=`date '+%d-%m-%Y'`

BASE_URL="https://fslgc0j56k.execute-api.eu-west-2.amazonaws.com/hashing"

k6 run -e URL=$BASE_URL/rust k6-benchmarking.js --iterations 1000 --vus 4 --summary-export rust-$DATE.json

k6 run -e URL=$BASE_URL/go k6-benchmarking.js --iterations 1000 --vus 4 --summary-export go-$DATE.json

k6 run -e URL=$BASE_URL/nodejs k6-benchmarking.js --iterations 1000 --vus 4 --summary-export nodejs-$DATE.json

k6 run -e URL=$BASE_URL/python3 k6-benchmarking.js --iterations 1000 --vus 4 --summary-export python3-$DATE.json
