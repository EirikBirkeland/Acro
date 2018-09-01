#!/bin/bash

shopt -s nullglob
filearray=( *NordicLang.txt ) # OK prints as complete files
fieldarray=( "\$2" "\$3" "\$4" "\$5" )
langarray=( "NORSK" "DANSK" "SVENSKA" "SUOMI" )
for file in "${filearray[@]}"; do
   rename 's/(.*?)_NordicLang.*/$1.txt/' "$file"
done
filearray[@]::2
filearray=( *.txt )
for file in "${filearray[@]}"; do
   for ((i=0;i<${#fieldarray[@]};++i)); do
     #printf "file is $file. %s is in %s\n" "${fieldarray[i]}" "${langarray[i]}"
      cat "$file" | awk 'BEGIN{FS=OFS="\t"} {print $1,'${fieldarray[i]}',$6,$7}' > "$file"_"${langarray[i]}".txt
   done
rename 's/(.*?).txt$/$1_NORDIC_ALL.txt/' "$file"
done



filearray2=( *.txt )
for file in "${filearray2[@]}"; do # remove excess .txt mid-file
rename 's/([.*?]).txt(_.*)/$1$2/' "$file"
done
printf "\n #2"
