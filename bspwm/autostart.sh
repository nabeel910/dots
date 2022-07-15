#!/bin/sh


killall picom
killall numlockx
killall /usr/libexec/xfce-polkit
killall dunst
killall clipmenud
killall xss-lock
killall sxhkd
killall polybar
killall libinput-gestures
killall pipewire
killall pipewire-media-session
killall pipewire-pulse



setxkbmap -model pc104 -layout us,ar -variant ,, -option grp:alt_shift_toggle &
xsetroot -cursor_name left_ptr &
picom -b &
numlockx on &
pipewire &
pipewire-media-session &
pipewire-pulse &
/usr/libexec/xfce-polkit &
dunst &
feh --bg-scale ~/Pictures/walls/bspwmcat.png
clipmenud &
xss-lock slock &
sxhkd &
polybar &
libinput-gestures &
