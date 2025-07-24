#!/usr/bin/env bash

itemNum=$(($1*5))

# Get lines mentioned for monitor index
readarray -t arr < <(cat "monitors" \
  | rg "Monitor| at |make|model|availableModes" \
  | awk "NR==$itemNum+1, NR==$itemNum+5" \
  | awk -F' ' '/availableModes/ { for( i=2; i<=NF; i++ ) print $i}')

for res in "${arr[@]}"; do
  echo "$res"
done
