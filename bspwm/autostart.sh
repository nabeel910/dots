#!/bin/bash

killall sxhkd
killall picom
killall -p numlockx
killall transmission-daemon
killall /usr/bin/pipewire
killall /usr/bin/pipewire-pulse
killall /usr/bin/pipewire-media-session
killall /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
killall dunst
killall clipmenud
eval "$(dbus-launch --sh-syntax --exit-with-session)"

setxkbmap -model pc104 -layout us,ar -variant ,, -option grp:alt_shift_toggle &
xsetroot -cursor_name left_ptr &
picom -b &
sxhkd &
numlockx on &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
dunst &
feh --bg-scale /home/nabeel/pics/walls/nord-peeks.png
clipmenud &
xidlehook --not-when-audio --not-when-fullscreen --timer 1200 "slock" "" &
transmission-daemon &
/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/pipewire-media-session &
