FROM phusion/baseimage:0.9.16
MAINTAINER epflsti <stiitdev@groupes.epfl.ch>

# Set correct environment variables
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG fr_CH.UTF-8
ENV LANGUAGE fr_CH.UTF-8

# Configure user nobody to match unRAID's settings
RUN \
 usermod -u 99 nobody && \
 usermod -g 100 nobody && \
 usermod -d /config nobody && \
 chown -R nobody:users /home

# Installing apps (Note: git is here juste in case noVNC needs it in launch.sh
RUN apt-get update &&  apt-get -y install xvfb x11vnc xdotool wget supervisor octave fluxbox git-core git

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ENV DISPLAY :0

WORKDIR /root/
ADD novnc /root/novnc/

# A few examples for the demo
WORKDIR /scripts
ADD ./octave_scr /scripts

# Can be confiugured to set octave settings
#COPY qt-settings /root/.config/octave/qt-settings

# Expose Port (Note: if you change it do it as well in surpervisord.conf)
EXPOSE 8083

CMD ["/usr/bin/supervisord"]
