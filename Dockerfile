FROM phusion/baseimage:0.9.16
MAINTAINER epflstiit <epflstiit@groupes.epfl.ch>

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

RUN apt-get update &&  apt-get -y install xvfb x11vnc xdotool wget supervisor 
RUN apt-get -y install octave
RUN apt-get -y install firefox
RUN apt-get -y install fluxbox
RUN apt-get -y install git-core git

#ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

#ENV WINEPREFIX /root/prefix32
#ENV WINEARCH win32
ENV DISPLAY :0

WORKDIR /root/
ADD novnc /root/novnc/

WORKDIR /scripts
ADD ./octave_scr /scripts

#ADD qt-settings /root/.config/octave/qt-settings
COPY qt-settings /root/.config/octave/qt-settings

# Expose Port
EXPOSE 8083

CMD ["/usr/bin/supervisord"]
