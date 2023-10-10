#!/bin/sh

export XDG_SESSION_TYPE=x11
export XDG_CURRENT_DESKTOP=X-Generic
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

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

setxkbmap -layout us,pt
setxkbmap -option grp:win_space_toggle
setxkbmap -option caps:escape
xset r rate 300 50
xrandr --output DP-0 --primary --mode 2560x1440 --left-of HDMI-0 --output HDMI-0 --mode 1920x1080
dunst &

if ! pgrep -f /usr/bin/easyeffects; then
    exec /usr/bin/easyeffects --gapplication-service &
    notify-send 'easyeffects daemon started'
fi

gpu_mode=$(/usr/bin/envycontrol -q)
if [ "$gpu_mode" = "nvidia" ]; then
    xrandr --setprovideroutputsource modesetting NVIDIA-0
    xrandr --auto
fi


exec /home/afonso/.local/bin/xmonad
