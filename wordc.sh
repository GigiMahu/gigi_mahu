#!/bin/bash

function main() {
if [ $arg_num -eq 2 ]; then
	# echo "Correct numbers of arguments supplied $arg_num."
	if [[ $opt == "-c" || $opt == "-w" || $opt == "-l" ]]; then
		# echo "Correct option supplied $opt."
		if [ -f $FILE ]; then
			# echo "File $FILE exist."
			string=$(<$FILE)
		else
			echo "File $FILE does not exist. It's a series of string."
			string=$FILE
		fi
		proc
	else
		echo "Incorrect option supplied $opt."
	fi
else
	echo "Incorrect numbers of arguments supplied $#."
fi
}

function proc() {
	if [ $opt == "-c" ]; then
		# count characters
	        if [ -f $FILE ]; then
			# add 1 char for EOF
			echo "Number of characters: $((${#string}+1))"
		else
			echo "Number of characters: ${#string}"
		fi
	fi
	if [ $opt == "-w" ]; then
		# count words
		i=0
		for j in $string; do
			((i++))
		done
		echo "Number of words: $i"
	fi
	if [ $opt == '-l' ]; then
		# count lines
		if [ -f $FILE ]; then
			#lines=`grep -c '' $FILE`
			lines=0
			while IFS= read -r line; do
				((lines++))
			done < "$FILE"
		else
			lines=1
		fi
		echo "Number of lines: $lines"
	fi
}

arg_num=$#
opt=$1
FILE=$2
main
