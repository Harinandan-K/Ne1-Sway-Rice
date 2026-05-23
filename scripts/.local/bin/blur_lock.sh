#!/usr/bin/env bash

# Define where to temporarily save the image
IMAGE="/tmp/sway_lock_screen.png"

# 1. Take a screenshot of the current screen
grim "$IMAGE"

# 2. Blur the image (0x15 is a great, smooth blur radius)
convert "$IMAGE" -blur 0x15 "$IMAGE"

# 3. Launch swaylock using the blurred image
swaylock -f -i "$IMAGE"
