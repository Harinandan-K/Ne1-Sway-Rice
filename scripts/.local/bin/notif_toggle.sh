#!/bin/bash
# Check if 'dnd' is active. If yes, remove it. If no, add it.
if makoctl mode | grep -q 'dnd'; then
  makoctl mode -r dnd
else
  makoctl mode -a dnd
fi
# Force Waybar to instantly refresh the bell icon
pkill -RTMIN+8 waybar
