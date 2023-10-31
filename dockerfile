# Base image
FROM ubuntu:latest

# Set environment variables
ENV DISPLAY=:0 \
    HOME=/home/peer2profit \
    USER=peer2profit

# Update and install necessary packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -qqy \
    xvfb \
    x11vnc \
    # x11-apps \
    # x11-utils \
    # x11-xserver-utils \
    tini \
    supervisor \
    bash \
    fluxbox \
    wget \
    curl \
    # net-tools \ 
    # util-linux \
    # strace \
    && \
    wget "https://updates.peer2profit.app/peer2profit_0.48_amd64.deb" -O /tmp/install.deb && \
    dpkg -i /tmp/install.deb || apt-get -y -f install && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/install.deb

# Copy entrypoint script and configuration files
COPY entrypoint.sh /entrypoint.sh
COPY supervisord.conf /etc/supervisord.conf

# Make scripts executable
RUN chmod +x /entrypoint.sh

# Create peer2profit user and group, and set permissions
RUN groupadd -g 999 peer2profit && \
    useradd -r -u 999 -g peer2profit peer2profit && \
    mkdir -p /home/peer2profit/.vnc && \
    chown -R peer2profit:peer2profit /home/peer2profit 

# Switch to peer2profit user
USER peer2profit

# Expose VNC and noVNC ports
EXPOSE 5901 6901

# Set tini as the entrypoint and the custom script as the command
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/entrypoint.sh"]