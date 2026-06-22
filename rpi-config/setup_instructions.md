# RPI Setup Instructions

## Install

```bash
sudo apt install xdotool unclutter sed
sudo apt-get install chromium-browser
```

In order to use xset & dpms commands, the screen blanking must be enabled in the GUI Raspberry pi config tool or sudo raspi-config

Change to x11 via raspi-config instead of wayland  
https://raspberrypi.stackexchange.com/questions/144866/can-i-use-x11-on-the-new-64-bit-os-instead-of-wayland

```bash
sudo apt purge xscreensaver

sudo apt purge wolfram-engine scratch scratch2 nuscratch sonic-pi idle3 -y
sudo apt purge smartsim java-common minecraft-pi libreoffice* -y
```

## Wifi AccessPoint

```bash
# If possible:
sudo raspi-config
# -> Advanced Options -> Network options -> Select NetworkManager
# Continue setup via NetworkManager GUI
# set Automatically connect x
# set IP 10.0.0.1/24
# Alternative config method:
sudo nmtui
```

## System Service

/etc/systemd/system

/etc/systemd/system/multi-user.target.wants/  
infoscreen@hardware.service -> /etc/systemd/system/infoscreen.service  
infoscreen@uwsgi.service -> /etc/systemd/system/infoscreen.service  
infoscreen@kiosk.service -> /etc/systemd/system/infoscreen.service

```bash
ln -s /home/pi/dpsg-jubel-kletterturm/rpi-config/infoscreen.service /etc/systemd/system/infoscreen@.service
ln -s /etc/systemd/system/infoscreen@.service /etc/systemd/system/multi-user.target.wants/infoscreen@kiosk.service

systemctl daemon-reload
sudo systemctl enable infoscreen@kiosk.service
```

## Make shutdown globally available

```bash
sudo chmod 4755 /sbin/shutdown
```

https://forums.raspberrypi.com/viewtopic.php?t=68552

#!/bin/bash

/home/pi/camera_control/bin/python /home/pi/camera_control/backend/manage.py readInputs
