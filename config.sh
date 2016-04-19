DIR=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)

if [ -f /usr/bin/VBoxClient-all ]; then
  /usr/bin/VBoxClient-all
fi

xsetroot -cursor_name left_ptr

[[ -f $DIR/Xresources ]] && xrdb -merge -I$DIR $DIR/Xresources

hsetroot -center $DIR/background.png

parcellite &

xscreensaver -no-splash &

compton --config $DIR/compton.conf -b

# set the default window manager
if [ "$WM_MANAGER" == "" ]; then
  WM_MANAGER=i3
fi

if [ "$WM_MANAGER" == "xmonad" ]; then
  trayer --edge top --align right --SetDockType true --SetPartialStrut true \
    --expand true --width 10 --transparent true --tint 0x191970 --height 12 &
  exec xmonad
fi

if [ "$WM_MANAGER" == "i3" ]; then
  exec i3
fi

if [ "$WM_MANAGER" == "awesome" ]; then
  exec awesome
fi
