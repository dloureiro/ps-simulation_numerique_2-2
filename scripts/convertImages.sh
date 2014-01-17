#! /bin/bash

input=$1
output=$2
size="600x600"

mkdir -p $output

for file in $(ls $input); do
	baseName=$(basename $file .graffle)
	if [ "$baseName" = "$file" ] ; then
		convert -geometry $size $input/$file $output/$file
    else
    	echo "Not converting graffle file : $file"
    	
    fi
done