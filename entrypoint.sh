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

# Check if P2P_EMAIL has been passed in
if [ -z "$P2P_EMAIL" ]; then
    echo "No P2P_EMAIL set, you will need to enter your email address in the peer2profit application"
else
    echo "Passed P2P_EMAIL is: ${P2P_EMAIL}"
    # Generate peer2profit configuration
    P2P_CONFIG="/root/.config/org.peer2profit.peer2profit.ini"
    if [ ! -f $P2P_CONFIG ]; then
        echo "No peer2profit configuration found, generating one..."
        tee $P2P_CONFIG <<END
[General]
StartOnStartup=true
hideToTrayMsg=true
locale=en_US
Username=$P2P_EMAIL
installid2=$(cat /proc/sys/kernel/random/uuid)
END
        echo -n
        
        cp $P2P_CONFIG /config/xdg/config/org.peer2profit.peer2profit.ini
        echo "peer2profit configuration generated, configuration file is located at: $P2P_CONFIG and has been copied also to /config/xdg/config/org.peer2profit.peer2profit.ini"
    else
        echo "peer2profit configuration already present, skipping generation..."
        echo "Check the peer2profit application for more information or to change your current configuration"
    fi
fi

# Start Supervisor
mkdir -p /var/log/supervisor/children
exec supervisord -c /etc/supervisord.conf
