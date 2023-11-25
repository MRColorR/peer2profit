# Peer2Profit Unofficial Docker Image 
Run and manage Peer2Profit in a Docker container with VNC support for easy GUI access.

**Leave a star ⭐ if you like this project 🙂 thank you.**

[![Docker Pulls](https://img.shields.io/docker/pulls/mrcolorrain/peer2profit.svg)](https://hub.docker.com/repository/docker/mrcolorrain/peer2profit)

## :information_source: Info
This Docker image encapsulates the Peer2Profit application, enabling users to run the Peer2Profit application in a containerized enviroment. With the VNC protocol and a VNC client of your choice, you can seamlessly interact with the Peer2Profit application using a visual interface directly from your local machine. This image has been optimized for lightweight deployment and is capable of being executed on various other architectures through an emulation layer.

## Features

- **VNC-Ready**: Ready for use with any VNC client, offering a user-friendly interface.
- **Emulation Layer Compatibility:**: The image can be run on multiple architectures using an emulation layer, providing a level of adaptability.
- **Optimized Build**: Lightweight and efficient.

## :arrow_forward: Getting Started

### Prerequisites

- Docker installed on your system.
- Basic knowledge of Docker and containerization.

### Pull & Run:
- Pull & Run the Image: `docker run -d -p 5901:5901 -p 6901:6901 mrcolorrain/peer2profit`
- Using a VNC Client connect to `localhost:5901` the vnc connection password is the name of my passive income project [money4band](https://github.com/MRColorR/money4band)
- Peer2Profit GUI will appear

## Setting Up Peer2Profit:
- The Peer2Profit GUI will be displayed upon connection.
- Simply enter your Peer2Profit details (e.g. email) to initiate the connection.
- With Peer2Profit now active and earning, you can safely close the VNC window.
- Enjoy & Earn: Let Peer2Profit work in the background, generating passive income for you.

### :warning: Disclaimer
This project is not affiliated with the official Peer2Profit project and is provided "as is", without any warranty of any kind, either express or implied. Use at your own risk.

## :hash: License
[GPL 3.0](https://www.gnu.org/licenses/gpl-3.0.html)

## Acknowledgments
- Thanks to the Peer2Profit team for developing the application.
- Kudos to everyone who contributes to the Docker and open-source community.
