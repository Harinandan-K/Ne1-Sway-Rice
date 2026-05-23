#!/usr/bin/env bash
# -----------------------------------------------------------------------------
# Script: wallpaper_picker.sh
# Description: Select and apply wallpapers from ~/Pictures/.wallpapers
# -----------------------------------------------------------------------------

# The exact path you provided
WALL_DIR="$HOME/Pictures/.wallpapers"
CONFIG_FILE="$HOME/.config/sway/wallpaper.conf"

# Ensure the directory exists
if [ ! -d "$WALL_DIR" ]; then
  rofi -e "Directory $WALL_DIR not found!"
  exit 1
fi

# Select wallpaper (scanning the hidden folder for images)
SELECTED=$(ls "$WALL_DIR" | grep -E "\.(jpg|jpeg|png|webp|pnm|tga|tiff)$" | rofi -dmenu -i -p "󰸉 Select Wallpaper")

if [ -n "$SELECTED" ]; then
  FULL_PATH="$WALL_DIR/$SELECTED"

  # Apply immediately to all outputs
  swaymsg output "*" bg "$FULL_PATH" fill

  # Save it so it persists when you log back in
  echo "output * bg \"$FULL_PATH\" fill" >"$CONFIG_FILE"
fi
