FROM ubuntu:22.04
LABEL maintainer="rodolphemds" 

# Update package lists
RUN apt-get update

# Install supervisor
RUN apt-get install -y supervisor

# Install systemctl
RUN apt-get install -y systemctl


# Install sudo
RUN apt-get install sudo

# Install git and avahi-daemon, then clone the repository
RUN apt install -y git avahi-daemon &&\
    cd /root/ &&\
    git clone https://github.com/rodolphemds/vector-escapepod.git &&\
    mv /root/escapepod /root/wire-pod &&\
    cd /root/wire-pod/ &&\
    sudo STT=vosk ./setup.sh

# Expose necessary ports
EXPOSE 80 8080 443 8084