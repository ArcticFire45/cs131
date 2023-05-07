#!/bin/bash

echo "date,county,state,fips,cases,deaths" > last10data.txt
echo "date,county,state,fips,cases,deaths" > top10data.txt


while IFS= read -r line; do
	grep $line mask_data.txt | awk -F, '{print}' >> last10data.txt
done < last10ids.txt

while IFS= read -r line; do
	grep $line mask_data.txt | awk -F, '{print}' >> top10data.txt
done < top10ids.txt
