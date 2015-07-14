# octave-x11-novnc-docker

This docker runs GNU Octave - an open source Matlab - which provides capabilities for the numerical solution of linear and nonlinear problems, and for performing other numerical experiments.
The Octave GUI have to be accessed through a browser in a noVNC windows.

![Demo Screenshot](http://epfl-sti.github.io/octave-x11-novnc-docker/images/lorenz.png)


## This container runs

* [Xvfb](http://www.x.org/releases/X11R7.6/doc/man/man1/Xvfb.1.xhtml) - X11 in a virtual framebuffer
* [x11vnc](http://www.karlrunge.com/x11vnc/) - A VNC server that scrapes the above X11 server
* [noNVC](https://kanaka.github.io/noVNC/) - A HTML5 canvas vnc viewer
* [Fluxbox](http://www.fluxbox.org/) - a small window manager
* [octave](http://www.gnu.org/software/octave/) - to demo that it works

## How To

### With Docker 

* docker pull epflsti/octave-x11-novnc-docker
* docker run -p 8083:8083 -ti  epflsti/octave-x11-novnc-docker:latest
* firefox http://localhost:8083

### Manual Build

* docker build -t epflsti/wine-x11-novnc-docker:latest .
* docker run -p 8083:8083 -ti  epflsti/wine-x11-novnc-docker:latest
* firefox http://localhost:8083
* octave is launched, just launch some script e.g. my_sombrero.m

## gh-pages
Please visit the project's website on [http://epfl-sti.github.io/octave-x11-novnc-docker/](http://epfl-sti.github.io/octave-x11-novnc-docker/)

## On DockerHub
[epflsti/octave-x11-novnc-docker](https://registry.hub.docker.com/u/epflsti/octave-x11-novnc-docker/)

## Thanks
Based on  [wine-x11-novnc-docker](https://github.com/solarkennedy/wine-x11-novnc-docker), thanks @solarkennedy !
