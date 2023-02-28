#!/bin/bash
filename=$(cat topreviews.txt)
for line in $filename
do
	        grep -w "$line" amazon_reviews_us_Books_v1_02.tsv >> ~/cs131/ws5/CUSTOMERS/$line.txt
done

