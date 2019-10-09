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

TEMP_FILENAME = "___bench.zeek"

ZEEK = os.getenv("ZEEK", "zeek")

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
        #print(template.render(N=iteration_count, number=number))
        f.write("\n")

    cmd = [ZEEK, TEMP_FILENAME]
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
            print("{:10} took {:5.2f}  {:15} it/sec".format(N, dur, int(N/dur)), end='\r')

    return N, dur
    
def run(script_filename, seconds, iterations=0, number=1, runs=3):
    if not iterations:
        N, dur = run_for_at_least(script_filename, seconds, number)
        print("{:10} took {:5.2f}  {:15} it/sec".format(N, dur, int(N/dur)))
    else:
        N = iterations
    for _ in range(runs):
        dur = run_once(script_filename, N, number)
        print("{:10} took {:5.2f}  {:15} it/sec".format(N, dur, int(N/dur)))

def main():
    parser = argparse.ArgumentParser(description='ZeekBench')
    parser.add_argument('script', metavar='script.zeek', type=str, help='script to run')
    parser.add_argument('--seconds', dest='seconds', type=int, default=5, help='Run for this many seconds')
    parser.add_argument('--iterations', dest='iterations', type=int, default=0, help='Run for this many iterations')
    parser.add_argument('--number', dest='number', type=int, default=1, help='arbitrary number for use in templates')
    parser.add_argument('--runs', dest='runs', type=int, default=3, help='number of test runs')
    args = parser.parse_args()
    run(args.script, args.seconds, args.iterations, args.number, args.runs)

if __name__ == "__main__":
    main()
