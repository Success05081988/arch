#!/bin/bash

sudo timedatectl set-ntp true
sudo hwclock --systohc

#sudo reflector --country Germany --latest 5 --sort age --save /etc/pacman.d/mirrorlist

#sudo firewall-cmd --add-port=1025-65535/tcp --permanent
#sudo firewall-cmd --add-port=1025-65535/udp --permanent
#sudo firewall-cmd --reload

git clone https://aur.archlinux.org/yay.git
cd /arch/yay/
makepkg -si --noconfirm

#pikaur -S --noconfirm system76-power
#sudo systemctl enable --now system76-power
#sudo system76-power graphics integrated
#pikaur -S --noconfirm auto-cpufreq
#sudo systemctl enable --now auto-cpufreq


sudo pacman -S --noconfirm plasma-meta ark dolphin konsole kwrite sddm sddm-kcm xorg-server xorg-xinit xorg-xkill vlc yakuake neofetch chromium
sudo pacman -S --noconfirm ttf-roboto ttf-roboto-mono ttf-roboto-mono-nerd ttf-terminus-nerd ksysguard 
#sudo flatpak install -y spotify

sudo systemctl enable sddm
/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
sleep 5
sudo reboot
