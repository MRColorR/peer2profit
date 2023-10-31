#!/usr/bin/env bash

# If VNC_PASSWORD is not set, use a default password
: ${VNC_PASSWORD:=money4band}
echo "Current vnc password is: ${VNC_PASSWORD}"

# Store the password
if [ "$VNC_PASSWORD" ]; then
    sed -i "s/^\(command.*x11vnc.*\)$/\1 -passwd '$VNC_PASSWORD'/" /etc/supervisord.conf
fi

# If VNC_RESOLUTION is not set, use a default resolution
: ${VNC_RESOLUTION:=1024x768}
echo "Current VNC resolution is: ${VNC_RESOLUTION}"

# Start Supervisor
mkdir -p /var/log/supervisor/children
exec supervisord -c /etc/supervisord.conf

