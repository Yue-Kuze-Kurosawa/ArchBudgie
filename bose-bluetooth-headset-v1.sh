#!/bin/bash
#
##################################################################################################################
# Written to be used on 64 bits computers
# Author 	: 	Erik Dubois
# Website 	: 	http://www.erikdubois.be
##################################################################################################################
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

sudo pacman -S --noconfirm --needed pulseaudio-alsa pulseaudio-bluetooth
sudo pacman -S --noconfirm --needed bluez bluez-libs bluez-utils bluez-firmware

sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service

echo "################################################################"
echo "###################    T H E   E N D      ######################"
echo "################################################################"
