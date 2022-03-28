#!/bin/bash
file=`ls -lAh | sed 's/  */ /g' | cut -d ' ' -f9,5`
for i in "$file"; do
	echo "$i"
done
