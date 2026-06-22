#!/bin/bash
export DISPLAY=:0
# export PWD=/home/pi/infoscreen
# export HOME=/home/pi
# export USER=pi

echo "xset"
xset s noblank
xset s off
xset -dpms

sleep 2

echo "unclutter"
# unclutter -idle 0.5 -root &
unclutter -idle 0 -root &

echo "sed"
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/pi/.config/chromium/Default/Preferences
sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /home/pi/.config/chromium/Default/Preferences

sleep 5

echo "chromium"
# /usr/bin/chromium-browser --noerrdialogs --disable-infobars --kiosk http://127.0.0.1/pages/harrypotter &
/usr/bin/chromium-browser --noerrdialogs --disable-infobars --window-position=0,0 --kiosk /home/pi/dpsg-jubel-kletterturm/web/index_16_9.html
#/usr/bin/chromium-browser --noerrdialogs --disable-infobars --kiosk http://127.0.0.1/anzeigerefresh.php &
