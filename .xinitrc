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

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

~/.fehbg &
pulseaudio --daemonize
udiskie &
sxhkd &
compton &
polybar base &
dunst &
exec 2bwm


#$HOME/.config/polybar/launch.sh
#exec betterlockscreen -w


### Multiple window managers #########################
#
# Default WM
#session=${1:-i3}
#
#case $session in
#	i3|i3wm		) exec i3;;
#	2bwm		) exec 2bwm;;
#	bspwm		) exec bspwm;;
#	# No known session, try to run it as command
#	*		) exec $1;;
#esac
#######################################################
