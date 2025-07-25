#!/usr/bin/env bash

# https://linuxhandbook.com/awk-string-functions/

DIR="/var/tmp/monitor-config"

if [ ! -d "$DIR" ]; then
  mkdir "$DIR"
fi

itemNum=$(($1 * 2))

# selection=$(cat "monitors" \
#   | rg "Monitor| at |make|model|availableModes" \
#   | awk "NR==$itemNum+1, NR==$itemNum+5" \
#   | awk -F' ' '/availableModes/ { for( i=2; i<=NF; i++ ) print substr($i,0,index($i,"@")-1)}'\
#   | uniq\
#   | wofi --dmenu)
#
# echo "You selected $selection"

# monitor_id=$(hyprctl activeworkspace | rg "monitorID" | awk '{print $2}')

readarray -t list < <(cat "monitors" \
  | rg "Monitor|availableModes" \
  | awk "NR==$itemNum+1, NR==$itemNum+2" \
  | awk -F' ' '/availableModes/ { 
      for( i=2; i<=NF; i++ ) 
        printf "%s\n", $i
      }')

res=$(printf "%s\n" "${list[@]}"\
      | awk '{ at=index($1, "@"); res=substr($1, 1, at -1); printf "%s\n", res }'\
      | sort -n\
      | uniq\
      | wofi --dmenu) 

# echo $res > $DIR/resolution

hz=$(printf "%s\n" "${list[@]}" \
      | rg $res \
      | awk '{ at=index($1, "@"); hz=substr($1, at +1); printf "%s\n", hz}'\
      | wofi --dmenu)

printf "$res@$hz" > $DIR/resolution

#hyprctl reload
