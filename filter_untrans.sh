cat *.txt \
   | sort \
   | uniq \
   | grep -P '^(.*?)\s*\t\s*\1' \
   | grep -vP '^\s+\t\s+' \
   | perl -pe 's/\s*\t\s*/\t/g'
