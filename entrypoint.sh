#!/usr/bin/env bash

export HOME=/home/peer2profit
export USER=peer2profit
export DISPLAY=:20
export XDG_RUNTIME_DIR=/run/user/$(id -u)

# P2P window size is about 450x550
FD_GEOM=450x550 x11vnc -forever -usepw -create

# Wait for X server to initialize
sleep 5

# Start the Peer2Profit client
peer2profit 