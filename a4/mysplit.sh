#!/bin/bash

# wc -l gives line count of csv file, we subtract 1 to skip the header line
numofentries=$(( $(wc -l < winequality-red.csv) - 1))

# multiply numofentries by .8 and add 1 to simplify work below
split=`expr $numofentries \* 8 / 10 + 1`

# converts semi colon separators to commas to be truly .csv file
sed -i 's/;/,/g' winequality-red.csv

# adds first header line from dataset to each sub dataset
head -1 winequality-red.csv > ~/cs131/a4/train/data.csv
head -1 winequality-red.csv > ~/cs131/a4/test/data.csv

# since split already has been increased by 1, since we start at the second line, we get all lines from 2 to the split
awk "NR>=2 && NR<=$split" winequality-red.csv >> ~/cs131/a4/train/data.csv

# gets remaining lines and adds 1 to numofentries to make up for initial subtraction
awk "NR>=$(($split+1)) && NR<=$(($numofentries+1))" winequality-red.csv >> ~/cs131/a4/test/data.csv
