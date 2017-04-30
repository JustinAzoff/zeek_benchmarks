#!/usr/bin/env python3

import argparse
import os
import subprocess
import sys
import time

from jinja2 import Environment, FileSystemLoader

env = Environment(
    loader=FileSystemLoader(".")
)

TEMP_FILENAME = "___bench.bro"

def get_duration(cmd):
    s = time.time()
    out = subprocess.check_output(cmd)
    e = time.time()
    dur = e -s
    return dur

def run_once(script_filename, iteration_count, number):
    template = env.get_template(script_filename)
    with open(TEMP_FILENAME, 'w') as f:
        f.write(template.render(N=iteration_count, number=number))
        f.write("\n")

    cmd = ["bro", TEMP_FILENAME]
    dur = get_duration(cmd)
    os.unlink(TEMP_FILENAME)
    return dur

def run_for_at_least(script_filename, seconds, number=1):
    seconds = float(seconds)
    N = 100
    dur = run_once(script_filename, N, number)
    while dur < seconds:
        if dur < .100:
            #print ("multiplied by", 8)
            N *= 8
        elif dur < 1:
            #print ("multiplied by", 4)
            N *= 4
        else:
            #print ("multiplied by", seconds/dur)
            N *= (seconds/dur)
            N = int(N)
        dur = run_once(script_filename, N, number)
        if sys.stdout.isatty():
            print(N, "took", dur, "iterations/sec", N/seconds, end="\r")

    return N, dur
    
def run(script_filename, seconds, number=1):
    iterations, seconds = run_for_at_least(script_filename, seconds, number)
    print(iterations, "took", seconds, "iterations/sec", iterations/seconds)
    for _ in range(3):
        seconds = run_once(script_filename, iterations, number)
        print(iterations, "took", seconds, "iterations/sec", iterations/seconds)

def main():
    parser = argparse.ArgumentParser(description='BroBench')
    parser.add_argument('script', metavar='script.bro', type=str, help='script to run')
    parser.add_argument('--seconds', dest='seconds', type=int, default=5, help='Run for this many seconds')
    parser.add_argument('--number', dest='number', type=int, default=1, help='arbitrary number for use in templates')
    args = parser.parse_args()
    run(args.script, args.seconds, args.number)

if __name__ == "__main__":
    main()
