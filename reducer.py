#!/usr/bin/python3
# -*-coding:utf-8 -*
import sys

def read_mapper_output(file, separator='\t'):
    for line in file:
        yield line.rstrip().split(separator, 1)

def main(separator='\t'):
    data = read_mapper_output(sys.stdin, separator=separator)
    current_word = None
    current_count = 0

    # input comes from STDIN
    for line in data:
        if len(line) != 2:
            continue  # skip lines that don't have exactly 2 parts

        word, count = line

        # convert count (currently a string) to int
        try:
            count = int(count)
        except ValueError:
            continue  # ignore lines where count is not a number

        # this IF-switch only works because Hadoop sorts map output
        # by key (here: word) before it is passed to the reducer
        if current_word == word:
            current_count += count
        else:
            if current_word is not None:
                # write result to STDOUT
                print(f'{current_word}\t{current_count}')
            current_count = count
            current_word = word

    # output the last word if needed!
    if current_word == word:
        print(f'{current_word}\t{current_count}')

if __name__ == "__main__":
    main()
