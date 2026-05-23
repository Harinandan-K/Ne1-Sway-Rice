#!/bin/bash
MODE=$(makoctl mode)

if [[ "$MODE" == *"dnd"* ]]; then
  echo '{"text": "", "class": "dnd", "tooltip": "Do Not Disturb"}'
else
  echo '{"text": "", "class": "active", "tooltip": "Notifications Active"}'
fi
