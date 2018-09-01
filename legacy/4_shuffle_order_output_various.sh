#!/bin/bash
# Shuffle the NORDIC files and output different versions

#TODO: insert $PWD condition later
cd nordic_all

shopt -s nullglob
filearray=( *NORDIC_ALL.txt )

for item in "${filearray[@]}"; do
  #Danish:
   cat "$item" | awk 'BEGIN{FS=OFS="\t"} {print $1,$3,$2,$4,$5,$6,$7}' > "$item"_DANSK_.txt
  #Swedish
   cat "$item" | awk 'BEGIN{FS=OFS="\t"} {print $1,$4,$3,$2,$5,$6,$7}' > "$item"_SVENSKA_.txt
  #Finnish: 
   cat "$item" | awk 'BEGIN{FS=OFS="\t"} {print $1,$5,$4,$3,$2,$6,$7}' > "$item"_SUOMI_.txt
done

filearray2=( *_.txt )
for file in "${filearray2[@]}"; do
   rename 's/(.*?)\.txt(_.*?)_\.txt/$1$2.txt/' "$file"
done
mkdir dansk
mv *DANSK* dansk
mkdir svenska
mv *SVENSKA* svenska
mkdir suomi
mv *SUOMI* suomi

filearray3=( *.txt )
for file2 in "${filearray3[@]}"; do
    rename 's/(.*?)\.txt/$1_NORSK.txt/' "$file2"
done
mkdir norsk
mv *NORSK* norsk
cd ..
# Add BOM to 1st line of all files. Sed is brilliant.
printf "Removing files designated for deletion\n" # This list must be updated for every conversion at least!
mkdir funky
find . -name '_SMS*' -type f -exec mv {} funky \;
find . -name '_iPhone*' -type f -exec mv {} funky \;
find . -name 'Tee*' -type f -exec mv {} funky \;
find . -name 'Userpanels*' -type f -exec mv {} funky \;
find . -name 'Glass*' -type f -exec mv {} funky \;
find . -name 'SketchUp*' -type f -exec mv {} funky \;
find . -name 'DART*' -type f -exec mv {} funky \;
find . -name 'Product Names___GTT-1*' -type f -exec mv {} funky \;
find . -name 'Confucius___GTT*' -type f -exec mv {} funky \;
find . -name 'Orkut**' -type f -exec mv {} funky \;
find . -name 'Knol*' -type f -exec mv {} funky \;
find . -name 'Media*' -type f -exec mv {} funky \;
find . -name 'Desktop*' -type f -exec mv {} funky \;
find . -name 'Trader*' -type f -exec mv {} funky \;
find . -name 'Bid Manager*' -type f -exec mv {} funky \;
find . -name '_Product*' -type f -exec mv {} funky \;

printf "Adding BOM . . .\n"
find . -name '*.txt' -type f -exec sed -i '1s/^/\xef\xbb\xbf/' {} \;

# Remove files that are useless here:
