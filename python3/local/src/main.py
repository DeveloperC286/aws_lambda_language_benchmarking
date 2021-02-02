#!/usr/bin/env python3

import sys
import argparse
import hashlib


def main(argv):
    parser = argparse.ArgumentParser(description='')
    parser.add_argument('--input', required=True, type=str)
    args = parser.parse_args()
    print(hash_input(args.input.encode('utf-8')))


def hash_input(input):
    output = hashlib.sha256(input).digest()

    for x in range(99998):
        output = hashlib.sha256(output).digest()

    return hashlib.sha256(output).hexdigest()


if __name__ == "__main__":
    main(sys.argv[1:])
