#!/bin/bash

# ---- CONFIG ----
BLUR_AMOUNT="0x8"  # Gaussian blur: radius x sigma
BLURRED_IMAGE="/home/masubhaat/.config/rofi/rofi_blurred_bg.png"
THEME_PATH="$HOME/.config/rofi/modern_theme.rasi"
HYPAPER_CONF="$HOME/.config/hypr/hyprpaper.conf"

# ---- DETECT ORIGINAL WALLPAPER ----
if [ ! -f "$HYPAPER_CONF" ]; then
    echo "Hyprpaper config not found at $HYPAPER_CONF"
    exit 1
fi

# Extract wallpaper path from the first 'preload =' line, trim spaces
ORIGINAL_IMAGE=$(grep -m 1 "^preload" "$HYPAPER_CONF" | cut -d'=' -f2- | xargs)

if [ ! -f "$ORIGINAL_IMAGE" ]; then
    echo "Wallpaper not found: $ORIGINAL_IMAGE"
    exit 2
fi

# ---- BLUR IMAGE ----
convert "$ORIGINAL_IMAGE" -blur "$BLUR_AMOUNT" "$BLURRED_IMAGE"

# ---- DETECT MONITOR ----
MONITOR=$(hyprctl monitors | grep "Monitor" | head -n1 | awk '{print $2}')
if [ -z "$MONITOR" ]; then
    echo "Could not detect active monitor"
    exit 3
fi

# ---- TEMP SET BLURRED WALLPAPER ----
hyprctl hyprpaper unload all
hyprctl hyprpaper preload "$BLURRED_IMAGE"
hyprctl hyprpaper wallpaper "$MONITOR,$BLURRED_IMAGE"

# ---- LAUNCH ROFI ----
rofi -show drun -theme "$THEME_PATH"

# ---- RESTORE ORIGINAL WALLPAPER ----
hyprctl hyprpaper unload all
hyprctl hyprpaper preload "$ORIGINAL_IMAGE"
hyprctl hyprpaper wallpaper "$MONITOR,$ORIGINAL_IMAGE"
