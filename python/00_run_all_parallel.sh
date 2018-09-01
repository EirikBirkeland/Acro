#!/bin/bash
time {

shopt -s nullglob
filearray=( *.csv )
COUNTER=0

# Validate by regexing the header row for any desired values
for item in "${filearray[@]}"
do
   # Invalidate by file size
   bytes=$(cat "$item" | wc -m)
   if [ "$bytes" -lt 1024 ]; then
      let COUNTER=COUNTER+1
      printf "$item is smaller than 1024 bytes\n\n"
      printf "\nItem $COUNTER:\n$item\n" >> merged.txt
      cat "$item" >> merged.txt
      rm "$item"
      echo "$item is only $bytes bytes and has been deleted"
   else
      headergrep=$(cat "$item" | head -1 | grep -P '"no"|"da"|"sv"|"fi"|"ja"|"fr"|"fr-CA"')
      if [ -n "$headergrep" ]; then
         let COUNTER=COUNTER+1
         printf "$item has no interesting header data.\n"
         printf "\nItem $COUNTER:\n$item\n" >> merged.txt
      fi
   fi
done


filearray=( *.csv )

printf "Removing BOM for picky Python CSV module. . .\n"
find . -name '*.csv' -type f -exec sed -i '1s/^\xef\xbb\xbf//' {} \;

declare -A langarray

langarray[no]=NORSK
langarray[da]=DANSK
langarray[sv]=SVENSKA
langarray[fi]=SUOMI
langarray[ja]=NIHONGO
langarray[fr]=FRANCAIS
langarray[fr-CA]=FRANCAIS_CA

for code in "${!langarray[@]}"; do
   mkdir $code
   echo "python.py: Extracting from $item"
   parallel "python3 ../python/python.py {} $code > $code/$code{.}.txt" ::: *.csv
done

# Remove all 0 byte files recursively
find . -name '*.txt' -type f -size 0 -print0 | xargs -0 rm
# Add BOM (note: will also add if BOM exists already!)
printf "Adding BOM . . .\n"
find . -name '*.txt' -type f -exec sed -i '1s/^/\xef\xbb\xbf/' {} \;
}
