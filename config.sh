/usr/bin/VBoxClient-all

xsetroot -cursor_name left_ptr

[[ -f ~/.xinit/.Xresources ]] && xrdb -merge -I$HOME/.xinit ~/.xinit/.Xresources

xloadimage -onroot -fullscreen ~/.xinit/background.png

trayer --edge top --align right --SetDockType true --SetPartialStrut true \
  --expand true --width 10 --transparent true --tint 0x191970 --height 12 &

xscreensaver -no-splash &

exec xmonad
