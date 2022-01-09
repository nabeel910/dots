#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

#eval "$(dbus-launch --sh-syntax --exit-with-session)"
#setxkbmap -model pc104 -layout us,ar -variant ,, -option grp:alt_shift_toggle &
#xsetroot -cursor_name left_ptr &
#picom -b &
#numlockx on &
#/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
#dunst &
#feh --bg-fill --randomize ~/pics/wallpapers &
#feh --bg-fill --randomize ~/pics/anime &
#clipmenud &
#xidlehook --not-when-audio --not-when-fullscreen --timer 1200 "slock" "" &
#transmission-daemon &
#/usr/bin/pipewire &
#/usr/bin/pipewire-pulse &
#/usr/bin/pipewire-media-session &
#slstatus &
#/usr/lib/kdeconnectd &
exec startdwm
#exec bspwm
