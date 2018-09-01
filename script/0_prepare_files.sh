#!/bin/bash
#
# Version history: 0.2 Nov 12th: - Fixed problem with LFs inside ","
#                                - Fixed renaming of file names in 4_ for multi-language files.
#                                - Added regex to strip double spaces from source files.

#echo "Your choice ?"
#echo "1) Perl"
#echo "2) Sed (unimplemented)"
#echo "3) quit"
#read case;

# Delete tiny files (TODO: Add check for whether header row contains NO EN DA SV)

shopt -s nullglob
filearray=( *.csv )
for item in "${filearray[@]}"
do
    bytes=$(cat "$item" | wc -m)
    if [ "$bytes" -lt 100 ]; then
        rm "$item"
        echo "$item is only $bytes bytes and has been deleted"
    fi
done

# Deactivated only temporarily!
# Check encoding and quarantine non-UTF-8.
shopt -s nullglob
filearray=( *.csv )
for item in "${filearray[@]}"
    do
    encoding=$(uchardet "$item")
    if ! [ "$encoding" = "UTF-8" ]; then
	if [ "$encoding" = "ascii/unknown" ]; then
            iconv -f ascii -t utf-8 "$item" > "$item"
        else
            printf "Invalid encoding, cannot proceed."
            exit 0
        fi
#        mv $item $item.bad
    fi
done

#case $case in

# 1)
# Replaces " in safe positions - i.e. next to tabs and ^ and $. 0.380 sec
# requires source file to be "," separated.
   perl -pi.bak -e '
    s/^\xEF\xBB\xBF//; # Removes BOM (Byte order mark) to allow for ^ matching with Perl.
    s/([^,"])\s*\n//g; # Remove "inline" newlines (i.e. that are inside the individual ","-separated entries.)
    s/(?<=[,"\t]),(?=[,"\t])/\t/g;
    s/^,/\t/g;
    s/,$/\t/g;
    s/"\t/\t/g;
    s/\t"/\t/g;
    s/^"//g;
    s/  +/ /g;
    s/"$//g' *.csv
#    ;;
# 2)
#    printf "\future option\n"
#    ;;
# 3)
    break
#    ;;
# *)
#    printf "\ninvalid option\n"
#    ;;
#esac
