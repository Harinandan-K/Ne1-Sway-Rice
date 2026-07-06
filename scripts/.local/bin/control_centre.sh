#!/usr/bin/env bash
# -----------------------------------------------------------------------------
# Script: control_centre.sh
# Description: Rofi-based Control Centre for Ne1 Chalk v2.0 with Wallpaper Picker
# -----------------------------------------------------------------------------

# Define the Master Logo Variable
LOGO="
                                      ╭────────────────────────╮
                                      │ 1                      │
                                      │                        │
                                      │   ███╗   ██╗           │
                                      │   ████╗  ██║           │
                                      │   ██╔██╗ ██║   █████╗  │
                                      │   ██║╚██╗██║  ██╔══██╗ │
                                      │   ██║ ╚████║  ███████║ │
                                      │   ╚═╝  ╚═══╝  ██╔════╝ │
                                      │               ╚██████╗ │
                                      │                ╚═════╝ │
                                      │                        │
                                      │       Ne1 Chalk        │
                                      │         v 2.0          │
                                      ╰────────────────────────╯"

# -- Generate Content Files --
cat <<EOF >/tmp/ne1_keys.txt
$LOGO
                   ============================================================
                                        KEYBINDINGS
                   ============================================================

[ Core System ]
Win + Return             : Open Terminal
Win + Q                  : Kill Focused Window
Win + Shift + C          : Reload Sway Config
Win + Escape             : Lock Screen (Swaylock)
Win + Shift + Escape     : Direct System Shutdown
Ctrl + Alt + Del         : Direct Logout
Win + /                  : Show Ne1 Control Centre
Win + Shift + E          : Power Control Center

[ App Launchers ]
Win + Space              : Rofi App Launcher
Win + W                  : Brave Browser
Win + E                  : Nautilus File Manager
Win + C                  : VS Code / Neovim
Win + D / Shift + D      : Discord

[ Media & Hardware ]
Win + F2 / F3            : Decrease / Increase Brightness
Win + F7                 : Toggle Audio Mute
Win + F8 / F9            : Decrease / Increase Volume
Win + F10 / F11 / F12    : Media: Prev / Play-Pause / Next
Win + Shift + S          : Screenshot to Clipboard

[ Notifications ]
Win + N                  : Toggle Do Not Disturb (DND)
Win + Shift + N          : View Last Dismissed Notification

[ Window Navigation & Movement ]
Win + Arrows (h/j/k/l)   : Focus Window
Win + Shift + Arrows     : Move Window Position
Alt + Tab                : Focus Next Window
Alt + Shift + Tab        : Focus Previous Window
Win + A                  : Focus Parent Container

[ Workspace Navigation ]
Win + 1-4                : Switch Workspaces
Win + Shift + 1-4        : Move Window to Workspace
Win + Tab                : Next Workspace on Monitor
Win + Shift + Tab        : Previous Workspace on Monitor
Win + Shift + W          : Quick Wallpaper Picker

[ Layout & Tiling ]
Win + V / S / B          : Vertical / Stacking / Tabbed
Win + T                  : Toggle Split
Win + Shift + Space      : Float Toggle
Win + F                  : Fullscreen Toggle
Win + P                  : Toggle Waybar Visibility

[ Scratchpad & Resize Mode ]
Win + Shift + Minus (-)  : Move Window to Scratchpad
Win + Minus (-)          : Show Scratchpad
Win + R                  : Enter Resize Mode (Arrows to adjust, Enter/Esc to exit)
EOF

cat <<EOF >/tmp/ne1_apps.txt
$LOGO
          ============================================================
                                  DEFAULT APPS
          ============================================================
Terminal Emulator    : Kitty
Web Browser          : Brave
File Manager         : Nautilus
Code Editor (CLI)    : Neovim
Code Editor (GUI)    : VS Code
Communication        : Discord
EOF

cat <<EOF >/tmp/ne1_docs.txt
$LOGO
          ============================================================
                         ARCHITECTURE & FILE STRUCTURE
          ============================================================

 .
