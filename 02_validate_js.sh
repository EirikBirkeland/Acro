#!/bin/bash

cd acrodump
cd json

shopt -s nullglob
filearray=( *.js )

for item in "${filearray[@]}"; do
      echo "$item"
      cat "$item" | perl -pe 'if ($. == 1) { s/.*?\[/[/}' | jsonlint -v
done
