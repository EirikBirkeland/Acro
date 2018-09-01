#!/usr/local/bin/python3
import csv
import sys
import re
import os

'''
class DevNull:
    def write(self, msg):
        pass
sys.stderr = DevNull()
'''

input1 = sys.argv[1]
with open(input1, newline='', encoding='utf-8') as csvfile:
    mycsv = csv.DictReader(csvfile)
    row_count = len(list(mycsv))
    iterator = 0

    # Sets file number ($.) to 0
    csvfile.seek(0)
    next(csvfile)

    result = re.sub(r'([^.]+).*', r'\1', sys.argv[1])
    result2 = re.sub(r' ', r'', result)
    print('g' + result2 + 'Dict = [\r\n')

    for row in mycsv:

        iterator += 1

        print('\t{\r\n')

        for key in row:
            if isinstance(key, str): # Check whether the key is a string, in-case a non-string element is found, leading to error
                row[key] = row[key].replace("\n", " \\n ")

        if 'en' in row:
            print('\t\t\"EN\": \"' + row['en'] + '\",\r\n')
        if 'fi' in row:
            print ('\t\t\"FI\": \"' + row['fi'] + '\",\r\n')
        if 'sv' in row:
            print ('\t\t\"SV\": \"' + row['sv'] + '\",\r\n')
        if 'da' in row:
            print ('\t\t\"DA\": \"' + row['da'] + '\",\r\n')
        if 'no' in row:
            print ('\t\t\"NO\": \"' + row['no'] + '\",\r\n')
        if 'pos' in row:
            print ('\t\t\"CLASS\": \"' + row['pos'] + '\",\r\n')
        if 'description' in row:
            print ('\t\t\"DEF\": \"' + row['description'] + '\",\r\n')
        print ('\t\t\"DATE\": \"' + os.environ['DATE'] + '\",\r\n')
        print ('\t\t\"PRODUCT\": \"' + result + '\"\r\n')
        if iterator < row_count:
            print('\t},\r\n')
        else:
            print('\t}\r\n')
print(']')
