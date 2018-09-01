import sys
import csv
import re

result = re.sub(r'.*?\]([^.]+).*', r'\1', sys.argv[1])

print('g' + result + ' = [\r\n')
 
with open(sys.argv[1],'r') as f:
    next(f) # skip headings
    reader=csv.reader(f,delimiter='\t')
 
    # get the total number of rows excluded the heading
    row_count = len(list(reader))
    ite = 0
 
    # back to first position
    f.seek(0)
    next(f) # skip headings
    
    for EN,FI,SV,DA,NO,CLASS,DEF in reader:
 
        ite+= 1
        
        print('\t{\r\n')
        
        a = '\t\t\"EN\": \"' + EN + '\",\r\n'
        b = '\t\t\"FI\": \"' + FI + '\",\r\n'
        c = '\t\t\"SV\": \"' + SV + '\",\r\n'
        d = '\t\t\"DA\": \"' + DA + '\",\r\n'
        e = '\t\t\"NO\": \"' + NO + '\",\r\n'
        f = '\t\t\"CLASS\": \"' + CLASS + '\",\r\n'
        g = '\t\t\"DEF\": \"' + DEF + '\"\r\n'
       
        for i in [a, b, c, d, e, f, g]:
            print(i)
        print('\t}')
 
        # omit comma for last row item
        if ite < row_count:
            print(',\r\n')
 
        print('\r\n')
 
print(']')
