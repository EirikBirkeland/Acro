#!/bin/bash
cd acrodump
shopt -s nullglob
filearray=( *.csv )
mkdir json

for item in "${filearray[@]}"
do
      re='([^.]+).*'
      if [[ "$item" =~ $re ]]; then
            item2=${BASH_REMATCH[1]}
      fi
      item2=$(echo $item2 | perl -pe 's/ //g')
      echo $item
      echo $item2
      python3 ../python/python_json.py "$item" | ../python/clean_up_json.sh > json/"$item2".js
done
echo "Adding BOM to .js files"
find . -name '*.js' -type f -exec sed -i '1s/^/\xef\xbb\xbf/' {} \;
