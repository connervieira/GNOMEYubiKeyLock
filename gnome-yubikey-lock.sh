#!/bin/bash
# Checks every 10 seconds to see if a yubikey device is plugged in and if the screensaver is already active, locks otherwise
while :
do
   sleep 10
   if [[ $(lsusb |grep Yubico|wc -l) -eq "0" && $(qdbus org.gnome.ScreenSaver /org/gnome/ScreenSaver org.gnome.ScreenSaver.GetActive) -eq "false" ]]
   then
    	   dbus-send --type=method_call --dest=org.gnome.ScreenSaver /org/gnome/ScreenSaver org.gnome.ScreenSaver.Lock
   fi
done
