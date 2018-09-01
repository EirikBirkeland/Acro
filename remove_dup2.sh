y!/bin/bash

# Alternative method: # 
#    awk '!($0 in array) { array[$0]; print }' "$file"


find . -name

function remove_dup {
  awk '!x[$0]++' "$file" > "$file".new
  mv "$file".new "$file"
}
