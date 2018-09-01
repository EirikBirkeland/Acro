unzip $1 -d acrodump
cd acrodump
../python/00_run_all.sh
cd ..
./remove_dup.pl
