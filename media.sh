#!/bin/bash

sudo pacman -S --noconfirm alsa-card-profiles alsa-lib alsa-plugins alsa-firmware alsa-utils gst-libav gst-plugin-pipewire gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly libpulse pipewire pipewire-alsa pipewire-jack pipewire-pulse wireplumber x264 x265 xvidcore


/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
sleep 5
sudo reboot
