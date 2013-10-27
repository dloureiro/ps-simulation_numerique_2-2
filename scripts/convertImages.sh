#! /bin/bash

input=$1
output=$2
size="600x600"

mkdir -p $output

for file in $(ls $input); do
    convert -geometry $size $input/$file $output/$file
done