#!/bin/bash
x=$1
y=$2
# regular expression to test if a string is number
# re='^[0-9]+$' 
# if [[ $x =~ $re ]] && [[ $y =~ $re ]]; then
if [[ $x = *[[:digit:]]* && $y = *[[:digit:]]* ]]; then
	if [[ $x != 0 ]] && [[ $y != 0 ]]; then
		echo $[ x * y ]
	else
		echo "One of the arguments is zero."
	fi
else 
	echo "One of the arguments is not number."
fi
