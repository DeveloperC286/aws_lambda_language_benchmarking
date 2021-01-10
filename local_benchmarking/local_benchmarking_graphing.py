#!/usr/bin/env python3

import sys
import matplotlib.patches as mpatches
import matplotlib.pyplot as plt
import argparse
import json
from os import path


def main(argv):
    parser = argparse.ArgumentParser(description='')
    parser.add_argument('--nodejs', required=True, type=str)
    parser.add_argument('--rust', required=True, type=str)
    parser.add_argument('--go', required=True, type=str)
    args = parser.parse_args()

    if not path.isfile(args.nodejs):
        print("The input NodeJS file '{}' does not exist or is not a file.".format(args.input))
        sys.exit(2)

    if not path.isfile(args.rust):
        print("The input Rust file '{}' does not exist or is not a file.".format(args.input))
        sys.exit(2)

    if not path.isfile(args.go):
        print("The input Go file '{}' does not exist or is not a file.".format(args.input))
        sys.exit(2)

    patches = []

    with open(args.nodejs) as f:
        results =  json.load(f)['results'][0]
        times = results['times']
        colour = 'limegreen'
        plt.plot(list(range(1, len(times) + 1)), times, color=colour)
        patches.append(mpatches.Patch(color=colour, label='NodeJS'))

    with open(args.rust) as f:
        results =  json.load(f)['results'][0]
        times = results['times']
        colour = 'orange'
        plt.plot(list(range(1, len(times) + 1)), times, color=colour)
        patches.append(mpatches.Patch(color=colour, label='Rust'))

    with open(args.go) as f:
        results =  json.load(f)['results'][0]
        times = results['times']
        colour = 'cyan'
        plt.plot(list(range(1, len(times) + 1)), times, color=colour)
        patches.append(mpatches.Patch(color=colour, label='Go'))

    plt.legend(handles=patches)
    plt.ylabel('Time (Seconds)')
    plt.xlabel('Iteration')
    plt.grid(True)
    plt.show()


if __name__ == "__main__":
    main(sys.argv[1:])
