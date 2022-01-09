#!/bin/sh
# place this file in /usr/lib/elogind/system-sleep/lock.sh
# Lock before suspend integration with elogind

username=nabeel
userhome=/home/$username
export XAUTHORITY="$userhome/.Xauthority"
export DISPLAY=":0.0"
case "${1}" in
    pre)
        su $username -c "/usr/local/bin/slock" &
        sleep 1s;
        ;;
esac
