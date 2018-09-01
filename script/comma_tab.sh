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
