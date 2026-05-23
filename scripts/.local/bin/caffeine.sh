#!/usr/bin/env bash

# The [s] prevents pgrep from accidentally matching itself!
if pgrep -f "[s]ystemd-inhibit.*sleep 999999" >/dev/null; then
  # It is running -> Kill it
  pkill -f "sleep 999999"
  notify-send "Caffeine" "Mode Disabled" -i face-sleeping -t 2000
else
  # It is NOT running -> Use nohup to perfectly detach it. No nested quotes!
  nohup systemd-inhibit --what=idle --who=Caffeine --why=Active sleep 999999 >/dev/null 2>&1 &
  disown
  notify-send "Caffeine" "Mode Enabled" -i face-angel -t 2000
fi

sleep 0.1
pkill -SIGRTMIN+9 waybar
