#!/usr/local/bin/python
import csv
import sys

class DevNull:
    def write(self, msg):
        pass
sys.stderr = DevNull()

input1 = sys.argv[1]
input2 = sys.argv[2]
with open(input1, newline='', encoding='utf-8') as csvfile:
    mycsv = csv.DictReader(csvfile)
    
    if input2 == 'no':
        for row in mycsv:
            print(row['en'],'\t',row['no'],'\t(da)',row['da'],'\t(sv)',row['sv'],'\t',row['pos'],'\t',row['description'])
    if input2 == 'da':
        for row in mycsv:
            print(row['en'],'\t',row['da'],'\t(no)',row['no'],'\t(sv)',row['sv'],'\t',row['pos'],'\t',row['description'])
    if input2 == 'sv':
        for row in mycsv:
            print(row['en'],'\t', row['sv'],'\t(no)', row['no'],'\t(da)',row['da'],'\t',row['pos'],'\t',row['description'])
