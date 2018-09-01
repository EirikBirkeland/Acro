#!/bin/bash

shopt -s nullglob
filearray=( *.js )

for item in "${filearray[@]}"
do
      ../../remove_duplicates.pl $item > $item.cleaned
done
