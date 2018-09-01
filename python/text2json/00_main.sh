#!/bin/bash

shopt -s nullglob
filearray=( *.txt )

for item in "${filearray[@]}"; do
      python ../../text2json.py "$item" | ../../clean_up_json.sh > "$item".json
done
