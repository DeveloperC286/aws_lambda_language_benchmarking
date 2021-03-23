#!/usr/bin/env python3

import argparse
import json
import matplotlib.patches as mpatches
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

    patches = []

    with open(args.nodejs) as f:
        results = json.load(f)['results'][0]
        times = results['times']
        colour = 'lime'
        plt.plot(list(range(1, len(times) + 1)), times, color=colour)
        nodejs_version = re.split('-', args.nodejs)[1]
        patches.append(mpatches.Patch(color=colour, label='Node.js ' + nodejs_version))

    with open(args.rust) as f:
        results = json.load(f)['results'][0]
        times = results['times']
        colour = 'orangered'
        plt.plot(list(range(1, len(times) + 1)), times, color=colour)
        rust_version = re.split('-', args.rust)[1]
        patches.append(mpatches.Patch(color=colour, label='Rust ' + rust_version))

    with open(args.go) as f:
        results = json.load(f)['results'][0]
        times = results['times']
        colour = 'lightskyblue'
        plt.plot(list(range(1, len(times) + 1)), times, color=colour)
        go_version = re.split('-', args.go)[1]
        patches.append(mpatches.Patch(color=colour, label='Go ' + go_version))

    with open(args.python3) as f:
        results = json.load(f)['results'][0]
        times = results['times']
        colour = 'yellow'
        plt.plot(list(range(1, len(times) + 1)), times, color=colour)
        python3_version = re.split('-', args.python3)[1]
        patches.append(mpatches.Patch(color=colour, label='Python3 ' + python3_version))

    plt.legend(handles=patches)
    plt.ylabel('Time (Seconds)')
    plt.xlabel('Iteration')
    plt.grid(b=True, which='major', linestyle='-')
    plt.minorticks_on()
    plt.grid(b=True, which='minor', linestyle='--', alpha=0.5)
    plt.show()


if __name__ == "__main__":
    main(sys.argv[1:])
