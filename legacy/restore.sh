#!/bin/bash
rm *.csv
rename 's/(.*).bak/$1/' *.bak
