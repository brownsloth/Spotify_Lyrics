#!/usr/bin/python3
# -*-coding:utf-8 -*

import sys
import csv
import re

def read_input(file):
    pattern = re.compile(r'\s+')
    for line in file:
        line = re.sub(pattern, '', line)
        yield line

def main(separator='\t'):
    data = read_input(sys.stdin)
    for line in data:
        line = line.strip()
        # split the line using CSV reader
        words = line.split()
        for word in words:
            # write the results to STDOUT (standard output)
            # tab-delimited; the trivial word count is 1
            print('%s\t%s' % (word, 1))

if __name__ == "__main__":
    main()
