#!/bin/bash
#Move file name from file itself and inject it into the 4th column just before
#the long description. I.e.: source target domain pos date description
#Can copy/paste bits from other files, largely.
#Also, move the file's date inside the file itself!

#pseudo code:

#open files[@]

#for file in ${files[@]};do # fix 3_rename_files to be optimal compared with this.
#   
#   date=$(echo $file | grep "([0-9]{2}\,[0-9]{2}\,[0-9]{4})") 
#   domain=$(echo $file | grep "^_?[^_]+")
#
#   cat $file | awk ...
#
#
