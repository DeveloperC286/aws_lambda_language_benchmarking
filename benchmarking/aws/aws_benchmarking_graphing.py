#!/usr/bin/env python3

import argparse
import json
import matplotlib.pyplot as plt
import re
import sys
from os import path


def main(argv):
    parser = argparse.ArgumentParser(description='')
    parser.add_argument('--nodejs', required=True, type=str)
    parser.add_argument('--rust', required=True, type=str)
    parser.add_argument('--go', required=True, type=str)
    parser.add_argument('--python3', required=True, type=str)
    args = parser.parse_args()

    if not path.isfile(args.nodejs):
        print("The input Node.js file '{}' does not exist or is not a file.".format(args.input))
        sys.exit(2)

    if not path.isfile(args.rust):
        print("The input Rust file '{}' does not exist or is not a file.".format(args.input))
        sys.exit(2)

    if not path.isfile(args.go):
        print("The input Go file '{}' does not exist or is not a file.".format(args.input))
        sys.exit(2)

    if not path.isfile(args.python3):
        print("The input Python3 file '{}' does not exist or is not a file.".format(args.input))
        sys.exit(2)

    stats = []

    with open(args.nodejs) as f:
        results = json.load(f)['metrics']['iteration_duration']
        stats += [{'mean': results['avg'], 'med': results['med'], 'q1': results['p(25)'], 'q3': results['p(75)'], 'whislo': results['min'], 'whishi': results['max']}]

    with open(args.rust) as f:
        results = json.load(f)['metrics']['iteration_duration']
        stats += [{'mean': results['avg'], 'med': results['med'], 'q1': results['p(25)'], 'q3': results['p(75)'], 'whislo': results['min'], 'whishi': results['max']}]

    with open(args.go) as f:
        results = json.load(f)['metrics']['iteration_duration']
        stats += [{'mean': results['avg'], 'med': results['med'], 'q1': results['p(25)'], 'q3': results['p(75)'], 'whislo': results['min'], 'whishi': results['max']}]

    with open(args.python3) as f:
        results = json.load(f)['metrics']['iteration_duration']
        stats += [{'mean': results['avg'], 'med': results['med'], 'q1': results['p(25)'], 'q3': results['p(75)'], 'whislo': results['min'], 'whishi': results['max']}]

    fig, ax = plt.subplots()
    ax.bxp(stats, showfliers=False, showmeans=True)

    nodejs_version = re.split('-', args.nodejs)[1]
    rust_version = re.split('-', args.rust)[1]
    go_version = re.split('-', args.go)[1]
    python3_version = re.split('-', args.python3)[1]

    plt.ylabel('Time (ms)')
    ax.set_xticks(range(1, len(stats) + 1))
    ax.set_xticklabels(['Node.js ' + nodejs_version, 'Rust ' + rust_version, 'Go ' + go_version, 'Python3 ' + python3_version])
    plt.grid(b=True, which='major', linestyle='-')
    plt.minorticks_on()
    plt.grid(b=True, which='minor', linestyle='--', alpha=0.5)
    plt.show()


if __name__ == "__main__":
    main(sys.argv[1:])
