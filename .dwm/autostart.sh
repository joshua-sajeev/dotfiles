#!/bin/sh 
slstatus &
pipewire &

brightnessctl set 30%
xwallpaper --zoom ~/.config/suckless/dwm-6.5/wallpapers/wallpaper.jpg &
dwmblocks
