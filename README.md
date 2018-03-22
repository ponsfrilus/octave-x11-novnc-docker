# octave-x11-novnc-docker

This docker runs GNU Octave - an open source Matlab - which provides capabilities for the numerical solution of linear and nonlinear problems, and for performing other numerical experiments.
The Octave GUI have to be accessed through a browser in a noVNC windows.

![Demo Screenshot](http://epfl-sti.github.io/octave-x11-novnc-docker/images/lorenz.png)

[... more screenshots](http://epfl-sti.github.io/octave-x11-novnc-docker/#screenshots)

## This container runs

* [Xvfb](http://www.x.org/releases/X11R7.6/doc/man/man1/Xvfb.1.xhtml) - X11 in a virtual framebuffer
* [x11vnc](http://www.karlrunge.com/x11vnc/) - A VNC server that scrapes the above X11 server
* [noNVC](https://kanaka.github.io/noVNC/) - A HTML5 canvas vnc viewer
* [Fluxbox](http://www.fluxbox.org/) - a small window manager
* [octave](http://www.gnu.org/software/octave/) - to demo that it works

## How To

### With Docker Hub

* `docker pull epflsti/octave-x11-novnc-docker`
* `docker run -p 8083:8083 -ti  epflsti/octave-x11-novnc-docker:latest`
* `firefox http://localhost:8083`
* octave is launched, just run some script e.g. my_sombrero.m

Adding the parameter `-e SCREEN_RESOLUTION=<width>x<height>` the screen size displayed is adjusted to the one in the environment variable. By default it is 1024x768.

If your source files are in your host then just add the -v parameter for example
* `docker run -p 8083:8083 -ti -v $(pwd):/source epflsti/octave-x11-novnc-docker:latest`

### Manual Build

* `docker build -t epflsti/octave-x11-novnc-docker:latest .`
* `docker run -p 8083:8083 -ti  epflsti/octave-x11-novnc-docker:latest`
* `firefox http://localhost:8083`
* octave is launched, just run some script e.g. my_sombrero.m

## Gh-pages
Please visit the project's website on [http://epfl-sti.github.io/octave-x11-novnc-docker/](http://epfl-sti.github.io/octave-x11-novnc-docker/)

## On DockerHub / GitHub

* [epflsti/octave-x11-novnc-docker on DockerHub](https://registry.hub.docker.com/u/epflsti/octave-x11-novnc-docker/)
* [epfl-sti/octave-x11-novnc-docker on GitHub](https://github.com/epfl-sti/octave-x11-novnc-docker)

## Thanks
Based on [wine-x11-novnc-docker](https://github.com/solarkennedy/wine-x11-novnc-docker), thanks @solarkennedy !