├──  .config
│   ├──  btop
│   │   ├──  btop.conf                 - Main configuration for btop system monitor
│   │   └──  themes                    - Directory for btop custom color themes
│   ├──  fastfetch
│   │   ├──  config.jsonc              - Main fastfetch module configuration
│   │   └──  ne1_logo.txt              - Custom ASCII logo for fastfetch
│   ├──  gh
│   │   ├──  config.yml                - GitHub CLI main configuration
│   ├──  gtk-3.0
│   │   ├──  bookmarks                 - Nautilus/file manager quick bookmarks
│   │   ├──  gtk.css                   - Custom CSS styling for GTK applications
│   │   └──  settings.ini              - GTK3 theme, font, and icon settings
│   ├──  kitty
│   │   ├──  current-theme.conf        - Currently active Kitty terminal theme
│   │   ├──  kitty.conf                - Main Kitty terminal configuration
│   ├──  mako
│   │   └──  config                    - Mako notification daemon styling & behavior
│   ├──  mimeapps.list                 - Default file associations for applications
│   ├──  nvim                          - Neovim editor configuration (LazyVim)
│   │   ├──  .gitignore                - Git ignore rules for neovim config
│   │   ├──  .neoconf.json             - Project-local Neovim configuration settings
│   │   ├──  init.lua                  - Main Neovim initialization file
│   │   ├──  lazy-lock.json            - Lockfile for Neovim package manager
│   │   ├──  lazyvim.json              - LazyVim specific base configuration
│   │   ├──  LICENSE                   - Neovim configuration license
│   │   ├──  lua                       
│   │   │   ├──  config
│   │   │   │   ├──  autocmds.lua      - Custom Neovim autocommands
│   │   │   │   ├──  keymaps.lua       - Custom Neovim keybindings
│   │   │   │   ├──  lazy.lua          - Plugin manager setup
│   │   │   │   └──  options.lua       - Editor behavior options
│   │   │   └──  plugins
│   │   │       ├──  colorscheme.lua   - Theme configuration
│   │   │       └──  example.lua       - Example plugin configuration
│   │   ├──  README.md                 - Neovim configuration documentation
│   │   └──  stylua.toml               - Lua code formatter configuration
│   ├──  nvtop
│   │   └──  interface.ini             - Configuration for nvtop GPU monitor layout
│   ├──  rofi
│   │   └──  config.rasi               - Main Rofi menu styling and behavior
│   ├──  sway
│   │   ├──  autostart.conf            - Programs to launch automatically on login
│   │   ├──  config                    - Main Sway Window Manager configuration
│   │   ├──  hardware.conf             - Input/Output device settings (monitors/keyboards)
│   │   ├──  keybindings.conf          - Comprehensive shortcut key mappings
│   │   ├──  theme.conf                - Window borders, gaps, and aesthetic settings
│   │   └──  wallpaper.conf            - Path and settings for the current wallpaper
│   ├──  tiling-assistant
│   │   └──  tiledSessionRestore.json  - Saved window layouts and states
│   ├──  user-dirs.dirs                - Defines default XDG user folders (Downloads, etc.)
│   ├──  waybar
│   │   ├──  config                    - Waybar modules and layout settings
│   │   └──  style.css                 - Waybar visual styling (colors, sizes, CSS)
│   ├──  wlogout
│   │   ├──  config                    - wlogout button actions and commands
│   │   ├──  layout                    - Arrangement of wlogout buttons on screen
│   │   └──  style.css                 - wlogout visual styling
│   ├──  wob
│   │   └──  wob.ini                   - Wayland Overlay Bar (Volume/Brightness popups)
│   └──  xdg-desktop-portal
│       └──  portals.conf              - XDG desktop portal backend settings
└──  .local
    └──  bin
        ├──  autotiling                - Script for automatic alternate window splitting
        ├──  battery_info.sh           - Script to fetch and format battery status
        ├──  blur_lock.sh              - Takes screenshot, blurs it, and launches lockscreen
        ├──  caffeine.sh               - Toggles system sleep inhibition daemon
        ├──  caffeine_status.sh        - Feeds Caffeine UI state to Waybar
        ├──  control_centre.sh         - The main Rofi Control Center UI script (this menu!)
        ├──  notif_status.sh           - Feeds Do-Not-Disturb state to Waybar
        ├──  notif_toggle.sh           - Toggles Mako Do-Not-Disturb mode
        ├──  osd_bar.sh                - Manages On-Screen-Display popups for hardware keys
        ├──  power_menu.sh             - Rofi-based power/logout control menu
        └──  wallpaper_picker.sh       - Script to select and apply wallpapers using Rofi
EOF

# -- Rofi Menu UI --
# -- Rofi Menu UI --
OPT_KEYS="󰌌   Keybindings"
OPT_WALL="󰸉   Set Wallpaper"
OPT_APPS="󰀻   Default Apps & Tools"
OPT_DOCS="󰈙   Documentation"

MSG="<span color='#89b4fa'><b>Ne1 Chalk</b></span> <span color='#cdd6f4'>| v 2.0 Control Center</span>"

THEME_FIX='
window { width: 500px; border-radius: 12px; border: 2px; border-color: #89b4fa; }
mainbox { children: [ message, listview ]; }
message { padding: 15px; margin: 0px 0px 10px 0px; background-color: #09090e; border-radius: 8px; }
textbox { text-color: #cdd6f4; horizontal-align: 0.5; }
listview { lines: 4; }
'

CHOICE=$(printf "%s\n%s\n%s\n%s" "$OPT_KEYS" "$OPT_WALL" "$OPT_APPS" "$OPT_DOCS" | rofi -dmenu -i -mesg "$MSG" -theme-str "$THEME_FIX" -config $HOME/.config/rofi/config.rasi)

case "$CHOICE" in
"$OPT_KEYS")
  kitty --class "ne1_cc" --title "Keybindings" -e less /tmp/ne1_keys.txt
  ;;
"$OPT_WALL")
  # Launch Zenity file picker pointing to your specific hidden folder
  SELECTED_WALL=$(zenity --file-selection --title="Select Wallpaper" --filename="$HOME/.config/.wallpaper/")

  if [ -n "$SELECTED_WALL" ]; then
    swaymsg "output * bg \"$SELECTED_WALL\" fill"
    echo "output * bg \"$SELECTED_WALL\" fill" >~/.config/sway/wallpaper.conf
  fi
  ;;
"$OPT_APPS")
  kitty --class "ne1_cc" --title "Default Apps" -e less /tmp/ne1_apps.txt
  ;;
"$OPT_DOCS")
  kitty --class "ne1_cc" --title "Documentation" -e less /tmp/ne1_docs.txt
  ;;
esac
