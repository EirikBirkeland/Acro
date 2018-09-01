#!/usr/local/bin/python3
import csv
import sys
import re
import os

input1 = sys.argv[1]
with open(input1, encoding='utf-8') as csvfile:
    mycsv = csv.reader(csvfile, dialect='excel')
    for row in mycsv:
        for item in row:
            if item == row[-1]:
                print(item, '\n', end="")
            else:
                print (item, ' ,', end="")
