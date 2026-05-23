#!/bin/bash
# Replaces notify-send with dunstify for better progress bar handling
dunstify -h string:x-dunst-stack-tag:$3 \
  -h int:value:$2 \
  "$1" "$2%" \
  -t 1500
