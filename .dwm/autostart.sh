#!/bin/sh

# Start status bar
slstatus &

# Start pipewire
pipewire &

# Set brightness level
brightnessctl set 30%

# Set wallpaper
xwallpaper --zoom ~/.config/suckless/dwm-6.5/wallpapers/wallpaper.jpg &

# Start dwmblocks
dwmblocks

# Lock screen and enable auto-lock
xss-lock -- betterlockscreen -l dim &
xautolock -time 1 -locker "betterlockscreen -l dim" &

# Enable two-finger scrolling for touchpad
xinput set-prop 'MSFT0001:00 04F3:31BE Touchpad' 'Synaptics Two-Finger Scrolling' 1 1
