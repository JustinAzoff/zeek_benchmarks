#!/usr/bin/env python3
import argparse
from jinja2 import Environment, FileSystemLoader

env = Environment(
    loader=FileSystemLoader(".")
)
def render(script_filename, iteration_count, number):
    template = env.get_template(script_filename)
    print(template.render(N=iteration_count, number=number))

def main():
    parser = argparse.ArgumentParser(description='BroBench')
    parser.add_argument('script', metavar='script.bro', type=str, help='script to run')
    parser.add_argument('--iterations', dest='iterations', type=int, default=1000000, help='Run for this many iterations')
    parser.add_argument('--number', dest='number', type=int, default=1, help='arbitrary number for use in templates')
    args = parser.parse_args()
    render(args.script, args.iterations, args.number)

if __name__ == "__main__":
    main()
