#!/usr/bin/env bash

if pgrep -f "[s]ystemd-inhibit.*sleep 999999" >/dev/null; then
  echo '{"text": "󰅶", "tooltip": "Caffeine Mode: ON", "class": "activated"}'
else
  echo '{"text": "󰖔", "tooltip": "Caffeine Mode: OFF", "class": "deactivated"}'
fi
