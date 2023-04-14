#!/bin/bash

# This checks if there are not enough parameters
if [ $# -lt 2 ]; then
	echo "Some parameters are missing!"
	exit 2
# This checks if there too many parameters
elif [ $# -gt 2 ]; then
	echo "Too many parameters!"
	exit 2
fi

# This checks if x is out of the range of [1, 99]
if [[ $1 -gt 99 || $1 -lt 1 ]]; then
	echo "Number is out of bounds!"
	exit 2
fi

# Calculates the total number of lines in the original file
numlines=$(wc -l $2 | cut -d " " -f1)

# Simple math to get the number of lines to sample from value of x
numlinestoget=$(($1*${numlines}/100))

# Gets and prints random sample of the given number of lines to stdout
shuf -n $numlinestoget $2                            
