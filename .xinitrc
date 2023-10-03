#!/usr/bin/env bash

xrdb $HOME/.Xresources
xsetroot -solid black -cursor_name left_ptr
xset -r

export XKL_XMODMAP_DISABLE=1
/usr/bin/peer2profit

