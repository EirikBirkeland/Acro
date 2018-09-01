#/usr/local/bin/python
import csv
import sys
import os

#class DevNull:
#    def write(self, msg):
#        pass
#
#sys.stderr = DevNull()

input1 = sys.argv[1] # Assigns the 1st command line argument to variable input1.
input2 = sys.argv[2] # Does the same for 2nd command line argument.

with open(input1, encoding='utf-8') as csvfile: # Opens the csv file specified as the first argument.
    mycsv = csv.DictReader(csvfile) # Parses the opened csv file into the csv module's format
    
    if input2 == 'no':
        for row in mycsv:
            print(row['en'],'\t',row['no'],'\t(da)',row['da'],'\t(sv)',row['sv'],'\t(fi)',row['fi'],'\t',row['pos'],'\t',row['description'],'\t',os.environ['DATE'])

    if input2 == 'da':
        for row in mycsv:
            print(row['en'],'\t',row['da'],'\t(no)',row['no'],'\t(sv)',row['sv'],'\t(fi)',row['fi'],'\t',row['pos'],'\t',row['description'],'\t',os.environ['DATE'])

    if input2 == 'sv': # For Swedish, you's type sv in the command line as the 2nd argument.
        for row in mycsv: # For each row, do the following:
            print(row['en'],'\t',row['sv'],'\t(no)', row['no'],'\t(da)',row['da'],'\t(fi)',row['fi'],'\t',row['pos'],'\t',row['description'],'\t',os.environ['DATE'])
   
    if input2 == 'fi':
        for row in mycsv:
            print(row['en'],'\t',row['fi'],'\t(sv)', row['sv'],'\t(da)',row['da'],'\t(no)',row['no'],'\t',row['pos'],'\t', row['description'],'\t',os.environ['DATE'])

    if input2 == 'ja':
        for row in mycsv:
            print(row['en'],'\t',row['ja'],'\t',row['pos'],'\t', row['description'],'\t',os.environ['DATE'])


    # Japanese only
    
    if input2 == 'fr': # This is for conversion into Japanese, which I thought to keep as a last resort reference.
        for row in mycsv:
            print(row['en'],'\t',row['fr'],'\t(Canadian) ',row['fr-CA'], '\t', row['pos'],'\t',row['description'],os.environ['DATE'])
    if input2 == 'fr-CA': # this is for conversion into japanese, which i thought to keep as a last resort reference.
        for row in mycsv:
            print(row['en'],'\t',row['fr-CA'],'\t(continental) ',row['fr'],'\t',row['pos'],'\t',row['description'],os.environ['DATE'])
