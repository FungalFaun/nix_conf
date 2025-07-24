#!/usr/bin/env bash

# https://linuxhandbook.com/awk-string-functions/

itemNum=$(($1 * 5))

# selection=$(cat "monitors" \
#   | rg "Monitor| at |make|model|availableModes" \
#   | awk "NR==$itemNum+1, NR==$itemNum+5" \
#   | awk -F' ' '/availableModes/ { for( i=2; i<=NF; i++ ) print substr($i,0,index($i,"@")-1)}'\
#   | uniq\
#   | wofi --dmenu)
#
# echo "You selected $selection"

readarray -t list < <(cat "monitors" \
  | rg "Monitor| at |make|model|availableModes" \
  | awk "NR==$itemNum+1, NR==$itemNum+5" \
  | awk -F' ' '/availableModes/ { 
      for( i=2; i<=NF; i++ ) 
        printf "%s\n", $i
      }')

printf "%s\n" "${list[@]}"\
      | awk '{ at=index($1, "@"); res=substr($1, 1, at -1); printf "%s\n", res }'\
      | sort -ui\
      | uniq\
      | wofi --dmenu

