#!/usr/local/bin/python
import csv
import sys

class DevNull:
    def write(self, msg):
        pass
sys.stderr = DevNull()

input1 = sys.argv[1]

with open(input1, newline='', encoding='utf-8') as csvfile:
    mycsv = csv.DictReader(csvfile)
    for row in mycsv:
        print(', '.join(row))
