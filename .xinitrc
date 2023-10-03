#!/usr/bin/env bash

xrdb $HOME/.Xresources
xsetroot -solid black -cursor_name left_ptr
xset -r

export XKL_XMODMAP_DISABLE=1

# Start the Peer2Profit client with architecture spoofing
setarch x86_64 --uname-2.6 /usr/bin/peer2profit 
