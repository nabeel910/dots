#!/bin/sh
setxkbmap -model pc104 -layout us,ar -variant ,, -option grp:alt_shift_toggle &
xsetroot -cursor_name left_ptr &
picom -b &
numlockx on &
pulseaudio &
/usr/libexec/xfce-polkit &
dunst &
feh --bg-scale ~/Pictures/walls/bspwmcat.png
clipmenud &
xss-lock slock &
sxhkd &
polybar &
libinput-gestures &
