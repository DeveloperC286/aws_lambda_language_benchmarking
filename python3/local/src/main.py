#!/usr/bin/env python3

import sys
import argparse
import hashlib


def main(argv):
    parser = argparse.ArgumentParser(description='')
    parser.add_argument('--input', required=True, type=str)
    args = parser.parse_args()
    print(hashlib.sha256(args.input.encode('utf-8')).hexdigest())


if __name__ == "__main__":
    main(sys.argv[1:])
