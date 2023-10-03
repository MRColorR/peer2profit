# Base image
FROM ubuntu

# Set environment variables
ENV TZ=UTC \
    DISPLAY=:20 \
    TINI_VERSION=v0.19.0 \
    HOME=/home/peer2profit \
    USER=peer2profit \
    XDG_RUNTIME_DIR=/home/peer2profit/runtime

# Update and install necessary packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -qqy x11-apps x11-utils x11-xserver-utils x11vnc xvfb net-tools wget curl strace util-linux && \
    wget "https://updates.peer2profit.app/peer2profit_0.48_amd64.deb" -O /tmp/install.deb && \
    dpkg -i /tmp/install.deb || apt-get -y -f install && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/install.deb

# Copy entrypoint script and xinitrc
COPY .xinitrc /home/peer2profit/
COPY ./entrypoint.sh /entrypoint.sh

# Make scripts executable
RUN chmod +x /home/peer2profit/.xinitrc /entrypoint.sh

# Create peer2profit user and group, and set permissions
RUN groupadd -g 999 peer2profit && \
    useradd -r -u 999 -g peer2profit peer2profit && \
    mkdir -p /home/peer2profit/.vnc && \
    chown -R peer2profit:peer2profit /home/peer2profit && \
    x11vnc -storepasswd money4band /home/peer2profit/.vnc/passwd && \
    chown peer2profit:peer2profit /home/peer2profit/.vnc/passwd

# Add tini for better signal handling
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-static-amd64 /tini
RUN chmod +x /tini

# Switch to peer2profit user
USER peer2profit

# Set tini as the entrypoint
ENTRYPOINT ["/tini", "--"]

# Set the command to run the entrypoint script
CMD ["/entrypoint.sh"]

# Expose port for VNC
EXPOSE 5900
