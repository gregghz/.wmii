#!/bin/zsh

memline=$(free | head -n 2 | tail -n 1 | tr -s ' ')
cached=$(echo $memline | cut -d ' ' -f 7)
free=$(echo $memline | cut -d ' ' -f 4)
cachedfree=$(echo $cached + $free | bc)
mem=$(echo "scale=3;" $cachedfree / 1000000 | bc)

echo $mem GB
