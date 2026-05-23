#!/usr/bin/env bash
# -----------------------------------------------------------------------------
# Script: power_menu.sh
# Description: Ubuntu-style Power Control Center for Sway
# -----------------------------------------------------------------------------

# 1. Check live process state dynamically
if pgrep -f "[s]ystemd-inhibit.*sleep 999999" >/dev/null; then
  OPT_CAFF="󰅶  Caffeine Mode: ON"
else
  OPT_CAFF="󰖔  Caffeine Mode: OFF"
fi

# 2. Static Options
OPT_LOGOUT="󰍃  Logout"
OPT_REBOOT="󰑐  Restart"
OPT_SHUT="  Shutdown"

MSG="<span color='#f38ba8'><b>System Power</b></span> <span color='#cdd6f4'>| Control Center</span>"

THEME_FIX='
window { width: 400px; border-radius: 12px; border: 2px; border-color: #f38ba8; }
mainbox { children: [ message, listview ]; }
message { padding: 15px; margin: 0px 0px 10px 0px; background-color: #1e293b; border-radius: 8px; }
textbox { text-color: #cdd6f4; horizontal-align: 0.5; }
listview { lines: 4; }
'

# 3. Launch Menu
CHOICE=$(printf "%s\n%s\n%s\n%s" "$OPT_CAFF" "$OPT_LOGOUT" "$OPT_REBOOT" "$OPT_SHUT" | rofi -dmenu -i -mesg "$MSG" -theme-str "$THEME_FIX" -config ~/.config/rofi/config.rasi)

# 4. Execute Choice
case "$CHOICE" in
"$OPT_SHUT") systemctl poweroff ;;
"$OPT_REBOOT") systemctl reboot ;;
"$OPT_LOGOUT") swaymsg exit ;;
"$OPT_CAFF") bash ~/.local/bin/caffeine.sh ;;
esac
