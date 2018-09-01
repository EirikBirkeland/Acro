#!/bin/bash
# This turns around the fields to optimal position.
cd funky
mkdir keep
find . -name '*NORDIC_ALL_NORSK*' -exec mv {} keep \;
cd keep

shopt -s nullglob
filearray=( *.txt )
for item in "${filearray[@]}"; do
    header=""
    header2=""
    header3=""
    header4=""
    header5=""
    header=$(cat "$item" | head -1 | grep --color=never -P "\ten\t\tdescription\tpos")
    header2=$(cat "$item" | head -1 | grep --color=never -P "\ten\tdescription\tpos\tsv")
    header3=$(cat "$item" | head -1 | grep --color=never -P "pos\tda\tsv\ten\tno\tdescription")
    header4=$(cat "$item" | head -1 | grep --color=never -P "pos\tno\ten\tda\tfi\tdescription")
    header5=$(cat "$item" | head -1 | grep --color=never -P "pos\tno\ten\tda\tsv\tdescription")
    header6=$(cat "$item" | head -1 | grep --color=never -P "description\tda\tpos\tsv\ten")
    header7=$(cat "$item" | head -1 | grep --color=never -P "\tda\tdescription\tpos\ten")

    if [[ $header =~ "	en		description	pos" ]];then
printf "seems like it worked.\n"
       awk -v FS="\t" -v OFS="\t" '{ print $2,$5,$4 }' "$item" > "$item".tmp
       mv "$item".tmp "$item"
    fi
    if [[ $header2 =~ "	en	description	pos	sv" ]]; then
printf "lol, haha"
        awk -v FS="\t" -v OFS="\t" '{ print $2,$5,$4,$3 }' "$item" > "$item".tmp
       mv "$item".tmp "$item"
    fi
    if [[ $header3 =~ "pos	da	sv	en	no	description" ]]; then
printf "lol, haha"
        awk -v FS="\t" -v OFS="\t" '{ print $4,$5,$2,$3,$1,$6        da      description     pos     en } ' "$item" > "$item".tmp
       mv "$item".tmp "$item"
    fi
    if [[ $header4 =~ "pos	no	en	da	fi	description" ]]; then
printf "lol, haha"
        awk -v FS="\t" -v OFS="\t" '{ print $3,$2,$4,$5,$1,$6 } ' "$item" > "$item".tmp
       mv "$item".tmp "$item"
    fi
    if [[ $header5 =~ "pos	no	en	da	sv	description" ]]; then
printf "lol, haha"
        awk -v FS="\t" -v OFS="\t" '{ print $3,$2,$4,$5,$1,$6 }' "$item" > "$item".tmp
       mv "$item".tmp "$item"
    fi
    if [[ $header6 =~ "description	da	pos	sv	en" ]]; then
printf "lol, haha"
        awk -v FS="\t" -v OFS="\t" '{ print $5,$2,$4,$3,$1 }' "$item" > "$item".tmp
       mv "$item".tmp "$item"
    fi
    if [[ $header7 =~ "	da	description	pos	en" ]]; then
printf "lol, haha"
        awk -v FS="\t" -v OFS="\t" '{ print $5,$2,$4,$3,$1 }' "$item" > "$item".tmp
       mv "$item".tmp "$item"
    fi


rename 's/(.*?ALL_).*/$1LIMITED.txt/' "$item"
cp * ../../nordic_all/dansk
cp * ../../nordic_all/norsk
cp * ../../nordic_all/suomi
cp * ../../nordic_all/svenska
done
