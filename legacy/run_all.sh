#!/bin/bash
time {
time ../script/0_prepare_files.sh
printf "\n0. Files have been prepared.\n"
time ../script/1_csv_stripper.sh pass
printf "\n1. Files have been truncated.\n"
cd txt
time ../../script/2_divide.sh
printf "\n2. Small single-pair files have been generated.\n"
time ../../script/3_move_folders.sh
printf "\n3. Single-pair files have been sorted in folders.\n"
time ../../script/4_shuffle_order_output_various.sh
printf "\n4. Multi-lang files have been generated for FI, SV, DA.\n"
time ../../script/5_fix_the_scrambled_ones.sh
printf "\n5. Moving files to respective subdirectories.\."
}
cd ..
# rm -R txt
