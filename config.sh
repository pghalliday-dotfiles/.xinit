DIR=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)

if [ -f /usr/bin/VBoxClient-all ]; then
  /usr/bin/VBoxClient-all
fi

xsetroot -cursor_name left_ptr

[[ -f $DIR/Xresources ]] && xrdb -merge -I$DIR $DIR/Xresources

hsetroot -center $DIR/background.png

parcellite &

trayer --edge top --align right --SetDockType true --SetPartialStrut true \
  --expand true --width 10 --transparent true --tint 0x191970 --height 12 &

xscreensaver -no-splash &

compton --config $DIR/compton.conf -b

exec xmonad
