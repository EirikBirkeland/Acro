#!/bin/bash

shopt -s nullglob
filearray=( *.txt )

for file in "${filearray[@]}"; do
  awk '!x[$0]++' "$file" > "$file".new
  # Alternative method: # 
  #    awk '!($0 in array) { array[$0]; print }' "$file"
mv "$file".new "$file"
done
