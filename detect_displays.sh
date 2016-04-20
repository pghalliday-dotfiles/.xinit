#!/bin/bash

set -e

last_display=
xrandr | grep connected | while read line; do
  display=$(echo $line | cut -f 1 -d " ")
  if [ "$last_display" == "" ]; then
    xrandr --output $display --auto --primary
  else
    xrandr --output $display --auto --right-of $last_display
  fi
  last_display=$display
done
