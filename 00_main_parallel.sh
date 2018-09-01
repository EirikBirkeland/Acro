#!/bin/bash
if [ -z "${1+xxx}" ]; then
    echo "Please provide an acrodump .zip, such as 20150427.zip as first argument."
    exit 0
fi

DATE=$(echo $1 | perl -pe 's/([^.]+).*/$1/')

rm -Rf ./acrodump
unzip $1 -d acrodump

cd acrodump
../python/00_run_all_parallel.sh
cd ..
echo "Removing duplicates:"
# Disabled incase it is the thing mangling some of the CSV lines.
#./remove_dup.pl
echo "Creating JSON bundle:"
./01_create_json.sh
