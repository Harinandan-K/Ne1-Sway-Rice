#!/usr/bin/env bash
# -----------------------------------------------------------------------------
# Script: battery_info.sh
# Description: Displays battery stats and power profiles via Rofi.
# -----------------------------------------------------------------------------

# 1. Gather Battery Data Dynamically
BAT=$(upower -e | grep 'BAT' | head -n 1)
STATE=$(upower -i "$BAT" | grep state | awk '{print $2}')
PERC=$(upower -i "$BAT" | grep percentage | awk '{print $2}')
TIME=$(upower -i "$BAT" | grep -E "time to" | awk '{print $4, $5}')
TIME=${TIME:-"N/A"}

# 2. Get Current Power Profile
PROFILE=$(powerprofilesctl get)

# 3. Define Menu Options
OPT_PERF="  Performance"
OPT_BAL="  Balanced"
OPT_SAVER="  Power-Saver"

# 4. Format the UI Message
MSG="<span color='#89b4fa'><b>Battery:</b></span> <span color='#cdd6f4'>$PERC ($STATE)</span>
<span color='#89b4fa'><b>Time Left:</b></span> <span color='#cdd6f4'>$TIME</span>   |   <span color='#89b4fa'><b>Mode:</b></span> <span color='#cdd6f4'>$PROFILE</span>"

THEME_FIX='
window { width: 400px; border-radius: 12px; border: 2px; border-color: #89b4fa; }
mainbox { children: [ message, listview ]; }
message { padding: 15px; margin: 0px 0px 10px 0px; background-color: #1e293b; border-radius: 8px; }
textbox { text-color: #cdd6f4; horizontal-align: 0.5; }
listview { lines: 3; }
'

# 5. Launch Rofi
CHOICE=$(printf "%s\n%s\n%s" "$OPT_PERF" "$OPT_BAL" "$OPT_SAVER" | rofi -dmenu -i -mesg "$MSG" -theme-str "$THEME_FIX")

# 6. Apply Selection
case "$CHOICE" in
"$OPT_PERF")
  powerprofilesctl set performance
  notify-send "Power Manager" "Performance Mode " -t 3000
  ;;
"$OPT_BAL")
  powerprofilesctl set balanced
  notify-send "Power Manager" "Balanced Mode " -t 3000
  ;;
"$OPT_SAVER")
  powerprofilesctl set power-saver
  notify-send "Power Manager" "Power-Saver Mode " -t 3000
  ;;
esac
